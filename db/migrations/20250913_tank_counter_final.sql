BEGIN;

-- Counter storage (idempotent)
CREATE TABLE IF NOT EXISTS public.tank_year_counters (
  site text NOT NULL,
  yy smallint NOT NULL,
  next_serial integer NOT NULL DEFAULT 1,
  PRIMARY KEY (site, yy)
);

-- Code generator: SITE-TANK-YY-####
CREATE OR REPLACE FUNCTION public.gen_tank_code(p_site text, p_when timestamptz DEFAULT now())
RETURNS text
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path = public
AS $$
DECLARE
  v_site   text;
  v_yy     smallint;
  v_serial integer;
  v_code   text;
BEGIN
  v_site := upper(btrim(p_site));
  v_yy   := to_char((p_when AT TIME ZONE 'America/Los_Angeles'), 'YY')::smallint;

  WITH up AS (
    INSERT INTO public.tank_year_counters(site, yy, next_serial)
    VALUES (v_site, v_yy, 1)
    ON CONFLICT (site, yy) DO UPDATE
    SET next_serial = public.tank_year_counters.next_serial + 1
    RETURNING next_serial
  )
  SELECT next_serial INTO v_serial FROM up;

  v_code := format('%s-TANK-%s-%s',
                   v_site,
                   to_char((p_when AT TIME ZONE 'America/Los_Angeles'), 'YY'),
                   lpad(v_serial::text, 4, '0'));
  RETURN v_code;
END;
$$;

-- BEFORE INSERT trigger function: fills site_code (if valid), code, and tank_code
CREATE OR REPLACE FUNCTION public.tanks_set_code()
RETURNS trigger
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path = public
AS $$
DECLARE
  v_site text;
  v_code text;
BEGIN
  -- derive site_code from location only if it matches enum; otherwise leave NULL so NOT NULL/enum check fires
  IF (NEW.site_code IS NULL OR btrim(NEW.site_code) = '') THEN
    BEGIN
      NEW.site_code := (upper(COALESCE(NEW.location, ''))::site_enum);
    EXCEPTION WHEN invalid_text_representation THEN
      -- no-op: invalid location won't be coerced to enum
    END;
  END IF;

  v_site := NEW.site_code::text;

  IF (NEW.code IS NULL OR btrim(NEW.code) = '')
     OR (NEW.tank_code IS NULL OR btrim(NEW.tank_code) = '') THEN
    v_code := public.gen_tank_code(v_site);
  END IF;

  IF NEW.code IS NULL OR btrim(NEW.code) = '' THEN
    NEW.code := v_code;
  END IF;

  IF NEW.tank_code IS NULL OR btrim(NEW.tank_code) = '' THEN
    NEW.tank_code := COALESCE(NEW.code, v_code);
  END IF;

  RETURN NEW;
END;
$$;

-- Constraint accepts legacy lowercase and new uppercase (case-insensitive)
ALTER TABLE public.tanks DROP CONSTRAINT IF EXISTS tanks_tank_code_format_chk;
ALTER TABLE public.tanks
  ADD CONSTRAINT tanks_tank_code_format_chk
  CHECK (tank_code ~* '^[A-Z0-9_-]+-TANK-(\d{2})-(\d{4})$');

-- Helpful unique indexes (idempotent)
CREATE UNIQUE INDEX IF NOT EXISTS ux_tanks_code ON public.tanks(code);
CREATE UNIQUE INDEX IF NOT EXISTS ux_tanks_tank_code ON public.tanks(tank_code);

-- Remove legacy trigger & helpers if present (lowercase "-tank-")
DROP TRIGGER IF EXISTS tanks_set_tank_code_before_insert ON public.tanks;
DROP FUNCTION IF EXISTS public.tanks_set_tank_code_site_yy();
DROP FUNCTION IF EXISTS public.alloc_tank_code_for_site_yy(integer, text);

-- Recreate our BEFORE INSERT trigger cleanly
DROP TRIGGER IF EXISTS trg_tanks_set_code ON public.tanks;
CREATE TRIGGER trg_tanks_set_code
BEFORE INSERT ON public.tanks
FOR EACH ROW
EXECUTE FUNCTION public.tanks_set_code();

-- Seed/advance per-site-year counters from existing codes (accept both cases)
WITH parsed AS (
  SELECT site_code::text AS site,
         (m[1])::smallint AS yy,
         (m[2])::int AS serial
  FROM public.tanks
  CROSS JOIN LATERAL regexp_matches(code, '(?i)^[^-]+-TANK-(\d{2})-(\d{4})$') AS m
)
INSERT INTO public.tank_year_counters(site, yy, next_serial)
SELECT site, yy, max(serial) + 1
FROM parsed
GROUP BY site, yy
ON CONFLICT (site, yy) DO UPDATE
SET next_serial = GREATEST(public.tank_year_counters.next_serial, EXCLUDED.next_serial);

COMMIT;
