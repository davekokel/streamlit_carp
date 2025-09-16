--
-- PostgreSQL database dump
--

\restrict XI8eM9N75BO6UGMhEDED5vkkBA1V6OkU8CaVHewekeyciY1r3mXzHPJZH7ju6Jv

-- Dumped from database version 17.4
-- Dumped by pg_dump version 17.6

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: auth; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA auth;


ALTER SCHEMA auth OWNER TO supabase_admin;

--
-- Name: extensions; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA extensions;


ALTER SCHEMA extensions OWNER TO postgres;

--
-- Name: graphql; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA graphql;


ALTER SCHEMA graphql OWNER TO supabase_admin;

--
-- Name: graphql_public; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA graphql_public;


ALTER SCHEMA graphql_public OWNER TO supabase_admin;

--
-- Name: pgbouncer; Type: SCHEMA; Schema: -; Owner: pgbouncer
--

CREATE SCHEMA pgbouncer;


ALTER SCHEMA pgbouncer OWNER TO pgbouncer;

--
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

-- *not* creating schema, since initdb creates it


ALTER SCHEMA public OWNER TO postgres;

--
-- Name: realtime; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA realtime;


ALTER SCHEMA realtime OWNER TO supabase_admin;

--
-- Name: storage; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA storage;


ALTER SCHEMA storage OWNER TO supabase_admin;

--
-- Name: supabase_migrations; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA supabase_migrations;


ALTER SCHEMA supabase_migrations OWNER TO postgres;

--
-- Name: vault; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA vault;


ALTER SCHEMA vault OWNER TO supabase_admin;

--
-- Name: btree_gist; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS btree_gist WITH SCHEMA public;


--
-- Name: EXTENSION btree_gist; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION btree_gist IS 'support for indexing common datatypes in GiST';


--
-- Name: pg_graphql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pg_graphql WITH SCHEMA graphql;


--
-- Name: EXTENSION pg_graphql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pg_graphql IS 'pg_graphql: GraphQL support';


--
-- Name: pg_stat_statements; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pg_stat_statements WITH SCHEMA extensions;


--
-- Name: EXTENSION pg_stat_statements; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pg_stat_statements IS 'track planning and execution statistics of all SQL statements executed';


--
-- Name: pg_trgm; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pg_trgm WITH SCHEMA public;


--
-- Name: EXTENSION pg_trgm; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pg_trgm IS 'text similarity measurement and index searching based on trigrams';


--
-- Name: pgcrypto; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pgcrypto WITH SCHEMA extensions;


--
-- Name: EXTENSION pgcrypto; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pgcrypto IS 'cryptographic functions';


--
-- Name: supabase_vault; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS supabase_vault WITH SCHEMA vault;


--
-- Name: EXTENSION supabase_vault; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION supabase_vault IS 'Supabase Vault Extension';


--
-- Name: uuid-ossp; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA extensions;


--
-- Name: EXTENSION "uuid-ossp"; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';


--
-- Name: aal_level; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.aal_level AS ENUM (
    'aal1',
    'aal2',
    'aal3'
);


ALTER TYPE auth.aal_level OWNER TO supabase_auth_admin;

--
-- Name: code_challenge_method; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.code_challenge_method AS ENUM (
    's256',
    'plain'
);


ALTER TYPE auth.code_challenge_method OWNER TO supabase_auth_admin;

--
-- Name: factor_status; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.factor_status AS ENUM (
    'unverified',
    'verified'
);


ALTER TYPE auth.factor_status OWNER TO supabase_auth_admin;

--
-- Name: factor_type; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.factor_type AS ENUM (
    'totp',
    'webauthn',
    'phone'
);


ALTER TYPE auth.factor_type OWNER TO supabase_auth_admin;

--
-- Name: oauth_registration_type; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.oauth_registration_type AS ENUM (
    'dynamic',
    'manual'
);


ALTER TYPE auth.oauth_registration_type OWNER TO supabase_auth_admin;

--
-- Name: one_time_token_type; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.one_time_token_type AS ENUM (
    'confirmation_token',
    'reauthentication_token',
    'recovery_token',
    'email_change_token_new',
    'email_change_token_current',
    'phone_change_token'
);


ALTER TYPE auth.one_time_token_type OWNER TO supabase_auth_admin;

--
-- Name: element_type; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.element_type AS ENUM (
    'linker',
    'backbone',
    'backbone_selection_gene',
    'enzyme_hatching',
    'enzyme_integrase',
    'enzyme_protease',
    'enzyme_transposon',
    'fluor',
    'peptide_self_cleaving',
    'promoter',
    'sequence_enhancer',
    'sequence_expression_enhancer',
    'sequence_recombination_site',
    'tag',
    'tag_localization',
    'tag_solubility',
    'unspecified'
);


ALTER TYPE public.element_type OWNER TO postgres;

--
-- Name: fish_treatment_types; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.fish_treatment_types AS ENUM (
    'dye',
    'heat_shock',
    'drug',
    'chemical_switch',
    'injection_rna',
    'injection_plasmid',
    'synthetic_RNA_microinjection',
    'plasmid_DNA_microinjection',
    'DiI_labeling',
    'Tricaine',
    '42C_heat_shock',
    'DMSO'
);


ALTER TYPE public.fish_treatment_types OWNER TO postgres;

--
-- Name: mutation_zygosity; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.mutation_zygosity AS ENUM (
    'het',
    'hom',
    'unknown'
);


ALTER TYPE public.mutation_zygosity OWNER TO postgres;

--
-- Name: site_enum; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.site_enum AS ENUM (
    'NURSERY',
    'ADULT'
);


ALTER TYPE public.site_enum OWNER TO postgres;

--
-- Name: tank_type_enum; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.tank_type_enum AS ENUM (
    '2L',
    '4L',
    '6L'
);


ALTER TYPE public.tank_type_enum OWNER TO postgres;

--
-- Name: transgene_zygosity; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.transgene_zygosity AS ENUM (
    'hemi',
    'hom',
    'mosaic',
    'unknown'
);


ALTER TYPE public.transgene_zygosity OWNER TO postgres;

--
-- Name: action; Type: TYPE; Schema: realtime; Owner: supabase_admin
--

CREATE TYPE realtime.action AS ENUM (
    'INSERT',
    'UPDATE',
    'DELETE',
    'TRUNCATE',
    'ERROR'
);


ALTER TYPE realtime.action OWNER TO supabase_admin;

--
-- Name: equality_op; Type: TYPE; Schema: realtime; Owner: supabase_admin
--

CREATE TYPE realtime.equality_op AS ENUM (
    'eq',
    'neq',
    'lt',
    'lte',
    'gt',
    'gte',
    'in'
);


ALTER TYPE realtime.equality_op OWNER TO supabase_admin;

--
-- Name: user_defined_filter; Type: TYPE; Schema: realtime; Owner: supabase_admin
--

CREATE TYPE realtime.user_defined_filter AS (
	column_name text,
	op realtime.equality_op,
	value text
);


ALTER TYPE realtime.user_defined_filter OWNER TO supabase_admin;

--
-- Name: wal_column; Type: TYPE; Schema: realtime; Owner: supabase_admin
--

CREATE TYPE realtime.wal_column AS (
	name text,
	type_name text,
	type_oid oid,
	value jsonb,
	is_pkey boolean,
	is_selectable boolean
);


ALTER TYPE realtime.wal_column OWNER TO supabase_admin;

--
-- Name: wal_rls; Type: TYPE; Schema: realtime; Owner: supabase_admin
--

CREATE TYPE realtime.wal_rls AS (
	wal jsonb,
	is_rls_enabled boolean,
	subscription_ids uuid[],
	errors text[]
);


ALTER TYPE realtime.wal_rls OWNER TO supabase_admin;

--
-- Name: email(); Type: FUNCTION; Schema: auth; Owner: supabase_auth_admin
--

CREATE FUNCTION auth.email() RETURNS text
    LANGUAGE sql STABLE
    AS $$
  select 
  coalesce(
    nullif(current_setting('request.jwt.claim.email', true), ''),
    (nullif(current_setting('request.jwt.claims', true), '')::jsonb ->> 'email')
  )::text
$$;


ALTER FUNCTION auth.email() OWNER TO supabase_auth_admin;

--
-- Name: FUNCTION email(); Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON FUNCTION auth.email() IS 'Deprecated. Use auth.jwt() -> ''email'' instead.';


--
-- Name: jwt(); Type: FUNCTION; Schema: auth; Owner: supabase_auth_admin
--

CREATE FUNCTION auth.jwt() RETURNS jsonb
    LANGUAGE sql STABLE
    AS $$
  select 
    coalesce(
        nullif(current_setting('request.jwt.claim', true), ''),
        nullif(current_setting('request.jwt.claims', true), '')
    )::jsonb
$$;


ALTER FUNCTION auth.jwt() OWNER TO supabase_auth_admin;

--
-- Name: role(); Type: FUNCTION; Schema: auth; Owner: supabase_auth_admin
--

CREATE FUNCTION auth.role() RETURNS text
    LANGUAGE sql STABLE
    AS $$
  select 
  coalesce(
    nullif(current_setting('request.jwt.claim.role', true), ''),
    (nullif(current_setting('request.jwt.claims', true), '')::jsonb ->> 'role')
  )::text
$$;


ALTER FUNCTION auth.role() OWNER TO supabase_auth_admin;

--
-- Name: FUNCTION role(); Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON FUNCTION auth.role() IS 'Deprecated. Use auth.jwt() -> ''role'' instead.';


--
-- Name: uid(); Type: FUNCTION; Schema: auth; Owner: supabase_auth_admin
--

CREATE FUNCTION auth.uid() RETURNS uuid
    LANGUAGE sql STABLE
    AS $$
  select 
  coalesce(
    nullif(current_setting('request.jwt.claim.sub', true), ''),
    (nullif(current_setting('request.jwt.claims', true), '')::jsonb ->> 'sub')
  )::uuid
$$;


ALTER FUNCTION auth.uid() OWNER TO supabase_auth_admin;

--
-- Name: FUNCTION uid(); Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON FUNCTION auth.uid() IS 'Deprecated. Use auth.jwt() -> ''sub'' instead.';


--
-- Name: grant_pg_cron_access(); Type: FUNCTION; Schema: extensions; Owner: supabase_admin
--

CREATE FUNCTION extensions.grant_pg_cron_access() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  IF EXISTS (
    SELECT
    FROM pg_event_trigger_ddl_commands() AS ev
    JOIN pg_extension AS ext
    ON ev.objid = ext.oid
    WHERE ext.extname = 'pg_cron'
  )
  THEN
    grant usage on schema cron to postgres with grant option;

    alter default privileges in schema cron grant all on tables to postgres with grant option;
    alter default privileges in schema cron grant all on functions to postgres with grant option;
    alter default privileges in schema cron grant all on sequences to postgres with grant option;

    alter default privileges for user supabase_admin in schema cron grant all
        on sequences to postgres with grant option;
    alter default privileges for user supabase_admin in schema cron grant all
        on tables to postgres with grant option;
    alter default privileges for user supabase_admin in schema cron grant all
        on functions to postgres with grant option;

    grant all privileges on all tables in schema cron to postgres with grant option;
    revoke all on table cron.job from postgres;
    grant select on table cron.job to postgres with grant option;
  END IF;
END;
$$;


ALTER FUNCTION extensions.grant_pg_cron_access() OWNER TO supabase_admin;

--
-- Name: FUNCTION grant_pg_cron_access(); Type: COMMENT; Schema: extensions; Owner: supabase_admin
--

COMMENT ON FUNCTION extensions.grant_pg_cron_access() IS 'Grants access to pg_cron';


--
-- Name: grant_pg_graphql_access(); Type: FUNCTION; Schema: extensions; Owner: supabase_admin
--

CREATE FUNCTION extensions.grant_pg_graphql_access() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $_$
DECLARE
    func_is_graphql_resolve bool;
BEGIN
    func_is_graphql_resolve = (
        SELECT n.proname = 'resolve'
        FROM pg_event_trigger_ddl_commands() AS ev
        LEFT JOIN pg_catalog.pg_proc AS n
        ON ev.objid = n.oid
    );

    IF func_is_graphql_resolve
    THEN
        -- Update public wrapper to pass all arguments through to the pg_graphql resolve func
        DROP FUNCTION IF EXISTS graphql_public.graphql;
        create or replace function graphql_public.graphql(
            "operationName" text default null,
            query text default null,
            variables jsonb default null,
            extensions jsonb default null
        )
            returns jsonb
            language sql
        as $$
            select graphql.resolve(
                query := query,
                variables := coalesce(variables, '{}'),
                "operationName" := "operationName",
                extensions := extensions
            );
        $$;

        -- This hook executes when `graphql.resolve` is created. That is not necessarily the last
        -- function in the extension so we need to grant permissions on existing entities AND
        -- update default permissions to any others that are created after `graphql.resolve`
        grant usage on schema graphql to postgres, anon, authenticated, service_role;
        grant select on all tables in schema graphql to postgres, anon, authenticated, service_role;
        grant execute on all functions in schema graphql to postgres, anon, authenticated, service_role;
        grant all on all sequences in schema graphql to postgres, anon, authenticated, service_role;
        alter default privileges in schema graphql grant all on tables to postgres, anon, authenticated, service_role;
        alter default privileges in schema graphql grant all on functions to postgres, anon, authenticated, service_role;
        alter default privileges in schema graphql grant all on sequences to postgres, anon, authenticated, service_role;

        -- Allow postgres role to allow granting usage on graphql and graphql_public schemas to custom roles
        grant usage on schema graphql_public to postgres with grant option;
        grant usage on schema graphql to postgres with grant option;
    END IF;

END;
$_$;


ALTER FUNCTION extensions.grant_pg_graphql_access() OWNER TO supabase_admin;

--
-- Name: FUNCTION grant_pg_graphql_access(); Type: COMMENT; Schema: extensions; Owner: supabase_admin
--

COMMENT ON FUNCTION extensions.grant_pg_graphql_access() IS 'Grants access to pg_graphql';


--
-- Name: grant_pg_net_access(); Type: FUNCTION; Schema: extensions; Owner: supabase_admin
--

CREATE FUNCTION extensions.grant_pg_net_access() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  IF EXISTS (
    SELECT 1
    FROM pg_event_trigger_ddl_commands() AS ev
    JOIN pg_extension AS ext
    ON ev.objid = ext.oid
    WHERE ext.extname = 'pg_net'
  )
  THEN
    IF NOT EXISTS (
      SELECT 1
      FROM pg_roles
      WHERE rolname = 'supabase_functions_admin'
    )
    THEN
      CREATE USER supabase_functions_admin NOINHERIT CREATEROLE LOGIN NOREPLICATION;
    END IF;

    GRANT USAGE ON SCHEMA net TO supabase_functions_admin, postgres, anon, authenticated, service_role;

    IF EXISTS (
      SELECT FROM pg_extension
      WHERE extname = 'pg_net'
      -- all versions in use on existing projects as of 2025-02-20
      -- version 0.12.0 onwards don't need these applied
      AND extversion IN ('0.2', '0.6', '0.7', '0.7.1', '0.8', '0.10.0', '0.11.0')
    ) THEN
      ALTER function net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) SECURITY DEFINER;
      ALTER function net.http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer) SECURITY DEFINER;

      ALTER function net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) SET search_path = net;
      ALTER function net.http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer) SET search_path = net;

      REVOKE ALL ON FUNCTION net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) FROM PUBLIC;
      REVOKE ALL ON FUNCTION net.http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer) FROM PUBLIC;

      GRANT EXECUTE ON FUNCTION net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) TO supabase_functions_admin, postgres, anon, authenticated, service_role;
      GRANT EXECUTE ON FUNCTION net.http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer) TO supabase_functions_admin, postgres, anon, authenticated, service_role;
    END IF;
  END IF;
END;
$$;


ALTER FUNCTION extensions.grant_pg_net_access() OWNER TO supabase_admin;

--
-- Name: FUNCTION grant_pg_net_access(); Type: COMMENT; Schema: extensions; Owner: supabase_admin
--

COMMENT ON FUNCTION extensions.grant_pg_net_access() IS 'Grants access to pg_net';


--
-- Name: pgrst_ddl_watch(); Type: FUNCTION; Schema: extensions; Owner: supabase_admin
--

CREATE FUNCTION extensions.pgrst_ddl_watch() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
  cmd record;
BEGIN
  FOR cmd IN SELECT * FROM pg_event_trigger_ddl_commands()
  LOOP
    IF cmd.command_tag IN (
      'CREATE SCHEMA', 'ALTER SCHEMA'
    , 'CREATE TABLE', 'CREATE TABLE AS', 'SELECT INTO', 'ALTER TABLE'
    , 'CREATE FOREIGN TABLE', 'ALTER FOREIGN TABLE'
    , 'CREATE VIEW', 'ALTER VIEW'
    , 'CREATE MATERIALIZED VIEW', 'ALTER MATERIALIZED VIEW'
    , 'CREATE FUNCTION', 'ALTER FUNCTION'
    , 'CREATE TRIGGER'
    , 'CREATE TYPE', 'ALTER TYPE'
    , 'CREATE RULE'
    , 'COMMENT'
    )
    -- don't notify in case of CREATE TEMP table or other objects created on pg_temp
    AND cmd.schema_name is distinct from 'pg_temp'
    THEN
      NOTIFY pgrst, 'reload schema';
    END IF;
  END LOOP;
END; $$;


ALTER FUNCTION extensions.pgrst_ddl_watch() OWNER TO supabase_admin;

--
-- Name: pgrst_drop_watch(); Type: FUNCTION; Schema: extensions; Owner: supabase_admin
--

CREATE FUNCTION extensions.pgrst_drop_watch() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
  obj record;
BEGIN
  FOR obj IN SELECT * FROM pg_event_trigger_dropped_objects()
  LOOP
    IF obj.object_type IN (
      'schema'
    , 'table'
    , 'foreign table'
    , 'view'
    , 'materialized view'
    , 'function'
    , 'trigger'
    , 'type'
    , 'rule'
    )
    AND obj.is_temporary IS false -- no pg_temp objects
    THEN
      NOTIFY pgrst, 'reload schema';
    END IF;
  END LOOP;
END; $$;


ALTER FUNCTION extensions.pgrst_drop_watch() OWNER TO supabase_admin;

--
-- Name: set_graphql_placeholder(); Type: FUNCTION; Schema: extensions; Owner: supabase_admin
--

CREATE FUNCTION extensions.set_graphql_placeholder() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $_$
    DECLARE
    graphql_is_dropped bool;
    BEGIN
    graphql_is_dropped = (
        SELECT ev.schema_name = 'graphql_public'
        FROM pg_event_trigger_dropped_objects() AS ev
        WHERE ev.schema_name = 'graphql_public'
    );

    IF graphql_is_dropped
    THEN
        create or replace function graphql_public.graphql(
            "operationName" text default null,
            query text default null,
            variables jsonb default null,
            extensions jsonb default null
        )
            returns jsonb
            language plpgsql
        as $$
            DECLARE
                server_version float;
            BEGIN
                server_version = (SELECT (SPLIT_PART((select version()), ' ', 2))::float);

                IF server_version >= 14 THEN
                    RETURN jsonb_build_object(
                        'errors', jsonb_build_array(
                            jsonb_build_object(
                                'message', 'pg_graphql extension is not enabled.'
                            )
                        )
                    );
                ELSE
                    RETURN jsonb_build_object(
                        'errors', jsonb_build_array(
                            jsonb_build_object(
                                'message', 'pg_graphql is only available on projects running Postgres 14 onwards.'
                            )
                        )
                    );
                END IF;
            END;
        $$;
    END IF;

    END;
$_$;


ALTER FUNCTION extensions.set_graphql_placeholder() OWNER TO supabase_admin;

--
-- Name: FUNCTION set_graphql_placeholder(); Type: COMMENT; Schema: extensions; Owner: supabase_admin
--

COMMENT ON FUNCTION extensions.set_graphql_placeholder() IS 'Reintroduces placeholder function for graphql_public.graphql';


--
-- Name: get_auth(text); Type: FUNCTION; Schema: pgbouncer; Owner: supabase_admin
--

CREATE FUNCTION pgbouncer.get_auth(p_usename text) RETURNS TABLE(username text, password text)
    LANGUAGE plpgsql SECURITY DEFINER
    AS $_$
begin
    raise debug 'PgBouncer auth request: %', p_usename;

    return query
    select 
        rolname::text, 
        case when rolvaliduntil < now() 
            then null 
            else rolpassword::text 
        end 
    from pg_authid 
    where rolname=$1 and rolcanlogin;
end;
$_$;


ALTER FUNCTION pgbouncer.get_auth(p_usename text) OWNER TO supabase_admin;

--
-- Name: alloc_tank_code_for_site_yy(integer, public.site_enum); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.alloc_tank_code_for_site_yy(y_in integer, s_in public.site_enum) RETURNS text
    LANGUAGE plpgsql
    AS $$ DECLARE n integer; vyy smallint := (y_in % 100)::smallint; BEGIN INSERT INTO public.tank_code_counters_site_yy(yy,site_code,last_num) VALUES (vyy,s_in,1) ON CONFLICT ON CONSTRAINT tank_code_counters_site_yy_pkey DO UPDATE SET last_num = public.tank_code_counters_site_yy.last_num + 1 RETURNING public.tank_code_counters_site_yy.last_num INTO n; RETURN s_in::text || '-tank-' || to_char(vyy,'FM00') || '-' || lpad(n::text,4,'0'); END $$;


ALTER FUNCTION public.alloc_tank_code_for_site_yy(y_in integer, s_in public.site_enum) OWNER TO postgres;

--
-- Name: enforce_nursery_age(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.enforce_nursery_age() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
  dob date;
  max_age integer;
  age_days integer;
  is_nursery boolean;
BEGIN
  IF NEW.valid_to IS NOT NULL THEN
    RETURN NEW;
  END IF;

  SELECT f.date_birth INTO dob
  FROM public.fish f
  WHERE f.id = NEW.fish_id;

  SELECT COALESCE(t.max_age_days_override, c.max_age_days),
         COALESCE(c.is_nursery, false)
    INTO max_age, is_nursery
  FROM public.tanks t
  LEFT JOIN public.tank_categories c ON c.id = t.tank_category_id
  WHERE t.id = NEW.tank_id;

  IF is_nursery AND max_age IS NOT NULL AND dob IS NOT NULL THEN
    age_days := (NEW.valid_from::date - dob);
    IF age_days > max_age THEN
      RAISE EXCEPTION 'Fish % is % days old; exceeds nursery max % for tank %', NEW.fish_id, age_days, max_age, NEW.tank_id;
    END IF;
  END IF;

  RETURN NEW;
END$$;


ALTER FUNCTION public.enforce_nursery_age() OWNER TO postgres;

--
-- Name: gen_code(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.gen_code(prefix text) RETURNS text
    LANGUAGE sql
    AS $$
  SELECT upper(prefix)||upper(substring(encode(digest(clock_timestamp()::text||random()::text,'md5'),'hex') from 1 for 8))
$$;


ALTER FUNCTION public.gen_code(prefix text) OWNER TO postgres;

--
-- Name: gen_tank_code(text, timestamp with time zone); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.gen_tank_code(p_site text, p_when timestamp with time zone DEFAULT now()) RETURNS text
    LANGUAGE plpgsql SECURITY DEFINER
    SET search_path TO 'public'
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


ALTER FUNCTION public.gen_tank_code(p_site text, p_when timestamp with time zone) OWNER TO postgres;

--
-- Name: graduate_overage_nursery_fish(bigint, timestamp with time zone); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.graduate_overage_nursery_fish(_target_tank_id bigint, _effective_at timestamp with time zone DEFAULT now()) RETURNS bigint
    LANGUAGE plpgsql
    AS $$
DECLARE
  r record;
  cnt bigint := 0;
BEGIN
  FOR r IN
    SELECT nq.fish_id
    FROM public.nursery_graduation_queue nq
  LOOP
    PERFORM public.move_fish(r.fish_id, _target_tank_id, _effective_at);
    cnt := cnt + 1;
  END LOOP;
  RETURN cnt;
END$$;


ALTER FUNCTION public.graduate_overage_nursery_fish(_target_tank_id bigint, _effective_at timestamp with time zone) OWNER TO postgres;

--
-- Name: handle_new_user(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.handle_new_user() RETURNS trigger
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$
begin
  insert into public.profiles (id, email)
  values (new.id, new.email)
  on conflict (id) do nothing;
  return new;
end;
$$;


ALTER FUNCTION public.handle_new_user() OWNER TO postgres;

--
-- Name: move_fish(bigint, bigint, timestamp with time zone); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.move_fish(_fish_id bigint, _tank_id bigint, _moved_at timestamp with time zone DEFAULT now()) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
  UPDATE public.fish_tank_memberships
  SET valid_to = _moved_at
  WHERE fish_id = _fish_id AND valid_to IS NULL;

  INSERT INTO public.fish_tank_memberships (fish_id, tank_id, valid_from)
  VALUES (_fish_id, _tank_id, _moved_at);
END$$;


ALTER FUNCTION public.move_fish(_fish_id bigint, _tank_id bigint, _moved_at timestamp with time zone) OWNER TO postgres;

--
-- Name: parse_date_loose(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.parse_date_loose(txt text) RETURNS date
    LANGUAGE plpgsql IMMUTABLE
    AS $_$
DECLARE d date;
BEGIN
  IF txt IS NULL OR btrim(txt)='' THEN RETURN NULL; END IF;
  BEGIN d := to_date(txt,'YYYY-MM-DD'); RETURN d; EXCEPTION WHEN others THEN END;
  BEGIN d := to_date(txt,'MM/DD/YYYY'); RETURN d; EXCEPTION WHEN others THEN END;
  BEGIN d := to_date(txt,'MM/DD/YY'); RETURN d; EXCEPTION WHEN others THEN END;
  BEGIN d := to_date(regexp_replace(txt,'(^|/)X(/|$)','\101\2','g'),'MM/DD/YY'); RETURN d; EXCEPTION WHEN others THEN END;
  RETURN NULL;
END $_$;


ALTER FUNCTION public.parse_date_loose(txt text) OWNER TO postgres;

--
-- Name: prevent_delete_occupied_tank(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.prevent_delete_occupied_tank() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  IF EXISTS (
    SELECT 1 FROM public.fish_tank_memberships m
    WHERE m.tank_id = OLD.id AND m.valid_to IS NULL
  ) THEN
    RAISE EXCEPTION 'Tank % has current occupants; move fish out first', OLD.id;
  END IF;
  RETURN OLD;
END$$;


ALTER FUNCTION public.prevent_delete_occupied_tank() OWNER TO postgres;

--
-- Name: set_code_if_null(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.set_code_if_null() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  IF NEW.code IS NULL OR NEW.code = '' THEN
    IF TG_ARGV[0] = 'F' THEN
      NEW.code := 'F'  || to_char(nextval(TG_ARGV[1]::regclass), 'FM000000');
    ELSIF TG_ARGV[0] = 'TK' THEN
      NEW.code := 'TK' || to_char(nextval(TG_ARGV[1]::regclass), 'FM000000');
    ELSE
      NEW.code := to_char(nextval(TG_ARGV[1]::regclass), 'FM000000');
    END IF;
  END IF;
  RETURN NEW;
END
$$;


ALTER FUNCTION public.set_code_if_null() OWNER TO postgres;

--
-- Name: set_created_by(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.set_created_by() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  IF NEW.created_by IS NULL THEN
    NEW.created_by := auth.uid();
  END IF;
  RETURN NEW;
END;
$$;


ALTER FUNCTION public.set_created_by() OWNER TO postgres;

--
-- Name: set_fish_code_per_year(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.set_fish_code_per_year() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
  yr       integer;
  next_val integer;
BEGIN
  IF NEW.created_at IS NULL THEN
    NEW.created_at := now();
  END IF;

  yr := CAST(to_char(NEW.created_at, 'YYYY') AS integer);

  INSERT INTO fish_year_counters AS c (year, last_val)
       VALUES (yr, 1)
  ON CONFLICT (year)
    DO UPDATE SET last_val = c.last_val + 1
  RETURNING last_val
    INTO next_val;

  NEW.fish_code := 'FSH-' || yr::text || '-' || lpad(next_val::text, 4, '0');
  RETURN NEW;
END;
$$;


ALTER FUNCTION public.set_fish_code_per_year() OWNER TO postgres;

--
-- Name: set_updated_at(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.set_updated_at() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
begin
  new.updated_at = now();
  return new;
end;
$$;


ALTER FUNCTION public.set_updated_at() OWNER TO postgres;

--
-- Name: tanks_set_code(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.tanks_set_code() RETURNS trigger
    LANGUAGE plpgsql SECURITY DEFINER
    SET search_path TO 'public'
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


ALTER FUNCTION public.tanks_set_code() OWNER TO postgres;

--
-- Name: tanks_tank_code_immutable(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.tanks_tank_code_immutable() RETURNS trigger
    LANGUAGE plpgsql
    AS $$ BEGIN IF current_setting('app.allow_tank_code_update', true)='on' THEN RETURN NEW; END IF; IF NEW.tank_code IS DISTINCT FROM OLD.tank_code THEN RAISE EXCEPTION 'tank_code is immutable'; END IF; RETURN NEW; END $$;


ALTER FUNCTION public.tanks_tank_code_immutable() OWNER TO postgres;

--
-- Name: apply_rls(jsonb, integer); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer DEFAULT (1024 * 1024)) RETURNS SETOF realtime.wal_rls
    LANGUAGE plpgsql
    AS $$
declare
-- Regclass of the table e.g. public.notes
entity_ regclass = (quote_ident(wal ->> 'schema') || '.' || quote_ident(wal ->> 'table'))::regclass;

-- I, U, D, T: insert, update ...
action realtime.action = (
    case wal ->> 'action'
        when 'I' then 'INSERT'
        when 'U' then 'UPDATE'
        when 'D' then 'DELETE'
        else 'ERROR'
    end
);

-- Is row level security enabled for the table
is_rls_enabled bool = relrowsecurity from pg_class where oid = entity_;

subscriptions realtime.subscription[] = array_agg(subs)
    from
        realtime.subscription subs
    where
        subs.entity = entity_;

-- Subscription vars
roles regrole[] = array_agg(distinct us.claims_role::text)
    from
        unnest(subscriptions) us;

working_role regrole;
claimed_role regrole;
claims jsonb;

subscription_id uuid;
subscription_has_access bool;
visible_to_subscription_ids uuid[] = '{}';

-- structured info for wal's columns
columns realtime.wal_column[];
-- previous identity values for update/delete
old_columns realtime.wal_column[];

error_record_exceeds_max_size boolean = octet_length(wal::text) > max_record_bytes;

-- Primary jsonb output for record
output jsonb;

begin
perform set_config('role', null, true);

columns =
    array_agg(
        (
            x->>'name',
            x->>'type',
            x->>'typeoid',
            realtime.cast(
                (x->'value') #>> '{}',
                coalesce(
                    (x->>'typeoid')::regtype, -- null when wal2json version <= 2.4
                    (x->>'type')::regtype
                )
            ),
            (pks ->> 'name') is not null,
            true
        )::realtime.wal_column
    )
    from
        jsonb_array_elements(wal -> 'columns') x
        left join jsonb_array_elements(wal -> 'pk') pks
            on (x ->> 'name') = (pks ->> 'name');

old_columns =
    array_agg(
        (
            x->>'name',
            x->>'type',
            x->>'typeoid',
            realtime.cast(
                (x->'value') #>> '{}',
                coalesce(
                    (x->>'typeoid')::regtype, -- null when wal2json version <= 2.4
                    (x->>'type')::regtype
                )
            ),
            (pks ->> 'name') is not null,
            true
        )::realtime.wal_column
    )
    from
        jsonb_array_elements(wal -> 'identity') x
        left join jsonb_array_elements(wal -> 'pk') pks
            on (x ->> 'name') = (pks ->> 'name');

for working_role in select * from unnest(roles) loop

    -- Update `is_selectable` for columns and old_columns
    columns =
        array_agg(
            (
                c.name,
                c.type_name,
                c.type_oid,
                c.value,
                c.is_pkey,
                pg_catalog.has_column_privilege(working_role, entity_, c.name, 'SELECT')
            )::realtime.wal_column
        )
        from
            unnest(columns) c;

    old_columns =
            array_agg(
                (
                    c.name,
                    c.type_name,
                    c.type_oid,
                    c.value,
                    c.is_pkey,
                    pg_catalog.has_column_privilege(working_role, entity_, c.name, 'SELECT')
                )::realtime.wal_column
            )
            from
                unnest(old_columns) c;

    if action <> 'DELETE' and count(1) = 0 from unnest(columns) c where c.is_pkey then
        return next (
            jsonb_build_object(
                'schema', wal ->> 'schema',
                'table', wal ->> 'table',
                'type', action
            ),
            is_rls_enabled,
            -- subscriptions is already filtered by entity
            (select array_agg(s.subscription_id) from unnest(subscriptions) as s where claims_role = working_role),
            array['Error 400: Bad Request, no primary key']
        )::realtime.wal_rls;

    -- The claims role does not have SELECT permission to the primary key of entity
    elsif action <> 'DELETE' and sum(c.is_selectable::int) <> count(1) from unnest(columns) c where c.is_pkey then
        return next (
            jsonb_build_object(
                'schema', wal ->> 'schema',
                'table', wal ->> 'table',
                'type', action
            ),
            is_rls_enabled,
            (select array_agg(s.subscription_id) from unnest(subscriptions) as s where claims_role = working_role),
            array['Error 401: Unauthorized']
        )::realtime.wal_rls;

    else
        output = jsonb_build_object(
            'schema', wal ->> 'schema',
            'table', wal ->> 'table',
            'type', action,
            'commit_timestamp', to_char(
                ((wal ->> 'timestamp')::timestamptz at time zone 'utc'),
                'YYYY-MM-DD"T"HH24:MI:SS.MS"Z"'
            ),
            'columns', (
                select
                    jsonb_agg(
                        jsonb_build_object(
                            'name', pa.attname,
                            'type', pt.typname
                        )
                        order by pa.attnum asc
                    )
                from
                    pg_attribute pa
                    join pg_type pt
                        on pa.atttypid = pt.oid
                where
                    attrelid = entity_
                    and attnum > 0
                    and pg_catalog.has_column_privilege(working_role, entity_, pa.attname, 'SELECT')
            )
        )
        -- Add "record" key for insert and update
        || case
            when action in ('INSERT', 'UPDATE') then
                jsonb_build_object(
                    'record',
                    (
                        select
                            jsonb_object_agg(
                                -- if unchanged toast, get column name and value from old record
                                coalesce((c).name, (oc).name),
                                case
                                    when (c).name is null then (oc).value
                                    else (c).value
                                end
                            )
                        from
                            unnest(columns) c
                            full outer join unnest(old_columns) oc
                                on (c).name = (oc).name
                        where
                            coalesce((c).is_selectable, (oc).is_selectable)
                            and ( not error_record_exceeds_max_size or (octet_length((c).value::text) <= 64))
                    )
                )
            else '{}'::jsonb
        end
        -- Add "old_record" key for update and delete
        || case
            when action = 'UPDATE' then
                jsonb_build_object(
                        'old_record',
                        (
                            select jsonb_object_agg((c).name, (c).value)
                            from unnest(old_columns) c
                            where
                                (c).is_selectable
                                and ( not error_record_exceeds_max_size or (octet_length((c).value::text) <= 64))
                        )
                    )
            when action = 'DELETE' then
                jsonb_build_object(
                    'old_record',
                    (
                        select jsonb_object_agg((c).name, (c).value)
                        from unnest(old_columns) c
                        where
                            (c).is_selectable
                            and ( not error_record_exceeds_max_size or (octet_length((c).value::text) <= 64))
                            and ( not is_rls_enabled or (c).is_pkey ) -- if RLS enabled, we can't secure deletes so filter to pkey
                    )
                )
            else '{}'::jsonb
        end;

        -- Create the prepared statement
        if is_rls_enabled and action <> 'DELETE' then
            if (select 1 from pg_prepared_statements where name = 'walrus_rls_stmt' limit 1) > 0 then
                deallocate walrus_rls_stmt;
            end if;
            execute realtime.build_prepared_statement_sql('walrus_rls_stmt', entity_, columns);
        end if;

        visible_to_subscription_ids = '{}';

        for subscription_id, claims in (
                select
                    subs.subscription_id,
                    subs.claims
                from
                    unnest(subscriptions) subs
                where
                    subs.entity = entity_
                    and subs.claims_role = working_role
                    and (
                        realtime.is_visible_through_filters(columns, subs.filters)
                        or (
                          action = 'DELETE'
                          and realtime.is_visible_through_filters(old_columns, subs.filters)
                        )
                    )
        ) loop

            if not is_rls_enabled or action = 'DELETE' then
                visible_to_subscription_ids = visible_to_subscription_ids || subscription_id;
            else
                -- Check if RLS allows the role to see the record
                perform
                    -- Trim leading and trailing quotes from working_role because set_config
                    -- doesn't recognize the role as valid if they are included
                    set_config('role', trim(both '"' from working_role::text), true),
                    set_config('request.jwt.claims', claims::text, true);

                execute 'execute walrus_rls_stmt' into subscription_has_access;

                if subscription_has_access then
                    visible_to_subscription_ids = visible_to_subscription_ids || subscription_id;
                end if;
            end if;
        end loop;

        perform set_config('role', null, true);

        return next (
            output,
            is_rls_enabled,
            visible_to_subscription_ids,
            case
                when error_record_exceeds_max_size then array['Error 413: Payload Too Large']
                else '{}'
            end
        )::realtime.wal_rls;

    end if;
end loop;

perform set_config('role', null, true);
end;
$$;


ALTER FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) OWNER TO supabase_admin;

--
-- Name: broadcast_changes(text, text, text, text, text, record, record, text); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.broadcast_changes(topic_name text, event_name text, operation text, table_name text, table_schema text, new record, old record, level text DEFAULT 'ROW'::text) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
    -- Declare a variable to hold the JSONB representation of the row
    row_data jsonb := '{}'::jsonb;
BEGIN
    IF level = 'STATEMENT' THEN
        RAISE EXCEPTION 'function can only be triggered for each row, not for each statement';
    END IF;
    -- Check the operation type and handle accordingly
    IF operation = 'INSERT' OR operation = 'UPDATE' OR operation = 'DELETE' THEN
        row_data := jsonb_build_object('old_record', OLD, 'record', NEW, 'operation', operation, 'table', table_name, 'schema', table_schema);
        PERFORM realtime.send (row_data, event_name, topic_name);
    ELSE
        RAISE EXCEPTION 'Unexpected operation type: %', operation;
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        RAISE EXCEPTION 'Failed to process the row: %', SQLERRM;
END;

$$;


ALTER FUNCTION realtime.broadcast_changes(topic_name text, event_name text, operation text, table_name text, table_schema text, new record, old record, level text) OWNER TO supabase_admin;

--
-- Name: build_prepared_statement_sql(text, regclass, realtime.wal_column[]); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) RETURNS text
    LANGUAGE sql
    AS $$
      /*
      Builds a sql string that, if executed, creates a prepared statement to
      tests retrive a row from *entity* by its primary key columns.
      Example
          select realtime.build_prepared_statement_sql('public.notes', '{"id"}'::text[], '{"bigint"}'::text[])
      */
          select
      'prepare ' || prepared_statement_name || ' as
          select
              exists(
                  select
                      1
                  from
                      ' || entity || '
                  where
                      ' || string_agg(quote_ident(pkc.name) || '=' || quote_nullable(pkc.value #>> '{}') , ' and ') || '
              )'
          from
              unnest(columns) pkc
          where
              pkc.is_pkey
          group by
              entity
      $$;


ALTER FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) OWNER TO supabase_admin;

--
-- Name: cast(text, regtype); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime."cast"(val text, type_ regtype) RETURNS jsonb
    LANGUAGE plpgsql IMMUTABLE
    AS $$
    declare
      res jsonb;
    begin
      execute format('select to_jsonb(%L::'|| type_::text || ')', val)  into res;
      return res;
    end
    $$;


ALTER FUNCTION realtime."cast"(val text, type_ regtype) OWNER TO supabase_admin;

--
-- Name: check_equality_op(realtime.equality_op, regtype, text, text); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) RETURNS boolean
    LANGUAGE plpgsql IMMUTABLE
    AS $$
      /*
      Casts *val_1* and *val_2* as type *type_* and check the *op* condition for truthiness
      */
      declare
          op_symbol text = (
              case
                  when op = 'eq' then '='
                  when op = 'neq' then '!='
                  when op = 'lt' then '<'
                  when op = 'lte' then '<='
                  when op = 'gt' then '>'
                  when op = 'gte' then '>='
                  when op = 'in' then '= any'
                  else 'UNKNOWN OP'
              end
          );
          res boolean;
      begin
          execute format(
              'select %L::'|| type_::text || ' ' || op_symbol
              || ' ( %L::'
              || (
                  case
                      when op = 'in' then type_::text || '[]'
                      else type_::text end
              )
              || ')', val_1, val_2) into res;
          return res;
      end;
      $$;


ALTER FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) OWNER TO supabase_admin;

--
-- Name: is_visible_through_filters(realtime.wal_column[], realtime.user_defined_filter[]); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) RETURNS boolean
    LANGUAGE sql IMMUTABLE
    AS $_$
    /*
    Should the record be visible (true) or filtered out (false) after *filters* are applied
    */
        select
            -- Default to allowed when no filters present
            $2 is null -- no filters. this should not happen because subscriptions has a default
            or array_length($2, 1) is null -- array length of an empty array is null
            or bool_and(
                coalesce(
                    realtime.check_equality_op(
                        op:=f.op,
                        type_:=coalesce(
                            col.type_oid::regtype, -- null when wal2json version <= 2.4
                            col.type_name::regtype
                        ),
                        -- cast jsonb to text
                        val_1:=col.value #>> '{}',
                        val_2:=f.value
                    ),
                    false -- if null, filter does not match
                )
            )
        from
            unnest(filters) f
            join unnest(columns) col
                on f.column_name = col.name;
    $_$;


ALTER FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) OWNER TO supabase_admin;

--
-- Name: list_changes(name, name, integer, integer); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) RETURNS SETOF realtime.wal_rls
    LANGUAGE sql
    SET log_min_messages TO 'fatal'
    AS $$
      with pub as (
        select
          concat_ws(
            ',',
            case when bool_or(pubinsert) then 'insert' else null end,
            case when bool_or(pubupdate) then 'update' else null end,
            case when bool_or(pubdelete) then 'delete' else null end
          ) as w2j_actions,
          coalesce(
            string_agg(
              realtime.quote_wal2json(format('%I.%I', schemaname, tablename)::regclass),
              ','
            ) filter (where ppt.tablename is not null and ppt.tablename not like '% %'),
            ''
          ) w2j_add_tables
        from
          pg_publication pp
          left join pg_publication_tables ppt
            on pp.pubname = ppt.pubname
        where
          pp.pubname = publication
        group by
          pp.pubname
        limit 1
      ),
      w2j as (
        select
          x.*, pub.w2j_add_tables
        from
          pub,
          pg_logical_slot_get_changes(
            slot_name, null, max_changes,
            'include-pk', 'true',
            'include-transaction', 'false',
            'include-timestamp', 'true',
            'include-type-oids', 'true',
            'format-version', '2',
            'actions', pub.w2j_actions,
            'add-tables', pub.w2j_add_tables
          ) x
      )
      select
        xyz.wal,
        xyz.is_rls_enabled,
        xyz.subscription_ids,
        xyz.errors
      from
        w2j,
        realtime.apply_rls(
          wal := w2j.data::jsonb,
          max_record_bytes := max_record_bytes
        ) xyz(wal, is_rls_enabled, subscription_ids, errors)
      where
        w2j.w2j_add_tables <> ''
        and xyz.subscription_ids[1] is not null
    $$;


ALTER FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) OWNER TO supabase_admin;

--
-- Name: quote_wal2json(regclass); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.quote_wal2json(entity regclass) RETURNS text
    LANGUAGE sql IMMUTABLE STRICT
    AS $$
      select
        (
          select string_agg('' || ch,'')
          from unnest(string_to_array(nsp.nspname::text, null)) with ordinality x(ch, idx)
          where
            not (x.idx = 1 and x.ch = '"')
            and not (
              x.idx = array_length(string_to_array(nsp.nspname::text, null), 1)
              and x.ch = '"'
            )
        )
        || '.'
        || (
          select string_agg('' || ch,'')
          from unnest(string_to_array(pc.relname::text, null)) with ordinality x(ch, idx)
          where
            not (x.idx = 1 and x.ch = '"')
            and not (
              x.idx = array_length(string_to_array(nsp.nspname::text, null), 1)
              and x.ch = '"'
            )
          )
      from
        pg_class pc
        join pg_namespace nsp
          on pc.relnamespace = nsp.oid
      where
        pc.oid = entity
    $$;


ALTER FUNCTION realtime.quote_wal2json(entity regclass) OWNER TO supabase_admin;

--
-- Name: send(jsonb, text, text, boolean); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.send(payload jsonb, event text, topic text, private boolean DEFAULT true) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
  BEGIN
    -- Set the topic configuration
    EXECUTE format('SET LOCAL realtime.topic TO %L', topic);

    -- Attempt to insert the message
    INSERT INTO realtime.messages (payload, event, topic, private, extension)
    VALUES (payload, event, topic, private, 'broadcast');
  EXCEPTION
    WHEN OTHERS THEN
      -- Capture and notify the error
      RAISE WARNING 'ErrorSendingBroadcastMessage: %', SQLERRM;
  END;
END;
$$;


ALTER FUNCTION realtime.send(payload jsonb, event text, topic text, private boolean) OWNER TO supabase_admin;

--
-- Name: subscription_check_filters(); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.subscription_check_filters() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
    /*
    Validates that the user defined filters for a subscription:
    - refer to valid columns that the claimed role may access
    - values are coercable to the correct column type
    */
    declare
        col_names text[] = coalesce(
                array_agg(c.column_name order by c.ordinal_position),
                '{}'::text[]
            )
            from
                information_schema.columns c
            where
                format('%I.%I', c.table_schema, c.table_name)::regclass = new.entity
                and pg_catalog.has_column_privilege(
                    (new.claims ->> 'role'),
                    format('%I.%I', c.table_schema, c.table_name)::regclass,
                    c.column_name,
                    'SELECT'
                );
        filter realtime.user_defined_filter;
        col_type regtype;

        in_val jsonb;
    begin
        for filter in select * from unnest(new.filters) loop
            -- Filtered column is valid
            if not filter.column_name = any(col_names) then
                raise exception 'invalid column for filter %', filter.column_name;
            end if;

            -- Type is sanitized and safe for string interpolation
            col_type = (
                select atttypid::regtype
                from pg_catalog.pg_attribute
                where attrelid = new.entity
                      and attname = filter.column_name
            );
            if col_type is null then
                raise exception 'failed to lookup type for column %', filter.column_name;
            end if;

            -- Set maximum number of entries for in filter
            if filter.op = 'in'::realtime.equality_op then
                in_val = realtime.cast(filter.value, (col_type::text || '[]')::regtype);
                if coalesce(jsonb_array_length(in_val), 0) > 100 then
                    raise exception 'too many values for `in` filter. Maximum 100';
                end if;
            else
                -- raises an exception if value is not coercable to type
                perform realtime.cast(filter.value, col_type);
            end if;

        end loop;

        -- Apply consistent order to filters so the unique constraint on
        -- (subscription_id, entity, filters) can't be tricked by a different filter order
        new.filters = coalesce(
            array_agg(f order by f.column_name, f.op, f.value),
            '{}'
        ) from unnest(new.filters) f;

        return new;
    end;
    $$;


ALTER FUNCTION realtime.subscription_check_filters() OWNER TO supabase_admin;

--
-- Name: to_regrole(text); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.to_regrole(role_name text) RETURNS regrole
    LANGUAGE sql IMMUTABLE
    AS $$ select role_name::regrole $$;


ALTER FUNCTION realtime.to_regrole(role_name text) OWNER TO supabase_admin;

--
-- Name: topic(); Type: FUNCTION; Schema: realtime; Owner: supabase_realtime_admin
--

CREATE FUNCTION realtime.topic() RETURNS text
    LANGUAGE sql STABLE
    AS $$
select nullif(current_setting('realtime.topic', true), '')::text;
$$;


ALTER FUNCTION realtime.topic() OWNER TO supabase_realtime_admin;

--
-- Name: can_insert_object(text, text, uuid, jsonb); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.can_insert_object(bucketid text, name text, owner uuid, metadata jsonb) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
  INSERT INTO "storage"."objects" ("bucket_id", "name", "owner", "metadata") VALUES (bucketid, name, owner, metadata);
  -- hack to rollback the successful insert
  RAISE sqlstate 'PT200' using
  message = 'ROLLBACK',
  detail = 'rollback successful insert';
END
$$;


ALTER FUNCTION storage.can_insert_object(bucketid text, name text, owner uuid, metadata jsonb) OWNER TO supabase_storage_admin;

--
-- Name: extension(text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.extension(name text) RETURNS text
    LANGUAGE plpgsql
    AS $$
DECLARE
_parts text[];
_filename text;
BEGIN
	select string_to_array(name, '/') into _parts;
	select _parts[array_length(_parts,1)] into _filename;
	-- @todo return the last part instead of 2
	return reverse(split_part(reverse(_filename), '.', 1));
END
$$;


ALTER FUNCTION storage.extension(name text) OWNER TO supabase_storage_admin;

--
-- Name: filename(text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.filename(name text) RETURNS text
    LANGUAGE plpgsql
    AS $$
DECLARE
_parts text[];
BEGIN
	select string_to_array(name, '/') into _parts;
	return _parts[array_length(_parts,1)];
END
$$;


ALTER FUNCTION storage.filename(name text) OWNER TO supabase_storage_admin;

--
-- Name: foldername(text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.foldername(name text) RETURNS text[]
    LANGUAGE plpgsql
    AS $$
DECLARE
_parts text[];
BEGIN
	select string_to_array(name, '/') into _parts;
	return _parts[1:array_length(_parts,1)-1];
END
$$;


ALTER FUNCTION storage.foldername(name text) OWNER TO supabase_storage_admin;

--
-- Name: get_size_by_bucket(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.get_size_by_bucket() RETURNS TABLE(size bigint, bucket_id text)
    LANGUAGE plpgsql
    AS $$
BEGIN
    return query
        select sum((metadata->>'size')::int) as size, obj.bucket_id
        from "storage".objects as obj
        group by obj.bucket_id;
END
$$;


ALTER FUNCTION storage.get_size_by_bucket() OWNER TO supabase_storage_admin;

--
-- Name: list_multipart_uploads_with_delimiter(text, text, text, integer, text, text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.list_multipart_uploads_with_delimiter(bucket_id text, prefix_param text, delimiter_param text, max_keys integer DEFAULT 100, next_key_token text DEFAULT ''::text, next_upload_token text DEFAULT ''::text) RETURNS TABLE(key text, id text, created_at timestamp with time zone)
    LANGUAGE plpgsql
    AS $_$
BEGIN
    RETURN QUERY EXECUTE
        'SELECT DISTINCT ON(key COLLATE "C") * from (
            SELECT
                CASE
                    WHEN position($2 IN substring(key from length($1) + 1)) > 0 THEN
                        substring(key from 1 for length($1) + position($2 IN substring(key from length($1) + 1)))
                    ELSE
                        key
                END AS key, id, created_at
            FROM
                storage.s3_multipart_uploads
            WHERE
                bucket_id = $5 AND
                key ILIKE $1 || ''%'' AND
                CASE
                    WHEN $4 != '''' AND $6 = '''' THEN
                        CASE
                            WHEN position($2 IN substring(key from length($1) + 1)) > 0 THEN
                                substring(key from 1 for length($1) + position($2 IN substring(key from length($1) + 1))) COLLATE "C" > $4
                            ELSE
                                key COLLATE "C" > $4
                            END
                    ELSE
                        true
                END AND
                CASE
                    WHEN $6 != '''' THEN
                        id COLLATE "C" > $6
                    ELSE
                        true
                    END
            ORDER BY
                key COLLATE "C" ASC, created_at ASC) as e order by key COLLATE "C" LIMIT $3'
        USING prefix_param, delimiter_param, max_keys, next_key_token, bucket_id, next_upload_token;
END;
$_$;


ALTER FUNCTION storage.list_multipart_uploads_with_delimiter(bucket_id text, prefix_param text, delimiter_param text, max_keys integer, next_key_token text, next_upload_token text) OWNER TO supabase_storage_admin;

--
-- Name: list_objects_with_delimiter(text, text, text, integer, text, text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.list_objects_with_delimiter(bucket_id text, prefix_param text, delimiter_param text, max_keys integer DEFAULT 100, start_after text DEFAULT ''::text, next_token text DEFAULT ''::text) RETURNS TABLE(name text, id uuid, metadata jsonb, updated_at timestamp with time zone)
    LANGUAGE plpgsql
    AS $_$
BEGIN
    RETURN QUERY EXECUTE
        'SELECT DISTINCT ON(name COLLATE "C") * from (
            SELECT
                CASE
                    WHEN position($2 IN substring(name from length($1) + 1)) > 0 THEN
                        substring(name from 1 for length($1) + position($2 IN substring(name from length($1) + 1)))
                    ELSE
                        name
                END AS name, id, metadata, updated_at
            FROM
                storage.objects
            WHERE
                bucket_id = $5 AND
                name ILIKE $1 || ''%'' AND
                CASE
                    WHEN $6 != '''' THEN
                    name COLLATE "C" > $6
                ELSE true END
                AND CASE
                    WHEN $4 != '''' THEN
                        CASE
                            WHEN position($2 IN substring(name from length($1) + 1)) > 0 THEN
                                substring(name from 1 for length($1) + position($2 IN substring(name from length($1) + 1))) COLLATE "C" > $4
                            ELSE
                                name COLLATE "C" > $4
                            END
                    ELSE
                        true
                END
            ORDER BY
                name COLLATE "C" ASC) as e order by name COLLATE "C" LIMIT $3'
        USING prefix_param, delimiter_param, max_keys, next_token, bucket_id, start_after;
END;
$_$;


ALTER FUNCTION storage.list_objects_with_delimiter(bucket_id text, prefix_param text, delimiter_param text, max_keys integer, start_after text, next_token text) OWNER TO supabase_storage_admin;

--
-- Name: operation(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.operation() RETURNS text
    LANGUAGE plpgsql STABLE
    AS $$
BEGIN
    RETURN current_setting('storage.operation', true);
END;
$$;


ALTER FUNCTION storage.operation() OWNER TO supabase_storage_admin;

--
-- Name: search(text, text, integer, integer, integer, text, text, text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.search(prefix text, bucketname text, limits integer DEFAULT 100, levels integer DEFAULT 1, offsets integer DEFAULT 0, search text DEFAULT ''::text, sortcolumn text DEFAULT 'name'::text, sortorder text DEFAULT 'asc'::text) RETURNS TABLE(name text, id uuid, updated_at timestamp with time zone, created_at timestamp with time zone, last_accessed_at timestamp with time zone, metadata jsonb)
    LANGUAGE plpgsql STABLE
    AS $_$
declare
  v_order_by text;
  v_sort_order text;
begin
  case
    when sortcolumn = 'name' then
      v_order_by = 'name';
    when sortcolumn = 'updated_at' then
      v_order_by = 'updated_at';
    when sortcolumn = 'created_at' then
      v_order_by = 'created_at';
    when sortcolumn = 'last_accessed_at' then
      v_order_by = 'last_accessed_at';
    else
      v_order_by = 'name';
  end case;

  case
    when sortorder = 'asc' then
      v_sort_order = 'asc';
    when sortorder = 'desc' then
      v_sort_order = 'desc';
    else
      v_sort_order = 'asc';
  end case;

  v_order_by = v_order_by || ' ' || v_sort_order;

  return query execute
    'with folders as (
       select path_tokens[$1] as folder
       from storage.objects
         where objects.name ilike $2 || $3 || ''%''
           and bucket_id = $4
           and array_length(objects.path_tokens, 1) <> $1
       group by folder
       order by folder ' || v_sort_order || '
     )
     (select folder as "name",
            null as id,
            null as updated_at,
            null as created_at,
            null as last_accessed_at,
            null as metadata from folders)
     union all
     (select path_tokens[$1] as "name",
            id,
            updated_at,
            created_at,
            last_accessed_at,
            metadata
     from storage.objects
     where objects.name ilike $2 || $3 || ''%''
       and bucket_id = $4
       and array_length(objects.path_tokens, 1) = $1
     order by ' || v_order_by || ')
     limit $5
     offset $6' using levels, prefix, search, bucketname, limits, offsets;
end;
$_$;


ALTER FUNCTION storage.search(prefix text, bucketname text, limits integer, levels integer, offsets integer, search text, sortcolumn text, sortorder text) OWNER TO supabase_storage_admin;

--
-- Name: update_updated_at_column(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.update_updated_at_column() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    NEW.updated_at = now();
    RETURN NEW; 
END;
$$;


ALTER FUNCTION storage.update_updated_at_column() OWNER TO supabase_storage_admin;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: audit_log_entries; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.audit_log_entries (
    instance_id uuid,
    id uuid NOT NULL,
    payload json,
    created_at timestamp with time zone,
    ip_address character varying(64) DEFAULT ''::character varying NOT NULL
);


ALTER TABLE auth.audit_log_entries OWNER TO supabase_auth_admin;

--
-- Name: TABLE audit_log_entries; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.audit_log_entries IS 'Auth: Audit trail for user actions.';


--
-- Name: flow_state; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.flow_state (
    id uuid NOT NULL,
    user_id uuid,
    auth_code text NOT NULL,
    code_challenge_method auth.code_challenge_method NOT NULL,
    code_challenge text NOT NULL,
    provider_type text NOT NULL,
    provider_access_token text,
    provider_refresh_token text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    authentication_method text NOT NULL,
    auth_code_issued_at timestamp with time zone
);


ALTER TABLE auth.flow_state OWNER TO supabase_auth_admin;

--
-- Name: TABLE flow_state; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.flow_state IS 'stores metadata for pkce logins';


--
-- Name: identities; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.identities (
    provider_id text NOT NULL,
    user_id uuid NOT NULL,
    identity_data jsonb NOT NULL,
    provider text NOT NULL,
    last_sign_in_at timestamp with time zone,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    email text GENERATED ALWAYS AS (lower((identity_data ->> 'email'::text))) STORED,
    id uuid DEFAULT gen_random_uuid() NOT NULL
);


ALTER TABLE auth.identities OWNER TO supabase_auth_admin;

--
-- Name: TABLE identities; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.identities IS 'Auth: Stores identities associated to a user.';


--
-- Name: COLUMN identities.email; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON COLUMN auth.identities.email IS 'Auth: Email is a generated column that references the optional email property in the identity_data';


--
-- Name: instances; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.instances (
    id uuid NOT NULL,
    uuid uuid,
    raw_base_config text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


ALTER TABLE auth.instances OWNER TO supabase_auth_admin;

--
-- Name: TABLE instances; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.instances IS 'Auth: Manages users across multiple sites.';


--
-- Name: mfa_amr_claims; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.mfa_amr_claims (
    session_id uuid NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    authentication_method text NOT NULL,
    id uuid NOT NULL
);


ALTER TABLE auth.mfa_amr_claims OWNER TO supabase_auth_admin;

--
-- Name: TABLE mfa_amr_claims; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.mfa_amr_claims IS 'auth: stores authenticator method reference claims for multi factor authentication';


--
-- Name: mfa_challenges; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.mfa_challenges (
    id uuid NOT NULL,
    factor_id uuid NOT NULL,
    created_at timestamp with time zone NOT NULL,
    verified_at timestamp with time zone,
    ip_address inet NOT NULL,
    otp_code text,
    web_authn_session_data jsonb
);


ALTER TABLE auth.mfa_challenges OWNER TO supabase_auth_admin;

--
-- Name: TABLE mfa_challenges; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.mfa_challenges IS 'auth: stores metadata about challenge requests made';


--
-- Name: mfa_factors; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.mfa_factors (
    id uuid NOT NULL,
    user_id uuid NOT NULL,
    friendly_name text,
    factor_type auth.factor_type NOT NULL,
    status auth.factor_status NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    secret text,
    phone text,
    last_challenged_at timestamp with time zone,
    web_authn_credential jsonb,
    web_authn_aaguid uuid
);


ALTER TABLE auth.mfa_factors OWNER TO supabase_auth_admin;

--
-- Name: TABLE mfa_factors; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.mfa_factors IS 'auth: stores metadata about factors';


--
-- Name: oauth_clients; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.oauth_clients (
    id uuid NOT NULL,
    client_id text NOT NULL,
    client_secret_hash text NOT NULL,
    registration_type auth.oauth_registration_type NOT NULL,
    redirect_uris text NOT NULL,
    grant_types text NOT NULL,
    client_name text,
    client_uri text,
    logo_uri text,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone,
    CONSTRAINT oauth_clients_client_name_length CHECK ((char_length(client_name) <= 1024)),
    CONSTRAINT oauth_clients_client_uri_length CHECK ((char_length(client_uri) <= 2048)),
    CONSTRAINT oauth_clients_logo_uri_length CHECK ((char_length(logo_uri) <= 2048))
);


ALTER TABLE auth.oauth_clients OWNER TO supabase_auth_admin;

--
-- Name: one_time_tokens; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.one_time_tokens (
    id uuid NOT NULL,
    user_id uuid NOT NULL,
    token_type auth.one_time_token_type NOT NULL,
    token_hash text NOT NULL,
    relates_to text NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    CONSTRAINT one_time_tokens_token_hash_check CHECK ((char_length(token_hash) > 0))
);


ALTER TABLE auth.one_time_tokens OWNER TO supabase_auth_admin;

--
-- Name: refresh_tokens; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.refresh_tokens (
    instance_id uuid,
    id bigint NOT NULL,
    token character varying(255),
    user_id character varying(255),
    revoked boolean,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    parent character varying(255),
    session_id uuid
);


ALTER TABLE auth.refresh_tokens OWNER TO supabase_auth_admin;

--
-- Name: TABLE refresh_tokens; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.refresh_tokens IS 'Auth: Store of tokens used to refresh JWT tokens once they expire.';


--
-- Name: refresh_tokens_id_seq; Type: SEQUENCE; Schema: auth; Owner: supabase_auth_admin
--

CREATE SEQUENCE auth.refresh_tokens_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE auth.refresh_tokens_id_seq OWNER TO supabase_auth_admin;

--
-- Name: refresh_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: auth; Owner: supabase_auth_admin
--

ALTER SEQUENCE auth.refresh_tokens_id_seq OWNED BY auth.refresh_tokens.id;


--
-- Name: saml_providers; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.saml_providers (
    id uuid NOT NULL,
    sso_provider_id uuid NOT NULL,
    entity_id text NOT NULL,
    metadata_xml text NOT NULL,
    metadata_url text,
    attribute_mapping jsonb,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    name_id_format text,
    CONSTRAINT "entity_id not empty" CHECK ((char_length(entity_id) > 0)),
    CONSTRAINT "metadata_url not empty" CHECK (((metadata_url = NULL::text) OR (char_length(metadata_url) > 0))),
    CONSTRAINT "metadata_xml not empty" CHECK ((char_length(metadata_xml) > 0))
);


ALTER TABLE auth.saml_providers OWNER TO supabase_auth_admin;

--
-- Name: TABLE saml_providers; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.saml_providers IS 'Auth: Manages SAML Identity Provider connections.';


--
-- Name: saml_relay_states; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.saml_relay_states (
    id uuid NOT NULL,
    sso_provider_id uuid NOT NULL,
    request_id text NOT NULL,
    for_email text,
    redirect_to text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    flow_state_id uuid,
    CONSTRAINT "request_id not empty" CHECK ((char_length(request_id) > 0))
);


ALTER TABLE auth.saml_relay_states OWNER TO supabase_auth_admin;

--
-- Name: TABLE saml_relay_states; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.saml_relay_states IS 'Auth: Contains SAML Relay State information for each Service Provider initiated login.';


--
-- Name: schema_migrations; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.schema_migrations (
    version character varying(255) NOT NULL
);


ALTER TABLE auth.schema_migrations OWNER TO supabase_auth_admin;

--
-- Name: TABLE schema_migrations; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.schema_migrations IS 'Auth: Manages updates to the auth system.';


--
-- Name: sessions; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.sessions (
    id uuid NOT NULL,
    user_id uuid NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    factor_id uuid,
    aal auth.aal_level,
    not_after timestamp with time zone,
    refreshed_at timestamp without time zone,
    user_agent text,
    ip inet,
    tag text
);


ALTER TABLE auth.sessions OWNER TO supabase_auth_admin;

--
-- Name: TABLE sessions; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.sessions IS 'Auth: Stores session data associated to a user.';


--
-- Name: COLUMN sessions.not_after; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON COLUMN auth.sessions.not_after IS 'Auth: Not after is a nullable column that contains a timestamp after which the session should be regarded as expired.';


--
-- Name: sso_domains; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.sso_domains (
    id uuid NOT NULL,
    sso_provider_id uuid NOT NULL,
    domain text NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    CONSTRAINT "domain not empty" CHECK ((char_length(domain) > 0))
);


ALTER TABLE auth.sso_domains OWNER TO supabase_auth_admin;

--
-- Name: TABLE sso_domains; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.sso_domains IS 'Auth: Manages SSO email address domain mapping to an SSO Identity Provider.';


--
-- Name: sso_providers; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.sso_providers (
    id uuid NOT NULL,
    resource_id text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    disabled boolean,
    CONSTRAINT "resource_id not empty" CHECK (((resource_id = NULL::text) OR (char_length(resource_id) > 0)))
);


ALTER TABLE auth.sso_providers OWNER TO supabase_auth_admin;

--
-- Name: TABLE sso_providers; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.sso_providers IS 'Auth: Manages SSO identity provider information; see saml_providers for SAML.';


--
-- Name: COLUMN sso_providers.resource_id; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON COLUMN auth.sso_providers.resource_id IS 'Auth: Uniquely identifies a SSO provider according to a user-chosen resource ID (case insensitive), useful in infrastructure as code.';


--
-- Name: users; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.users (
    instance_id uuid,
    id uuid NOT NULL,
    aud character varying(255),
    role character varying(255),
    email character varying(255),
    encrypted_password character varying(255),
    email_confirmed_at timestamp with time zone,
    invited_at timestamp with time zone,
    confirmation_token character varying(255),
    confirmation_sent_at timestamp with time zone,
    recovery_token character varying(255),
    recovery_sent_at timestamp with time zone,
    email_change_token_new character varying(255),
    email_change character varying(255),
    email_change_sent_at timestamp with time zone,
    last_sign_in_at timestamp with time zone,
    raw_app_meta_data jsonb,
    raw_user_meta_data jsonb,
    is_super_admin boolean,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    phone text DEFAULT NULL::character varying,
    phone_confirmed_at timestamp with time zone,
    phone_change text DEFAULT ''::character varying,
    phone_change_token character varying(255) DEFAULT ''::character varying,
    phone_change_sent_at timestamp with time zone,
    confirmed_at timestamp with time zone GENERATED ALWAYS AS (LEAST(email_confirmed_at, phone_confirmed_at)) STORED,
    email_change_token_current character varying(255) DEFAULT ''::character varying,
    email_change_confirm_status smallint DEFAULT 0,
    banned_until timestamp with time zone,
    reauthentication_token character varying(255) DEFAULT ''::character varying,
    reauthentication_sent_at timestamp with time zone,
    is_sso_user boolean DEFAULT false NOT NULL,
    deleted_at timestamp with time zone,
    is_anonymous boolean DEFAULT false NOT NULL,
    CONSTRAINT users_email_change_confirm_status_check CHECK (((email_change_confirm_status >= 0) AND (email_change_confirm_status <= 2)))
);


ALTER TABLE auth.users OWNER TO supabase_auth_admin;

--
-- Name: TABLE users; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.users IS 'Auth: Stores user login data within a secure schema.';


--
-- Name: COLUMN users.is_sso_user; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON COLUMN auth.users.is_sso_user IS 'Auth: Set this column to true when the account comes from SSO. These accounts can have duplicate emails.';


--
-- Name: dyes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dyes (
    id bigint NOT NULL,
    name text NOT NULL,
    type text,
    description text,
    notes text,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    excitation integer,
    emission integer,
    id_uuid uuid DEFAULT gen_random_uuid() NOT NULL
);


ALTER TABLE public.dyes OWNER TO postgres;

--
-- Name: dyes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.dyes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.dyes_id_seq OWNER TO postgres;

--
-- Name: dyes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.dyes_id_seq OWNED BY public.dyes.id;


--
-- Name: fish; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fish (
    id bigint NOT NULL,
    name text NOT NULL,
    date_birth date,
    notes text,
    mother_fish_id bigint,
    father_fish_id bigint,
    line_building_stage text,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    fish_code text,
    created_by uuid DEFAULT auth.uid() NOT NULL,
    code text NOT NULL,
    id_uuid uuid DEFAULT gen_random_uuid() NOT NULL,
    father_fish_id_uuid uuid,
    mother_fish_id_uuid uuid,
    sex text,
    status text,
    CONSTRAINT fish_name_btrim CHECK ((name = btrim(name)))
);


ALTER TABLE public.fish OWNER TO postgres;

--
-- Name: fish_code_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.fish_code_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.fish_code_seq OWNER TO postgres;

--
-- Name: fish_tank_memberships; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fish_tank_memberships (
    id bigint NOT NULL,
    fish_id bigint,
    tank_id bigint,
    valid_from timestamp with time zone DEFAULT now() NOT NULL,
    valid_to timestamp with time zone,
    fish_id_uuid uuid NOT NULL,
    tank_id_uuid uuid NOT NULL,
    created_by uuid,
    CONSTRAINT fish_tank_memberships_check CHECK (((valid_to IS NULL) OR (valid_to > valid_from)))
);


ALTER TABLE public.fish_tank_memberships OWNER TO postgres;

--
-- Name: fish_current_tank; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.fish_current_tank AS
 SELECT fish_id,
    tank_id,
    valid_from
   FROM public.fish_tank_memberships m
  WHERE (valid_to IS NULL);


ALTER VIEW public.fish_current_tank OWNER TO postgres;

--
-- Name: fish_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.fish_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.fish_id_seq OWNER TO postgres;

--
-- Name: fish_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.fish_id_seq OWNED BY public.fish.id;


--
-- Name: fish_mounts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fish_mounts (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    fish_id bigint NOT NULL,
    mount_id uuid NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    created_by uuid DEFAULT auth.uid() NOT NULL,
    fish_id_uuid uuid,
    mount_id_uuid uuid
);


ALTER TABLE public.fish_mounts OWNER TO postgres;

--
-- Name: fish_mutations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fish_mutations (
    fish_id bigint NOT NULL,
    mutation_id bigint NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    fish_id_uuid uuid,
    mutation_id_uuid uuid
);


ALTER TABLE public.fish_mutations OWNER TO postgres;

--
-- Name: fish_parents; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fish_parents (
    child_id bigint NOT NULL,
    mom_id bigint,
    dad_id bigint,
    child_id_uuid uuid,
    mom_id_uuid uuid,
    dad_id_uuid uuid
);


ALTER TABLE public.fish_parents OWNER TO postgres;

--
-- Name: fish_selectedphenotypes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fish_selectedphenotypes (
    fish_id bigint NOT NULL,
    selectedphenotype_id bigint NOT NULL,
    created_at timestamp with time zone DEFAULT now(),
    created_by uuid DEFAULT auth.uid(),
    fish_id_uuid uuid,
    selectedphenotype_id_uuid uuid
);


ALTER TABLE public.fish_selectedphenotypes OWNER TO postgres;

--
-- Name: fish_strains; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fish_strains (
    fish_id bigint NOT NULL,
    strain_id bigint NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    fish_id_uuid uuid,
    strain_id_uuid uuid
);


ALTER TABLE public.fish_strains OWNER TO postgres;

--
-- Name: tanks; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tanks (
    id bigint NOT NULL,
    name text NOT NULL,
    location text,
    description text,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    created_by uuid DEFAULT auth.uid() NOT NULL,
    tank_category_id smallint,
    max_age_days_override integer,
    rack text,
    code text,
    id_uuid uuid DEFAULT gen_random_uuid() NOT NULL,
    type text,
    notes text,
    site_code text NOT NULL,
    tank_code text NOT NULL,
    tank_type public.tank_type_enum DEFAULT '4L'::public.tank_type_enum NOT NULL,
    CONSTRAINT tanks_site_code_chk CHECK (((site_code = ANY (ARRAY['NURSERY'::text, 'ADULT'::text])) OR (site_code IS NULL))),
    CONSTRAINT tanks_tank_code_format_chk CHECK ((tank_code ~* '^[A-Z0-9_-]+-TANK-(\d{2})-(\d{4})$'::text))
);


ALTER TABLE public.tanks OWNER TO postgres;

--
-- Name: fish_tank_history; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.fish_tank_history AS
 SELECT m.fish_id,
    f.fish_code,
    f.name AS fish_name,
    m.tank_id,
    t.name AS tank_name,
    m.valid_from,
    m.valid_to,
    (COALESCE(m.valid_to, now()) - m.valid_from) AS duration
   FROM ((public.fish_tank_memberships m
     JOIN public.fish f ON ((f.id = m.fish_id)))
     JOIN public.tanks t ON ((t.id = m.tank_id)))
  ORDER BY m.fish_id, m.valid_from;


ALTER VIEW public.fish_tank_history OWNER TO postgres;

--
-- Name: fish_tank_memberships_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.fish_tank_memberships_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.fish_tank_memberships_id_seq OWNER TO postgres;

--
-- Name: fish_tank_memberships_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.fish_tank_memberships_id_seq OWNED BY public.fish_tank_memberships.id;


--
-- Name: fish_transgenes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fish_transgenes (
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    fish_id_uuid uuid,
    transgene_id_uuid uuid,
    zygosity text,
    notes text
);


ALTER TABLE public.fish_transgenes OWNER TO postgres;

--
-- Name: fish_transgenes_unresolved_audit; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fish_transgenes_unresolved_audit (
    logged_at timestamp with time zone DEFAULT now(),
    fish_code text,
    transgene_name text
);


ALTER TABLE public.fish_transgenes_unresolved_audit OWNER TO postgres;

--
-- Name: fish_treatments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fish_treatments (
    id bigint NOT NULL,
    fish_id bigint NOT NULL,
    treatment_id uuid NOT NULL,
    applied_at timestamp with time zone DEFAULT now() NOT NULL,
    amount text,
    units text,
    route text,
    notes text,
    created_by uuid,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    dye_id bigint,
    fish_id_uuid uuid,
    dye_id_uuid uuid
);


ALTER TABLE public.fish_treatments OWNER TO postgres;

--
-- Name: TABLE fish_treatments; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.fish_treatments IS 'Join table: which fish received which treatment and when.';


--
-- Name: fish_treatments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.fish_treatments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.fish_treatments_id_seq OWNER TO postgres;

--
-- Name: fish_treatments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.fish_treatments_id_seq OWNED BY public.fish_treatments.id;


--
-- Name: fish_year_counters; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fish_year_counters (
    year integer NOT NULL,
    last_val integer NOT NULL
);


ALTER TABLE public.fish_year_counters OWNER TO postgres;

--
-- Name: fluors; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fluors (
    id bigint NOT NULL,
    name text NOT NULL,
    excitation integer,
    emission integer,
    tag text,
    notes text,
    id_uuid uuid DEFAULT gen_random_uuid() NOT NULL
);


ALTER TABLE public.fluors OWNER TO postgres;

--
-- Name: fluors_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.fluors_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.fluors_id_seq OWNER TO postgres;

--
-- Name: fluors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.fluors_id_seq OWNED BY public.fluors.id;


--
-- Name: mounts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.mounts (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    type text NOT NULL,
    name text NOT NULL,
    description text,
    date_mounted date,
    time_mounted time without time zone,
    mounting_orientation text,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    created_by uuid DEFAULT auth.uid() NOT NULL,
    id_uuid uuid DEFAULT gen_random_uuid() NOT NULL
);


ALTER TABLE public.mounts OWNER TO postgres;

--
-- Name: mutations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.mutations (
    id bigint NOT NULL,
    name text NOT NULL,
    gene text,
    notes text,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    created_by uuid DEFAULT auth.uid() NOT NULL,
    id_uuid uuid DEFAULT gen_random_uuid() NOT NULL
);


ALTER TABLE public.mutations OWNER TO postgres;

--
-- Name: mutations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.mutations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.mutations_id_seq OWNER TO postgres;

--
-- Name: mutations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.mutations_id_seq OWNED BY public.mutations.id;


--
-- Name: tank_categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tank_categories (
    id smallint NOT NULL,
    name text NOT NULL,
    is_nursery boolean DEFAULT false NOT NULL,
    max_age_days integer,
    notes text
);


ALTER TABLE public.tank_categories OWNER TO postgres;

--
-- Name: nursery_current; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.nursery_current AS
 SELECT m.fish_id,
    m.tank_id,
    m.valid_from,
    f.date_birth,
    (CURRENT_DATE - f.date_birth) AS age_days,
    COALESCE(t.max_age_days_override, c.max_age_days) AS allowed_days
   FROM (((public.fish_tank_memberships m
     JOIN public.tanks t ON ((t.id = m.tank_id)))
     LEFT JOIN public.tank_categories c ON ((c.id = t.tank_category_id)))
     JOIN public.fish f ON ((f.id = m.fish_id)))
  WHERE ((m.valid_to IS NULL) AND COALESCE(c.is_nursery, false));


ALTER VIEW public.nursery_current OWNER TO postgres;

--
-- Name: nursery_graduation_queue; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.nursery_graduation_queue AS
 SELECT fish_id,
    tank_id,
    valid_from,
    date_birth,
    age_days,
    allowed_days
   FROM public.nursery_current
  WHERE ((allowed_days IS NOT NULL) AND (age_days > allowed_days));


ALTER VIEW public.nursery_graduation_queue OWNER TO postgres;

--
-- Name: plasmid_dyes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.plasmid_dyes (
    plasmid_id bigint NOT NULL,
    dye_id bigint NOT NULL,
    plasmid_id_uuid uuid,
    dye_id_uuid uuid
);


ALTER TABLE public.plasmid_dyes OWNER TO postgres;

--
-- Name: plasmid_fluors; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.plasmid_fluors (
    plasmid_id bigint NOT NULL,
    fluor_id bigint NOT NULL,
    plasmid_id_uuid uuid,
    fluor_id_uuid uuid
);


ALTER TABLE public.plasmid_fluors OWNER TO postgres;

--
-- Name: plasmids; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.plasmids (
    id bigint NOT NULL,
    name text NOT NULL,
    description text,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    nickname text,
    marker text,
    resistance text,
    notes text,
    created_by uuid DEFAULT auth.uid() NOT NULL,
    id_uuid uuid DEFAULT gen_random_uuid() NOT NULL
);


ALTER TABLE public.plasmids OWNER TO postgres;

--
-- Name: plasmids_cassettes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.plasmids_cassettes (
    id bigint NOT NULL,
    plasmid_id bigint NOT NULL,
    cassette_id bigint NOT NULL,
    "position" integer DEFAULT 1 NOT NULL,
    notes text,
    created_by uuid DEFAULT '00000000-0000-0000-0000-000000000000'::uuid NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    plasmid_id_uuid uuid
);


ALTER TABLE public.plasmids_cassettes OWNER TO postgres;

--
-- Name: plasmids_cassettes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.plasmids_cassettes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.plasmids_cassettes_id_seq OWNER TO postgres;

--
-- Name: plasmids_cassettes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.plasmids_cassettes_id_seq OWNED BY public.plasmids_cassettes.id;


--
-- Name: plasmids_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.plasmids_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.plasmids_id_seq OWNER TO postgres;

--
-- Name: plasmids_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.plasmids_id_seq OWNED BY public.plasmids.id;


--
-- Name: profiles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.profiles (
    id uuid NOT NULL,
    email text,
    full_name text,
    created_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.profiles OWNER TO postgres;

--
-- Name: rna; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rna (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    name text NOT NULL,
    description text,
    notes text,
    source text,
    created_by uuid,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    id_uuid uuid DEFAULT gen_random_uuid() NOT NULL
);


ALTER TABLE public.rna OWNER TO postgres;

--
-- Name: TABLE rna; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.rna IS 'RNA entities referenced by treatments (e.g., mRNA, sgRNA pools).';


--
-- Name: rna_fluors; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rna_fluors (
    rna_id uuid NOT NULL,
    fluor_id bigint NOT NULL,
    rna_id_uuid uuid,
    fluor_id_uuid uuid
);


ALTER TABLE public.rna_fluors OWNER TO postgres;

--
-- Name: seedmap_dyes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.seedmap_dyes (
    seed_code text,
    seed_name text,
    id_uuid uuid,
    id bigint
);


ALTER TABLE public.seedmap_dyes OWNER TO postgres;

--
-- Name: seedmap_fish; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.seedmap_fish (
    seed_code text,
    seed_name text,
    id_uuid uuid,
    id bigint
);


ALTER TABLE public.seedmap_fish OWNER TO postgres;

--
-- Name: seedmap_fluors; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.seedmap_fluors (
    seed_code text,
    seed_name text,
    id_uuid uuid,
    id bigint
);


ALTER TABLE public.seedmap_fluors OWNER TO postgres;

--
-- Name: seedmap_mounts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.seedmap_mounts (
    seed_code text,
    seed_name text,
    id_uuid uuid,
    id bigint
);


ALTER TABLE public.seedmap_mounts OWNER TO postgres;

--
-- Name: seedmap_mutations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.seedmap_mutations (
    seed_code text,
    seed_name text,
    id_uuid uuid,
    id bigint
);


ALTER TABLE public.seedmap_mutations OWNER TO postgres;

--
-- Name: seedmap_plasmids; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.seedmap_plasmids (
    seed_code text,
    seed_name text,
    id_uuid uuid,
    id bigint
);


ALTER TABLE public.seedmap_plasmids OWNER TO postgres;

--
-- Name: seedmap_rna; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.seedmap_rna (
    seed_code text,
    seed_name text,
    id_uuid uuid,
    id bigint
);


ALTER TABLE public.seedmap_rna OWNER TO postgres;

--
-- Name: seedmap_selectedphenotypes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.seedmap_selectedphenotypes (
    seed_code text,
    seed_name text,
    id_uuid uuid,
    id bigint
);


ALTER TABLE public.seedmap_selectedphenotypes OWNER TO postgres;

--
-- Name: seedmap_strains; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.seedmap_strains (
    seed_code text,
    seed_name text,
    id_uuid uuid,
    id bigint
);


ALTER TABLE public.seedmap_strains OWNER TO postgres;

--
-- Name: seedmap_tanks; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.seedmap_tanks (
    seed_code text,
    seed_name text,
    id_uuid uuid,
    id bigint
);


ALTER TABLE public.seedmap_tanks OWNER TO postgres;

--
-- Name: seedmap_transgenes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.seedmap_transgenes (
    seed_code text,
    seed_name text,
    id_uuid uuid,
    id bigint
);


ALTER TABLE public.seedmap_transgenes OWNER TO postgres;

--
-- Name: seedmap_treatments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.seedmap_treatments (
    seed_code text,
    seed_name text,
    id_uuid uuid,
    id bigint
);


ALTER TABLE public.seedmap_treatments OWNER TO postgres;

--
-- Name: selectedphenotypes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.selectedphenotypes (
    id bigint NOT NULL,
    name text NOT NULL,
    type text,
    description text,
    created_at timestamp with time zone DEFAULT now(),
    created_by uuid DEFAULT auth.uid(),
    id_uuid uuid DEFAULT gen_random_uuid() NOT NULL
);


ALTER TABLE public.selectedphenotypes OWNER TO postgres;

--
-- Name: selectedphenotypes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.selectedphenotypes ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.selectedphenotypes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: staging_dyes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.staging_dyes (
    name text,
    type text,
    description text,
    notes text,
    excitation text
);


ALTER TABLE public.staging_dyes OWNER TO postgres;

--
-- Name: staging_fish; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.staging_fish (
    name text,
    fish_code text,
    sex text,
    date_birth text,
    line_building_stage text,
    status text,
    background_strain_name text,
    tank_code text,
    mom_code text,
    dad_code text,
    notes text,
    created_by text
);


ALTER TABLE public.staging_fish OWNER TO postgres;

--
-- Name: staging_fish_parents; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.staging_fish_parents (
    child_fish_code text,
    parent_fish_code text,
    role text,
    notes text,
    created_by text
);


ALTER TABLE public.staging_fish_parents OWNER TO postgres;

--
-- Name: staging_fish_tank_history; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.staging_fish_tank_history (
    fish_code text,
    tank_code text,
    start_dt text,
    end_dt text,
    notes text,
    created_by text
);


ALTER TABLE public.staging_fish_tank_history OWNER TO postgres;

--
-- Name: staging_fish_transgenes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.staging_fish_transgenes (
    fish_code text,
    transgene_name text,
    transgene_id_uuid uuid,
    zygosity text,
    notes text
);


ALTER TABLE public.staging_fish_transgenes OWNER TO postgres;

--
-- Name: staging_fluors; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.staging_fluors (
    emission text,
    excitation text,
    name text,
    notes text,
    tag text
);


ALTER TABLE public.staging_fluors OWNER TO postgres;

--
-- Name: staging_mounts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.staging_mounts (
    type text,
    name text,
    description text,
    date_mounted text,
    time_mounted text,
    mounting_orientation text
);


ALTER TABLE public.staging_mounts OWNER TO postgres;

--
-- Name: staging_mutations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.staging_mutations (
    name text
);


ALTER TABLE public.staging_mutations OWNER TO postgres;

--
-- Name: staging_plasmid_fluors; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.staging_plasmid_fluors (
    plasmid_name text,
    fluor_name text
);


ALTER TABLE public.staging_plasmid_fluors OWNER TO postgres;

--
-- Name: staging_plasmids; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.staging_plasmids (
    name text,
    description text,
    notes text,
    source text,
    created_by text
);


ALTER TABLE public.staging_plasmids OWNER TO postgres;

--
-- Name: staging_rna; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.staging_rna (
    name text,
    description text,
    notes text,
    source text,
    created_by text
);


ALTER TABLE public.staging_rna OWNER TO postgres;

--
-- Name: staging_rna_fluors; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.staging_rna_fluors (
    rna_name text,
    fluor_name text
);


ALTER TABLE public.staging_rna_fluors OWNER TO postgres;

--
-- Name: staging_selectedphenotypes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.staging_selectedphenotypes (
    name text,
    type text,
    description text
);


ALTER TABLE public.staging_selectedphenotypes OWNER TO postgres;

--
-- Name: staging_strains; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.staging_strains (
    name text,
    description text
);


ALTER TABLE public.staging_strains OWNER TO postgres;

--
-- Name: staging_tanks; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.staging_tanks (
    tank_code text,
    fish_code text,
    tank_type text,
    status text,
    room text,
    rack text,
    "position" text,
    capacity text,
    date_started text,
    notes text,
    created_by text,
    name text,
    type text,
    location text,
    background_strain_name text
);


ALTER TABLE public.staging_tanks OWNER TO postgres;

--
-- Name: staging_tanks_optional; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.staging_tanks_optional (
    tank_name text,
    fish_name text,
    location text,
    description text
);


ALTER TABLE public.staging_tanks_optional OWNER TO postgres;

--
-- Name: staging_transgene_fluors; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.staging_transgene_fluors (
    transgene_name text,
    fluor_name text
);


ALTER TABLE public.staging_transgene_fluors OWNER TO postgres;

--
-- Name: staging_transgenes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.staging_transgenes (
    name text,
    type text,
    description text
);


ALTER TABLE public.staging_transgenes OWNER TO postgres;

--
-- Name: staging_treatment_dyes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.staging_treatment_dyes (
    treatment_label_or_name text,
    dye_name text,
    conc_um text,
    notes text
);


ALTER TABLE public.staging_treatment_dyes OWNER TO postgres;

--
-- Name: staging_treatment_plasmids; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.staging_treatment_plasmids (
    treatment_label_or_name text,
    plasmid_name text,
    amount_ng text,
    conc_ng_per_ul text,
    notes text
);


ALTER TABLE public.staging_treatment_plasmids OWNER TO postgres;

--
-- Name: staging_treatment_rnas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.staging_treatment_rnas (
    treatment_label_or_name text,
    rna_name text,
    amount_ng text,
    notes text
);


ALTER TABLE public.staging_treatment_rnas OWNER TO postgres;

--
-- Name: staging_treatments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.staging_treatments (
    label text,
    notes text
);


ALTER TABLE public.staging_treatments OWNER TO postgres;

--
-- Name: strains; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.strains (
    id bigint NOT NULL,
    name text NOT NULL,
    description text,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    created_by uuid DEFAULT auth.uid() NOT NULL,
    id_uuid uuid DEFAULT gen_random_uuid() NOT NULL
);


ALTER TABLE public.strains OWNER TO postgres;

--
-- Name: strains_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.strains_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.strains_id_seq OWNER TO postgres;

--
-- Name: strains_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.strains_id_seq OWNED BY public.strains.id;


--
-- Name: tank_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tank_categories_id_seq
    AS smallint
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tank_categories_id_seq OWNER TO postgres;

--
-- Name: tank_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tank_categories_id_seq OWNED BY public.tank_categories.id;


--
-- Name: tank_code_counters_site_yy; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tank_code_counters_site_yy (
    yy smallint NOT NULL,
    site_code text NOT NULL,
    last_num integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.tank_code_counters_site_yy OWNER TO postgres;

--
-- Name: tank_current_fish; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.tank_current_fish AS
 SELECT tank_id,
    fish_id,
    valid_from
   FROM public.fish_tank_memberships m
  WHERE (valid_to IS NULL);


ALTER VIEW public.tank_current_fish OWNER TO postgres;

--
-- Name: tank_occupancy_current; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.tank_occupancy_current AS
 SELECT t.id AS tank_id,
    t.name AS tank_name,
    (count(m.fish_id))::integer AS n_fish
   FROM (public.tanks t
     LEFT JOIN public.fish_tank_memberships m ON (((m.tank_id = t.id) AND (m.valid_to IS NULL))))
  GROUP BY t.id, t.name
  ORDER BY t.name;


ALTER VIEW public.tank_occupancy_current OWNER TO postgres;

--
-- Name: tank_year_counters; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tank_year_counters (
    site text NOT NULL,
    yy smallint NOT NULL,
    next_serial integer DEFAULT 1 NOT NULL
);


ALTER TABLE public.tank_year_counters OWNER TO postgres;

--
-- Name: tanks_code_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tanks_code_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tanks_code_seq OWNER TO postgres;

--
-- Name: tanks_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tanks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tanks_id_seq OWNER TO postgres;

--
-- Name: tanks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tanks_id_seq OWNED BY public.tanks.id;


--
-- Name: transgene_fluors; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.transgene_fluors (
    id bigint NOT NULL,
    transgene_id bigint NOT NULL,
    fluor_id bigint NOT NULL,
    transgene_id_uuid uuid,
    fluor_id_uuid uuid
);


ALTER TABLE public.transgene_fluors OWNER TO postgres;

--
-- Name: transgene_fluors_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.transgene_fluors_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.transgene_fluors_id_seq OWNER TO postgres;

--
-- Name: transgene_fluors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.transgene_fluors_id_seq OWNED BY public.transgene_fluors.id;


--
-- Name: transgenes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.transgenes (
    id bigint NOT NULL,
    name text NOT NULL,
    plasmid_id bigint,
    description text,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    created_by uuid DEFAULT auth.uid() NOT NULL,
    type text,
    plasmid_id_uuid uuid,
    id_uuid uuid DEFAULT gen_random_uuid() NOT NULL
);


ALTER TABLE public.transgenes OWNER TO postgres;

--
-- Name: transgenes_fluors; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.transgenes_fluors (
    transgene_id bigint NOT NULL,
    fluor_id bigint NOT NULL,
    transgene_id_uuid uuid,
    fluor_id_uuid uuid
);


ALTER TABLE public.transgenes_fluors OWNER TO postgres;

--
-- Name: transgenes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.transgenes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.transgenes_id_seq OWNER TO postgres;

--
-- Name: transgenes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.transgenes_id_seq OWNED BY public.transgenes.id;


--
-- Name: treatment_dyes_old; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.treatment_dyes_old (
    treatment_id uuid NOT NULL,
    dye_id bigint NOT NULL,
    conc_um numeric,
    notes text,
    dye_id_uuid uuid
);


ALTER TABLE public.treatment_dyes_old OWNER TO postgres;

--
-- Name: treatment_plasmids; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.treatment_plasmids (
    treatment_id uuid NOT NULL,
    plasmid_id bigint NOT NULL,
    amount_ng numeric,
    conc_ng_per_ul numeric,
    notes text,
    plasmid_id_uuid uuid
);


ALTER TABLE public.treatment_plasmids OWNER TO postgres;

--
-- Name: treatment_rnas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.treatment_rnas (
    treatment_id uuid NOT NULL,
    rna_id uuid NOT NULL,
    amount_ng numeric,
    notes text,
    rna_id_uuid uuid
);


ALTER TABLE public.treatment_rnas OWNER TO postgres;

--
-- Name: treatments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.treatments (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    notes text
);


ALTER TABLE public.treatments OWNER TO postgres;

--
-- Name: treatment_components_v; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.treatment_components_v AS
 SELECT t.id AS treatment_id,
    'plasmid'::text AS component_type,
    (tp.plasmid_id)::text AS component_id,
    tp.amount_ng,
    tp.conc_ng_per_ul AS conc,
    tp.notes
   FROM (public.treatments t
     JOIN public.treatment_plasmids tp ON ((t.id = tp.treatment_id)))
UNION ALL
 SELECT t.id AS treatment_id,
    'rna'::text AS component_type,
    (tr.rna_id)::text AS component_id,
    tr.amount_ng,
    NULL::numeric AS conc,
    tr.notes
   FROM (public.treatments t
     JOIN public.treatment_rnas tr ON ((t.id = tr.treatment_id)))
UNION ALL
 SELECT t.id AS treatment_id,
    'dye'::text AS component_type,
    (td.dye_id)::text AS component_id,
    NULL::numeric AS amount_ng,
    td.conc_um AS conc,
    td.notes
   FROM (public.treatments t
     JOIN public.treatment_dyes_old td ON ((t.id = td.treatment_id)));


ALTER VIEW public.treatment_components_v OWNER TO postgres;

--
-- Name: treatment_dyes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.treatment_dyes (
    treatment_id uuid NOT NULL,
    dye_id_uuid uuid NOT NULL,
    conc_um numeric,
    notes text,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    created_by uuid
);


ALTER TABLE public.treatment_dyes OWNER TO postgres;

--
-- Name: treatments_dyes; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.treatments_dyes AS
 SELECT treatment_id,
    dye_id_uuid,
    created_at,
    created_by
   FROM public.treatment_dyes;


ALTER VIEW public.treatments_dyes OWNER TO postgres;

--
-- Name: messages; Type: TABLE; Schema: realtime; Owner: supabase_realtime_admin
--

CREATE TABLE realtime.messages (
    topic text NOT NULL,
    extension text NOT NULL,
    payload jsonb,
    event text,
    private boolean DEFAULT false,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    inserted_at timestamp without time zone DEFAULT now() NOT NULL,
    id uuid DEFAULT gen_random_uuid() NOT NULL
)
PARTITION BY RANGE (inserted_at);


ALTER TABLE realtime.messages OWNER TO supabase_realtime_admin;

--
-- Name: schema_migrations; Type: TABLE; Schema: realtime; Owner: supabase_admin
--

CREATE TABLE realtime.schema_migrations (
    version bigint NOT NULL,
    inserted_at timestamp(0) without time zone
);


ALTER TABLE realtime.schema_migrations OWNER TO supabase_admin;

--
-- Name: subscription; Type: TABLE; Schema: realtime; Owner: supabase_admin
--

CREATE TABLE realtime.subscription (
    id bigint NOT NULL,
    subscription_id uuid NOT NULL,
    entity regclass NOT NULL,
    filters realtime.user_defined_filter[] DEFAULT '{}'::realtime.user_defined_filter[] NOT NULL,
    claims jsonb NOT NULL,
    claims_role regrole GENERATED ALWAYS AS (realtime.to_regrole((claims ->> 'role'::text))) STORED NOT NULL,
    created_at timestamp without time zone DEFAULT timezone('utc'::text, now()) NOT NULL
);


ALTER TABLE realtime.subscription OWNER TO supabase_admin;

--
-- Name: subscription_id_seq; Type: SEQUENCE; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE realtime.subscription ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME realtime.subscription_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: buckets; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.buckets (
    id text NOT NULL,
    name text NOT NULL,
    owner uuid,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now(),
    public boolean DEFAULT false,
    avif_autodetection boolean DEFAULT false,
    file_size_limit bigint,
    allowed_mime_types text[],
    owner_id text
);


ALTER TABLE storage.buckets OWNER TO supabase_storage_admin;

--
-- Name: COLUMN buckets.owner; Type: COMMENT; Schema: storage; Owner: supabase_storage_admin
--

COMMENT ON COLUMN storage.buckets.owner IS 'Field is deprecated, use owner_id instead';


--
-- Name: migrations; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.migrations (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    hash character varying(40) NOT NULL,
    executed_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE storage.migrations OWNER TO supabase_storage_admin;

--
-- Name: objects; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.objects (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    bucket_id text,
    name text,
    owner uuid,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now(),
    last_accessed_at timestamp with time zone DEFAULT now(),
    metadata jsonb,
    path_tokens text[] GENERATED ALWAYS AS (string_to_array(name, '/'::text)) STORED,
    version text,
    owner_id text,
    user_metadata jsonb
);


ALTER TABLE storage.objects OWNER TO supabase_storage_admin;

--
-- Name: COLUMN objects.owner; Type: COMMENT; Schema: storage; Owner: supabase_storage_admin
--

COMMENT ON COLUMN storage.objects.owner IS 'Field is deprecated, use owner_id instead';


--
-- Name: s3_multipart_uploads; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.s3_multipart_uploads (
    id text NOT NULL,
    in_progress_size bigint DEFAULT 0 NOT NULL,
    upload_signature text NOT NULL,
    bucket_id text NOT NULL,
    key text NOT NULL COLLATE pg_catalog."C",
    version text NOT NULL,
    owner_id text,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    user_metadata jsonb
);


ALTER TABLE storage.s3_multipart_uploads OWNER TO supabase_storage_admin;

--
-- Name: s3_multipart_uploads_parts; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.s3_multipart_uploads_parts (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    upload_id text NOT NULL,
    size bigint DEFAULT 0 NOT NULL,
    part_number integer NOT NULL,
    bucket_id text NOT NULL,
    key text NOT NULL COLLATE pg_catalog."C",
    etag text NOT NULL,
    owner_id text,
    version text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE storage.s3_multipart_uploads_parts OWNER TO supabase_storage_admin;

--
-- Name: schema_migrations; Type: TABLE; Schema: supabase_migrations; Owner: postgres
--

CREATE TABLE supabase_migrations.schema_migrations (
    version text NOT NULL,
    statements text[],
    name text
);


ALTER TABLE supabase_migrations.schema_migrations OWNER TO postgres;

--
-- Name: seed_files; Type: TABLE; Schema: supabase_migrations; Owner: postgres
--

CREATE TABLE supabase_migrations.seed_files (
    path text NOT NULL,
    hash text NOT NULL
);


ALTER TABLE supabase_migrations.seed_files OWNER TO postgres;

--
-- Name: refresh_tokens id; Type: DEFAULT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.refresh_tokens ALTER COLUMN id SET DEFAULT nextval('auth.refresh_tokens_id_seq'::regclass);


--
-- Name: dyes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dyes ALTER COLUMN id SET DEFAULT nextval('public.dyes_id_seq'::regclass);


--
-- Name: fish id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fish ALTER COLUMN id SET DEFAULT nextval('public.fish_id_seq'::regclass);


--
-- Name: fish_tank_memberships id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fish_tank_memberships ALTER COLUMN id SET DEFAULT nextval('public.fish_tank_memberships_id_seq'::regclass);


--
-- Name: fish_treatments id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fish_treatments ALTER COLUMN id SET DEFAULT nextval('public.fish_treatments_id_seq'::regclass);


--
-- Name: fluors id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fluors ALTER COLUMN id SET DEFAULT nextval('public.fluors_id_seq'::regclass);


--
-- Name: mutations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mutations ALTER COLUMN id SET DEFAULT nextval('public.mutations_id_seq'::regclass);


--
-- Name: plasmids id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plasmids ALTER COLUMN id SET DEFAULT nextval('public.plasmids_id_seq'::regclass);


--
-- Name: plasmids_cassettes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plasmids_cassettes ALTER COLUMN id SET DEFAULT nextval('public.plasmids_cassettes_id_seq'::regclass);


--
-- Name: strains id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strains ALTER COLUMN id SET DEFAULT nextval('public.strains_id_seq'::regclass);


--
-- Name: tank_categories id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tank_categories ALTER COLUMN id SET DEFAULT nextval('public.tank_categories_id_seq'::regclass);


--
-- Name: tanks id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tanks ALTER COLUMN id SET DEFAULT nextval('public.tanks_id_seq'::regclass);


--
-- Name: transgene_fluors id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transgene_fluors ALTER COLUMN id SET DEFAULT nextval('public.transgene_fluors_id_seq'::regclass);


--
-- Name: transgenes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transgenes ALTER COLUMN id SET DEFAULT nextval('public.transgenes_id_seq'::regclass);


--
-- Data for Name: audit_log_entries; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.audit_log_entries (instance_id, id, payload, created_at, ip_address) FROM stdin;
00000000-0000-0000-0000-000000000000	23f11c95-b286-4b41-914f-28401f6edcd4	{"action":"user_confirmation_requested","actor_id":"84c9b40f-0450-4311-af2b-220cebfb4c19","actor_name":"","actor_username":"dave.kokel@gmail.com","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}	2025-08-30 04:49:32.877102+00	
00000000-0000-0000-0000-000000000000	3a896b13-d659-49b5-9bf3-715996032646	{"action":"user_signedup","actor_id":"84c9b40f-0450-4311-af2b-220cebfb4c19","actor_name":"","actor_username":"dave.kokel@gmail.com","actor_via_sso":false,"log_type":"team","traits":{"provider":"email"}}	2025-08-30 04:49:49.888357+00	
00000000-0000-0000-0000-000000000000	e5bacfbc-8f4e-4b81-913f-f778a301b3ec	{"action":"user_invited","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"davekokel@berkeley.edu","user_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f"}}	2025-08-30 05:12:30.102904+00	
00000000-0000-0000-0000-000000000000	3f84d240-9b96-4b8f-a689-1d005410d54a	{"action":"user_signedup","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"team","traits":{"provider":"email"}}	2025-08-30 05:19:04.843516+00	
00000000-0000-0000-0000-000000000000	558b0569-37e4-4a93-b0be-aab09859fdd8	{"action":"user_recovery_requested","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"user"}	2025-08-30 05:24:20.353491+00	
00000000-0000-0000-0000-000000000000	e5da6294-d475-453a-8ddc-b03fc8c8be20	{"action":"login","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"account"}	2025-08-30 05:24:29.575713+00	
00000000-0000-0000-0000-000000000000	3bc5264a-bf5e-4a54-8a65-d8311521c6d0	{"action":"user_recovery_requested","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"user"}	2025-08-30 05:33:35.084976+00	
00000000-0000-0000-0000-000000000000	8e4aa8a2-4985-4f3a-9eae-ee4f057df5af	{"action":"login","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"account"}	2025-08-30 05:33:53.801831+00	
00000000-0000-0000-0000-000000000000	40717e21-d0be-4345-955a-4c7734b5a8e8	{"action":"user_recovery_requested","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"user"}	2025-08-30 06:24:39.713199+00	
00000000-0000-0000-0000-000000000000	f1219e76-fc4e-49de-b4ad-24a68090929c	{"action":"login","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"account"}	2025-08-30 06:24:48.48891+00	
00000000-0000-0000-0000-000000000000	f32debc7-36d0-4ed0-9796-2f41c751158d	{"action":"user_recovery_requested","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"user"}	2025-08-30 06:26:23.86754+00	
00000000-0000-0000-0000-000000000000	941a6544-c582-4b61-bf3e-8fd69b12669f	{"action":"user_recovery_requested","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"user"}	2025-08-30 06:27:24.799314+00	
00000000-0000-0000-0000-000000000000	975aef96-fd04-4670-aaf8-a8620c5c3f68	{"action":"login","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"account"}	2025-08-30 06:27:32.228688+00	
00000000-0000-0000-0000-000000000000	444b6d5a-fa28-4ce8-8e9d-016fd7f4e11c	{"action":"user_recovery_requested","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"user"}	2025-08-30 06:43:41.470366+00	
00000000-0000-0000-0000-000000000000	c84c6998-050f-496c-bfaf-07fdf97e4ed1	{"action":"login","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"account"}	2025-08-30 06:44:09.469479+00	
00000000-0000-0000-0000-000000000000	ca48f267-36bf-4a94-86ac-81e7d106abfd	{"action":"user_recovery_requested","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"user"}	2025-08-30 06:50:29.373161+00	
00000000-0000-0000-0000-000000000000	ec6b2bc9-528d-42c0-967f-a821d66e22b3	{"action":"login","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"account"}	2025-08-30 06:50:36.632799+00	
00000000-0000-0000-0000-000000000000	c66af0ba-5b9d-45a9-9833-130302defbf9	{"action":"user_recovery_requested","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"user"}	2025-08-30 06:56:32.478042+00	
00000000-0000-0000-0000-000000000000	9f173aac-a925-4a8e-8cdc-def30eea6723	{"action":"login","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"account"}	2025-08-30 06:56:40.694851+00	
00000000-0000-0000-0000-000000000000	c43e34b1-d7a2-470d-a078-f744dec64814	{"action":"user_recovery_requested","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"user"}	2025-08-30 07:00:07.67459+00	
00000000-0000-0000-0000-000000000000	b1231a18-af1e-4e48-9c64-0ddeb097fb12	{"action":"login","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"account"}	2025-08-30 07:00:20.649861+00	
00000000-0000-0000-0000-000000000000	a3f0b027-6376-4654-86c8-547fb7352ea9	{"action":"user_recovery_requested","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"user"}	2025-08-30 07:02:13.985295+00	
00000000-0000-0000-0000-000000000000	8a8a9688-3168-489e-bcad-e52b901fdb56	{"action":"login","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"account"}	2025-08-30 07:27:24.679031+00	
00000000-0000-0000-0000-000000000000	31bd4c08-780e-4735-b7be-9d91e70f05b0	{"action":"user_recovery_requested","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"user"}	2025-08-30 07:27:37.180228+00	
00000000-0000-0000-0000-000000000000	edb02c1c-2b18-44b8-8775-45d27495c9c3	{"action":"login","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"account"}	2025-08-30 07:27:53.272682+00	
00000000-0000-0000-0000-000000000000	e5fd49b2-4c0b-447b-b4f9-063a2bb12976	{"action":"user_recovery_requested","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"user"}	2025-08-30 07:33:53.879332+00	
00000000-0000-0000-0000-000000000000	dc9b3342-7772-4691-a089-105bf0ca8281	{"action":"login","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"account"}	2025-08-30 07:34:11.019037+00	
00000000-0000-0000-0000-000000000000	c4219da7-3555-4e5f-ae27-eba87db1ad55	{"action":"user_recovery_requested","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"user"}	2025-08-30 07:36:26.183028+00	
00000000-0000-0000-0000-000000000000	cb7692fc-7aea-4dc5-80a5-3f1a277e5ef9	{"action":"login","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"account"}	2025-08-30 07:37:28.967771+00	
00000000-0000-0000-0000-000000000000	cfe2ba91-8201-44d3-a1eb-f3d5969d7583	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-08-30 08:37:18.506367+00	
00000000-0000-0000-0000-000000000000	9b4dbde5-abc0-49d4-ac7c-2bc7a49c2d93	{"action":"token_revoked","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-08-30 08:37:18.535759+00	
00000000-0000-0000-0000-000000000000	797a751f-a9d7-42d2-b739-746a04d97c62	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-08-30 08:37:18.865106+00	
00000000-0000-0000-0000-000000000000	2bc30c7f-474f-4d83-b598-b5e4bfe1dc76	{"action":"token_revoked","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-08-30 08:37:18.867726+00	
00000000-0000-0000-0000-000000000000	2e8d2fa2-1eea-4374-b6ab-bde1340dfd4f	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-08-30 09:37:08.663229+00	
00000000-0000-0000-0000-000000000000	291514b0-bd46-478b-9900-f9a4618847b9	{"action":"token_revoked","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-08-30 09:37:08.672836+00	
00000000-0000-0000-0000-000000000000	343a312f-a6ee-4593-9593-bf19f5183b7a	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-08-30 09:37:09.024934+00	
00000000-0000-0000-0000-000000000000	55fc8b60-6b39-4fe1-998f-2fcdbec2fe32	{"action":"token_revoked","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-08-30 09:37:09.026736+00	
00000000-0000-0000-0000-000000000000	f48264b2-0092-4ecb-a3e4-540591d1bb81	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-08-30 10:36:59.847477+00	
00000000-0000-0000-0000-000000000000	a44f0834-4379-422e-95c2-6760096ee5fb	{"action":"token_revoked","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-08-30 10:36:59.856123+00	
00000000-0000-0000-0000-000000000000	93927cd1-2955-4ea8-8eec-78abdfc4662a	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-08-30 10:37:00.160876+00	
00000000-0000-0000-0000-000000000000	c46b10b4-8160-433b-afb9-2303fa289af0	{"action":"token_revoked","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-08-30 10:37:00.163268+00	
00000000-0000-0000-0000-000000000000	2f710a62-4d17-488e-bc22-c7c8518ebf0f	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-08-30 11:36:51.03839+00	
00000000-0000-0000-0000-000000000000	90113e3f-4f73-4e7e-a843-54be99523e21	{"action":"token_revoked","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-08-30 11:36:51.046632+00	
00000000-0000-0000-0000-000000000000	6bf11b63-8779-4c22-91d1-d56be7258cde	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-08-30 11:36:51.224645+00	
00000000-0000-0000-0000-000000000000	8960467f-4da3-4f75-8f9f-7c3daa823ea0	{"action":"token_revoked","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-08-30 11:36:51.226041+00	
00000000-0000-0000-0000-000000000000	d3a2aa8e-2553-4ca0-9bc7-b24bbbc0e114	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-08-30 12:36:42.166155+00	
00000000-0000-0000-0000-000000000000	ca6de815-996a-4828-8df9-3f320ab05f1f	{"action":"token_revoked","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-08-30 12:36:42.190226+00	
00000000-0000-0000-0000-000000000000	c73ecbe9-0974-46bd-a323-69af8f18f905	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-08-30 12:36:42.566901+00	
00000000-0000-0000-0000-000000000000	b51d7324-99a2-4be6-bc80-131f155c8117	{"action":"token_revoked","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-08-30 12:36:42.571932+00	
00000000-0000-0000-0000-000000000000	3f10c413-ad14-4d3c-88e1-97a43d40485b	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-08-30 13:36:32.360862+00	
00000000-0000-0000-0000-000000000000	0c79a4e3-0d61-417e-929c-78fdef38af0b	{"action":"token_revoked","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-08-30 13:36:32.37126+00	
00000000-0000-0000-0000-000000000000	00cf277c-5f37-4fed-934c-f6c2bb17ed9f	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-08-30 13:36:32.688167+00	
00000000-0000-0000-0000-000000000000	13b0f47e-c999-4100-a27e-e7a4aa80dc23	{"action":"token_revoked","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-08-30 13:36:32.690386+00	
00000000-0000-0000-0000-000000000000	29ee6ac2-92b3-4a86-8248-8246b0fb3e1b	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-08-30 14:36:22.501439+00	
00000000-0000-0000-0000-000000000000	f55ce9c5-2abd-4b2c-8b37-7237aaaa4788	{"action":"token_revoked","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-08-30 14:36:22.514208+00	
00000000-0000-0000-0000-000000000000	6ab68b31-bc02-4954-b4eb-1074a1b071a9	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-08-30 14:36:22.804077+00	
00000000-0000-0000-0000-000000000000	a3d25086-8ac9-4fa6-adaf-0684118a756f	{"action":"token_revoked","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-08-30 14:36:22.808378+00	
00000000-0000-0000-0000-000000000000	4790e562-54fc-47d4-8636-199fb940d306	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-08-30 15:36:12.559396+00	
00000000-0000-0000-0000-000000000000	4b237480-bba4-447d-abd7-7d32e3f719b7	{"action":"token_revoked","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-08-30 15:36:12.573287+00	
00000000-0000-0000-0000-000000000000	f516b3a5-58f5-47e7-b70e-271362dbf797	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-08-30 15:36:12.894561+00	
00000000-0000-0000-0000-000000000000	f6f6fc9d-b500-42b4-8d58-7e4e02f1213b	{"action":"token_revoked","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-08-30 15:36:12.897777+00	
00000000-0000-0000-0000-000000000000	7526b496-cf93-4e25-a174-0313b6d1993e	{"action":"user_recovery_requested","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"user"}	2025-08-30 15:56:37.316348+00	
00000000-0000-0000-0000-000000000000	0acf7f28-1b0d-475a-bc54-fbc88382d622	{"action":"login","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"account"}	2025-08-30 15:57:31.107648+00	
00000000-0000-0000-0000-000000000000	1e569fdb-c51e-4641-895b-35cb10b575e9	{"action":"user_recovery_requested","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"user"}	2025-08-30 16:10:02.186453+00	
00000000-0000-0000-0000-000000000000	e9a8a942-6dd4-4fb8-be1a-f10f90d01ddf	{"action":"login","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"account"}	2025-08-30 16:10:13.143861+00	
00000000-0000-0000-0000-000000000000	aa59bf1f-bd64-47b9-9b93-e78828bf358e	{"action":"user_recovery_requested","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"user"}	2025-08-30 16:14:32.927099+00	
00000000-0000-0000-0000-000000000000	6d6311e1-eb01-4a32-8432-09af29e8d63a	{"action":"login","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"account"}	2025-08-30 16:14:41.974427+00	
00000000-0000-0000-0000-000000000000	e3f19d53-abb7-44ac-bb60-70cc99a556fb	{"action":"user_recovery_requested","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"user"}	2025-08-30 16:23:34.96939+00	
00000000-0000-0000-0000-000000000000	3dca299e-cd1c-43f6-807b-b6a89f52bd01	{"action":"login","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"account"}	2025-08-30 16:23:44.914017+00	
00000000-0000-0000-0000-000000000000	ee271545-9fd2-4c53-8c86-99ae42e83578	{"action":"user_recovery_requested","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"user"}	2025-08-30 16:25:38.23674+00	
00000000-0000-0000-0000-000000000000	51112d0b-db92-4722-a8cc-a5238e02d25a	{"action":"login","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"account"}	2025-08-30 16:25:51.150534+00	
00000000-0000-0000-0000-000000000000	f721bcf5-90d2-4285-abae-b357e1a03c1c	{"action":"user_recovery_requested","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"user"}	2025-08-30 16:44:48.745538+00	
00000000-0000-0000-0000-000000000000	9552240e-6d97-431d-bd59-5eaf0b17fbb9	{"action":"login","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"account"}	2025-08-30 16:47:14.073464+00	
00000000-0000-0000-0000-000000000000	0a0e9f35-9875-440c-8beb-df814746cf4d	{"action":"user_recovery_requested","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"user"}	2025-08-30 16:49:37.039371+00	
00000000-0000-0000-0000-000000000000	b5382ba1-0693-42c4-9b3e-cb58eaaef505	{"action":"login","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"account"}	2025-08-30 16:49:56.401522+00	
00000000-0000-0000-0000-000000000000	154f2eb3-49b9-406b-a7d4-29ee79862598	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-08-30 17:49:46.62312+00	
00000000-0000-0000-0000-000000000000	5d7e7d4a-9886-45d2-a048-6bce59814f60	{"action":"token_revoked","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-08-30 17:49:46.635203+00	
00000000-0000-0000-0000-000000000000	9b17009f-2da8-40a5-a73d-49dbf9682023	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-08-30 17:49:46.994174+00	
00000000-0000-0000-0000-000000000000	395693f8-fbe8-4ae5-8b60-7d1e4f47d084	{"action":"token_revoked","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-08-30 17:49:46.995597+00	
00000000-0000-0000-0000-000000000000	d6011e00-ab1b-41ef-aa5a-919e5e4e2004	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-08-30 18:49:37.876723+00	
00000000-0000-0000-0000-000000000000	a8401be9-4f01-4c78-af5c-e11c35f99a04	{"action":"token_revoked","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-08-30 18:49:37.890778+00	
00000000-0000-0000-0000-000000000000	f3281658-3800-4a67-b3cf-ccc017861fdd	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-08-30 18:49:38.201058+00	
00000000-0000-0000-0000-000000000000	5e8d54b4-5d30-4de0-9f16-3f1c12668655	{"action":"token_revoked","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-08-30 18:49:38.204559+00	
00000000-0000-0000-0000-000000000000	f060ff9e-42ee-47ed-95ae-7ca52394de75	{"action":"user_recovery_requested","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"user"}	2025-08-30 19:40:25.130197+00	
00000000-0000-0000-0000-000000000000	e0c434de-1e71-418f-8649-a84bdac3febc	{"action":"login","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"account"}	2025-08-30 19:40:36.065196+00	
00000000-0000-0000-0000-000000000000	1639abdb-bb38-4328-bfbe-8c3b959644c9	{"action":"user_updated_password","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"user"}	2025-08-30 19:40:59.529414+00	
00000000-0000-0000-0000-000000000000	8b056d56-8ac1-479c-9e30-c120103e4ef2	{"action":"user_modified","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"user"}	2025-08-30 19:40:59.530206+00	
00000000-0000-0000-0000-000000000000	8f312908-fe37-434d-9971-504b14597c8b	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-08-30 20:40:26.678187+00	
00000000-0000-0000-0000-000000000000	431d6cbd-bb40-445f-bfbd-87dc57caa5b4	{"action":"token_revoked","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-08-30 20:40:26.69956+00	
00000000-0000-0000-0000-000000000000	3d28672b-bc25-4b8c-abdb-d3d8fed46d39	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-08-30 20:40:27.016181+00	
00000000-0000-0000-0000-000000000000	75e0d343-6b4e-4248-b702-92be0c6d790b	{"action":"token_revoked","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-08-30 20:40:27.018439+00	
00000000-0000-0000-0000-000000000000	8d881761-35fa-498b-87b6-d504e9f32c4b	{"action":"login","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-30 21:26:30.824028+00	
00000000-0000-0000-0000-000000000000	4d353720-524a-4b55-809d-b0dbaaf69c42	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-08-30 22:26:20.819701+00	
00000000-0000-0000-0000-000000000000	486982e6-2908-4007-ad55-a6461225cee6	{"action":"token_revoked","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-08-30 22:26:20.841726+00	
00000000-0000-0000-0000-000000000000	662cb952-e277-4278-8686-b5a067809772	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-08-30 22:26:21.150716+00	
00000000-0000-0000-0000-000000000000	d3ea19f0-a437-4ef3-8506-1e244bf5fca8	{"action":"token_revoked","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-08-30 22:26:21.152673+00	
00000000-0000-0000-0000-000000000000	88b349d9-92a9-4796-bfbf-7f68630d32a2	{"action":"login","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-30 22:27:49.998264+00	
00000000-0000-0000-0000-000000000000	f953d99d-dd04-4f92-9914-37b3b74baab7	{"action":"login","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-30 22:44:59.464887+00	
00000000-0000-0000-0000-000000000000	cc0d573f-f17b-412f-b1da-f50d5c1b886a	{"action":"login","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-30 22:49:57.21839+00	
00000000-0000-0000-0000-000000000000	44a3f3ee-7689-4fad-944a-098f77150cc0	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-08-30 23:27:41.06482+00	
00000000-0000-0000-0000-000000000000	fca3eea6-68d5-4353-a7f4-0fa60094b692	{"action":"token_revoked","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-08-30 23:27:41.083248+00	
00000000-0000-0000-0000-000000000000	27557020-644f-456d-b038-db12958ac8da	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-08-30 23:27:41.372918+00	
00000000-0000-0000-0000-000000000000	0de1591f-7cd7-4074-b245-98198dca55c0	{"action":"token_revoked","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-08-30 23:27:41.373652+00	
00000000-0000-0000-0000-000000000000	30316d79-c631-44f8-ba30-28acae576592	{"action":"login","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-30 23:38:58.345057+00	
00000000-0000-0000-0000-000000000000	5bfbd10d-2d51-486a-8bdc-b1b3a80c01ee	{"action":"login","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-30 23:41:22.346311+00	
00000000-0000-0000-0000-000000000000	82bf58aa-5bde-4651-b259-bf3be50f9b42	{"action":"login","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-30 23:45:11.183669+00	
00000000-0000-0000-0000-000000000000	7f84b328-177b-4116-89ae-954ed68869e1	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-08-31 00:27:32.107629+00	
00000000-0000-0000-0000-000000000000	99186e42-b3fe-4cf6-9bbd-879c81f3d9d3	{"action":"token_revoked","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-08-31 00:27:32.129573+00	
00000000-0000-0000-0000-000000000000	d4e7bfa2-b105-4175-bc59-f035f44d257e	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-08-31 00:27:32.419511+00	
00000000-0000-0000-0000-000000000000	f8ffbffa-aacf-4101-bf62-15af21366a40	{"action":"token_revoked","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-08-31 00:27:32.420809+00	
00000000-0000-0000-0000-000000000000	501c91f2-b899-4a20-8848-7c61db2eca4c	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-08-31 01:27:23.070502+00	
00000000-0000-0000-0000-000000000000	c3f9c963-524e-43d4-9fa4-274bb4b361bc	{"action":"token_revoked","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-08-31 01:27:23.081595+00	
00000000-0000-0000-0000-000000000000	0a0fcf7e-fccb-4f34-9083-9cdee106cdc0	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-08-31 01:27:23.376978+00	
00000000-0000-0000-0000-000000000000	ebbed30f-820f-41d9-8a4f-a6c565001493	{"action":"token_revoked","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-08-31 01:27:23.378344+00	
00000000-0000-0000-0000-000000000000	b3169652-8ab3-47d3-8504-b570d7bae883	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-08-31 02:27:14.275592+00	
00000000-0000-0000-0000-000000000000	fab70afc-2281-4bcc-953c-272b660743f7	{"action":"token_revoked","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-08-31 02:27:14.288958+00	
00000000-0000-0000-0000-000000000000	4be7e20c-8a36-4607-9e5c-028bd2522f4a	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-08-31 02:27:14.650718+00	
00000000-0000-0000-0000-000000000000	006c6ca3-86b0-414a-8a0a-9bf3d7e89c87	{"action":"token_revoked","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-08-31 02:27:14.651424+00	
00000000-0000-0000-0000-000000000000	92529d7e-8d80-4955-b1cd-97f90ae4bcd2	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-08-31 03:27:04.547186+00	
00000000-0000-0000-0000-000000000000	543a9823-7097-46b0-a6cf-62f917a57ac9	{"action":"token_revoked","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-08-31 03:27:04.564032+00	
00000000-0000-0000-0000-000000000000	9f7c7aa0-8cab-4a29-ab88-840f96fea72d	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-08-31 03:27:04.883755+00	
00000000-0000-0000-0000-000000000000	77c955bf-8ebd-4e37-b377-840b130c5e5c	{"action":"token_revoked","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-08-31 03:27:04.8858+00	
00000000-0000-0000-0000-000000000000	3c8348ff-4f95-4a82-89d7-40a39cbdfbe4	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-08-31 04:26:54.63206+00	
00000000-0000-0000-0000-000000000000	a377716b-3e2f-4e29-835b-ebb6d65c954e	{"action":"token_revoked","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-08-31 04:26:54.642756+00	
00000000-0000-0000-0000-000000000000	365e47af-0f57-48ce-b50a-e946fccf8c0d	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-08-31 04:26:54.922687+00	
00000000-0000-0000-0000-000000000000	2a2400ee-cec2-450e-8d40-2649f0efa864	{"action":"token_revoked","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-08-31 04:26:54.925312+00	
00000000-0000-0000-0000-000000000000	4654eaae-b09e-441c-81a4-910cdf7c17bd	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-08-31 05:26:44.878067+00	
00000000-0000-0000-0000-000000000000	ee2e5e01-bfe9-43a8-8d1b-2542b33ff5ed	{"action":"token_revoked","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-08-31 05:26:44.904702+00	
00000000-0000-0000-0000-000000000000	b428d839-5bcc-44fe-a517-5a157725e656	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-08-31 05:26:45.320235+00	
00000000-0000-0000-0000-000000000000	77365c91-e7fd-4185-a431-5a7c8dade3ca	{"action":"token_revoked","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-08-31 05:26:45.322953+00	
00000000-0000-0000-0000-000000000000	97c3f7c2-0d62-440a-831d-f42700a8c8ea	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-13 17:29:25.865451+00	
00000000-0000-0000-0000-000000000000	c441a3a8-81f9-479d-9813-53da49fa56c8	{"action":"login","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-02 20:05:17.010253+00	
00000000-0000-0000-0000-000000000000	095b99b5-e784-49ae-bcf9-aa21da51608f	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-02 21:05:08.128192+00	
00000000-0000-0000-0000-000000000000	ceeb049b-857a-4526-b22d-2fd3344cee0d	{"action":"token_revoked","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-02 21:05:08.141748+00	
00000000-0000-0000-0000-000000000000	57ac54d3-9b5d-4a52-8df1-43e43487526e	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-02 21:05:08.459701+00	
00000000-0000-0000-0000-000000000000	0bfa77a1-cd72-4049-b475-849489cc7cc1	{"action":"token_revoked","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-02 21:05:08.461673+00	
00000000-0000-0000-0000-000000000000	5154b885-88de-447d-aa59-8328df398049	{"action":"login","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-02 21:36:12.351242+00	
00000000-0000-0000-0000-000000000000	144bd178-2656-413c-b870-5ddab7de70cb	{"action":"login","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-02 21:56:08.393464+00	
00000000-0000-0000-0000-000000000000	8fcb3e23-abab-48eb-a478-5e4080b53cdc	{"action":"logout","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"account"}	2025-09-02 22:17:15.697791+00	
00000000-0000-0000-0000-000000000000	b8989c5c-165a-4319-9080-1749b13704e9	{"action":"login","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-02 22:17:29.166046+00	
00000000-0000-0000-0000-000000000000	e09e7d5d-d7e1-40f0-818f-84902bafca62	{"action":"login","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-02 22:18:38.805959+00	
00000000-0000-0000-0000-000000000000	48ea7849-0a23-4094-9e0e-45149ac00fdf	{"action":"login","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-02 22:21:11.687115+00	
00000000-0000-0000-0000-000000000000	06952551-bc5a-444a-ad2f-35c29ebbde8a	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-02 23:21:01.948651+00	
00000000-0000-0000-0000-000000000000	1d062f10-86a8-462c-b5a9-27080a49622b	{"action":"token_revoked","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-02 23:21:01.967485+00	
00000000-0000-0000-0000-000000000000	bc9cfad3-32e8-4e8a-a1d6-6315364493b9	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-02 23:21:02.386452+00	
00000000-0000-0000-0000-000000000000	10a8fb06-8dd4-40f4-ae29-b1c419c516de	{"action":"token_revoked","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-02 23:21:02.387154+00	
00000000-0000-0000-0000-000000000000	70bc69f6-7354-4f24-bd30-87accc5a4235	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-03 00:20:53.212363+00	
00000000-0000-0000-0000-000000000000	9c80025d-6261-44ac-a88f-f8caa88cc793	{"action":"token_revoked","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-03 00:20:53.22646+00	
00000000-0000-0000-0000-000000000000	bb6b08af-ca57-44db-9f3e-315d32e32e8f	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-03 00:20:53.533324+00	
00000000-0000-0000-0000-000000000000	6136d471-25c5-4861-9062-e6530af1bf73	{"action":"token_revoked","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-03 00:20:53.535+00	
00000000-0000-0000-0000-000000000000	d12b1dd9-794b-4150-8a08-79703282a30f	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-03 01:20:43.386225+00	
00000000-0000-0000-0000-000000000000	d7225d82-b1c7-4329-99b3-7907accd3325	{"action":"token_revoked","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-03 01:20:43.400253+00	
00000000-0000-0000-0000-000000000000	23d9593b-9380-4c2e-bbc5-ed1b425b9900	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-03 01:20:43.679318+00	
00000000-0000-0000-0000-000000000000	904396c5-de8b-4ad5-a40c-6ff25e1ff051	{"action":"token_revoked","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-03 01:20:43.680597+00	
00000000-0000-0000-0000-000000000000	437f8d64-c2db-4879-98fa-0764dcc1c158	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-03 02:20:33.479541+00	
00000000-0000-0000-0000-000000000000	0326479b-e6c7-425b-9366-c9a71959bc16	{"action":"token_revoked","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-03 02:20:33.497453+00	
00000000-0000-0000-0000-000000000000	561eca07-e318-409d-a1d5-47abb8978a29	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-03 02:20:33.78517+00	
00000000-0000-0000-0000-000000000000	3c622a88-63f8-420d-8505-da69659b17be	{"action":"token_revoked","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-03 02:20:33.787006+00	
00000000-0000-0000-0000-000000000000	13bccdcf-13e4-478a-a8f9-7dab8b802f50	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-03 03:20:23.592789+00	
00000000-0000-0000-0000-000000000000	8ddb955f-7dd0-4357-8955-d13a4762ad4f	{"action":"token_revoked","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-03 03:20:23.604631+00	
00000000-0000-0000-0000-000000000000	47f26550-60c3-43be-adeb-7863af56a6a6	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-03 03:20:23.941524+00	
00000000-0000-0000-0000-000000000000	de66c7ad-4780-4f14-86d0-9287fc1e8c7d	{"action":"token_revoked","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-03 03:20:23.948493+00	
00000000-0000-0000-0000-000000000000	0e8b0998-3f28-477d-b861-43dbc5bb0df3	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-03 04:20:13.697281+00	
00000000-0000-0000-0000-000000000000	b051aa92-78fc-4c0e-81b0-92d78516a661	{"action":"token_revoked","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-03 04:20:13.708675+00	
00000000-0000-0000-0000-000000000000	21c81600-c20c-4125-99f9-467b695c79f0	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-03 04:20:14.013159+00	
00000000-0000-0000-0000-000000000000	10c1388b-2b0a-4380-98d4-59d817a1915b	{"action":"token_revoked","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-03 04:20:14.016118+00	
00000000-0000-0000-0000-000000000000	1f36a98d-dec1-4c73-88c9-dfce6a9d5a7a	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-03 05:20:04.940003+00	
00000000-0000-0000-0000-000000000000	9fba792a-bd24-4cf6-b066-7b142228514f	{"action":"token_revoked","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-03 05:20:04.959512+00	
00000000-0000-0000-0000-000000000000	d250f4a1-0b72-4191-bfbe-d69a6fd1816f	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-03 05:20:05.274901+00	
00000000-0000-0000-0000-000000000000	ba183b37-d2e7-427b-861f-d83f47dc38a6	{"action":"token_revoked","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-03 05:20:05.276904+00	
00000000-0000-0000-0000-000000000000	95f88706-10ae-4953-9790-c222aeaeec9d	{"action":"login","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-04 00:39:39.217574+00	
00000000-0000-0000-0000-000000000000	6f4794d5-2a6a-446b-8c44-85d2bcbd5a02	{"action":"login","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-04 21:22:43.042923+00	
00000000-0000-0000-0000-000000000000	2fd17139-03fc-49b2-80b9-425043a2ed44	{"action":"login","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-04 21:23:27.975514+00	
00000000-0000-0000-0000-000000000000	0d6cba56-ebea-4c3d-8b3e-a8334149670e	{"action":"login","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-04 21:37:11.100965+00	
00000000-0000-0000-0000-000000000000	5dd8aac8-622f-4d50-a289-a81c366632b9	{"action":"login","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-04 22:25:52.931075+00	
00000000-0000-0000-0000-000000000000	58915beb-22ba-4079-a496-8af2c1e7b266	{"action":"login","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-04 23:10:01.849151+00	
00000000-0000-0000-0000-000000000000	5bc17757-0618-429e-940e-87e89a16cdf1	{"action":"login","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-04 23:44:29.054483+00	
00000000-0000-0000-0000-000000000000	e983e997-fa62-4ce1-8be1-b908fa3f3808	{"action":"login","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-04 23:58:12.949311+00	
00000000-0000-0000-0000-000000000000	ca7994fb-5183-4045-b85b-d8755f97f90c	{"action":"login","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-05 00:07:53.993443+00	
00000000-0000-0000-0000-000000000000	ca22d101-bd60-45e4-a691-233db37d6fc8	{"action":"user_recovery_requested","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"user"}	2025-09-13 00:18:15.956568+00	
00000000-0000-0000-0000-000000000000	8a4be586-5f41-41c4-8f06-13eda55778d9	{"action":"login","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"account"}	2025-09-13 00:18:26.997285+00	
00000000-0000-0000-0000-000000000000	8ed2b83d-6e44-4b78-917b-ac67f8f2f427	{"action":"user_recovery_requested","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"user"}	2025-09-13 00:22:47.912238+00	
00000000-0000-0000-0000-000000000000	af228c80-af45-4f4b-bb29-fa441830ecb4	{"action":"login","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"account"}	2025-09-13 00:23:08.678907+00	
00000000-0000-0000-0000-000000000000	e6e132b7-17c6-4318-b76e-88dcc78f862b	{"action":"user_modified","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"user","traits":{"user_email":"davekokel@berkeley.edu","user_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","user_phone":""}}	2025-09-13 00:56:23.73638+00	
00000000-0000-0000-0000-000000000000	105dc43d-45ac-4b52-93fc-e752e40cd6f8	{"action":"user_modified","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"user","traits":{"user_email":"davekokel@berkeley.edu","user_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","user_phone":""}}	2025-09-13 00:59:29.588719+00	
00000000-0000-0000-0000-000000000000	12dac1ac-985e-4101-83e1-b78dfee0d20a	{"action":"user_modified","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"user","traits":{"user_email":"davekokel@berkeley.edu","user_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","user_phone":""}}	2025-09-13 01:02:48.899402+00	
00000000-0000-0000-0000-000000000000	c5d89849-f829-476c-9821-9ad53583644a	{"action":"user_modified","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"user","traits":{"user_email":"davekokel@berkeley.edu","user_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","user_phone":""}}	2025-09-13 01:10:33.17049+00	
00000000-0000-0000-0000-000000000000	801abcb4-51fc-4b2c-a0ad-21d699465649	{"action":"login","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-13 01:11:39.211785+00	
00000000-0000-0000-0000-000000000000	e36ae953-78a0-45af-b719-cbcdf23565e2	{"action":"user_modified","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"user","traits":{"user_email":"davekokel@berkeley.edu","user_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","user_phone":""}}	2025-09-13 01:15:12.73271+00	
00000000-0000-0000-0000-000000000000	f8bb8755-67f5-44ec-bc72-b876e6b60d5d	{"action":"login","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-13 01:15:12.949169+00	
00000000-0000-0000-0000-000000000000	67b67df8-341c-43ec-ab7d-992de069dc07	{"action":"login","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-13 01:15:13.599476+00	
00000000-0000-0000-0000-000000000000	31ed5865-0801-480f-8b47-cf35d66e4637	{"action":"user_modified","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"user","traits":{"user_email":"davekokel@berkeley.edu","user_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","user_phone":""}}	2025-09-13 01:17:43.430882+00	
00000000-0000-0000-0000-000000000000	7cb61600-12b8-4f59-a4c2-3a0967625a15	{"action":"login","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-13 01:17:43.634782+00	
00000000-0000-0000-0000-000000000000	b74e3a47-3724-4907-acff-f73536ebc5a6	{"action":"user_modified","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"user","traits":{"user_email":"davekokel@berkeley.edu","user_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","user_phone":""}}	2025-09-13 01:18:56.858414+00	
00000000-0000-0000-0000-000000000000	e75c4b5a-a2d2-47aa-a375-463a2156c9f0	{"action":"user_modified","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"user","traits":{"user_email":"davekokel@berkeley.edu","user_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","user_phone":""}}	2025-09-13 01:21:15.894982+00	
00000000-0000-0000-0000-000000000000	e2d3e052-3508-477a-870b-542d3c2b5777	{"action":"login","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-13 01:21:16.24833+00	
00000000-0000-0000-0000-000000000000	50470389-c78d-4d3c-8cad-ca5af6508b8c	{"action":"login","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-13 01:22:28.019458+00	
00000000-0000-0000-0000-000000000000	1269296e-34ed-44b5-9c17-6ac8eb3089a7	{"action":"login","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-13 01:28:57.720045+00	
00000000-0000-0000-0000-000000000000	b5c88666-63bd-4443-825a-ec68dda2b57d	{"action":"login","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-13 01:31:39.207329+00	
00000000-0000-0000-0000-000000000000	f5f2e781-56dd-44a4-95a1-da7256399233	{"action":"login","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-13 01:31:53.509877+00	
00000000-0000-0000-0000-000000000000	3532949a-29e5-412e-9175-f436656ea660	{"action":"login","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-13 01:36:38.51787+00	
00000000-0000-0000-0000-000000000000	d8e7e938-d9e4-4428-86dc-11f7480f0636	{"action":"login","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-13 01:36:42.544476+00	
00000000-0000-0000-0000-000000000000	6b6faf0c-e1b0-46e6-8937-5cc1c0890a80	{"action":"login","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-13 01:40:00.399347+00	
00000000-0000-0000-0000-000000000000	cbbd3faa-a1e5-46df-bfdb-53b9f43c8feb	{"action":"login","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-13 01:43:06.409511+00	
00000000-0000-0000-0000-000000000000	34034cfc-39d3-4c87-b6ea-20703ef29f57	{"action":"login","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-13 01:43:12.341641+00	
00000000-0000-0000-0000-000000000000	f330f6c5-7d5e-42d8-9084-264ab54d3fc2	{"action":"login","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-13 01:47:27.03742+00	
00000000-0000-0000-0000-000000000000	8bef8e93-0a4f-4a7b-8346-32d1da7b8b14	{"action":"login","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-13 01:49:38.18574+00	
00000000-0000-0000-0000-000000000000	013a9480-fd9f-4527-88d6-12ff6a61ae68	{"action":"login","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-13 02:41:04.966673+00	
00000000-0000-0000-0000-000000000000	85589ced-7a32-4625-805a-8a7231c253a8	{"action":"login","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-13 15:03:07.289985+00	
00000000-0000-0000-0000-000000000000	5fa588cb-96b2-4c90-86f9-fe2461a4f3b8	{"action":"login","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-13 15:09:56.256451+00	
00000000-0000-0000-0000-000000000000	781b1311-a335-498a-8a38-2b22e8fd8f5e	{"action":"login","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-13 15:17:58.074087+00	
00000000-0000-0000-0000-000000000000	358a184d-9905-49c0-a021-3e778b0f9813	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-13 16:17:48.587534+00	
00000000-0000-0000-0000-000000000000	9ff31f33-ec93-47ec-bee7-8374ed9b83d8	{"action":"token_revoked","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-13 16:17:48.603209+00	
00000000-0000-0000-0000-000000000000	b2eebd0a-74eb-452b-bb76-49bcd7c50256	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-13 16:17:48.676127+00	
00000000-0000-0000-0000-000000000000	b79cac68-e7c2-43cc-81a4-4d8632e3ebe7	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-13 16:17:48.707939+00	
00000000-0000-0000-0000-000000000000	d801e66a-64f7-4fda-8a05-30fa3b4efaf5	{"action":"token_revoked","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-13 16:17:48.708569+00	
00000000-0000-0000-0000-000000000000	8bf75fee-fc45-4af0-84f8-1f879351991b	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-13 16:17:48.752591+00	
00000000-0000-0000-0000-000000000000	9bf2a089-a181-46c5-803d-3e6c3664ab3d	{"action":"login","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-13 16:29:36.707405+00	
00000000-0000-0000-0000-000000000000	c20e4f57-f84d-4fc8-bac2-4a6ab3c019e3	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-13 17:17:37.97579+00	
00000000-0000-0000-0000-000000000000	acae90ac-437a-4d90-8f31-1e1e633abc72	{"action":"token_revoked","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-13 17:17:37.981917+00	
00000000-0000-0000-0000-000000000000	ef57500f-b0da-4489-bb5d-da453ff42c52	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-13 17:17:38.063128+00	
00000000-0000-0000-0000-000000000000	0676175d-5256-4ef3-a57b-11696f9db2b8	{"action":"token_revoked","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-13 17:17:38.063853+00	
00000000-0000-0000-0000-000000000000	d13c136a-76f8-46b5-a3c9-dbdab2c44850	{"action":"token_revoked","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-13 17:29:25.886866+00	
00000000-0000-0000-0000-000000000000	471903b2-dc1b-44c2-beba-dff0d3e88b63	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-13 17:29:25.951045+00	
00000000-0000-0000-0000-000000000000	5d5ee42d-c96d-41e3-8ef8-379986fee7b6	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-13 17:29:25.972416+00	
00000000-0000-0000-0000-000000000000	8af9aa4d-c2cc-4a9d-84f5-960ae0c5df85	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-13 17:29:25.986274+00	
00000000-0000-0000-0000-000000000000	e767a644-98e6-48b5-834c-88787751012d	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-13 17:29:26.004229+00	
00000000-0000-0000-0000-000000000000	e2c4d432-f90e-423f-8678-7bd9bf99c7c4	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-13 17:29:26.017058+00	
00000000-0000-0000-0000-000000000000	a8b78a6d-afc8-4704-8900-9191ae0e2da7	{"action":"token_revoked","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-13 17:29:26.017845+00	
00000000-0000-0000-0000-000000000000	8d0251f9-59ac-4c4a-8406-25f4d44746b8	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-13 17:29:26.03712+00	
00000000-0000-0000-0000-000000000000	4c287d80-bddc-461a-bfd2-7c89b1bb1a41	{"action":"token_revoked","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-13 17:29:26.040634+00	
00000000-0000-0000-0000-000000000000	6a52c31d-4b85-4e82-884a-fa3fa8b7850e	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-13 17:29:26.066139+00	
00000000-0000-0000-0000-000000000000	f8a36c11-9831-4625-9683-993dad1b73e1	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-13 17:29:26.078068+00	
00000000-0000-0000-0000-000000000000	acfc4be7-f878-4fbc-bf83-6adcb6daf9a9	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-13 17:29:26.094931+00	
00000000-0000-0000-0000-000000000000	ceb36b49-9125-415f-9d19-a7eb72d3745a	{"action":"token_revoked","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-13 17:29:26.102781+00	
00000000-0000-0000-0000-000000000000	0da68ab0-7584-4b31-adfd-a0bd71c402e3	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-13 17:29:26.147576+00	
00000000-0000-0000-0000-000000000000	2f10244b-19ed-4ce6-8451-2c52a503eca0	{"action":"token_revoked","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-13 17:29:26.148338+00	
00000000-0000-0000-0000-000000000000	0f24d2b3-3daa-41ac-86db-652db3031eb6	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-13 17:29:26.156908+00	
00000000-0000-0000-0000-000000000000	8963099e-a35a-4f36-923b-daba81cf41f9	{"action":"token_revoked","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-13 17:29:26.157786+00	
00000000-0000-0000-0000-000000000000	05859c93-7634-4c7b-b06d-34dfbb5a8928	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-13 17:29:26.183942+00	
00000000-0000-0000-0000-000000000000	2ae8fc6e-7d17-4be0-a97b-c08be1b21948	{"action":"token_revoked","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-13 17:29:26.1857+00	
00000000-0000-0000-0000-000000000000	0e39caa5-3be1-4848-b2bc-56c09f5e3605	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-13 17:29:26.192711+00	
00000000-0000-0000-0000-000000000000	a592ba02-07ea-4d06-8f74-77124f995ac8	{"action":"token_revoked","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-13 17:29:26.193439+00	
00000000-0000-0000-0000-000000000000	d8dd9ee4-7345-41c4-8838-41069b7aa5f3	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-13 17:29:26.206073+00	
00000000-0000-0000-0000-000000000000	9622f093-488d-4494-a13d-3e5192d04a64	{"action":"token_revoked","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-13 17:29:26.209025+00	
00000000-0000-0000-0000-000000000000	3b3fb7d0-6d36-4d95-9955-67097ee0dc19	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-13 17:29:26.22667+00	
00000000-0000-0000-0000-000000000000	b6530f17-b703-4912-8dc7-737558cbd898	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-13 17:29:26.236914+00	
00000000-0000-0000-0000-000000000000	6bafd69f-b853-4398-89e4-a423f1f408d7	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-13 17:29:26.241205+00	
00000000-0000-0000-0000-000000000000	ade20004-43c8-43e2-b4ae-f06568db8ff6	{"action":"token_revoked","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-13 17:29:26.243184+00	
00000000-0000-0000-0000-000000000000	a15c8cac-dffc-428f-b1b9-906e8a8b3ab9	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-13 17:29:26.260201+00	
00000000-0000-0000-0000-000000000000	e22f0667-e21c-4fd2-88b9-4ba624922fee	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-13 17:29:26.265638+00	
00000000-0000-0000-0000-000000000000	0e7df0c1-0ad3-400f-af64-5ca86fdc453d	{"action":"token_revoked","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-13 17:29:26.266497+00	
00000000-0000-0000-0000-000000000000	7e0e4fae-3d45-450b-88fe-bd6eaec54bb7	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-13 17:29:26.274574+00	
00000000-0000-0000-0000-000000000000	fe3c0880-47eb-40d7-8ba2-bed86ad765f2	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-13 17:29:26.287529+00	
00000000-0000-0000-0000-000000000000	445456db-d2f3-4227-8324-5fd98fd044b9	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-13 17:29:26.293448+00	
00000000-0000-0000-0000-000000000000	3e14a097-2e3d-414b-b748-836023c8b3f9	{"action":"token_revoked","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-13 17:29:26.294542+00	
00000000-0000-0000-0000-000000000000	f29bd1dd-f176-440b-85e7-a5a3ac3c4f8a	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-13 17:29:26.306069+00	
00000000-0000-0000-0000-000000000000	7c0f60c7-458f-4645-8244-31eea30df96f	{"action":"token_revoked","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-13 17:29:26.308898+00	
00000000-0000-0000-0000-000000000000	30ff5bfe-37a2-41c1-b2f9-f64f1e2f00cc	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-13 17:29:26.327844+00	
00000000-0000-0000-0000-000000000000	52aea7fb-9959-4ddd-a7dd-cfcc201181a7	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-13 17:29:26.340713+00	
00000000-0000-0000-0000-000000000000	6877856e-95c9-4dda-bb99-3e1af76a88c6	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-13 17:29:26.320315+00	
00000000-0000-0000-0000-000000000000	378a2e1a-cd43-49a6-b7b5-9bf779a8920b	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-13 17:29:26.345593+00	
00000000-0000-0000-0000-000000000000	317dcb69-b11f-4158-bb52-3e8f7e925e28	{"action":"token_revoked","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-13 17:29:26.346658+00	
00000000-0000-0000-0000-000000000000	b8c3a2e3-d566-49fa-b6e8-c9a850d03cae	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-13 17:29:26.389096+00	
00000000-0000-0000-0000-000000000000	170eb0d2-0ec5-4bbb-aa8e-1ef7b62a620e	{"action":"token_revoked","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-13 17:29:26.389788+00	
00000000-0000-0000-0000-000000000000	87522ec4-c85f-4746-b3bf-917fa6c8341e	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-13 17:29:26.408749+00	
00000000-0000-0000-0000-000000000000	452e1730-ecc2-4b61-8b4f-c23ca7d1c135	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-13 19:28:59.045534+00	
00000000-0000-0000-0000-000000000000	cd554a06-49bf-4034-b3da-37c430a96743	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-13 19:29:25.468642+00	
00000000-0000-0000-0000-000000000000	54704c55-03c2-48bb-bcd4-86a9d5f4dd3e	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-13 19:29:47.737193+00	
00000000-0000-0000-0000-000000000000	67759cb8-eae9-475f-961b-d318210bc09d	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-13 19:31:45.566893+00	
00000000-0000-0000-0000-000000000000	45e70a67-71cf-442f-9d65-8d5c565992e7	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-13 19:31:56.940111+00	
00000000-0000-0000-0000-000000000000	6b2f5c40-f637-4cd1-8d78-431876564843	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-13 19:32:09.829993+00	
00000000-0000-0000-0000-000000000000	810e41d7-bc97-4a0b-8d0f-62fdce644e67	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-13 19:32:17.181199+00	
00000000-0000-0000-0000-000000000000	caefe55a-a6a4-45e9-bc3e-4d23de973703	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-13 19:32:23.209666+00	
00000000-0000-0000-0000-000000000000	e1df3cac-6cf0-4cb3-8c40-644c2c896fb7	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-13 19:32:29.199773+00	
00000000-0000-0000-0000-000000000000	ac1e45d0-3407-43b6-a76d-653161192dc0	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-13 19:32:33.451891+00	
00000000-0000-0000-0000-000000000000	d0e6ff2d-0ff2-4b7b-ab92-01f92eccb127	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-13 19:32:37.512684+00	
00000000-0000-0000-0000-000000000000	b190123b-2607-4ec5-94db-aaf9f9be2e32	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-13 19:37:45.775576+00	
00000000-0000-0000-0000-000000000000	e2b62a6b-15df-49ec-a53e-89df691e1231	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-13 19:37:46.811483+00	
00000000-0000-0000-0000-000000000000	5136df43-e11c-493f-a50b-9985914169e1	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-13 19:38:46.678633+00	
00000000-0000-0000-0000-000000000000	d219c367-bf1d-4753-9e28-eecfd3887fcb	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-13 19:38:47.336437+00	
00000000-0000-0000-0000-000000000000	6aa47934-73bb-472d-be24-6a4bfbdbe038	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-13 19:42:37.722827+00	
00000000-0000-0000-0000-000000000000	890b9f0f-5805-4e57-a057-e80eff831116	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-13 19:42:38.170919+00	
00000000-0000-0000-0000-000000000000	650b37ac-49e3-4fc8-87bb-dcfbbb65ba56	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-13 19:42:53.822518+00	
00000000-0000-0000-0000-000000000000	d58e696d-3ef9-4bf0-aa43-26ea9f8017e9	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-13 19:42:57.201732+00	
00000000-0000-0000-0000-000000000000	cb7d6901-0549-4df2-8098-c11e93d3fdd1	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-13 19:43:07.725536+00	
00000000-0000-0000-0000-000000000000	3f75de7e-b7fa-4383-a12a-b6c90b0084a3	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-13 19:43:11.142208+00	
00000000-0000-0000-0000-000000000000	94b6c5e7-3ce3-4009-b9c0-c52c1b19195f	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-13 19:44:43.853426+00	
00000000-0000-0000-0000-000000000000	4ad3abfb-a5a6-48c6-ae74-97691d4d0c77	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-13 19:44:50.769134+00	
00000000-0000-0000-0000-000000000000	9b021174-9e9d-40a9-b29a-10eed03a7616	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-13 19:46:48.188078+00	
00000000-0000-0000-0000-000000000000	a84bf3cf-a67f-4a8c-b117-c3f700602cfc	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-13 19:46:48.209405+00	
00000000-0000-0000-0000-000000000000	58fb7de1-2758-4f86-b709-bac5a0aa60ee	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-13 19:46:48.8762+00	
00000000-0000-0000-0000-000000000000	787f2bc2-402d-4acc-b6ba-ca7b523102c0	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-13 19:47:02.749092+00	
00000000-0000-0000-0000-000000000000	6d956cd8-ea24-45e8-9f46-6e31c159f35e	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-13 19:47:10.385286+00	
00000000-0000-0000-0000-000000000000	d17bd363-c3cc-4267-bf24-205baf11b5e1	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-13 19:47:14.001809+00	
00000000-0000-0000-0000-000000000000	2eaa310f-321b-4291-979e-0f2eedf6b86b	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-13 19:47:16.135136+00	
00000000-0000-0000-0000-000000000000	cef316c2-61af-408a-9e4e-240748118e16	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-13 19:47:20.991711+00	
00000000-0000-0000-0000-000000000000	725de547-f7d2-408f-8405-91d99f6029b5	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-13 19:47:24.020117+00	
00000000-0000-0000-0000-000000000000	a2263bd2-739e-4e31-a2ac-43412c09aa41	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-13 19:47:26.404579+00	
00000000-0000-0000-0000-000000000000	0b655529-0fd4-42ce-aa48-f1dc59a18cda	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-13 19:47:31.337452+00	
00000000-0000-0000-0000-000000000000	65820e33-df97-42b6-8e74-b524e3021b82	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-13 19:48:01.205301+00	
00000000-0000-0000-0000-000000000000	2fbacb84-37b3-42f6-ac0b-708c41272017	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-13 19:48:02.943821+00	
00000000-0000-0000-0000-000000000000	25cf3e21-d8e9-4b07-947c-db1bb3f5b9b9	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-13 19:48:09.510919+00	
00000000-0000-0000-0000-000000000000	83b0f79a-06af-47f0-b544-c3fb0af1a403	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-13 19:48:47.685694+00	
00000000-0000-0000-0000-000000000000	9f712efe-6f09-493d-bf9d-1af2310608fc	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-13 19:48:52.102392+00	
00000000-0000-0000-0000-000000000000	cbbba8bb-e58a-4f48-8f7a-3d92fba272ba	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-13 19:48:57.259953+00	
00000000-0000-0000-0000-000000000000	9b63b272-35dc-4114-8d56-14772d215719	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-13 19:49:10.873309+00	
00000000-0000-0000-0000-000000000000	ee4c9e22-f309-41b3-b0e6-f8600c9178cc	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-13 19:49:10.981909+00	
00000000-0000-0000-0000-000000000000	ece9a92f-9999-4d92-b80e-ffb9f52ac34e	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-13 19:49:33.303243+00	
00000000-0000-0000-0000-000000000000	67e2edab-2e93-4d02-8154-283267d97ec7	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-13 19:49:36.862215+00	
00000000-0000-0000-0000-000000000000	1cb1d511-39cc-4add-9947-e28303200fc2	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-13 19:53:02.778183+00	
00000000-0000-0000-0000-000000000000	371d0ec2-b1ae-4fe5-9a4f-f2667f9cf54a	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-13 19:53:28.129193+00	
00000000-0000-0000-0000-000000000000	79b5ff73-2ffc-47fc-bf7e-424f5a276356	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-13 19:53:34.447305+00	
00000000-0000-0000-0000-000000000000	0edbcbbd-4f7f-4812-8154-c56b042b4fd1	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-13 19:53:40.543469+00	
00000000-0000-0000-0000-000000000000	36ced06d-f5b8-4ea1-98aa-e1a98fc56400	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-13 19:54:13.695596+00	
00000000-0000-0000-0000-000000000000	c8d35c29-0101-496b-8e39-1d57ea326d79	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-13 19:54:25.955846+00	
00000000-0000-0000-0000-000000000000	f33b3881-cd56-4c0a-8e39-acc845b39061	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-13 19:54:33.148448+00	
00000000-0000-0000-0000-000000000000	36095198-3792-4ded-a960-1352911b5e7e	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-13 19:54:38.688852+00	
00000000-0000-0000-0000-000000000000	c88a0aec-dbe2-476a-80b9-b83013dccae1	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-13 19:55:06.125621+00	
00000000-0000-0000-0000-000000000000	93f163ef-02f5-4dff-8158-bab040eab859	{"action":"token_revoked","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-13 19:55:06.145565+00	
00000000-0000-0000-0000-000000000000	79c9993e-cb75-408e-a4b8-b45ec83b655d	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-13 19:55:06.38045+00	
00000000-0000-0000-0000-000000000000	88d3b57d-d230-42bc-8861-0f3677ff08a1	{"action":"token_revoked","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-13 19:55:06.382989+00	
00000000-0000-0000-0000-000000000000	c1993a9b-6198-4a29-aede-9787ffcfd2c3	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-13 19:58:00.232668+00	
00000000-0000-0000-0000-000000000000	b46999f9-3946-4bf8-a40d-3ab0f9009de2	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-13 19:58:00.270045+00	
00000000-0000-0000-0000-000000000000	792cd96b-5bbf-41d4-bc1d-a5e3e64f1660	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-13 19:59:24.903167+00	
00000000-0000-0000-0000-000000000000	8ca14689-d064-4f62-a6bd-b75ef266c614	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-13 20:00:52.719796+00	
00000000-0000-0000-0000-000000000000	89932a19-857f-4739-b680-6479dc123a23	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-13 20:02:45.78898+00	
00000000-0000-0000-0000-000000000000	482c77f0-e9bf-4344-810c-f7aeee95a129	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-13 20:02:50.378912+00	
00000000-0000-0000-0000-000000000000	e8a6c717-8f4d-4ece-be81-5f892f775c4d	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-13 20:06:53.959229+00	
00000000-0000-0000-0000-000000000000	a768b5a8-b21b-49f4-b334-c6019ff2ec00	{"action":"token_revoked","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-13 20:06:53.96049+00	
00000000-0000-0000-0000-000000000000	b9721d7c-bca1-4044-b1cd-d9680ace6b29	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-13 20:06:54.009078+00	
00000000-0000-0000-0000-000000000000	170f9b0a-d907-43f1-ac07-13eaef19a07d	{"action":"token_revoked","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-13 20:06:54.011876+00	
00000000-0000-0000-0000-000000000000	9b57e92d-62a8-4724-9b79-61e232cabf5f	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-13 20:06:54.054357+00	
00000000-0000-0000-0000-000000000000	25db050b-1a92-4113-ab17-fd7d1aeb219e	{"action":"token_revoked","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-13 20:06:54.062259+00	
00000000-0000-0000-0000-000000000000	417404b8-4d60-4216-9f4f-f9748b483064	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-13 20:06:54.096907+00	
00000000-0000-0000-0000-000000000000	53f9d040-11b1-44b9-910d-6f025cf89f52	{"action":"token_revoked","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-13 20:06:54.099177+00	
00000000-0000-0000-0000-000000000000	ed491db1-d1d2-457d-bb23-78cc50192a43	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-13 20:06:54.127681+00	
00000000-0000-0000-0000-000000000000	96a99c12-2aef-4d57-9be7-3fafdf499654	{"action":"token_revoked","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-13 20:06:54.133911+00	
00000000-0000-0000-0000-000000000000	2db8bbfb-f5a4-4a7f-a8e9-33bacf972b40	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-13 20:06:54.18321+00	
00000000-0000-0000-0000-000000000000	e796f6f0-28e9-498a-a9dc-cc681076cba0	{"action":"token_revoked","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-13 20:06:54.188352+00	
00000000-0000-0000-0000-000000000000	e3eea28e-d835-4d49-a712-e6716d564221	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-13 20:06:54.217545+00	
00000000-0000-0000-0000-000000000000	d71e846c-8e26-4cc2-8ae6-aebd2db8eaa3	{"action":"token_revoked","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-13 20:06:54.224787+00	
00000000-0000-0000-0000-000000000000	efc2edcb-0d0f-4dc0-9b42-eaff8a81501e	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-13 20:06:54.26679+00	
00000000-0000-0000-0000-000000000000	f34317a9-276b-44a1-a11a-9eaf2422e067	{"action":"token_revoked","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-13 20:06:54.270223+00	
00000000-0000-0000-0000-000000000000	68148592-bd52-4e23-9490-110753e01e78	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-13 20:06:54.286856+00	
00000000-0000-0000-0000-000000000000	df377d9d-4b53-48f9-8f5e-b308391c2914	{"action":"token_revoked","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-13 20:06:54.288831+00	
00000000-0000-0000-0000-000000000000	85acf772-a540-4c9b-905c-95fb18dfcf0b	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-13 20:06:54.319328+00	
00000000-0000-0000-0000-000000000000	16b02b4f-a20f-469f-b23b-1d9a1bd6580d	{"action":"token_revoked","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-13 20:06:54.325005+00	
00000000-0000-0000-0000-000000000000	698d0c32-a487-44ff-94b0-37deaab8f82d	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-13 20:06:54.335738+00	
00000000-0000-0000-0000-000000000000	0b074399-b902-4d27-8b3c-e4e3048100e1	{"action":"token_revoked","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-13 20:06:54.3375+00	
00000000-0000-0000-0000-000000000000	ff406b46-e027-471e-b337-87707dd43439	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-13 20:06:54.360901+00	
00000000-0000-0000-0000-000000000000	40feccce-c591-4f9a-9efb-82c495b786c4	{"action":"token_revoked","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-13 20:06:54.362678+00	
00000000-0000-0000-0000-000000000000	e81e7159-a827-420e-b377-fa2c26a5b695	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-13 20:06:54.383954+00	
00000000-0000-0000-0000-000000000000	19858486-f58b-43b5-b302-34020be48c79	{"action":"token_revoked","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-13 20:06:54.385335+00	
00000000-0000-0000-0000-000000000000	0a0fcb8a-d035-42b1-a84f-6b5c3c556eda	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-13 20:06:54.405819+00	
00000000-0000-0000-0000-000000000000	952c13e4-917a-4a1a-b2e2-24a5c3db5e7a	{"action":"token_revoked","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-13 20:06:54.409043+00	
00000000-0000-0000-0000-000000000000	1d5db375-503f-4d69-969c-4adf03e48104	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-13 20:06:54.423655+00	
00000000-0000-0000-0000-000000000000	4aea3c7a-2adc-4c64-9316-bf420511f5d6	{"action":"token_revoked","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-13 20:06:54.425298+00	
00000000-0000-0000-0000-000000000000	1739bd36-8623-4b8f-9b8c-65633f54bc58	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-13 20:06:54.438661+00	
00000000-0000-0000-0000-000000000000	1f865b32-55f2-4720-bcc1-8ea497a42c1d	{"action":"token_revoked","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-13 20:06:54.442759+00	
00000000-0000-0000-0000-000000000000	5624cacd-2de1-4bb5-9394-4a9193fe5af0	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-13 20:06:54.521043+00	
00000000-0000-0000-0000-000000000000	1744d5ae-bd45-4142-b409-46c4cd39392e	{"action":"token_revoked","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-13 20:06:54.521695+00	
00000000-0000-0000-0000-000000000000	02828471-a023-4bfd-b065-72239875ee4b	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-13 20:06:54.609585+00	
00000000-0000-0000-0000-000000000000	9baccb29-cebd-420b-aadd-bd24a368eb25	{"action":"token_revoked","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-13 20:06:54.610225+00	
00000000-0000-0000-0000-000000000000	6f3cae16-735f-4652-99ab-6e1654049cf7	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-13 20:06:54.62833+00	
00000000-0000-0000-0000-000000000000	dce428c9-c9f5-4cfd-9398-2cc8fe9340f9	{"action":"token_revoked","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-13 20:06:54.628956+00	
00000000-0000-0000-0000-000000000000	3e153cae-2e4d-467a-be86-1137fd673d82	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-13 20:06:54.659082+00	
00000000-0000-0000-0000-000000000000	23a1e044-685d-4a90-bba5-13091ca37da1	{"action":"token_revoked","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-13 20:06:54.659708+00	
00000000-0000-0000-0000-000000000000	4ca08431-3e15-4027-b9cd-dc999c487362	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-13 20:06:54.463841+00	
00000000-0000-0000-0000-000000000000	4a534c49-adbf-4cb5-960e-e1fa839da448	{"action":"token_revoked","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-13 20:06:54.466502+00	
00000000-0000-0000-0000-000000000000	b00b9597-bedb-49d6-a037-6e4a34b239ef	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-13 20:06:54.479257+00	
00000000-0000-0000-0000-000000000000	da21dc1d-b9cf-4369-bbb5-3303316ff379	{"action":"token_revoked","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-13 20:06:54.488252+00	
00000000-0000-0000-0000-000000000000	4a22fc7b-54f5-4169-b624-bb4c5861d1a7	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-13 20:06:54.536977+00	
00000000-0000-0000-0000-000000000000	6ead4908-3b0e-416c-a3f8-e118af074855	{"action":"token_revoked","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-13 20:06:54.53804+00	
00000000-0000-0000-0000-000000000000	fb6dbedf-aa65-4c73-931b-54b704bb996d	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-13 20:06:54.552167+00	
00000000-0000-0000-0000-000000000000	0abca955-f923-4ccb-b5fd-8d38d0369de6	{"action":"token_revoked","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-13 20:06:54.554069+00	
00000000-0000-0000-0000-000000000000	15626448-f28b-4a6f-8ec3-b11119e6abcc	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-13 20:06:54.599752+00	
00000000-0000-0000-0000-000000000000	5ca6fb99-8511-4862-ba42-018e6964773f	{"action":"token_revoked","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-13 20:06:54.601134+00	
00000000-0000-0000-0000-000000000000	53c272e6-016b-4a0c-8ec2-60f60e5ce1ef	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-13 20:06:54.620587+00	
00000000-0000-0000-0000-000000000000	69468971-df93-4c54-9e43-9210ce7c6645	{"action":"token_revoked","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-13 20:06:54.621312+00	
00000000-0000-0000-0000-000000000000	873ac09a-86ea-4145-a598-5b5ea658bad5	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-13 20:06:54.635892+00	
00000000-0000-0000-0000-000000000000	9c08e413-f899-40eb-bb49-6e76356a85ba	{"action":"token_revoked","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-13 20:06:54.636508+00	
00000000-0000-0000-0000-000000000000	06cf48cb-134b-42f9-8917-eff926aae5b4	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-13 20:06:54.650412+00	
00000000-0000-0000-0000-000000000000	805340db-3ca5-425d-94b4-639c6f7bd989	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-13 20:06:54.569279+00	
00000000-0000-0000-0000-000000000000	cd94a7f2-cb63-48b5-b2e5-bfc0b7af2e63	{"action":"token_revoked","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-13 20:06:54.571425+00	
00000000-0000-0000-0000-000000000000	82cb4159-d9d9-42db-b4d0-79df57812550	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-13 20:06:54.582315+00	
00000000-0000-0000-0000-000000000000	45e9aedf-9537-47b6-86b4-6244f97d1f1d	{"action":"token_revoked","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-13 20:06:54.584182+00	
00000000-0000-0000-0000-000000000000	52050930-6bdf-414d-8d94-f545f3905350	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-13 21:53:41.859579+00	
00000000-0000-0000-0000-000000000000	edfb64fe-67f5-4b5b-906a-72064b0ca8d1	{"action":"token_revoked","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-13 21:53:41.907426+00	
00000000-0000-0000-0000-000000000000	7e7bfa41-7c4d-4ba5-95df-df262d0e8acd	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-13 21:53:42.079178+00	
00000000-0000-0000-0000-000000000000	b5863d2b-1121-42b4-91d6-4fcbb1cc846c	{"action":"token_revoked","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-13 21:53:42.081317+00	
00000000-0000-0000-0000-000000000000	7e8cb9e3-ef2f-4dc4-97ec-7443c365738a	{"action":"login","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-13 22:23:09.576513+00	
00000000-0000-0000-0000-000000000000	abe75c8e-3819-49bf-af8c-193413bef211	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-13 22:53:32.730046+00	
00000000-0000-0000-0000-000000000000	e81b93c4-2175-473c-a7b8-ae76cffb5d46	{"action":"token_revoked","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-13 22:53:32.750095+00	
00000000-0000-0000-0000-000000000000	dac4a8ce-b10a-4653-b418-97461acc3698	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-13 22:53:32.869454+00	
00000000-0000-0000-0000-000000000000	dd3fe42a-c97e-4870-9436-eacf99115a8c	{"action":"token_revoked","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-13 22:53:32.871941+00	
00000000-0000-0000-0000-000000000000	115c0db1-af3c-40c8-af2b-7ed218a9e7b8	{"action":"login","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-13 23:07:46.715749+00	
00000000-0000-0000-0000-000000000000	569ae998-be46-4fa1-aa71-55b1e9240c61	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-13 23:22:59.742511+00	
00000000-0000-0000-0000-000000000000	97b7dde8-0aa7-4f65-8837-5147430f1ea8	{"action":"token_revoked","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-13 23:22:59.771955+00	
00000000-0000-0000-0000-000000000000	63013141-8ded-42d1-83b7-2efb7e2b374d	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-13 23:22:59.845779+00	
00000000-0000-0000-0000-000000000000	7b557a20-1789-4dd8-a8e0-4ebd276ef1f1	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-13 23:22:59.869511+00	
00000000-0000-0000-0000-000000000000	5520172c-4e72-4397-95e8-8745f9962beb	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-13 23:22:59.916153+00	
00000000-0000-0000-0000-000000000000	4489e83f-c29c-49b8-bf60-0a270f4683d5	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-13 23:22:59.931575+00	
00000000-0000-0000-0000-000000000000	810e5346-e95b-4615-bde7-2ebc510e8b94	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-13 23:22:59.963345+00	
00000000-0000-0000-0000-000000000000	4215f978-c8a5-4b27-a448-37b95e6969d7	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-13 23:22:59.973381+00	
00000000-0000-0000-0000-000000000000	3da3e88a-d342-4445-ac54-7191b380b32d	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-13 23:22:59.990123+00	
00000000-0000-0000-0000-000000000000	5fd9eaef-83b6-4277-8fe9-4ce4040c505e	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-13 23:23:00.014469+00	
00000000-0000-0000-0000-000000000000	bf0c6bda-9b48-4c92-b66b-992326976079	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-13 23:23:00.027168+00	
00000000-0000-0000-0000-000000000000	75d2b486-2b1d-4574-b08d-aa379cdf000d	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-13 23:23:00.035793+00	
00000000-0000-0000-0000-000000000000	d637af4d-2fa9-4e6d-8e18-afa6386ed30d	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-13 23:23:00.04334+00	
00000000-0000-0000-0000-000000000000	557aa3ac-f499-47b1-9fed-b4d2a9a55e98	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-13 23:23:00.066018+00	
00000000-0000-0000-0000-000000000000	2ad0402c-bc74-4b16-9f50-fe0c5d2c3de3	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-13 23:23:00.080157+00	
00000000-0000-0000-0000-000000000000	f6d04afc-0f2f-4e0e-890a-bb2da1db30e3	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-13 23:23:00.118461+00	
00000000-0000-0000-0000-000000000000	73011946-0d37-4139-8935-627f4b0549e1	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-13 23:23:00.129954+00	
00000000-0000-0000-0000-000000000000	eb11903f-c07d-404b-bade-59777be3501b	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-13 23:23:00.150137+00	
00000000-0000-0000-0000-000000000000	366a3d2c-0b37-42d4-bba8-a04e487bdb1e	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-13 23:23:00.160725+00	
00000000-0000-0000-0000-000000000000	b49df012-4723-4e3b-8b14-24844f5e1d18	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-13 23:23:00.171894+00	
00000000-0000-0000-0000-000000000000	dab9b2de-940a-4eab-a3d4-941870cb16e3	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-13 23:23:00.182425+00	
00000000-0000-0000-0000-000000000000	72189960-b5ef-495f-94e4-a6af8c5fd00f	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-13 23:23:00.192957+00	
00000000-0000-0000-0000-000000000000	489839e4-b086-48ae-b9a3-0ac79d439e2a	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-13 23:23:00.213926+00	
00000000-0000-0000-0000-000000000000	a838ec2b-a0d3-4bbd-bdea-e904673310cc	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-13 23:23:00.238544+00	
00000000-0000-0000-0000-000000000000	892cb413-03d3-4c03-927d-2278c889f608	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-13 23:23:00.203877+00	
00000000-0000-0000-0000-000000000000	9e082131-17b5-4adf-856a-9edae56e72f1	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-13 23:23:00.269749+00	
00000000-0000-0000-0000-000000000000	dc885387-174a-425d-ac8b-eb94461eff68	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-13 23:23:00.283856+00	
00000000-0000-0000-0000-000000000000	1c3a263e-dd05-43e7-917a-d31fda225f1e	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-13 23:23:00.293007+00	
00000000-0000-0000-0000-000000000000	e6ca7d57-636d-461a-b316-cb0d1b2dd774	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-13 23:23:00.228249+00	
00000000-0000-0000-0000-000000000000	bdf8fbc1-cd89-4c76-af8c-30625ff091fd	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-13 23:23:00.253568+00	
00000000-0000-0000-0000-000000000000	e263c3a7-971d-4d9d-9580-fbeeebf5dbfc	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-13 23:23:00.262172+00	
00000000-0000-0000-0000-000000000000	37d90e2f-9d50-40df-99c0-6b62f5d2ee61	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-13 23:53:22.24827+00	
00000000-0000-0000-0000-000000000000	02105403-a5ca-4a03-904a-c6417b53e0e4	{"action":"token_revoked","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-13 23:53:22.266636+00	
00000000-0000-0000-0000-000000000000	9767abc4-d181-4429-83eb-91df402a85c3	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-13 23:53:22.413126+00	
00000000-0000-0000-0000-000000000000	38167fe4-c18a-4e35-98e2-7c529d24a625	{"action":"token_revoked","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-13 23:53:22.416607+00	
00000000-0000-0000-0000-000000000000	189e15e2-37a1-4cc0-983e-9efd410af992	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-14 00:18:02.489258+00	
00000000-0000-0000-0000-000000000000	b905f4e0-6bd9-4871-9646-7d909c3ff5ef	{"action":"token_revoked","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-14 00:18:02.507414+00	
00000000-0000-0000-0000-000000000000	87510fd0-261c-4a32-97a0-eb8793b29dc9	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-14 00:18:02.602711+00	
00000000-0000-0000-0000-000000000000	9a3746df-a7de-4a08-a227-04f260322619	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-14 00:18:02.629627+00	
00000000-0000-0000-0000-000000000000	9035d9b3-fa5e-427f-849c-6c45f039a762	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-14 00:18:02.661851+00	
00000000-0000-0000-0000-000000000000	f8b7b028-e784-4eeb-ac02-4decc0db8077	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-14 00:18:02.682905+00	
00000000-0000-0000-0000-000000000000	bd3b14d2-16f5-4ade-8a5d-74366139f368	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-14 00:18:02.70802+00	
00000000-0000-0000-0000-000000000000	8c6a009f-b74f-4620-955b-3298b267cc0b	{"action":"token_revoked","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-14 00:18:02.71097+00	
00000000-0000-0000-0000-000000000000	f1523adc-576d-4aea-b796-7f45557df6f3	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-14 00:18:02.734612+00	
00000000-0000-0000-0000-000000000000	054f5dfa-b6ce-4c80-8b42-ea7351627a79	{"action":"token_revoked","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-14 00:18:02.738441+00	
00000000-0000-0000-0000-000000000000	96d6758b-6a32-4aaf-8289-ed1605d3b4fb	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-14 00:18:02.795342+00	
00000000-0000-0000-0000-000000000000	3110756a-c33c-4b89-a729-94dc0154defc	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-14 00:18:02.821215+00	
00000000-0000-0000-0000-000000000000	78e52f45-f962-4b63-8030-7a91f575f98d	{"action":"token_revoked","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-14 00:18:02.822894+00	
00000000-0000-0000-0000-000000000000	7696d297-b9a2-4a10-ad4a-06b4f1749031	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-14 00:18:02.856874+00	
00000000-0000-0000-0000-000000000000	5502a241-ffe2-4aa7-ad4b-eb2e9b24a2a1	{"action":"token_revoked","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-14 00:18:02.859216+00	
00000000-0000-0000-0000-000000000000	bd49f266-947f-4835-9532-bd1c5bcbf80e	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-14 00:18:02.878946+00	
00000000-0000-0000-0000-000000000000	7b843d15-6fbb-4a5a-9a46-d8aec6469e98	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-14 00:18:02.896109+00	
00000000-0000-0000-0000-000000000000	720597e4-c242-456a-9001-9e7af2720901	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-14 00:18:02.913995+00	
00000000-0000-0000-0000-000000000000	3b5f6cea-d5f5-4b51-92d2-41d45a96c81b	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-14 00:18:02.929485+00	
00000000-0000-0000-0000-000000000000	adef17a4-6c58-4f2d-8e16-fe1c86c60d70	{"action":"token_revoked","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-14 00:18:02.930741+00	
00000000-0000-0000-0000-000000000000	0153a9b2-d110-4b63-ba17-1cc98d755737	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-14 00:18:02.950218+00	
00000000-0000-0000-0000-000000000000	cd7a1c4f-55d3-4b60-bff2-c2e1e133fbde	{"action":"token_revoked","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-14 00:18:02.951391+00	
00000000-0000-0000-0000-000000000000	06e04ab2-c35d-4b00-8427-b0b75e391525	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-14 00:18:02.962191+00	
00000000-0000-0000-0000-000000000000	c67e950a-9faa-4268-a7ce-d9d48fac7d39	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-14 00:18:02.988708+00	
00000000-0000-0000-0000-000000000000	34f82136-81c2-4cdb-9390-d0fd45f5fa90	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-14 00:18:02.999107+00	
00000000-0000-0000-0000-000000000000	4081203f-8a43-4da0-aa66-4af6f6b6972d	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-14 00:18:03.009547+00	
00000000-0000-0000-0000-000000000000	6ddc3f02-3c5b-490d-988a-4785d017674a	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-14 00:18:03.031825+00	
00000000-0000-0000-0000-000000000000	a397e04e-6436-4823-aa25-7a85666e60d5	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-14 00:18:03.086982+00	
00000000-0000-0000-0000-000000000000	41ab01fa-c156-48db-8e3e-834e74801892	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-14 00:18:03.109698+00	
00000000-0000-0000-0000-000000000000	77b7db77-50c1-4ff5-8806-3355bb3dc969	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-14 00:18:03.052024+00	
00000000-0000-0000-0000-000000000000	782f442e-4c29-4794-862a-8b55c70c6438	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-14 00:18:03.069703+00	
00000000-0000-0000-0000-000000000000	1222cbad-9e23-4300-9c99-cc661ce78532	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-14 00:18:03.093533+00	
00000000-0000-0000-0000-000000000000	86e9b221-4202-42d4-bc88-65a91495be0c	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-14 00:18:03.103081+00	
00000000-0000-0000-0000-000000000000	ac196901-7516-4634-9c61-33cb77863086	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-14 00:18:03.131435+00	
00000000-0000-0000-0000-000000000000	96a6df4b-6de0-482f-9b12-030b37020a42	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-14 00:18:03.143995+00	
00000000-0000-0000-0000-000000000000	830c5cd8-96a3-49e5-832b-3d8a027d4a49	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-14 00:18:03.177762+00	
00000000-0000-0000-0000-000000000000	0c153fba-b64c-4d90-adfb-9a475c1801fc	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-14 00:18:03.116684+00	
00000000-0000-0000-0000-000000000000	6539c1de-df75-4e97-8229-6a2f1fcd37b6	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-14 00:33:15.724456+00	
00000000-0000-0000-0000-000000000000	e00294e9-f03b-4d18-89e1-649bff6c5d6c	{"action":"token_revoked","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-14 00:33:15.730539+00	
00000000-0000-0000-0000-000000000000	28932fa4-e39c-4119-90f5-d45d1b8719c2	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-14 00:33:15.764317+00	
00000000-0000-0000-0000-000000000000	883e8b86-79ad-488c-8443-f134afdd0feb	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-14 00:33:15.776546+00	
00000000-0000-0000-0000-000000000000	fcdc28dc-ab7f-4466-82c3-4359e5afa2e5	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-14 00:33:15.795026+00	
00000000-0000-0000-0000-000000000000	eac06fd6-d871-4949-bac7-7e52b13883c0	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-14 00:33:15.806298+00	
00000000-0000-0000-0000-000000000000	09e019f9-0eb6-428e-95ef-d13c1fcd9251	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-14 00:33:15.814299+00	
00000000-0000-0000-0000-000000000000	f8ebd452-6727-413a-ba52-d0f15b9bbff2	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-14 00:33:15.837383+00	
00000000-0000-0000-0000-000000000000	02eb4caa-2b58-407a-aedd-9c752a3bf221	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-14 00:33:15.851232+00	
00000000-0000-0000-0000-000000000000	913e62cb-a6c9-4637-877c-5c1a9e256225	{"action":"token_revoked","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-14 00:33:15.85195+00	
00000000-0000-0000-0000-000000000000	3c7c4680-1bd7-4561-b1c0-82a0afa1131b	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-14 00:33:15.86176+00	
00000000-0000-0000-0000-000000000000	7b99f4d8-8832-49ad-8c3b-94298ae2e3e9	{"action":"token_revoked","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-14 00:33:15.862528+00	
00000000-0000-0000-0000-000000000000	83045b2a-bd58-49a0-809b-9c9174258317	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-14 00:33:15.871709+00	
00000000-0000-0000-0000-000000000000	508139f1-b70b-4f51-828c-b2a5d42ff37b	{"action":"token_revoked","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-14 00:33:15.872353+00	
00000000-0000-0000-0000-000000000000	f84a90a5-c8b7-4b36-90b0-e983de6fc088	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-14 00:33:15.890682+00	
00000000-0000-0000-0000-000000000000	6097a876-a863-4875-b458-0e0965ed425e	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-14 00:33:15.905753+00	
00000000-0000-0000-0000-000000000000	dfc03591-62a6-484b-9a2b-f3c16d68944e	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-14 00:33:15.914916+00	
00000000-0000-0000-0000-000000000000	d1bcb5c0-1c2d-499e-a0c9-75051a9fc86a	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-14 00:33:15.922844+00	
00000000-0000-0000-0000-000000000000	93cf9965-9fbb-4881-add4-e7c6c804102a	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-14 00:33:15.927077+00	
00000000-0000-0000-0000-000000000000	52656278-277d-42ea-9220-105e4c19246f	{"action":"token_revoked","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-14 00:33:15.928117+00	
00000000-0000-0000-0000-000000000000	5ce0c7a5-68e9-4736-9d6c-5dca84c2c053	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-14 00:33:15.950821+00	
00000000-0000-0000-0000-000000000000	f1518476-c290-4ecd-a88f-07e954e2339d	{"action":"token_revoked","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-14 00:33:15.952202+00	
00000000-0000-0000-0000-000000000000	5473152e-dc2c-4bd1-8cbb-5538db5c35a3	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-14 00:33:16.560334+00	
00000000-0000-0000-0000-000000000000	a89ef08d-7f72-423d-a88a-bbeb863d42e2	{"action":"token_revoked","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-14 00:33:16.56133+00	
00000000-0000-0000-0000-000000000000	1eeeea0d-c8cb-4a2d-9684-7fe265182386	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-14 00:33:16.574076+00	
00000000-0000-0000-0000-000000000000	ca4abc20-5575-4fca-806c-4192c26f252a	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-14 00:33:16.602095+00	
00000000-0000-0000-0000-000000000000	db34fcf8-0d80-4704-9a37-2fd48f97bf09	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-14 00:33:16.622543+00	
00000000-0000-0000-0000-000000000000	cd32b3ab-95b8-4a24-909e-a1d45a862460	{"action":"token_revoked","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-14 00:33:16.62485+00	
00000000-0000-0000-0000-000000000000	06dec788-e4dd-40a5-8587-2a99c30b95d2	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-14 00:33:16.638017+00	
00000000-0000-0000-0000-000000000000	a7c17dbe-6617-4753-929d-5f66e3d69bfa	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-14 00:33:16.652398+00	
00000000-0000-0000-0000-000000000000	43c79463-a1f7-4a89-9e1c-0bdde7a1e543	{"action":"token_revoked","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-14 00:33:16.653145+00	
00000000-0000-0000-0000-000000000000	8ee9b47b-83df-4840-9ebd-de0c740f013c	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-14 00:33:16.67876+00	
00000000-0000-0000-0000-000000000000	1e17fbe6-6d6d-4cbc-9320-965f123aa378	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-14 00:33:16.689535+00	
00000000-0000-0000-0000-000000000000	71d0eeec-04a3-4b3f-b24f-90520545937c	{"action":"token_revoked","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-14 00:33:16.692133+00	
00000000-0000-0000-0000-000000000000	1bbf2284-bce9-477e-af05-984bb8da3165	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-14 00:33:16.704735+00	
00000000-0000-0000-0000-000000000000	7eaed7c1-4a69-42ab-87ab-697e0386ebdb	{"action":"token_revoked","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-14 00:33:16.705899+00	
00000000-0000-0000-0000-000000000000	da6fd11e-f145-4634-b77a-bd2789dc185d	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-14 00:33:16.734207+00	
00000000-0000-0000-0000-000000000000	68711bd4-d5cc-4994-9433-d8a45e3fdbd0	{"action":"token_revoked","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-14 00:33:16.734998+00	
00000000-0000-0000-0000-000000000000	6dd28dda-82aa-499f-b8aa-5a5296f877ce	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-14 00:33:16.756592+00	
00000000-0000-0000-0000-000000000000	ddbeccbf-4b5d-4ca1-88ce-fc0bf44ab32e	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-14 00:33:16.773536+00	
00000000-0000-0000-0000-000000000000	b5119e3c-c888-4d40-9e49-587f1aa90046	{"action":"token_revoked","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-14 00:33:16.774215+00	
00000000-0000-0000-0000-000000000000	d765ba7c-694f-4589-983e-e7c0d7f64078	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-14 00:33:16.797245+00	
00000000-0000-0000-0000-000000000000	9149c349-2df3-46d2-9f83-8e9e39443e04	{"action":"token_revoked","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-14 00:33:16.798024+00	
00000000-0000-0000-0000-000000000000	aa42c814-f906-44e1-b1d7-fddf2cf824a5	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-14 00:33:16.823125+00	
00000000-0000-0000-0000-000000000000	a50282b0-9150-4876-b798-99bc5fe30c01	{"action":"login","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-14 01:20:02.713438+00	
00000000-0000-0000-0000-000000000000	8e20ecae-4b78-4c78-8efc-2e976a864010	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-14 02:41:58.84616+00	
00000000-0000-0000-0000-000000000000	bd4e2f77-7785-4079-9e81-9c2d345b867e	{"action":"token_revoked","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-14 02:41:58.867252+00	
00000000-0000-0000-0000-000000000000	731542e4-e1c3-4930-aaac-d6b339b8051b	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-14 02:41:58.936299+00	
00000000-0000-0000-0000-000000000000	0f511afd-9e79-4ddb-8d3b-41e70b128479	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-14 02:41:58.957182+00	
00000000-0000-0000-0000-000000000000	15167fbf-2f16-43a5-a48f-62bf95097e86	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-14 02:41:58.968624+00	
00000000-0000-0000-0000-000000000000	bb79a64d-39bb-45db-8281-9dc1fab32e97	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-14 02:41:58.979489+00	
00000000-0000-0000-0000-000000000000	2100e825-3bc3-4d65-86bb-8eeebd72f996	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-14 02:41:59.006965+00	
00000000-0000-0000-0000-000000000000	24f9488d-50de-4a3b-9d6c-6a246f08ee74	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-14 02:41:59.032446+00	
00000000-0000-0000-0000-000000000000	de5fd3b2-efe7-42de-8815-45b48251277f	{"action":"token_revoked","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-14 02:41:59.033203+00	
00000000-0000-0000-0000-000000000000	17356875-6fd1-4c81-a08a-af8912f3051b	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-14 02:41:59.053423+00	
00000000-0000-0000-0000-000000000000	58cbc5bd-132b-4372-964f-cdd02bd8a0f5	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-14 02:41:59.062507+00	
00000000-0000-0000-0000-000000000000	1c938deb-35c6-4a37-b259-2c9734221a53	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-14 02:41:59.085714+00	
00000000-0000-0000-0000-000000000000	700feb93-6894-4a36-ac45-5d89f7584433	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-14 02:41:59.099569+00	
00000000-0000-0000-0000-000000000000	72de8aa1-a997-40f0-bb6e-5e5595e21165	{"action":"token_refreshed","actor_id":"d51b73e3-2c57-427c-9f9b-9c4c067f921f","actor_username":"davekokel@berkeley.edu","actor_via_sso":false,"log_type":"token"}	2025-09-14 02:41:59.124872+00	
\.


--
-- Data for Name: flow_state; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.flow_state (id, user_id, auth_code, code_challenge_method, code_challenge, provider_type, provider_access_token, provider_refresh_token, created_at, updated_at, authentication_method, auth_code_issued_at) FROM stdin;
\.


--
-- Data for Name: identities; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id) FROM stdin;
84c9b40f-0450-4311-af2b-220cebfb4c19	84c9b40f-0450-4311-af2b-220cebfb4c19	{"sub": "84c9b40f-0450-4311-af2b-220cebfb4c19", "email": "dave.kokel@gmail.com", "full_name": "", "email_verified": true, "phone_verified": false}	email	2025-08-30 04:49:32.861499+00	2025-08-30 04:49:32.861554+00	2025-08-30 04:49:32.861554+00	8e53fcc4-986c-4efa-a944-156d2f0c83cf
d51b73e3-2c57-427c-9f9b-9c4c067f921f	d51b73e3-2c57-427c-9f9b-9c4c067f921f	{"sub": "d51b73e3-2c57-427c-9f9b-9c4c067f921f", "email": "davekokel@berkeley.edu", "email_verified": true, "phone_verified": false}	email	2025-08-30 05:12:30.07695+00	2025-08-30 05:12:30.077005+00	2025-08-30 05:12:30.077005+00	46e92898-e062-4896-9df1-bbd6fe81b1de
\.


--
-- Data for Name: instances; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.instances (id, uuid, raw_base_config, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: mfa_amr_claims; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.mfa_amr_claims (session_id, created_at, updated_at, authentication_method, id) FROM stdin;
3a99fa1f-906e-4073-a49f-b7473d3056fa	2025-08-30 04:49:49.909536+00	2025-08-30 04:49:49.909536+00	otp	04a70b36-8843-41eb-b61e-48659be02d3f
c89d7417-1399-4863-acde-9ab9ab96048e	2025-09-13 01:21:16.255402+00	2025-09-13 01:21:16.255402+00	password	24254e65-3944-4f28-9e9a-a8ca401e8df6
2242ca6c-cae4-41e6-a848-6fca58fe4cc3	2025-09-13 01:22:28.056814+00	2025-09-13 01:22:28.056814+00	password	9716d5ea-a4ae-4402-ae23-208edcb0a326
d248a4a2-8eff-4869-8b3d-3aea619464ac	2025-09-13 01:28:57.727567+00	2025-09-13 01:28:57.727567+00	password	8bea22bb-6afd-44f7-908d-7ff0c38609d2
f466bb30-a2d9-408f-b715-8d5121087531	2025-09-13 01:31:39.212393+00	2025-09-13 01:31:39.212393+00	password	c786faa7-84ef-457c-946f-98914ee79323
95c47c2f-f178-4a7c-a6a5-6563a67011d0	2025-09-13 01:31:53.514693+00	2025-09-13 01:31:53.514693+00	password	144dca43-2985-4733-a2c4-13670bf9ef7a
94599a71-3b10-488d-8e7e-56f1e7d7e66d	2025-09-13 01:36:38.555633+00	2025-09-13 01:36:38.555633+00	password	47bb325d-2fc1-4d1a-b5a8-d7264230c1d6
d410a16b-9d97-4172-91a6-9fa02150f946	2025-09-13 01:36:42.548848+00	2025-09-13 01:36:42.548848+00	password	9fae5d6b-3d5d-43ad-a28c-293e9d86e5e7
7e494aca-e0e1-455a-8e72-7499f1d42780	2025-09-13 01:40:00.403765+00	2025-09-13 01:40:00.403765+00	password	07e03088-da04-4188-b071-5020bbc2a872
8cec9317-e961-4fe9-8fdd-ebd50da108d9	2025-09-13 01:43:06.460685+00	2025-09-13 01:43:06.460685+00	password	eb25e6f1-9cdc-4ed0-8da2-ee3906516e39
6325f304-2d3b-4343-a24f-079134122dd9	2025-09-13 01:43:12.344815+00	2025-09-13 01:43:12.344815+00	password	96005951-2969-4365-8ba6-9d03e1779788
618a2633-82e7-4217-969e-ffd7d9c314ea	2025-09-13 01:47:27.044303+00	2025-09-13 01:47:27.044303+00	password	36995998-9643-4b7a-91cb-67c419252205
bc8fe362-90c1-462a-bdf2-4871d98cf3dc	2025-09-13 01:49:38.190288+00	2025-09-13 01:49:38.190288+00	password	fe244ea2-52fc-45e4-9f82-e48a371fdc48
7e7ada72-51b4-41ce-a2c5-c479e271ef80	2025-09-13 02:41:05.060102+00	2025-09-13 02:41:05.060102+00	password	e5ec7a0e-f0c5-4019-b44d-487a0e8900f6
e57a9649-e36a-4718-b4df-dc277a2ff217	2025-09-13 15:03:07.386518+00	2025-09-13 15:03:07.386518+00	password	8392101b-cb44-4b06-b3a8-d1ae08b90783
a6e2b7c4-3165-4144-b80f-299ab6ba5515	2025-09-13 15:09:56.266467+00	2025-09-13 15:09:56.266467+00	password	756c22b3-a700-425c-9906-97d85ae05a28
4fd2affe-9e51-4d55-b9c1-b10f62458ba0	2025-09-13 15:17:58.099828+00	2025-09-13 15:17:58.099828+00	password	d890fbf6-3113-4926-9407-ce284faa47b6
81e735c1-0ece-4aa8-8217-4fc67ea197b6	2025-09-13 16:29:36.747064+00	2025-09-13 16:29:36.747064+00	password	d0fd3037-b4c1-4b9c-9578-a98ee524f9ca
3965faf5-7d36-4eb9-af8f-1bb1c8bcd18a	2025-09-13 22:23:09.612346+00	2025-09-13 22:23:09.612346+00	password	29ccb9a8-56be-4717-86aa-f765daff86b8
abbcbf7b-b415-4396-b081-b5abefe1058f	2025-09-13 23:07:46.782864+00	2025-09-13 23:07:46.782864+00	password	38ff9bb2-6436-4c1b-b584-b1751058e8a3
93f16ca0-c5dc-4bae-a689-bb3895c81ccd	2025-09-14 01:20:02.832673+00	2025-09-14 01:20:02.832673+00	password	5dbc6307-9204-4f65-8375-df781d975da2
\.


--
-- Data for Name: mfa_challenges; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.mfa_challenges (id, factor_id, created_at, verified_at, ip_address, otp_code, web_authn_session_data) FROM stdin;
\.


--
-- Data for Name: mfa_factors; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.mfa_factors (id, user_id, friendly_name, factor_type, status, created_at, updated_at, secret, phone, last_challenged_at, web_authn_credential, web_authn_aaguid) FROM stdin;
\.


--
-- Data for Name: oauth_clients; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.oauth_clients (id, client_id, client_secret_hash, registration_type, redirect_uris, grant_types, client_name, client_uri, logo_uri, created_at, updated_at, deleted_at) FROM stdin;
\.


--
-- Data for Name: one_time_tokens; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.one_time_tokens (id, user_id, token_type, token_hash, relates_to, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: refresh_tokens; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.refresh_tokens (instance_id, id, token, user_id, revoked, created_at, updated_at, parent, session_id) FROM stdin;
00000000-0000-0000-0000-000000000000	1	kelzr26bclay	84c9b40f-0450-4311-af2b-220cebfb4c19	f	2025-08-30 04:49:49.900027+00	2025-08-30 04:49:49.900027+00	\N	3a99fa1f-906e-4073-a49f-b7473d3056fa
00000000-0000-0000-0000-000000000000	125	kar7qsdq2jod	d51b73e3-2c57-427c-9f9b-9c4c067f921f	t	2025-09-13 17:17:38.064785+00	2025-09-13 19:55:06.146258+00	ingjdq2ftnjr	4fd2affe-9e51-4d55-b9c1-b10f62458ba0
00000000-0000-0000-0000-000000000000	141	76sncjwm6f7b	d51b73e3-2c57-427c-9f9b-9c4c067f921f	t	2025-09-13 19:55:06.20588+00	2025-09-13 19:55:06.383705+00	kar7qsdq2jod	4fd2affe-9e51-4d55-b9c1-b10f62458ba0
00000000-0000-0000-0000-000000000000	127	irvitpfeti6g	d51b73e3-2c57-427c-9f9b-9c4c067f921f	t	2025-09-13 17:29:26.019381+00	2025-09-13 20:06:53.961007+00	qlpuqi65fe77	81e735c1-0ece-4aa8-8217-4fc67ea197b6
00000000-0000-0000-0000-000000000000	133	vtijgjh442pq	d51b73e3-2c57-427c-9f9b-9c4c067f921f	t	2025-09-13 17:29:26.19525+00	2025-09-13 20:06:54.018682+00	j5j5nfvlm2bz	81e735c1-0ece-4aa8-8217-4fc67ea197b6
00000000-0000-0000-0000-000000000000	130	bylzypgjmdwh	d51b73e3-2c57-427c-9f9b-9c4c067f921f	t	2025-09-13 17:29:26.149102+00	2025-09-13 20:06:54.065409+00	3skkaatridz4	81e735c1-0ece-4aa8-8217-4fc67ea197b6
00000000-0000-0000-0000-000000000000	190	7vwofhhotm5k	d51b73e3-2c57-427c-9f9b-9c4c067f921f	t	2025-09-14 00:33:15.86383+00	2025-09-14 00:33:15.92869+00	l2hcgiokev3z	3965faf5-7d36-4eb9-af8f-1bb1c8bcd18a
00000000-0000-0000-0000-000000000000	188	46amdel34im3	d51b73e3-2c57-427c-9f9b-9c4c067f921f	t	2025-09-14 00:33:15.737901+00	2025-09-14 00:33:15.952751+00	l2hcgiokev3z	3965faf5-7d36-4eb9-af8f-1bb1c8bcd18a
00000000-0000-0000-0000-000000000000	131	2mc6gcohtnqf	d51b73e3-2c57-427c-9f9b-9c4c067f921f	t	2025-09-13 17:29:26.163489+00	2025-09-13 20:06:54.137308+00	j5j5nfvlm2bz	81e735c1-0ece-4aa8-8217-4fc67ea197b6
00000000-0000-0000-0000-000000000000	137	75ejysgts3ax	d51b73e3-2c57-427c-9f9b-9c4c067f921f	t	2025-09-13 17:29:26.298007+00	2025-09-13 20:06:54.194116+00	j5j5nfvlm2bz	81e735c1-0ece-4aa8-8217-4fc67ea197b6
00000000-0000-0000-0000-000000000000	194	i23r7crnqddy	d51b73e3-2c57-427c-9f9b-9c4c067f921f	t	2025-09-14 00:33:16.562303+00	2025-09-14 00:33:16.692843+00	l2hcgiokev3z	3965faf5-7d36-4eb9-af8f-1bb1c8bcd18a
00000000-0000-0000-0000-000000000000	193	igjvcy3jcec7	d51b73e3-2c57-427c-9f9b-9c4c067f921f	t	2025-09-14 00:33:15.953103+00	2025-09-14 01:20:03.40748+00	46amdel34im3	3965faf5-7d36-4eb9-af8f-1bb1c8bcd18a
00000000-0000-0000-0000-000000000000	147	v26lvfxjmfdv	d51b73e3-2c57-427c-9f9b-9c4c067f921f	t	2025-09-13 20:06:54.144772+00	2025-09-13 20:06:54.272382+00	2mc6gcohtnqf	81e735c1-0ece-4aa8-8217-4fc67ea197b6
00000000-0000-0000-0000-000000000000	144	dvr7brbfg7ok	d51b73e3-2c57-427c-9f9b-9c4c067f921f	t	2025-09-13 20:06:54.023854+00	2025-09-13 20:06:54.291341+00	vtijgjh442pq	81e735c1-0ece-4aa8-8217-4fc67ea197b6
00000000-0000-0000-0000-000000000000	139	3gq2atw7xz4q	d51b73e3-2c57-427c-9f9b-9c4c067f921f	t	2025-09-13 17:29:26.349149+00	2025-09-13 20:06:54.325814+00	qlpuqi65fe77	81e735c1-0ece-4aa8-8217-4fc67ea197b6
00000000-0000-0000-0000-000000000000	145	rjiwte6xghrj	d51b73e3-2c57-427c-9f9b-9c4c067f921f	t	2025-09-13 20:06:54.073462+00	2025-09-13 20:06:54.338982+00	bylzypgjmdwh	81e735c1-0ece-4aa8-8217-4fc67ea197b6
00000000-0000-0000-0000-000000000000	148	pob3njggmnf3	d51b73e3-2c57-427c-9f9b-9c4c067f921f	t	2025-09-13 20:06:54.197051+00	2025-09-13 20:06:54.366497+00	75ejysgts3ax	81e735c1-0ece-4aa8-8217-4fc67ea197b6
00000000-0000-0000-0000-000000000000	149	6zwnseosbiie	d51b73e3-2c57-427c-9f9b-9c4c067f921f	t	2025-09-13 20:06:54.232461+00	2025-09-13 20:06:54.412228+00	vyisxtb2c3lx	81e735c1-0ece-4aa8-8217-4fc67ea197b6
00000000-0000-0000-0000-000000000000	129	akzuex7i7eju	d51b73e3-2c57-427c-9f9b-9c4c067f921f	t	2025-09-13 17:29:26.109672+00	2025-09-13 20:06:54.426921+00	qlpuqi65fe77	81e735c1-0ece-4aa8-8217-4fc67ea197b6
00000000-0000-0000-0000-000000000000	105	vnxfxiq6stvd	d51b73e3-2c57-427c-9f9b-9c4c067f921f	f	2025-09-13 01:21:16.250129+00	2025-09-13 01:21:16.250129+00	\N	c89d7417-1399-4863-acde-9ab9ab96048e
00000000-0000-0000-0000-000000000000	106	w3bibgnhpknu	d51b73e3-2c57-427c-9f9b-9c4c067f921f	f	2025-09-13 01:22:28.038119+00	2025-09-13 01:22:28.038119+00	\N	2242ca6c-cae4-41e6-a848-6fca58fe4cc3
00000000-0000-0000-0000-000000000000	107	7wq3ks2rmwbc	d51b73e3-2c57-427c-9f9b-9c4c067f921f	f	2025-09-13 01:28:57.724036+00	2025-09-13 01:28:57.724036+00	\N	d248a4a2-8eff-4869-8b3d-3aea619464ac
00000000-0000-0000-0000-000000000000	108	xn4g5indwij5	d51b73e3-2c57-427c-9f9b-9c4c067f921f	f	2025-09-13 01:31:39.209626+00	2025-09-13 01:31:39.209626+00	\N	f466bb30-a2d9-408f-b715-8d5121087531
00000000-0000-0000-0000-000000000000	109	h6qzopvwkcdk	d51b73e3-2c57-427c-9f9b-9c4c067f921f	f	2025-09-13 01:31:53.512836+00	2025-09-13 01:31:53.512836+00	\N	95c47c2f-f178-4a7c-a6a5-6563a67011d0
00000000-0000-0000-0000-000000000000	110	wrh4vj3nmbnt	d51b73e3-2c57-427c-9f9b-9c4c067f921f	f	2025-09-13 01:36:38.533856+00	2025-09-13 01:36:38.533856+00	\N	94599a71-3b10-488d-8e7e-56f1e7d7e66d
00000000-0000-0000-0000-000000000000	111	tah2b5rc3fhv	d51b73e3-2c57-427c-9f9b-9c4c067f921f	f	2025-09-13 01:36:42.547554+00	2025-09-13 01:36:42.547554+00	\N	d410a16b-9d97-4172-91a6-9fa02150f946
00000000-0000-0000-0000-000000000000	112	z7gfwrenebwl	d51b73e3-2c57-427c-9f9b-9c4c067f921f	f	2025-09-13 01:40:00.401634+00	2025-09-13 01:40:00.401634+00	\N	7e494aca-e0e1-455a-8e72-7499f1d42780
00000000-0000-0000-0000-000000000000	113	2eywkli5ks6g	d51b73e3-2c57-427c-9f9b-9c4c067f921f	f	2025-09-13 01:43:06.43939+00	2025-09-13 01:43:06.43939+00	\N	8cec9317-e961-4fe9-8fdd-ebd50da108d9
00000000-0000-0000-0000-000000000000	114	3xm6naz7fzi7	d51b73e3-2c57-427c-9f9b-9c4c067f921f	f	2025-09-13 01:43:12.343584+00	2025-09-13 01:43:12.343584+00	\N	6325f304-2d3b-4343-a24f-079134122dd9
00000000-0000-0000-0000-000000000000	115	57zozwpjclme	d51b73e3-2c57-427c-9f9b-9c4c067f921f	f	2025-09-13 01:47:27.041671+00	2025-09-13 01:47:27.041671+00	\N	618a2633-82e7-4217-969e-ffd7d9c314ea
00000000-0000-0000-0000-000000000000	116	e2kttetyorjf	d51b73e3-2c57-427c-9f9b-9c4c067f921f	f	2025-09-13 01:49:38.188079+00	2025-09-13 01:49:38.188079+00	\N	bc8fe362-90c1-462a-bdf2-4871d98cf3dc
00000000-0000-0000-0000-000000000000	117	vt4w4tz5bb6n	d51b73e3-2c57-427c-9f9b-9c4c067f921f	f	2025-09-13 02:41:05.020113+00	2025-09-13 02:41:05.020113+00	\N	7e7ada72-51b4-41ce-a2c5-c479e271ef80
00000000-0000-0000-0000-000000000000	118	d4fksu53s7fz	d51b73e3-2c57-427c-9f9b-9c4c067f921f	f	2025-09-13 15:03:07.337269+00	2025-09-13 15:03:07.337269+00	\N	e57a9649-e36a-4718-b4df-dc277a2ff217
00000000-0000-0000-0000-000000000000	119	d7nictu3gpsh	d51b73e3-2c57-427c-9f9b-9c4c067f921f	f	2025-09-13 15:09:56.26312+00	2025-09-13 15:09:56.26312+00	\N	a6e2b7c4-3165-4144-b80f-299ab6ba5515
00000000-0000-0000-0000-000000000000	120	6aeperb6czjq	d51b73e3-2c57-427c-9f9b-9c4c067f921f	t	2025-09-13 15:17:58.0898+00	2025-09-13 16:17:48.60381+00	\N	4fd2affe-9e51-4d55-b9c1-b10f62458ba0
00000000-0000-0000-0000-000000000000	143	uq45zccbkndz	d51b73e3-2c57-427c-9f9b-9c4c067f921f	t	2025-09-13 20:06:53.969898+00	2025-09-13 20:06:54.50156+00	irvitpfeti6g	81e735c1-0ece-4aa8-8217-4fc67ea197b6
00000000-0000-0000-0000-000000000000	121	gl2epyqii3ik	d51b73e3-2c57-427c-9f9b-9c4c067f921f	t	2025-09-13 16:17:48.617154+00	2025-09-13 16:17:48.709187+00	6aeperb6czjq	4fd2affe-9e51-4d55-b9c1-b10f62458ba0
00000000-0000-0000-0000-000000000000	135	uxajs53kskjp	d51b73e3-2c57-427c-9f9b-9c4c067f921f	t	2025-09-13 17:29:26.249649+00	2025-09-13 20:06:54.522748+00	qlpuqi65fe77	81e735c1-0ece-4aa8-8217-4fc67ea197b6
00000000-0000-0000-0000-000000000000	146	6vgwheviuscs	d51b73e3-2c57-427c-9f9b-9c4c067f921f	t	2025-09-13 20:06:54.104204+00	2025-09-13 20:06:54.540582+00	bn4g25pp3skc	81e735c1-0ece-4aa8-8217-4fc67ea197b6
00000000-0000-0000-0000-000000000000	122	kvujmd3ktm5g	d51b73e3-2c57-427c-9f9b-9c4c067f921f	t	2025-09-13 16:17:48.709538+00	2025-09-13 17:17:37.982563+00	gl2epyqii3ik	4fd2affe-9e51-4d55-b9c1-b10f62458ba0
00000000-0000-0000-0000-000000000000	124	ingjdq2ftnjr	d51b73e3-2c57-427c-9f9b-9c4c067f921f	t	2025-09-13 17:17:37.991983+00	2025-09-13 17:17:38.064441+00	kvujmd3ktm5g	4fd2affe-9e51-4d55-b9c1-b10f62458ba0
00000000-0000-0000-0000-000000000000	140	5q6vkxojhigg	d51b73e3-2c57-427c-9f9b-9c4c067f921f	t	2025-09-13 17:29:26.390773+00	2025-09-13 20:06:54.585035+00	3skkaatridz4	81e735c1-0ece-4aa8-8217-4fc67ea197b6
00000000-0000-0000-0000-000000000000	152	6tjfwem26pzp	d51b73e3-2c57-427c-9f9b-9c4c067f921f	t	2025-09-13 20:06:54.326323+00	2025-09-13 20:06:54.621972+00	3gq2atw7xz4q	81e735c1-0ece-4aa8-8217-4fc67ea197b6
00000000-0000-0000-0000-000000000000	132	z4kabwirwpvj	d51b73e3-2c57-427c-9f9b-9c4c067f921f	t	2025-09-13 17:29:26.186457+00	2025-09-13 20:06:54.629577+00	3skkaatridz4	81e735c1-0ece-4aa8-8217-4fc67ea197b6
00000000-0000-0000-0000-000000000000	136	t75ycnub2ytu	d51b73e3-2c57-427c-9f9b-9c4c067f921f	t	2025-09-13 17:29:26.267422+00	2025-09-13 20:06:54.637774+00	3skkaatridz4	81e735c1-0ece-4aa8-8217-4fc67ea197b6
00000000-0000-0000-0000-000000000000	150	2kaqbwazo3lg	d51b73e3-2c57-427c-9f9b-9c4c067f921f	t	2025-09-13 20:06:54.273684+00	2025-09-13 21:27:35.17432+00	v26lvfxjmfdv	81e735c1-0ece-4aa8-8217-4fc67ea197b6
00000000-0000-0000-0000-000000000000	142	euhkhlj5qdwy	d51b73e3-2c57-427c-9f9b-9c4c067f921f	t	2025-09-13 19:55:06.384091+00	2025-09-13 21:53:41.910089+00	76sncjwm6f7b	4fd2affe-9e51-4d55-b9c1-b10f62458ba0
00000000-0000-0000-0000-000000000000	128	j5j5nfvlm2bz	d51b73e3-2c57-427c-9f9b-9c4c067f921f	t	2025-09-13 17:29:26.045339+00	2025-09-13 17:29:26.296807+00	3skkaatridz4	81e735c1-0ece-4aa8-8217-4fc67ea197b6
00000000-0000-0000-0000-000000000000	126	qlpuqi65fe77	d51b73e3-2c57-427c-9f9b-9c4c067f921f	t	2025-09-13 17:29:25.905345+00	2025-09-13 17:29:26.348299+00	3skkaatridz4	81e735c1-0ece-4aa8-8217-4fc67ea197b6
00000000-0000-0000-0000-000000000000	123	3skkaatridz4	d51b73e3-2c57-427c-9f9b-9c4c067f921f	t	2025-09-13 16:29:36.735417+00	2025-09-13 17:29:26.390387+00	\N	81e735c1-0ece-4aa8-8217-4fc67ea197b6
00000000-0000-0000-0000-000000000000	155	xyqyq2mllpvd	d51b73e3-2c57-427c-9f9b-9c4c067f921f	t	2025-09-13 20:06:54.386927+00	2025-09-13 21:27:35.17432+00	t75ycnub2ytu	81e735c1-0ece-4aa8-8217-4fc67ea197b6
00000000-0000-0000-0000-000000000000	189	cqaaxyn2hcqr	d51b73e3-2c57-427c-9f9b-9c4c067f921f	t	2025-09-14 00:33:15.853143+00	2025-09-14 01:20:03.40748+00	46amdel34im3	3965faf5-7d36-4eb9-af8f-1bb1c8bcd18a
00000000-0000-0000-0000-000000000000	191	gkm5m6bvwwi7	d51b73e3-2c57-427c-9f9b-9c4c067f921f	t	2025-09-14 00:33:15.873261+00	2025-09-14 01:20:03.40748+00	46amdel34im3	3965faf5-7d36-4eb9-af8f-1bb1c8bcd18a
00000000-0000-0000-0000-000000000000	156	4nczacx7s7mp	d51b73e3-2c57-427c-9f9b-9c4c067f921f	t	2025-09-13 20:06:54.412637+00	2025-09-13 21:27:35.17432+00	6zwnseosbiie	81e735c1-0ece-4aa8-8217-4fc67ea197b6
00000000-0000-0000-0000-000000000000	196	7gtuc7zmlvl6	d51b73e3-2c57-427c-9f9b-9c4c067f921f	t	2025-09-14 00:33:16.654066+00	2025-09-14 00:33:16.735579+00	l2hcgiokev3z	3965faf5-7d36-4eb9-af8f-1bb1c8bcd18a
00000000-0000-0000-0000-000000000000	198	6xa7qx3ytfvg	d51b73e3-2c57-427c-9f9b-9c4c067f921f	t	2025-09-14 00:33:16.707078+00	2025-09-14 00:33:16.774806+00	l2hcgiokev3z	3965faf5-7d36-4eb9-af8f-1bb1c8bcd18a
00000000-0000-0000-0000-000000000000	192	jnbc47xkzo7d	d51b73e3-2c57-427c-9f9b-9c4c067f921f	t	2025-09-14 00:33:15.929364+00	2025-09-14 01:20:03.40748+00	7vwofhhotm5k	3965faf5-7d36-4eb9-af8f-1bb1c8bcd18a
00000000-0000-0000-0000-000000000000	195	qgv7fkc5jbht	d51b73e3-2c57-427c-9f9b-9c4c067f921f	t	2025-09-14 00:33:16.626727+00	2025-09-14 01:20:03.40748+00	i23r7crnqddy	3965faf5-7d36-4eb9-af8f-1bb1c8bcd18a
00000000-0000-0000-0000-000000000000	197	33kokyf2u32t	d51b73e3-2c57-427c-9f9b-9c4c067f921f	t	2025-09-14 00:33:16.693213+00	2025-09-14 01:20:03.40748+00	i23r7crnqddy	3965faf5-7d36-4eb9-af8f-1bb1c8bcd18a
00000000-0000-0000-0000-000000000000	199	bspjojceggee	d51b73e3-2c57-427c-9f9b-9c4c067f921f	t	2025-09-14 00:33:16.736564+00	2025-09-14 01:20:03.40748+00	7gtuc7zmlvl6	3965faf5-7d36-4eb9-af8f-1bb1c8bcd18a
00000000-0000-0000-0000-000000000000	200	4kcd4atbdugw	d51b73e3-2c57-427c-9f9b-9c4c067f921f	t	2025-09-14 00:33:16.775088+00	2025-09-14 01:20:03.40748+00	6xa7qx3ytfvg	3965faf5-7d36-4eb9-af8f-1bb1c8bcd18a
00000000-0000-0000-0000-000000000000	201	ya4i43invqah	d51b73e3-2c57-427c-9f9b-9c4c067f921f	t	2025-09-14 00:33:16.799323+00	2025-09-14 01:20:03.40748+00	l2hcgiokev3z	3965faf5-7d36-4eb9-af8f-1bb1c8bcd18a
00000000-0000-0000-0000-000000000000	202	5clr5wgqbfc6	d51b73e3-2c57-427c-9f9b-9c4c067f921f	t	2025-09-14 01:20:02.768303+00	2025-09-14 02:41:58.867896+00	\N	93f16ca0-c5dc-4bae-a689-bb3895c81ccd
00000000-0000-0000-0000-000000000000	157	lenfinl2olgt	d51b73e3-2c57-427c-9f9b-9c4c067f921f	t	2025-09-13 20:06:54.427449+00	2025-09-13 20:06:54.554551+00	akzuex7i7eju	81e735c1-0ece-4aa8-8217-4fc67ea197b6
00000000-0000-0000-0000-000000000000	160	xrupl3odmgzk	d51b73e3-2c57-427c-9f9b-9c4c067f921f	t	2025-09-13 20:06:54.503998+00	2025-09-13 21:27:35.17432+00	uq45zccbkndz	81e735c1-0ece-4aa8-8217-4fc67ea197b6
00000000-0000-0000-0000-000000000000	162	rixbn5rvisnv	d51b73e3-2c57-427c-9f9b-9c4c067f921f	t	2025-09-13 20:06:54.54108+00	2025-09-13 21:27:35.17432+00	6vgwheviuscs	81e735c1-0ece-4aa8-8217-4fc67ea197b6
00000000-0000-0000-0000-000000000000	203	3jozjgl7ug7o	d51b73e3-2c57-427c-9f9b-9c4c067f921f	t	2025-09-14 02:41:58.88398+00	2025-09-14 02:41:59.033878+00	5clr5wgqbfc6	93f16ca0-c5dc-4bae-a689-bb3895c81ccd
00000000-0000-0000-0000-000000000000	134	vyisxtb2c3lx	d51b73e3-2c57-427c-9f9b-9c4c067f921f	t	2025-09-13 17:29:26.210181+00	2025-09-13 20:06:54.610833+00	3skkaatridz4	81e735c1-0ece-4aa8-8217-4fc67ea197b6
00000000-0000-0000-0000-000000000000	158	htmsrvcyc5ww	d51b73e3-2c57-427c-9f9b-9c4c067f921f	t	2025-09-13 20:06:54.450265+00	2025-09-13 21:27:35.17432+00	5q6vkxojhigg	81e735c1-0ece-4aa8-8217-4fc67ea197b6
00000000-0000-0000-0000-000000000000	161	otoz6pg4tnko	d51b73e3-2c57-427c-9f9b-9c4c067f921f	t	2025-09-13 20:06:54.523102+00	2025-09-13 21:27:35.17432+00	uxajs53kskjp	81e735c1-0ece-4aa8-8217-4fc67ea197b6
00000000-0000-0000-0000-000000000000	167	zpxiahuk3gbq	d51b73e3-2c57-427c-9f9b-9c4c067f921f	t	2025-09-13 20:06:54.611143+00	2025-09-13 21:27:35.17432+00	vyisxtb2c3lx	81e735c1-0ece-4aa8-8217-4fc67ea197b6
00000000-0000-0000-0000-000000000000	169	6bxfgcsphauq	d51b73e3-2c57-427c-9f9b-9c4c067f921f	t	2025-09-13 20:06:54.629905+00	2025-09-13 21:27:35.17432+00	z4kabwirwpvj	81e735c1-0ece-4aa8-8217-4fc67ea197b6
00000000-0000-0000-0000-000000000000	171	ruhb3phgnvee	d51b73e3-2c57-427c-9f9b-9c4c067f921f	t	2025-09-13 20:06:54.660589+00	2025-09-13 21:27:35.17432+00	bn4g25pp3skc	81e735c1-0ece-4aa8-8217-4fc67ea197b6
00000000-0000-0000-0000-000000000000	159	i5l6nli3ake3	d51b73e3-2c57-427c-9f9b-9c4c067f921f	t	2025-09-13 20:06:54.467359+00	2025-09-13 21:27:35.17432+00	uxajs53kskjp	81e735c1-0ece-4aa8-8217-4fc67ea197b6
00000000-0000-0000-0000-000000000000	204	nymd5jycmp7t	d51b73e3-2c57-427c-9f9b-9c4c067f921f	t	2025-09-14 02:41:59.034796+00	2025-09-14 04:41:13.238856+00	3jozjgl7ug7o	93f16ca0-c5dc-4bae-a689-bb3895c81ccd
00000000-0000-0000-0000-000000000000	138	bn4g25pp3skc	d51b73e3-2c57-427c-9f9b-9c4c067f921f	t	2025-09-13 17:29:26.311128+00	2025-09-13 20:06:54.660264+00	3skkaatridz4	81e735c1-0ece-4aa8-8217-4fc67ea197b6
00000000-0000-0000-0000-000000000000	164	2uvu5pyj7ghg	d51b73e3-2c57-427c-9f9b-9c4c067f921f	t	2025-09-13 20:06:54.574291+00	2025-09-13 21:27:35.17432+00	bn4g25pp3skc	81e735c1-0ece-4aa8-8217-4fc67ea197b6
00000000-0000-0000-0000-000000000000	165	fzmy2ghoonnb	d51b73e3-2c57-427c-9f9b-9c4c067f921f	t	2025-09-13 20:06:54.585414+00	2025-09-13 21:27:35.17432+00	5q6vkxojhigg	81e735c1-0ece-4aa8-8217-4fc67ea197b6
00000000-0000-0000-0000-000000000000	151	sblnlm2h5lnd	d51b73e3-2c57-427c-9f9b-9c4c067f921f	t	2025-09-13 20:06:54.292552+00	2025-09-13 21:27:35.17432+00	dvr7brbfg7ok	81e735c1-0ece-4aa8-8217-4fc67ea197b6
00000000-0000-0000-0000-000000000000	153	5kk5rvyppbvk	d51b73e3-2c57-427c-9f9b-9c4c067f921f	t	2025-09-13 20:06:54.339955+00	2025-09-13 21:27:35.17432+00	rjiwte6xghrj	81e735c1-0ece-4aa8-8217-4fc67ea197b6
00000000-0000-0000-0000-000000000000	154	wx24iii66gjx	d51b73e3-2c57-427c-9f9b-9c4c067f921f	t	2025-09-13 20:06:54.367914+00	2025-09-13 21:27:35.17432+00	pob3njggmnf3	81e735c1-0ece-4aa8-8217-4fc67ea197b6
00000000-0000-0000-0000-000000000000	163	4du6qrfkhiu2	d51b73e3-2c57-427c-9f9b-9c4c067f921f	t	2025-09-13 20:06:54.555574+00	2025-09-13 21:27:35.17432+00	lenfinl2olgt	81e735c1-0ece-4aa8-8217-4fc67ea197b6
00000000-0000-0000-0000-000000000000	166	5fjvrjxztjtk	d51b73e3-2c57-427c-9f9b-9c4c067f921f	t	2025-09-13 20:06:54.602401+00	2025-09-13 21:27:35.17432+00	bn4g25pp3skc	81e735c1-0ece-4aa8-8217-4fc67ea197b6
00000000-0000-0000-0000-000000000000	168	ledhqua4r3qy	d51b73e3-2c57-427c-9f9b-9c4c067f921f	t	2025-09-13 20:06:54.623033+00	2025-09-13 21:27:35.17432+00	6tjfwem26pzp	81e735c1-0ece-4aa8-8217-4fc67ea197b6
00000000-0000-0000-0000-000000000000	170	4b2qlpir6i7u	d51b73e3-2c57-427c-9f9b-9c4c067f921f	t	2025-09-13 20:06:54.638115+00	2025-09-13 21:27:35.17432+00	t75ycnub2ytu	81e735c1-0ece-4aa8-8217-4fc67ea197b6
00000000-0000-0000-0000-000000000000	172	cnncovsvfvqx	d51b73e3-2c57-427c-9f9b-9c4c067f921f	t	2025-09-13 21:53:41.937945+00	2025-09-13 21:53:42.081945+00	euhkhlj5qdwy	4fd2affe-9e51-4d55-b9c1-b10f62458ba0
00000000-0000-0000-0000-000000000000	173	xvhkusmrdfdr	d51b73e3-2c57-427c-9f9b-9c4c067f921f	t	2025-09-13 21:53:42.082293+00	2025-09-13 22:53:32.752376+00	cnncovsvfvqx	4fd2affe-9e51-4d55-b9c1-b10f62458ba0
00000000-0000-0000-0000-000000000000	178	l2hcgiokev3z	d51b73e3-2c57-427c-9f9b-9c4c067f921f	t	2025-09-13 23:22:59.793685+00	2025-09-14 00:33:16.798979+00	mp6cj7ulih24	3965faf5-7d36-4eb9-af8f-1bb1c8bcd18a
00000000-0000-0000-0000-000000000000	175	5nfa35xr4inc	d51b73e3-2c57-427c-9f9b-9c4c067f921f	t	2025-09-13 22:53:32.774369+00	2025-09-13 22:53:32.872634+00	xvhkusmrdfdr	4fd2affe-9e51-4d55-b9c1-b10f62458ba0
00000000-0000-0000-0000-000000000000	174	mp6cj7ulih24	d51b73e3-2c57-427c-9f9b-9c4c067f921f	t	2025-09-13 22:23:09.599902+00	2025-09-13 23:22:59.778863+00	\N	3965faf5-7d36-4eb9-af8f-1bb1c8bcd18a
00000000-0000-0000-0000-000000000000	176	k67aq5gskdum	d51b73e3-2c57-427c-9f9b-9c4c067f921f	t	2025-09-13 22:53:32.872966+00	2025-09-13 23:53:22.267382+00	5nfa35xr4inc	4fd2affe-9e51-4d55-b9c1-b10f62458ba0
00000000-0000-0000-0000-000000000000	179	eexqkia45pmm	d51b73e3-2c57-427c-9f9b-9c4c067f921f	t	2025-09-13 23:53:22.284515+00	2025-09-13 23:53:22.417885+00	k67aq5gskdum	4fd2affe-9e51-4d55-b9c1-b10f62458ba0
00000000-0000-0000-0000-000000000000	180	422dmxvz2gms	d51b73e3-2c57-427c-9f9b-9c4c067f921f	f	2025-09-13 23:53:22.418357+00	2025-09-13 23:53:22.418357+00	eexqkia45pmm	4fd2affe-9e51-4d55-b9c1-b10f62458ba0
00000000-0000-0000-0000-000000000000	182	eewyuuhw4gw2	d51b73e3-2c57-427c-9f9b-9c4c067f921f	f	2025-09-14 00:18:02.714135+00	2025-09-14 00:18:02.714135+00	toylbwpv256n	abbcbf7b-b415-4396-b081-b5abefe1058f
00000000-0000-0000-0000-000000000000	183	libcmxxn22kv	d51b73e3-2c57-427c-9f9b-9c4c067f921f	f	2025-09-14 00:18:02.750272+00	2025-09-14 00:18:02.750272+00	76fwm37dcomp	abbcbf7b-b415-4396-b081-b5abefe1058f
00000000-0000-0000-0000-000000000000	184	5ftgt6vnb6nm	d51b73e3-2c57-427c-9f9b-9c4c067f921f	f	2025-09-14 00:18:02.82666+00	2025-09-14 00:18:02.82666+00	toylbwpv256n	abbcbf7b-b415-4396-b081-b5abefe1058f
00000000-0000-0000-0000-000000000000	185	k4k5jd7k2kvl	d51b73e3-2c57-427c-9f9b-9c4c067f921f	f	2025-09-14 00:18:02.861294+00	2025-09-14 00:18:02.861294+00	76fwm37dcomp	abbcbf7b-b415-4396-b081-b5abefe1058f
00000000-0000-0000-0000-000000000000	181	toylbwpv256n	d51b73e3-2c57-427c-9f9b-9c4c067f921f	t	2025-09-14 00:18:02.526682+00	2025-09-14 00:18:02.932735+00	76fwm37dcomp	abbcbf7b-b415-4396-b081-b5abefe1058f
00000000-0000-0000-0000-000000000000	186	r77hbyz2ue22	d51b73e3-2c57-427c-9f9b-9c4c067f921f	f	2025-09-14 00:18:02.933773+00	2025-09-14 00:18:02.933773+00	toylbwpv256n	abbcbf7b-b415-4396-b081-b5abefe1058f
00000000-0000-0000-0000-000000000000	177	76fwm37dcomp	d51b73e3-2c57-427c-9f9b-9c4c067f921f	t	2025-09-13 23:07:46.748176+00	2025-09-14 00:18:02.952115+00	\N	abbcbf7b-b415-4396-b081-b5abefe1058f
00000000-0000-0000-0000-000000000000	187	jjlehbpjw4o5	d51b73e3-2c57-427c-9f9b-9c4c067f921f	f	2025-09-14 00:18:02.952655+00	2025-09-14 00:18:02.952655+00	76fwm37dcomp	abbcbf7b-b415-4396-b081-b5abefe1058f
\.


--
-- Data for Name: saml_providers; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.saml_providers (id, sso_provider_id, entity_id, metadata_xml, metadata_url, attribute_mapping, created_at, updated_at, name_id_format) FROM stdin;
\.


--
-- Data for Name: saml_relay_states; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.saml_relay_states (id, sso_provider_id, request_id, for_email, redirect_to, created_at, updated_at, flow_state_id) FROM stdin;
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.schema_migrations (version) FROM stdin;
20171026211738
20171026211808
20171026211834
20180103212743
20180108183307
20180119214651
20180125194653
00
20210710035447
20210722035447
20210730183235
20210909172000
20210927181326
20211122151130
20211124214934
20211202183645
20220114185221
20220114185340
20220224000811
20220323170000
20220429102000
20220531120530
20220614074223
20220811173540
20221003041349
20221003041400
20221011041400
20221020193600
20221021073300
20221021082433
20221027105023
20221114143122
20221114143410
20221125140132
20221208132122
20221215195500
20221215195800
20221215195900
20230116124310
20230116124412
20230131181311
20230322519590
20230402418590
20230411005111
20230508135423
20230523124323
20230818113222
20230914180801
20231027141322
20231114161723
20231117164230
20240115144230
20240214120130
20240306115329
20240314092811
20240427152123
20240612123726
20240729123726
20240802193726
20240806073726
20241009103726
20250717082212
20250731150234
\.


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.sessions (id, user_id, created_at, updated_at, factor_id, aal, not_after, refreshed_at, user_agent, ip, tag) FROM stdin;
3a99fa1f-906e-4073-a49f-b7473d3056fa	84c9b40f-0450-4311-af2b-220cebfb4c19	2025-08-30 04:49:49.894912+00	2025-08-30 04:49:49.894912+00	\N	aal1	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.6 Safari/605.1.15	146.75.154.0	\N
3965faf5-7d36-4eb9-af8f-1bb1c8bcd18a	d51b73e3-2c57-427c-9f9b-9c4c067f921f	2025-09-13 22:23:09.589629+00	2025-09-14 00:33:16.829161+00	\N	aal1	\N	2025-09-14 00:33:16.829088	python-httpx/0.28.1	23.93.73.222	\N
c89d7417-1399-4863-acde-9ab9ab96048e	d51b73e3-2c57-427c-9f9b-9c4c067f921f	2025-09-13 01:21:16.249112+00	2025-09-13 01:21:16.249112+00	\N	aal1	\N	\N	curl/8.7.1	128.32.90.51	\N
2242ca6c-cae4-41e6-a848-6fca58fe4cc3	d51b73e3-2c57-427c-9f9b-9c4c067f921f	2025-09-13 01:22:28.0289+00	2025-09-13 01:22:28.0289+00	\N	aal1	\N	\N	python-httpx/0.28.1	128.32.90.51	\N
d248a4a2-8eff-4869-8b3d-3aea619464ac	d51b73e3-2c57-427c-9f9b-9c4c067f921f	2025-09-13 01:28:57.722328+00	2025-09-13 01:28:57.722328+00	\N	aal1	\N	\N	python-httpx/0.28.1	128.32.90.51	\N
f466bb30-a2d9-408f-b715-8d5121087531	d51b73e3-2c57-427c-9f9b-9c4c067f921f	2025-09-13 01:31:39.208475+00	2025-09-13 01:31:39.208475+00	\N	aal1	\N	\N	python-httpx/0.28.1	128.32.90.51	\N
95c47c2f-f178-4a7c-a6a5-6563a67011d0	d51b73e3-2c57-427c-9f9b-9c4c067f921f	2025-09-13 01:31:53.511519+00	2025-09-13 01:31:53.511519+00	\N	aal1	\N	\N	python-httpx/0.28.1	128.32.90.51	\N
94599a71-3b10-488d-8e7e-56f1e7d7e66d	d51b73e3-2c57-427c-9f9b-9c4c067f921f	2025-09-13 01:36:38.523143+00	2025-09-13 01:36:38.523143+00	\N	aal1	\N	\N	python-httpx/0.28.1	128.32.90.51	\N
d410a16b-9d97-4172-91a6-9fa02150f946	d51b73e3-2c57-427c-9f9b-9c4c067f921f	2025-09-13 01:36:42.546215+00	2025-09-13 01:36:42.546215+00	\N	aal1	\N	\N	python-httpx/0.28.1	128.32.90.51	\N
7e494aca-e0e1-455a-8e72-7499f1d42780	d51b73e3-2c57-427c-9f9b-9c4c067f921f	2025-09-13 01:40:00.400463+00	2025-09-13 01:40:00.400463+00	\N	aal1	\N	\N	python-httpx/0.28.1	128.32.90.51	\N
8cec9317-e961-4fe9-8fdd-ebd50da108d9	d51b73e3-2c57-427c-9f9b-9c4c067f921f	2025-09-13 01:43:06.423545+00	2025-09-13 01:43:06.423545+00	\N	aal1	\N	\N	python-httpx/0.28.1	128.32.90.51	\N
6325f304-2d3b-4343-a24f-079134122dd9	d51b73e3-2c57-427c-9f9b-9c4c067f921f	2025-09-13 01:43:12.342819+00	2025-09-13 01:43:12.342819+00	\N	aal1	\N	\N	python-httpx/0.28.1	128.32.90.51	\N
618a2633-82e7-4217-969e-ffd7d9c314ea	d51b73e3-2c57-427c-9f9b-9c4c067f921f	2025-09-13 01:47:27.040194+00	2025-09-13 01:47:27.040194+00	\N	aal1	\N	\N	python-httpx/0.28.1	128.32.90.51	\N
bc8fe362-90c1-462a-bdf2-4871d98cf3dc	d51b73e3-2c57-427c-9f9b-9c4c067f921f	2025-09-13 01:49:38.186893+00	2025-09-13 01:49:38.186893+00	\N	aal1	\N	\N	python-httpx/0.28.1	128.32.90.51	\N
7e7ada72-51b4-41ce-a2c5-c479e271ef80	d51b73e3-2c57-427c-9f9b-9c4c067f921f	2025-09-13 02:41:05.00267+00	2025-09-13 02:41:05.00267+00	\N	aal1	\N	\N	python-httpx/0.28.1	128.32.90.51	\N
e57a9649-e36a-4718-b4df-dc277a2ff217	d51b73e3-2c57-427c-9f9b-9c4c067f921f	2025-09-13 15:03:07.315886+00	2025-09-13 15:03:07.315886+00	\N	aal1	\N	\N	python-httpx/0.28.1	23.93.73.222	\N
a6e2b7c4-3165-4144-b80f-299ab6ba5515	d51b73e3-2c57-427c-9f9b-9c4c067f921f	2025-09-13 15:09:56.258694+00	2025-09-13 15:09:56.258694+00	\N	aal1	\N	\N	python-httpx/0.28.1	23.93.73.222	\N
abbcbf7b-b415-4396-b081-b5abefe1058f	d51b73e3-2c57-427c-9f9b-9c4c067f921f	2025-09-13 23:07:46.733622+00	2025-09-14 00:18:03.179426+00	\N	aal1	\N	2025-09-14 00:18:03.179362	python-httpx/0.28.1	23.93.73.222	\N
4fd2affe-9e51-4d55-b9c1-b10f62458ba0	d51b73e3-2c57-427c-9f9b-9c4c067f921f	2025-09-13 15:17:58.083189+00	2025-09-13 23:53:22.422362+00	\N	aal1	\N	2025-09-13 23:53:22.422268	python-httpx/0.28.1	23.93.73.222	\N
81e735c1-0ece-4aa8-8217-4fc67ea197b6	d51b73e3-2c57-427c-9f9b-9c4c067f921f	2025-09-13 16:29:36.721864+00	2025-09-13 20:06:54.662359+00	\N	aal1	\N	2025-09-13 20:06:54.662291	python-httpx/0.28.1	23.93.73.222	\N
93f16ca0-c5dc-4bae-a689-bb3895c81ccd	d51b73e3-2c57-427c-9f9b-9c4c067f921f	2025-09-14 01:20:02.743591+00	2025-09-14 02:41:59.126192+00	\N	aal1	\N	2025-09-14 02:41:59.126121	python-httpx/0.28.1	23.93.73.222	\N
\.


--
-- Data for Name: sso_domains; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.sso_domains (id, sso_provider_id, domain, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: sso_providers; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.sso_providers (id, resource_id, created_at, updated_at, disabled) FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.users (instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, invited_at, confirmation_token, confirmation_sent_at, recovery_token, recovery_sent_at, email_change_token_new, email_change, email_change_sent_at, last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at, phone, phone_confirmed_at, phone_change, phone_change_token, phone_change_sent_at, email_change_token_current, email_change_confirm_status, banned_until, reauthentication_token, reauthentication_sent_at, is_sso_user, deleted_at, is_anonymous) FROM stdin;
00000000-0000-0000-0000-000000000000	84c9b40f-0450-4311-af2b-220cebfb4c19	authenticated	authenticated	dave.kokel@gmail.com	$2a$10$REKGzn/9/fz3PU4WMiii/u3SfR/93uu1bem/Bu4BGvj41phkj3lUy	2025-08-30 04:49:49.890192+00	\N		2025-08-30 04:49:32.887546+00		\N			\N	2025-08-30 04:49:49.894837+00	{"provider": "email", "providers": ["email"]}	{"sub": "84c9b40f-0450-4311-af2b-220cebfb4c19", "email": "dave.kokel@gmail.com", "full_name": "", "email_verified": true, "phone_verified": false}	\N	2025-08-30 04:49:32.817255+00	2025-08-30 04:49:49.908983+00	\N	\N			\N		0	\N		\N	f	\N	f
00000000-0000-0000-0000-000000000000	d51b73e3-2c57-427c-9f9b-9c4c067f921f	authenticated	authenticated	davekokel@berkeley.edu	$2a$10$5z1FxKtsD2.TYi8a7Mo8FOMCcYn.tTn7UhcG6.ExjETJ4urtX1lBm	2025-09-13 01:21:15.890615+00	2025-08-30 05:12:30.119575+00		\N		\N			\N	2025-09-14 01:20:02.74243+00	{"provider": "email", "providers": ["email"]}	{"email_verified": true}	\N	2025-08-30 05:12:30.013356+00	2025-09-14 02:41:59.037932+00	\N	\N			\N		0	\N		\N	f	\N	f
\.


--
-- Data for Name: dyes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.dyes (id, name, type, description, notes, created_at, excitation, emission, id_uuid) FROM stdin;
1	JFX650	\N	\N	\N	2025-09-10 01:46:34.996116+00	\N	\N	baf10673-4565-47e2-ac79-a3542ee4f8aa
5	example_chemical	\N	\N	\N	2025-09-12 22:00:28.223616+00	\N	\N	d42cdbd0-f12e-4e1f-937c-2fb7f963c67f
6	example_dye	\N	\N	\N	2025-09-12 22:00:28.223616+00	\N	\N	76deac14-11b7-40e1-9f82-cf3d0ede1f5e
\.


--
-- Data for Name: fish; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.fish (id, name, date_birth, notes, mother_fish_id, father_fish_id, line_building_stage, created_at, fish_code, created_by, code, id_uuid, father_fish_id_uuid, mother_fish_id_uuid, sex, status) FROM stdin;
656	my favorite fish	2025-09-13	test dev	\N	\N	stable_line>propagate	2025-09-13 16:30:09.634884+00	FSH-2025-0162	d51b73e3-2c57-427c-9f9b-9c4c067f921f	FSH-2025-0162	0fd9699e-d509-463a-9c71-d2b96d03ef3c	0080b875-dff0-458b-81aa-ac1f1414cb1e	f18359d4-a20e-42f8-b963-f5e21fde64fc	\N	\N
5	#1 4FP crya F2s	2025-02-26	\N	\N	\N	P0_founder	2025-09-12 23:09:14.242528+00	FSH-2025-0001	00000000-0000-0000-0000-000000000000	F-DDA24699	8e2854fd-d26b-49e7-be53-e653d7bf2508	\N	\N	\N	\N
6	#11 male Ben F2 male 2 x #7 female JIM F2 female 2	\N	\N	\N	\N	F1_ox	2025-09-12 23:09:14.242528+00	FSH-2025-0002	00000000-0000-0000-0000-000000000000	F-9FC39240	8b244e09-b545-4fbe-96f6-4572523a870c	\N	\N	\N	\N
7	#2 5FP crya F1 male (Chris); #1 4FP exorh F2 female(3) (LINN)	2025-02-17	\N	\N	\N	\N	2025-09-12 23:09:14.242528+00	FSH-2025-0003	00000000-0000-0000-0000-000000000000	F-D0606585	29fa09f4-9f3d-43f3-aa90-3e9873d3578b	\N	\N	\N	\N
8	2xLynk:tdmSG (rescued)	2024-11-18	\N	\N	\N	\N	2025-09-12 23:09:14.242528+00	FSH-2025-0004	00000000-0000-0000-0000-000000000000	F-75877C11	95705ea1-a7c6-4fea-ab96-4de9da063c92	\N	\N	\N	\N
9	301 ef1a:2xlynk:tdmSG female x skittles 5FP exorh male C	2025-03-26	\N	\N	\N	\N	2025-09-12 23:09:14.242528+00	FSH-2025-0005	00000000-0000-0000-0000-000000000000	F-F6825E64	1ebedaa5-6730-4c7a-8239-a8e1900a2873	\N	\N	\N	\N
10	301 tdmSG x H2B:Halo csp	2025-02-17	\N	\N	\N	\N	2025-09-12 23:09:14.242528+00	FSH-2025-0006	00000000-0000-0000-0000-000000000000	F-03FC7816	99938fcc-18d8-46e4-9379-ca36327d2d5f	\N	\N	\N	\N
11	301 x H2B:Halo	2025-02-17	\N	\N	\N	\N	2025-09-12 23:09:14.242528+00	FSH-2025-0007	00000000-0000-0000-0000-000000000000	F-E7FC97FB	fef8d3e7-8171-4da0-977f-a0574b8f76ab	\N	\N	\N	\N
12	Abe	2024-10-01	male #5 25%+ positive rate - currently best founder (but 2 alleles, one dim one bright(er)?	\N	\N	P0_founder	2025-09-12 23:09:14.242528+00	FSH-2025-0008	00000000-0000-0000-0000-000000000000	F-190A1719	7f5ae828-720d-43ef-9240-e035a5e8ebe9	\N	\N	\N	\N
14	Ben	2025-02-26	F1s of male #11  ~20% positive rate (~5 fish survived to adulthood)	\N	\N	F1_ox	2025-09-12 23:09:14.242528+00	FSH-2025-0010	00000000-0000-0000-0000-000000000000	F-274711EB	2f5350c0-cc5c-41ff-8247-9dcf4cf5c303	\N	\N	\N	\N
15	Casper F2 (Monday)	2024-08-27	\N	\N	\N	na	2025-09-12 23:09:14.242528+00	FSH-2025-0011	00000000-0000-0000-0000-000000000000	F-0DB96A67	b456f41f-907e-4082-8a3b-3719737b35cd	\N	\N	\N	\N
16	Casper F2 (Sunday)	2024-08-27	\N	\N	\N	na	2025-09-12 23:09:14.242528+00	FSH-2025-0012	00000000-0000-0000-0000-000000000000	F-1490CD1E	4a21e548-fc48-44a2-ac2d-490cdbe23fa8	\N	\N	\N	\N
17	Casper F2 (thursday)	2024-08-27	\N	\N	\N	na	2025-09-12 23:09:14.242528+00	FSH-2025-0013	00000000-0000-0000-0000-000000000000	F-B83C77E2	814c7640-9ef5-4e3c-aec1-f2b61dd30211	\N	\N	\N	\N
18	Casper F2 (Tuesday)	2024-08-27	\N	\N	\N	na	2025-09-12 23:09:14.242528+00	FSH-2025-0014	00000000-0000-0000-0000-000000000000	F-1DE6D3D8	a65b3ae6-aa76-4eaf-a84e-79e1c7147fd6	\N	\N	\N	\N
19	Casper F2 (Wednesday)	2024-08-27	\N	\N	\N	na	2025-09-12 23:09:14.242528+00	FSH-2025-0015	00000000-0000-0000-0000-000000000000	F-73C4EE97	6195b216-6350-4370-8fe1-05759b9da067	\N	\N	\N	\N
20	casper F2 screen for mSG	2024-08-27	\N	\N	\N	\N	2025-09-12 23:09:14.242528+00	FSH-2025-0016	00000000-0000-0000-0000-000000000000	F-2375F812	239031f9-86af-4230-96a4-a451094c6d12	\N	\N	\N	\N
21	casper/rnf	\N	\N	\N	\N	\N	2025-09-12 23:09:14.242528+00	FSH-2025-0017	00000000-0000-0000-0000-000000000000	F-84E6B6F0	614d036a-b9c7-43e5-8f74-6de387587163	\N	\N	\N	\N
23	Chris	2024-10-01	male #2 good founder	\N	\N	P0_founder	2025-09-12 23:09:14.242528+00	FSH-2025-0019	00000000-0000-0000-0000-000000000000	F-2CCA7CF1	89ce50cf-9b03-40eb-9409-85263e833fc9	\N	\N	\N	\N
24	crya:mSc;skittles 5FP founder #11: skittles 4FP exorhGFP	2025-10-29	\N	\N	\N	F1xF1	2025-09-12 23:09:14.242528+00	FSH-2025-0020	00000000-0000-0000-0000-000000000000	F-89008CB8	f5849fb4-4e74-45fd-8df7-250df757be68	\N	\N	\N	\N
26	csp/pIGLET 14a	\N	\N	\N	\N	\N	2025-09-12 23:09:14.242528+00	FSH-2025-0022	00000000-0000-0000-0000-000000000000	F-EDB83A31	0bd79682-f24f-4772-b37a-419273ee1000	\N	\N	\N	\N
27	csp/pIGLET 24b	\N	\N	\N	\N	\N	2025-09-12 23:09:14.242528+00	FSH-2025-0023	00000000-0000-0000-0000-000000000000	F-6275E7A0	dec21eb9-86c7-41dd-a85c-7f42c9a4ca4e	\N	\N	\N	\N
28	Dennis	2024-10-01	F1s of male #14	\N	\N	F1_ox	2025-09-12 23:09:14.242528+00	FSH-2025-0024	00000000-0000-0000-0000-000000000000	F-EDE1C6E7	479e940a-5572-49fd-84c5-9542a9a3105e	\N	\N	\N	\N
29	Ed	2025-02-26	male #1 - 10+ fish survived	\N	\N	P0_founder	2025-09-12 23:09:14.242528+00	FSH-2025-0025	00000000-0000-0000-0000-000000000000	F-D30E4FDE	5f8338e4-0376-47e4-87e6-110bd58d342f	\N	\N	\N	\N
30	ef1:mem:Halo het/homo? csp?	2025-04-29	\N	\N	\N	\N	2025-09-12 23:09:14.242528+00	FSH-2025-0026	00000000-0000-0000-0000-000000000000	F-A3687214	192aec0f-729a-41d4-92cf-f65800bf96ba	\N	\N	\N	\N
31	ef1a: skittles 5FP	2025-10-01	\N	\N	\N	potential_founders	2025-09-12 23:09:14.242528+00	FSH-2025-0027	00000000-0000-0000-0000-000000000000	F-13663EAB	74b5a73f-efab-4ac7-a446-c5e63f0564c1	\N	\N	\N	\N
32	ef1a:2lynx:tdmSG 301 ix + pDQM112 hsphiC:NLS	2025-04-17	\N	\N	\N	potential_founders	2025-09-12 23:09:14.242528+00	FSH-2025-0028	00000000-0000-0000-0000-000000000000	F-C1C828D5	db050c2a-4c9d-44d2-bba3-932ec419b891	\N	\N	\N	\N
33	ef1a:2xlynk:tdmSG #11 F2 inf ox	2025-04-17	\N	\N	\N	F2_ix	2025-09-12 23:09:14.242528+00	FSH-2025-0029	00000000-0000-0000-0000-000000000000	F-30EFA620	0280d316-4a55-4ba1-8609-6381372149b0	\N	\N	\N	\N
34	ef1a:2xlynk:tdmSG #11 male x csp ox	2024-11-25	\N	\N	\N	F1_ox	2025-09-12 23:09:14.242528+00	FSH-2025-0030	00000000-0000-0000-0000-000000000000	F-C2D71F20	0080b875-dff0-458b-81aa-ac1f1414cb1e	\N	\N	\N	\N
35	ef1a:2xLynk:tdmSG 301 ix F3	2025-04-18	\N	\N	\N	F2_ix	2025-09-12 23:09:14.242528+00	FSH-2025-0031	00000000-0000-0000-0000-000000000000	F-8E77574B	2ab106a8-fb15-4c1a-bb89-23d80cc6548e	\N	\N	\N	\N
36	ef1a:2xmem:tdmSG #8 male F2 less bright cs ox	2024-11-12	\N	\N	\N	to_kill	2025-09-12 23:09:14.242528+00	FSH-2025-0032	00000000-0000-0000-0000-000000000000	F-DE8A6A22	658a52bb-4c56-4a84-a0e2-c8cc835136f2	\N	\N	\N	\N
37	ef1a:2xmem:tdmSG F2 ix (#11)	2025-03-03	\N	\N	\N	F2_ix	2025-09-12 23:09:14.242528+00	FSH-2025-0033	00000000-0000-0000-0000-000000000000	F-DB5B1AF9	f4b0e45d-4006-4692-bfe6-a718a9c24f99	\N	\N	\N	\N
39	ef1a:2xmemitdmSG F2 femal/male301 F1 (#1)	2024-11-02	\N	\N	\N	F1_ox	2025-09-12 23:09:14.242528+00	FSH-2025-0035	00000000-0000-0000-0000-000000000000	F-E3D6175A	668c64a1-8f35-4e60-aaee-ae8ad0bb4047	\N	\N	\N	\N
40	ef1a:2xmemitdmSG male 8 x csp ox 301 F1 (#3)	2024-11-12	\N	\N	\N	F1_ox	2025-09-12 23:09:14.242528+00	FSH-2025-0036	00000000-0000-0000-0000-000000000000	F-13A45993	895ccb31-3a06-40bd-b1ea-54e2940930ef	\N	\N	\N	\N
41	ef1a:2xmemitdmSG male 8 x csp ox 301 F1 (#4)	2024-11-12	\N	\N	\N	F1_ox	2025-09-12 23:09:14.242528+00	FSH-2025-0037	00000000-0000-0000-0000-000000000000	F-FBCA6F0E	3aca6699-ffc4-41bd-9a9e-458574ff1314	\N	\N	\N	\N
42	ef1a:mem:Halo het or homo csp	2025-04-29	\N	\N	\N	F1_ox	2025-09-12 23:09:14.242528+00	FSH-2025-0038	00000000-0000-0000-0000-000000000000	F-C01BF876	f92367c0-66ca-4e22-8b3a-13c594081249	\N	\N	\N	\N
43	ef1a:mem:tdmSG #11 male FOUNDER	2024-08-16	\N	\N	\N	P0_founder	2025-09-12 23:09:14.242528+00	FSH-2025-0039	00000000-0000-0000-0000-000000000000	F-6466C874	a021684d-705b-479e-aa0e-36219483e636	\N	\N	\N	\N
44	ef1a:memHalo-Halo csp 1+ alleles	2024-08-21	\N	\N	\N	\N	2025-09-12 23:09:14.242528+00	FSH-2025-0040	00000000-0000-0000-0000-000000000000	F-4F783A94	eb303441-8303-4506-bf57-1903a6ff00ea	\N	\N	\N	\N
45	ef1a:memSG #8 ox H2B:mChilada	2025-01-13	\N	\N	\N	\N	2025-09-12 23:09:14.242528+00	FSH-2025-0041	00000000-0000-0000-0000-000000000000	F-904211DC	5fa5da8b-9ce8-429c-9188-e86654e16222	\N	\N	\N	\N
46	ef1a:skittles male #5 5FP crya:mSC ox csp	2025-02-09	\N	\N	\N	\N	2025-09-12 23:09:14.242528+00	FSH-2025-0042	00000000-0000-0000-0000-000000000000	F-6BB4E806	eb783339-935a-46b7-ae65-cdec046ad866	\N	\N	\N	\N
47	ef1a:slit #5 male F2 ox csp, #5 ABE F2 male(2) x #11Ben F2 female (2)	2025-02-11	\N	\N	\N	\N	2025-09-12 23:09:14.242528+00	FSH-2025-0043	00000000-0000-0000-0000-000000000000	F-1810A84D	f5711bb8-c476-49a7-a1d8-9c7116ac723b	\N	\N	\N	\N
49	exorh:GFP;crya skittles 5FP female 24 F2s x 301 ef1a:2xlynk:tdmSG	2025-04-30	\N	\N	\N	\N	2025-09-12 23:09:14.242528+00	FSH-2025-0045	00000000-0000-0000-0000-000000000000	F-87FA9BAB	d92e45d8-ccb9-41e3-877e-a47666bee502	\N	\N	\N	\N
48	ef1a:tsmSG negative	2024-08-16	\N	\N	\N	to_kill	2025-09-12 23:09:14.242528+00	FSH-2025-0044	00000000-0000-0000-0000-000000000000	F-C052C9E9	01d2f082-d75b-4208-8a59-1e369ce63161	\N	\N	\N	\N
50	exorh:GFP;skittles 5FP female #29 F2s (dim 301?)	2025-04-30	\N	\N	\N	\N	2025-09-12 23:09:14.242528+00	FSH-2025-0046	00000000-0000-0000-0000-000000000000	F-AC965210	c490715d-605b-4041-a5a0-f86d03bee03e	\N	\N	\N	\N
51	exorh+5FP skittles male	2024-11-20	\N	\N	\N	P0_founder	2025-09-12 23:09:14.242528+00	FSH-2025-0047	00000000-0000-0000-0000-000000000000	F-C592992B	5b54aa72-46a4-4ab8-840b-4747c10c5fe7	\N	\N	\N	\N
52	F2 male #3 hspphiCNLS:exorh;mSC(+) ; 301(weak)	2025-05-27	\N	\N	\N	\N	2025-09-12 23:09:14.242528+00	FSH-2025-0048	00000000-0000-0000-0000-000000000000	F-794C09D3	5a166116-c0ac-4adb-8902-afcf7f484d4a	\N	\N	\N	\N
53	Gemma	2024-11-20	female #1  - low frequency (1-2%) exorH:GFP (+) embryos - will start tank	\N	\N	P0_founder	2025-09-12 23:09:14.242528+00	FSH-2025-0049	00000000-0000-0000-0000-000000000000	F-D6AB5660	1794f661-bf46-44de-85f8-73c4e72cb321	\N	\N	\N	\N
56	hspphiCNLS; exorh:mScarlet male #1 FOUNDER	2025-02-22	\N	\N	\N	P0_founder	2025-09-12 23:09:14.242528+00	FSH-2025-0052	00000000-0000-0000-0000-000000000000	F-05129E86	a8be7228-666d-40f0-95d8-eb0474667650	\N	\N	\N	\N
58	Jim	2025-02-25	male #7, 4 fish survived to adulthood	\N	\N	P0_founder	2025-09-12 23:09:14.242528+00	FSH-2025-0054	00000000-0000-0000-0000-000000000000	F-073F3F91	f3a03a33-0f32-482e-9987-7d3252686947	\N	\N	\N	\N
60	Liam	2024-11-03	male #1 02012025	\N	\N	P0_founder	2025-09-12 23:09:14.242528+00	FSH-2025-0056	00000000-0000-0000-0000-000000000000	F-1519200C	b83a5cd7-6083-444d-acb1-a3f7d6f25fd9	\N	\N	\N	\N
61	mem-Halo	2024-05-20	\N	\N	\N	F1_ox	2025-09-12 23:09:14.242528+00	FSH-2025-0057	00000000-0000-0000-0000-000000000000	F-4C45020F	69c8746d-2a55-48c6-bc13-4eae796e3666	\N	\N	\N	\N
63	mem:tdmChilada	\N	F1s of allele 315	\N	\N	F1_ox	2025-09-12 23:09:14.242528+00	FSH-2025-0059	00000000-0000-0000-0000-000000000000	F-A91F9B21	6271ab4c-171f-4d13-a162-7eb490287279	\N	\N	\N	\N
64	mHalo ix F2	2025-04-29	\N	\N	\N	F2_ix	2025-09-12 23:09:14.242528+00	FSH-2025-0060	00000000-0000-0000-0000-000000000000	F-0FD02B4B	f734f851-78a1-47c5-8a59-193e1774c2ee	\N	\N	\N	\N
65	mSG #19 bright/csp ef1a:2xlynk:tdmSG	2024-12-06	\N	\N	\N	to_kill	2025-09-12 23:09:14.242528+00	FSH-2025-0061	00000000-0000-0000-0000-000000000000	F-4A6BC096	90d26eef-daf0-4278-9988-0a935e9fb963	\N	\N	\N	\N
66	mSG #23 male FOUNDER	2024-08-16	\N	\N	\N	to_kill	2025-09-12 23:09:14.242528+00	FSH-2025-0062	00000000-0000-0000-0000-000000000000	F-FDD5D869	98693193-6ebb-4a90-87ff-96dc7d57c007	\N	\N	\N	\N
67	mSg #26 bright male	2024-08-14	\N	\N	\N	P0_founder	2025-09-12 23:09:14.242528+00	FSH-2025-0063	00000000-0000-0000-0000-000000000000	F-8DF90E2F	3956a7b4-cd13-44da-a2b2-9bae4908e11f	\N	\N	\N	\N
68	mSG male (+++)	2024-08-16	\N	\N	\N	\N	2025-09-12 23:09:14.242528+00	FSH-2025-0064	00000000-0000-0000-0000-000000000000	F-D9E781E1	2c4787b9-387d-4c83-9eae-0c1f2e6d8ee0	\N	\N	\N	\N
69	mSG male #14 (++)	2024-08-16	\N	\N	\N	to_kill	2025-09-12 23:09:14.242528+00	FSH-2025-0065	00000000-0000-0000-0000-000000000000	F-8B95ED5D	2c6587bc-4656-47d0-bf95-76f06dbba946	\N	\N	\N	\N
70	mSg male #19 ++ ~15%	2024-08-16	\N	\N	\N	P0_founder	2025-09-12 23:09:14.242528+00	FSH-2025-0066	00000000-0000-0000-0000-000000000000	F-7054D58A	f3792ebc-428c-4f57-ab41-754f5cd6be3e	\N	\N	\N	\N
73	pDQM06 tdmCh:H2B negative	2024-11-25	\N	\N	\N	to_kill	2025-09-12 23:09:14.242528+00	FSH-2025-0069	00000000-0000-0000-0000-000000000000	F-9D9F23BF	01284da8-d672-4add-b2a3-09656003b58d	\N	\N	\N	\N
74	pDQM068 piglet14a/csp eef1a:2xlynk:tdmSG	2024-12-05	\N	\N	\N	potential_founders	2025-09-12 23:09:14.242528+00	FSH-2025-0070	00000000-0000-0000-0000-000000000000	F-EC5F4C78	ca2b2d27-99d6-42d2-9d35-13212f791e82	\N	\N	\N	\N
75	pDQM072 ef1a:2xlynk:tdmSG tPT2A:tdmChilada:H2B	2025-12-06	\N	\N	\N	potential_founders	2025-09-12 23:09:14.242528+00	FSH-2025-0071	00000000-0000-0000-0000-000000000000	F-5D19752B	0626d7d3-884b-447c-8179-a4a28b15a160	\N	\N	\N	\N
76	pDQM076 piglet 14a/csp exorh:GFP:hsp:DHB:HmSC + T2A:tdmCh:H2B	2024-12-05	\N	\N	\N	potential_founders	2025-09-12 23:09:14.242528+00	FSH-2025-0072	00000000-0000-0000-0000-000000000000	F-CB3C8EAD	570d6234-de3f-4cd7-b2d8-45b9ea785e08	\N	\N	\N	\N
77	pDQM078 negative	2024-12-05	\N	\N	\N	to_kill	2025-09-12 23:09:14.242528+00	FSH-2025-0073	00000000-0000-0000-0000-000000000000	F-B3839394	9274aec1-3d85-4032-ab80-c0c6fc2b680a	\N	\N	\N	\N
79	pDQM082 ef1a:2lynx:tdmChilada #1 male founder (++) mut alles	2024-12-10	\N	\N	\N	P0_founder	2025-09-12 23:09:14.242528+00	FSH-2025-0075	00000000-0000-0000-0000-000000000000	F-0666F2B2	f2086ae1-c7c9-479b-9205-fc7c7eff12db	\N	\N	\N	\N
80	pDQM082 F2 csp/AB	2025-04-23	\N	\N	\N	F1_ox	2025-09-12 23:09:14.242528+00	FSH-2025-0076	00000000-0000-0000-0000-000000000000	F-4A424F37	541b0623-d93d-4113-9f08-178fd1c2a072	\N	\N	\N	\N
81	pDQM082 F2 ef1a:2xlynk:tdmChilada male 1	2025-04-25	\N	\N	\N	P0_founder	2025-09-12 23:09:14.242528+00	FSH-2025-0077	00000000-0000-0000-0000-000000000000	F-B61569DE	d0617443-8d87-4100-bdb9-978431aa28ec	\N	\N	\N	\N
82	pDQM082 negative	2024-12-18	\N	\N	\N	to_kill	2025-09-12 23:09:14.242528+00	FSH-2025-0078	00000000-0000-0000-0000-000000000000	F-A60896C6	094cc673-0e68-4317-935c-1b7f3adf0420	\N	\N	\N	\N
83	pDQM082 rnf/AB F2s male #1	2025-04-22	\N	\N	\N	\N	2025-09-12 23:09:14.242528+00	FSH-2025-0079	00000000-0000-0000-0000-000000000000	F-6972A9CC	563ddec0-9af6-491c-a3c3-07145fc4c56f	\N	\N	\N	\N
84	pDQM085 FOUNDER male #1	2024-11-25	\N	\N	\N	P0_founder	2025-09-12 23:09:14.242528+00	FSH-2025-0080	00000000-0000-0000-0000-000000000000	F-2DE92E0D	4c24a487-c19c-4372-bae6-6139b4b6cf2d	\N	\N	\N	\N
85	pDQM094 (+) male #4	2025-01-07	\N	\N	\N	P0_founder	2025-09-12 23:09:14.242528+00	FSH-2025-0081	00000000-0000-0000-0000-000000000000	F-37D7C0A2	b86044f0-91e0-4630-9ae1-670eb21695c9	\N	\N	\N	\N
86	pDQM094 female 1 F2 (++)	2025-04-01	\N	\N	\N	P0_founder	2025-09-12 23:09:14.242528+00	FSH-2025-0082	00000000-0000-0000-0000-000000000000	F-FA18881E	39befe76-c75a-46bc-a0e4-bde7f45e654f	\N	\N	\N	\N
87	pDQM094 negative	\N	\N	\N	\N	to_kill	2025-09-12 23:09:14.242528+00	FSH-2025-0083	00000000-0000-0000-0000-000000000000	F-A488A1C9	420ea053-f5cf-4cba-9ba0-b23dd399f06e	\N	\N	\N	\N
88	pDQM095 zFUCCIv1 + tol2	2025-01-07	\N	\N	\N	potential_founders	2025-09-12 23:09:14.242528+00	FSH-2025-0084	00000000-0000-0000-0000-000000000000	F-ECC7AFFD	8bbb47c0-d9e1-4dd2-b3c8-1abe6d41b235	\N	\N	\N	\N
89	pDQM0954 (+++) female #2 x csp F2 ox FOUNDER	2025-01-07	\N	\N	\N	P0_founder	2025-09-12 23:09:14.242528+00	FSH-2025-0085	00000000-0000-0000-0000-000000000000	F-DFE444C5	de5aee72-a6bf-4913-b17f-618d6fc59e86	\N	\N	\N	\N
90	pDQM096 zFUCCI u2 +tol2	2025-01-07	\N	\N	\N	potential_founders	2025-09-12 23:09:14.242528+00	FSH-2025-0086	00000000-0000-0000-0000-000000000000	F-E5A73D8F	04dced60-7ff6-4065-86ab-8bba732ae9be	\N	\N	\N	\N
91	pDQM125 301 inf ix tol2	2025-04-18	\N	\N	\N	potential_founders	2025-09-12 23:09:14.242528+00	FSH-2025-0087	00000000-0000-0000-0000-000000000000	F-793AC235	a56b64f2-147f-4778-ab9d-0ccf6f71977a	\N	\N	\N	\N
92	pDQM132 +tol2	2025-04-21	\N	\N	\N	potential_founders	2025-09-12 23:09:14.242528+00	FSH-2025-0088	00000000-0000-0000-0000-000000000000	F-01B98F1C	06ceb55d-00eb-475f-9cd5-eeac1a591be2	\N	\N	\N	\N
657	let image these!	2025-09-13	test dev	\N	\N	for_imaging	2025-09-13 19:49:38.032928+00	FSH-2025-0163	d51b73e3-2c57-427c-9f9b-9c4c067f921f	FSH-2025-0163	7c9589f6-bcd3-4035-ba1b-6f1b250dec82	0080b875-dff0-458b-81aa-ac1f1414cb1e	f18359d4-a20e-42f8-b963-f5e21fde64fc	\N	\N
93	pDQM132 male FOUNDER	2025-04-21	\N	\N	\N	P0_founder	2025-09-12 23:09:14.242528+00	FSH-2025-0089	00000000-0000-0000-0000-000000000000	F-26F3465D	f67c2dc7-7cc6-48c2-9e42-b7ca3a19d918	\N	\N	\N	\N
94	pDQM132+tol2(iC)	2025-05-23	\N	\N	\N	potential_founders	2025-09-12 23:09:14.242528+00	FSH-2025-0090	00000000-0000-0000-0000-000000000000	F-88AF6C1E	0ff37210-8c46-4117-bbc6-07f0c14bc17e	\N	\N	\N	\N
95	pDQM133	2025-04-17	\N	\N	\N	potential_founders	2025-09-12 23:09:14.242528+00	FSH-2025-0091	00000000-0000-0000-0000-000000000000	F-977E7995	21cee4ff-fca5-4ac5-9780-cc4ba176919b	\N	\N	\N	\N
96	pDQM133 301 ix +tol2	2025-04-18	\N	\N	\N	potential_founders	2025-09-12 23:09:14.242528+00	FSH-2025-0092	00000000-0000-0000-0000-000000000000	F-31360611	78239033-1eec-4689-a28b-5a8f2a7be0c9	\N	\N	\N	\N
97	pDQM133 301ix +tol2	2025-04-18	\N	\N	\N	potential_founders	2025-09-12 23:09:14.242528+00	FSH-2025-0093	00000000-0000-0000-0000-000000000000	F-D16D7C91	986edf2f-32c1-4c7b-a61c-70565cac46e6	\N	\N	\N	\N
98	pDQM133 P0 male ef1aext:tdmSc3s2:H2B	2025-04-08	\N	\N	\N	P0_founder	2025-09-12 23:09:14.242528+00	FSH-2025-0094	00000000-0000-0000-0000-000000000000	F-052A4035	8b8c8555-557e-4599-8ea9-2ab0078126c5	\N	\N	\N	\N
99	pDQM136	2025-04-27	\N	\N	\N	potential_founders	2025-09-12 23:09:14.242528+00	FSH-2025-0095	00000000-0000-0000-0000-000000000000	F-359B5B70	32d557d2-8773-4824-8d0c-98d9cddb89bc	\N	\N	\N	\N
100	pDQM136 Bright	2025-04-28	bright	\N	\N	potential_founders	2025-09-12 23:09:14.242528+00	FSH-2025-0096	00000000-0000-0000-0000-000000000000	F-EEE1F70F	2a0b333b-4d5e-4f23-976e-82bf1227a5ea	\N	\N	\N	\N
101	pDQM136 FOUNDER male #1	2025-04-28	\N	\N	\N	P0_founder	2025-09-12 23:09:14.242528+00	FSH-2025-0097	00000000-0000-0000-0000-000000000000	F-27FC464F	a50449a8-c4b1-4c12-bef9-94d771bf3927	\N	\N	\N	\N
102	pDQM136 screened negative	2025-04-28	\N	\N	\N	to_kill	2025-09-12 23:09:14.242528+00	FSH-2025-0098	00000000-0000-0000-0000-000000000000	F-06C3DFDD	52d86a23-aeee-43cc-87a9-5f53d227512d	\N	\N	\N	\N
103	piglet 14a /csp	2024-12-05	\N	\N	\N	\N	2025-09-12 23:09:14.242528+00	FSH-2025-0099	00000000-0000-0000-0000-000000000000	F-9AB2DEF3	529c7219-1beb-4d23-ba86-9b4ac138e5e5	\N	\N	\N	\N
104	piglet 14a mpx:mChilada( 1 allele)	2025-01-15	\N	\N	\N	\N	2025-09-12 23:09:14.242528+00	FSH-2025-0100	00000000-0000-0000-0000-000000000000	F-AC0ACBD0	6da4628a-cf7c-443f-8ede-ddada243cc28	\N	\N	\N	\N
105	piglet 14a pDQM078 ef1a:2xlynx:tdmSg	2024-12-05	\N	\N	\N	potential_founders	2025-09-12 23:09:14.242528+00	FSH-2025-0101	00000000-0000-0000-0000-000000000000	F-86556601	e2a298f3-900f-4610-8c52-1f5afba76f1e	\N	\N	\N	\N
106	piglet 14a/csp hets slc1a3b:mKate2(1 pr 2 alleles) negative	2024-11-26	\N	\N	\N	to_kill	2025-09-12 23:09:14.242528+00	FSH-2025-0102	00000000-0000-0000-0000-000000000000	F-5F54F1B2	2cba9336-c74a-4993-9091-105ce02b995f	\N	\N	\N	\N
107	piglet 20pg ef1a:mStayGold test	2025-02-01	\N	\N	\N	potential_founders	2025-09-12 23:09:14.242528+00	FSH-2025-0103	00000000-0000-0000-0000-000000000000	F-672CBC9F	ef00373f-5c3b-4dd2-b1b4-5c12678dc3bd	\N	\N	\N	\N
111	piglet 24b pDQM079 ef1a:2xlynk:mSG	2024-12-06	\N	\N	\N	potential_founders	2025-09-12 23:09:14.242528+00	FSH-2025-0107	00000000-0000-0000-0000-000000000000	F-0EBA9667	d4cbd484-b4a8-4405-97ea-6759c9246dfb	\N	\N	\N	\N
112	piglet 24b pDQM131 exorh:GFP;hsp:DHB/H2B	2025-04-23	\N	\N	\N	potential_founders	2025-09-12 23:09:14.242528+00	FSH-2025-0108	00000000-0000-0000-0000-000000000000	F-045DCFBE	5e16ff3c-ffb8-4a43-a879-d6e5362934ae	\N	\N	\N	\N
113	piglet14a	2025-01-08	\N	\N	\N	to_kill	2025-09-12 23:09:14.242528+00	FSH-2025-0109	00000000-0000-0000-0000-000000000000	F-1CEBB7FD	fefff13c-bafd-4b8d-9910-085235da1018	\N	\N	\N	\N
114	piglet24b ef1a:2xlynk:tdmSG pDQM078	2024-12-06	\N	\N	\N	potential_founders	2025-09-12 23:09:14.242528+00	FSH-2025-0110	00000000-0000-0000-0000-000000000000	F-A3489D35	8b20813a-6dbc-4487-826c-34af8636b810	\N	\N	\N	\N
115	piglet24b sox10:mCh	2025-03-18	\N	\N	\N	\N	2025-09-12 23:09:14.242528+00	FSH-2025-0111	00000000-0000-0000-0000-000000000000	F-38D8B574	64088179-fd82-48a7-af4b-b0c305a57d94	\N	\N	\N	\N
116	rnf+pDQM112 exorh:mSc:hsp:phiCNLS	2025-02-28	\N	\N	\N	potential_founders	2025-09-12 23:09:14.242528+00	FSH-2025-0112	00000000-0000-0000-0000-000000000000	F-5A2CE586	5bc649e0-dddc-491e-a8c9-680bfd8b2659	\N	\N	\N	\N
117	rnf+pDQM137 Skittles 4.0	2025-04-22	\N	\N	\N	potential_founders	2025-09-12 23:09:14.242528+00	FSH-2025-0113	00000000-0000-0000-0000-000000000000	F-F99D0FBB	d39f94c1-d718-423a-89e9-09d4e6d79bbb	\N	\N	\N	\N
118	screened negative	2024-11-20	\N	\N	\N	to_kill	2025-09-12 23:09:14.242528+00	FSH-2025-0114	00000000-0000-0000-0000-000000000000	F-5BFF0432	63f05582-a83c-4739-af0f-1363cc0b2b4e	\N	\N	\N	\N
119	skittles 2.0 male #5	2024-09-16	\N	\N	\N	P0_founder	2025-09-12 23:09:14.242528+00	FSH-2025-0115	00000000-0000-0000-0000-000000000000	F-9E92948F	afc2111d-b372-483d-b253-dfd73fd2ed6e	\N	\N	\N	\N
120	skittles 2.0 negative	2024-09-16	\N	\N	\N	to_kill	2025-09-12 23:09:14.242528+00	FSH-2025-0116	00000000-0000-0000-0000-000000000000	F-AA197DB5	f9f61a5a-f225-4dd6-a5f5-83d4cbe80884	\N	\N	\N	\N
121	skittles 3.0 exorh 3FP(+) male 1	2024-10-25	\N	\N	\N	P0_founder	2025-09-12 23:09:14.242528+00	FSH-2025-0117	00000000-0000-0000-0000-000000000000	F-3727AC86	9765667b-e584-4c37-b59c-3561caae8ea7	\N	\N	\N	\N
122	skittles 3.0 male exorhGFP 4 FP	2024-10-29	\N	\N	\N	potential_founders	2025-09-12 23:09:14.242528+00	FSH-2025-0118	00000000-0000-0000-0000-000000000000	F-9DBB908F	ebb03677-25b2-4b68-930e-052255b58508	\N	\N	\N	\N
123	skittles 4 FP cryaa:mScarlet	2025-02-26	F1s of male #1	\N	\N	F1_ox	2025-09-12 23:09:14.242528+00	FSH-2025-0119	00000000-0000-0000-0000-000000000000	F-73CE00D0	b95c0036-0df0-4a1d-be39-121ec9e59bdd	\N	\N	\N	\N
124	skittles 4 FP exorh 3.0 ix csp male #1	2025-02-17	\N	\N	\N	\N	2025-09-12 23:09:14.242528+00	FSH-2025-0120	00000000-0000-0000-0000-000000000000	F-AB08DC5D	47754395-36dc-42ab-ba83-0e6250f95e86	\N	\N	\N	\N
125	skittles 4 FP male #3 exorh 3.0 ox csp	2025-02-17	\N	\N	\N	\N	2025-09-12 23:09:14.242528+00	FSH-2025-0121	00000000-0000-0000-0000-000000000000	F-3A7B1021	cde309b8-c573-4a13-b6e7-a495e91a5a82	\N	\N	\N	\N
126	skittles 4 FP tol2 (clone 4)	2024-09-17	\N	\N	\N	potential_founders	2025-09-12 23:09:14.242528+00	FSH-2025-0122	00000000-0000-0000-0000-000000000000	F-C3E4235C	65ce7338-5c18-44cb-9e5a-8e25e095d210	\N	\N	\N	\N
127	skittles 4.0 mfix+pDQM137	2025-04-22	\N	\N	\N	potential_founders	2025-09-12 23:09:14.242528+00	FSH-2025-0123	00000000-0000-0000-0000-000000000000	F-832173D5	d09c8616-b52d-454b-b28a-697e7864bbd1	\N	\N	\N	\N
128	skittles 4.0 pDQM137 male #4 weak FOUNDER	2025-04-22	\N	\N	\N	P0_founder	2025-09-12 23:09:14.242528+00	FSH-2025-0124	00000000-0000-0000-0000-000000000000	F-4FAE0583	96d6d48e-bd9f-49f9-b0d6-41922be83875	\N	\N	\N	\N
129	skittles 4.0 x csp FOUNDER female #1 and male #2	2025-04-22	\N	\N	\N	P0_founder	2025-09-12 23:09:14.242528+00	FSH-2025-0125	00000000-0000-0000-0000-000000000000	F-84354FB7	b572d20a-c3fc-447f-bb60-d4d135115d09	\N	\N	\N	\N
130	skittles 4.0 x csp FOUNDER male #1	2025-04-22	\N	\N	\N	P0_founder	2025-09-12 23:09:14.242528+00	FSH-2025-0126	00000000-0000-0000-0000-000000000000	F-92005912	9c9c8362-6bd6-425d-90fb-44367c5593ab	\N	\N	\N	\N
658	FSH-2025-0164	2025-09-13	test dev	\N	\N	for_imaging	2025-09-13 19:53:41.584822+00	FSH-2025-0164	d51b73e3-2c57-427c-9f9b-9c4c067f921f	FSH-2025-0164	415b34d9-c5b1-4a4d-a5c5-375d7108b66d	0080b875-dff0-458b-81aa-ac1f1414cb1e	f18359d4-a20e-42f8-b963-f5e21fde64fc	\N	\N
131	Skittles 4.1	2025-08-19	F1s of male #2 multiple alleles, good founder (?) but not super bright	\N	\N	F1_ox	2025-09-12 23:09:14.242528+00	FSH-2025-0127	00000000-0000-0000-0000-000000000000	F-DB54EDDF	ec292bcb-d050-415b-9c5f-32a9771b154e	\N	\N	\N	\N
132	skittles 4FP #1 male F2s ox csp crya+	2025-02-26	\N	\N	\N	F1_ox	2025-09-12 23:09:14.242528+00	FSH-2025-0128	00000000-0000-0000-0000-000000000000	F-C680D232	f18359d4-a20e-42f8-b963-f5e21fde64fc	\N	\N	\N	\N
133	skittles 4FP exorh x ox	2024-11-20	\N	\N	\N	potential_founders	2025-09-12 23:09:14.242528+00	FSH-2025-0129	00000000-0000-0000-0000-000000000000	F-EE557399	943d0cf1-8156-4157-9f51-62f5f9d4339c	\N	\N	\N	\N
134	skittles 4FP exorh:GFP	2025-02-25	male #7, 4 fish survived to adulthood	\N	\N	P0_founder	2025-09-12 23:09:14.242528+00	FSH-2025-0130	00000000-0000-0000-0000-000000000000	F-9D759A6B	10cea9ea-f0d0-4f26-abae-baf43aa1a653	\N	\N	\N	\N
13	Astrocytes mKate2	2024-11-26	1 tank started - screened all negative	\N	\N	potential_founders	2025-09-12 23:09:14.242528+00	FSH-2025-0009	00000000-0000-0000-0000-000000000000	F-A944A380	70c486a5-8a55-4863-8614-b10a85e3805f	\N	\N	\N	\N
22	cell cycle state sensor + histone	2024-12-05	1 tank started	\N	\N	potential_founders	2025-09-12 23:09:14.242528+00	FSH-2025-0018	00000000-0000-0000-0000-000000000000	F-B99C4C31	5598945c-d7a4-4488-8258-15745b52dd9d	\N	\N	\N	\N
38	ef1a:2xmemitdmSG 301 F1 (#2)	2024-11-12	\N	\N	\N	F1_ox	2025-09-12 23:09:14.242528+00	FSH-2025-0034	00000000-0000-0000-0000-000000000000	F-2CC8FAF1	973b8c71-ce10-4393-81ff-be556bedc77b	\N	\N	\N	\N
54	Harry	2025-03-19	F1s of male C 	\N	\N	F1_ox	2025-09-12 23:09:14.242528+00	FSH-2025-0050	00000000-0000-0000-0000-000000000000	F-47BDBD8E	08a01749-eb21-40cf-b268-632b8d810f1b	\N	\N	\N	\N
660	my favorite fish 2	2025-09-13	test dev	\N	\N	for_imaging	2025-09-13 22:25:08.546944+00	FSH-2025-0165	d51b73e3-2c57-427c-9f9b-9c4c067f921f	FSH-2025-0165	726504a8-11a2-4c67-8856-583b259e6349	0080b875-dff0-458b-81aa-ac1f1414cb1e	f18359d4-a20e-42f8-b963-f5e21fde64fc	\N	\N
55	heatshock PhiC	2025-05-27	F1s ox to mem:SG of male #1	\N	\N	F1_ox	2025-09-12 23:09:14.242528+00	FSH-2025-0051	00000000-0000-0000-0000-000000000000	F-10341858	c70902b8-b3db-4a93-af70-1c938999cf6d	\N	\N	\N	\N
57	Isaac	2024-11-20	male K ~20%+ frequency exorH:GFP (+) embryos	\N	\N	P0_founder	2025-09-12 23:09:14.242528+00	FSH-2025-0053	00000000-0000-0000-0000-000000000000	F-2DCB0638	6b91efa0-243e-44cc-9e17-c190fc8c87ab	\N	\N	\N	\N
59	Ken	2025-02-25	F1s of male #6	\N	\N	F1_ox	2025-09-12 23:09:14.242528+00	FSH-2025-0055	00000000-0000-0000-0000-000000000000	F-1CADE564	4e827676-f765-4a00-bb1b-4f0cf451dcef	\N	\N	\N	\N
62	mem:mStayGold (1x)	2024-12-06	1 tank started	\N	\N	potential_founders	2025-09-12 23:09:14.242528+00	FSH-2025-0058	00000000-0000-0000-0000-000000000000	F-3A94D0A5	82d6a070-56ae-4377-82e1-8510fc3a2862	\N	\N	\N	\N
71	Neural Crest mChilada	2024-11-05	1 tank started - screened 2 fish (both negative)	\N	\N	potential_founders	2025-09-12 23:09:14.242528+00	FSH-2025-0067	00000000-0000-0000-0000-000000000000	F-1D6876BD	00ebb07e-e4e6-4f2b-b08f-0e44a1c6999c	\N	\N	\N	\N
72	Neutrophils mChilada	2024-12-11	1 tank started - screened all negative	\N	\N	potential_founders	2025-09-12 23:09:14.242528+00	FSH-2025-0068	00000000-0000-0000-0000-000000000000	F-277463D0	57fa77f3-16de-484b-9ef7-9472b060b9d0	\N	\N	\N	\N
78	pDQM079 ef1a:2xLynxmSG piglet14a/csp	2024-12-05	\N	\N	\N	potential_founders	2025-09-12 23:09:14.242528+00	FSH-2025-0074	00000000-0000-0000-0000-000000000000	F-383C6F7F	7a05b39b-7a0b-408a-bb85-1843b96baba6	\N	\N	\N	\N
108	piglet 24b ox csp(IX) slc1a3b:mKate2 (1 or 2 alleles)	2024-12-06	\N	\N	\N	potential_founders	2025-09-12 23:09:14.242528+00	FSH-2025-0104	00000000-0000-0000-0000-000000000000	F-2BDEE687	af760189-34b6-4d76-99d0-15068e60dfdd	\N	\N	\N	\N
109	piglet 24b pDQM076 exorh:GFP hsp:DHB:tdmSG+ PT2a:tdmCh:H2B	2024-12-06	\N	\N	\N	potential_founders	2025-09-12 23:09:14.242528+00	FSH-2025-0105	00000000-0000-0000-0000-000000000000	F-519273AB	9c534062-c303-4e98-90e2-ac61ffa80ed1	\N	\N	\N	\N
110	piglet 24b pDQM079 (+)	\N	\N	\N	\N	P0_founder	2025-09-12 23:09:14.242528+00	FSH-2025-0106	00000000-0000-0000-0000-000000000000	F-5866A48B	73ec0f06-795d-4b52-bafe-5adb90f10023	\N	\N	\N	\N
165	white tape	\N	\N	\N	\N	to_kill	2025-09-12 23:09:14.242528+00	FSH-2025-0161	00000000-0000-0000-0000-000000000000	F-FC3EB218	6d2b383b-4662-411e-ab7f-2656e5b475bf	\N	\N	\N	\N
661	test fish 1	2025-09-13	\N	\N	\N	for_imaging	2025-09-13 22:48:32.847427+00	FSH-2025-0166	d51b73e3-2c57-427c-9f9b-9c4c067f921f	FSH-2025-0166	67872087-4cf3-4bdd-b49d-94ae3700d929	0080b875-dff0-458b-81aa-ac1f1414cb1e	a021684d-705b-479e-aa0e-36219483e636	\N	\N
25	crya+5FP skittles male #11 F2s	2025-02-26	\N	\N	\N	F1_ox	2025-09-12 23:09:14.242528+00	FSH-2025-0021	00000000-0000-0000-0000-000000000000	F-61C16E9C	fb0988d3-f29a-44b5-a184-c9be6524c841	\N	\N	\N	\N
135	skittles 4FP exorh+ male #6 ox csp	2025-03-19	\N	\N	\N	\N	2025-09-12 23:09:14.242528+00	FSH-2025-0131	00000000-0000-0000-0000-000000000000	F-CBCDCFCA	44249e59-d071-4dad-a796-ce5848eccad5	\N	\N	\N	\N
136	skittles 4FP male #14 x csp	2025-03-04	\N	\N	\N	\N	2025-09-12 23:09:14.242528+00	FSH-2025-0132	00000000-0000-0000-0000-000000000000	F-1E6898EA	410aa74d-6520-43b8-8b2f-fc7272ad03a0	\N	\N	\N	\N
137	Skittles 5 FP cryaa:mScarlet	2024-10-01	20-25 fish in 1 tank - 2 good founders?, phiC mRNA injection results ++	\N	\N	potential_founders	2025-09-12 23:09:14.242528+00	FSH-2025-0133	00000000-0000-0000-0000-000000000000	F-16C46BB2	0c07810f-fbed-4b48-ab85-29689d0cacb8	\N	\N	\N	\N
138	Skittles 5 FP exorH	2024-11-20	1 tank started	\N	\N	potential_founders	2025-09-12 23:09:14.242528+00	FSH-2025-0134	00000000-0000-0000-0000-000000000000	F-A8977475	461e13c6-1c7b-4a12-b396-5d71f3001855	\N	\N	\N	\N
139	Skittles 5 FP exorh:GFP	2024-11-20	female  - low frequency (1-2%) exorH:GFP (+) embryos - will start tank 311	\N	\N	P0_founder	2025-09-12 23:09:14.242528+00	FSH-2025-0135	00000000-0000-0000-0000-000000000000	F-082BA540	e594553b-b675-4974-b70d-c7ba03ccccbe	\N	\N	\N	\N
140	skittles 5-FP exorh F2 ox rnf male	2025-03-12	\N	\N	\N	\N	2025-09-12 23:09:14.242528+00	FSH-2025-0136	00000000-0000-0000-0000-000000000000	F-1B86227D	39a09196-c410-4465-b4ca-aaa14861d2b7	\N	\N	\N	\N
141	skittles 5FP crya+	2024-11-20	\N	\N	\N	potential_founders	2025-09-12 23:09:14.242528+00	FSH-2025-0137	00000000-0000-0000-0000-000000000000	F-9280A19F	bb80ca65-a2ad-4e6b-86b2-9d238beebf49	\N	\N	\N	\N
142	skittles 5FP exorh+ male K ox csp F2s	2025-03-12	\N	\N	\N	\N	2025-09-12 23:09:14.242528+00	FSH-2025-0138	00000000-0000-0000-0000-000000000000	F-E9D8A5C7	5122137c-167c-4e44-b3ae-013c1aedc650	\N	\N	\N	\N
143	skittles 5FP female #1 crya+ ox csp	2025-03-19	\N	\N	\N	\N	2025-09-12 23:09:14.242528+00	FSH-2025-0139	00000000-0000-0000-0000-000000000000	F-10EA3AE0	023093e2-b969-41f3-9eee-fa15d1ffa543	\N	\N	\N	\N
144	skittles 5FP male "C" exorh+	2025-03-19	\N	\N	\N	\N	2025-09-12 23:09:14.242528+00	FSH-2025-0140	00000000-0000-0000-0000-000000000000	F-8FFF9A66	1dc683cf-3480-4d40-914d-e7a3566a42f9	\N	\N	\N	\N
145	skittles 5FP male #5 crya x 301 female ef1a:2xlynk:tdmSG (+++)	2025-04-29	\N	\N	\N	\N	2025-09-12 23:09:14.242528+00	FSH-2025-0141	00000000-0000-0000-0000-000000000000	F-69CC93E5	f95aa2f3-a236-4107-a95c-5a724609f224	\N	\N	\N	\N
146	skittles exorh:GFP +4FP male 7 F2s ox csp	2025-02-25	\N	\N	\N	\N	2025-09-12 23:09:14.242528+00	FSH-2025-0142	00000000-0000-0000-0000-000000000000	F-993556CA	e8464076-53c1-4936-ab6e-5f1495cb315a	\N	\N	\N	\N
147	skittles exorh+5FP	2025-11-20	\N	\N	\N	potential_founders	2025-09-12 23:09:14.242528+00	FSH-2025-0143	00000000-0000-0000-0000-000000000000	F-7E781B90	4569b036-fa50-4113-800d-57173a98f970	\N	\N	\N	\N
148	skittles exorh+5FP female 1	2025-11-20	\N	\N	\N	P0_founder	2025-09-12 23:09:14.242528+00	FSH-2025-0144	00000000-0000-0000-0000-000000000000	F-D229BDED	725b19be-7467-4fc9-909a-7ee753ecc6bc	\N	\N	\N	\N
149	skittles negative	2025-10-01	\N	\N	\N	to_kill	2025-09-12 23:09:14.242528+00	FSH-2025-0145	00000000-0000-0000-0000-000000000000	F-75421B99	f7d14e69-2978-4e04-b1fc-fb23ab56f8ff	\N	\N	\N	\N
150	skittles pDQM137 isce-1	2025-05-18	\N	\N	\N	P0_founder	2025-09-12 23:09:14.242528+00	FSH-2025-0146	00000000-0000-0000-0000-000000000000	F-F7DF1CF5	9c6e27e1-f783-4cbf-b99f-509f9c2141a3	\N	\N	\N	\N
151	skittles screened negative	2025-10-01	\N	\N	\N	to_kill	2025-09-12 23:09:14.242528+00	FSH-2025-0147	00000000-0000-0000-0000-000000000000	F-86AE7380	442016ef-e01a-4a10-b3b2-93f2920f8829	\N	\N	\N	\N
152	skittles- 5FP female #24 exorh	2024-11-25	\N	\N	\N	P0_founder	2025-09-12 23:09:14.242528+00	FSH-2025-0148	00000000-0000-0000-0000-000000000000	F-49ADB080	93ef4c26-0e7d-4c64-bf45-be97f9fe02ec	\N	\N	\N	\N
153	skittles-4FP male #1	2024-09-17	\N	\N	\N	P0_founder	2025-09-12 23:09:14.242528+00	FSH-2025-0149	00000000-0000-0000-0000-000000000000	F-EE453FAB	86f54026-07bc-4f58-8a6f-e45535ce2d25	\N	\N	\N	\N
154	skittles-5FP	2025-10-24	\N	\N	\N	potential_founders	2025-09-12 23:09:14.242528+00	FSH-2025-0150	00000000-0000-0000-0000-000000000000	F-14CDF763	72124493-c799-47b4-8dd5-8de3e63fdbea	\N	\N	\N	\N
155	slc1a3:mKate2 in piglet 14a	2025-09-13	\N	\N	\N	\N	2025-09-12 23:09:14.242528+00	FSH-2025-0151	00000000-0000-0000-0000-000000000000	F-B5BEBADB	c7e0dbeb-b182-4186-9094-cd5e1d66176a	\N	\N	\N	\N
156	sox10:mCH piglet124b screened (-)	2024-10-11	\N	\N	\N	\N	2025-09-12 23:09:14.242528+00	FSH-2025-0152	00000000-0000-0000-0000-000000000000	F-AE8104C8	b7088a52-8178-4db6-bb61-35fe1ebff47b	\N	\N	\N	\N
157	sox10:mCh piglet14a	\N	\N	\N	\N	\N	2025-09-12 23:09:14.242528+00	FSH-2025-0153	00000000-0000-0000-0000-000000000000	F-2F206325	26afaecb-545d-4460-83e0-62565dc82c23	\N	\N	\N	\N
158	sox10:mChilada piglet 14a	2025-02-07	\N	\N	\N	\N	2025-09-12 23:09:14.242528+00	FSH-2025-0154	00000000-0000-0000-0000-000000000000	F-4FF9DC19	29fd672e-9102-4831-b9f6-9bad0a9daa96	\N	\N	\N	\N
159	sox10mCh (-) screened	\N	\N	\N	\N	to_kill	2025-09-12 23:09:14.242528+00	FSH-2025-0155	00000000-0000-0000-0000-000000000000	F-FC496213	d591dfc5-37e0-46ce-a4cc-77be4b781969	\N	\N	\N	\N
160	tandem mem:mStayGold	2024-08-16	male #19 - bright, low frequency transmission (<10%)	\N	\N	P0_founder	2025-09-12 23:09:14.242528+00	FSH-2025-0156	00000000-0000-0000-0000-000000000000	F-114EC8D2	665b0731-0449-432a-bdcb-49f65f1244aa	\N	\N	\N	\N
161	tandem mem:mStayGold; tdmChilada:Histone	2024-12-06	1 tank started	\N	\N	potential_founders	2025-09-12 23:09:14.242528+00	FSH-2025-0157	00000000-0000-0000-0000-000000000000	F-7A605EA0	95fd30c1-86a5-41dd-b971-cbb7b6c5b801	\N	\N	\N	\N
162	tandem mem:mStayGold; tdmChilada(MAGPV):Histone	\N	\N	\N	\N	potential_founders	2025-09-12 23:09:14.242528+00	FSH-2025-0158	00000000-0000-0000-0000-000000000000	F-E568B49F	3bdf38c6-787b-49ce-a747-068ed6b772ea	\N	\N	\N	\N
163	tdmScarlet3S2	\N	F1s of male #1??? ox casper	\N	\N	F1_ox	2025-09-12 23:09:14.242528+00	FSH-2025-0159	00000000-0000-0000-0000-000000000000	F-C2C535BB	b27803a7-b9b0-4c66-a643-b1c07ec3485d	\N	\N	\N	\N
164	tdmScarlet3S2:H2B-tol2	\N	male #1	\N	\N	P0_founder	2025-09-12 23:09:14.242528+00	FSH-2025-0160	00000000-0000-0000-0000-000000000000	F-134059F9	b36b5caf-4f16-449a-9ef0-0f700fe02487	\N	\N	\N	\N
1	Test Fry 1	2025-09-05	TEMP	\N	\N	\N	2025-09-12 16:50:49.656203+00	TESTF001	00000000-0000-0000-0000-000000000000	TESTF001	4ee2e7c4-9466-46e9-af81-5e8646c415ed	\N	\N	\N	\N
2	Test Fry 2	2025-09-10	TEMP	\N	\N	\N	2025-09-12 16:50:49.656203+00	TESTF002	00000000-0000-0000-0000-000000000000	TESTF002	23db5971-6624-4a2a-ad02-e96d98d3fb3a	\N	\N	\N	\N
\.


--
-- Data for Name: fish_mounts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.fish_mounts (id, fish_id, mount_id, created_at, created_by, fish_id_uuid, mount_id_uuid) FROM stdin;
\.


--
-- Data for Name: fish_mutations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.fish_mutations (fish_id, mutation_id, created_at, fish_id_uuid, mutation_id_uuid) FROM stdin;
\.


--
-- Data for Name: fish_parents; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.fish_parents (child_id, mom_id, dad_id, child_id_uuid, mom_id_uuid, dad_id_uuid) FROM stdin;
\.


--
-- Data for Name: fish_selectedphenotypes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.fish_selectedphenotypes (fish_id, selectedphenotype_id, created_at, created_by, fish_id_uuid, selectedphenotype_id_uuid) FROM stdin;
\.


--
-- Data for Name: fish_strains; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.fish_strains (fish_id, strain_id, created_at, fish_id_uuid, strain_id_uuid) FROM stdin;
\.


--
-- Data for Name: fish_tank_memberships; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.fish_tank_memberships (id, fish_id, tank_id, valid_from, valid_to, fish_id_uuid, tank_id_uuid, created_by) FROM stdin;
5	1	5	2025-09-12 16:53:44.172841+00	2025-09-12 16:58:37.24557+00	4ee2e7c4-9466-46e9-af81-5e8646c415ed	b2feb31c-79eb-44d8-9558-df12ae786c5b	\N
6	2	5	2025-09-12 16:53:44.296425+00	\N	23db5971-6624-4a2a-ad02-e96d98d3fb3a	b2feb31c-79eb-44d8-9558-df12ae786c5b	\N
7	1	6	2025-09-12 16:58:37.24557+00	\N	4ee2e7c4-9466-46e9-af81-5e8646c415ed	5863ecc3-2a29-4940-b111-6e1bf55315fd	\N
4	2	6	2025-09-12 16:53:44.036147+00	2025-09-12 16:53:44.296425+00	23db5971-6624-4a2a-ad02-e96d98d3fb3a	5863ecc3-2a29-4940-b111-6e1bf55315fd	\N
9	\N	\N	2025-09-13 22:48:33.093783+00	\N	67872087-4cf3-4bdd-b49d-94ae3700d929	b2feb31c-79eb-44d8-9558-df12ae786c5b	d51b73e3-2c57-427c-9f9b-9c4c067f921f
10	63	28	2025-09-14 06:22:27.127057+00	2025-09-14 06:32:24.605568+00	6271ab4c-171f-4d13-a162-7eb490287279	c0b2cb6b-53cc-43b2-8af5-4dc20dcc8bf4	\N
13	63	31	2025-09-14 06:32:25.732665+00	\N	6271ab4c-171f-4d13-a162-7eb490287279	3191cede-2816-40b1-869b-8868684fab8b	\N
\.


--
-- Data for Name: fish_transgenes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.fish_transgenes (created_at, fish_id_uuid, transgene_id_uuid, zygosity, notes) FROM stdin;
2025-09-13 16:30:09.761858+00	0fd9699e-d509-463a-9c71-d2b96d03ef3c	10bf1ff1-6319-4652-854d-ea3395062d22	\N	\N
2025-09-13 16:30:09.761858+00	0fd9699e-d509-463a-9c71-d2b96d03ef3c	6dd019eb-af90-4782-a4b2-ce4a600b5287	\N	\N
2025-09-13 19:49:38.129342+00	7c9589f6-bcd3-4035-ba1b-6f1b250dec82	10bf1ff1-6319-4652-854d-ea3395062d22	\N	\N
2025-09-13 19:49:38.129342+00	7c9589f6-bcd3-4035-ba1b-6f1b250dec82	6dd019eb-af90-4782-a4b2-ce4a600b5287	\N	\N
2025-09-13 19:53:41.641075+00	415b34d9-c5b1-4a4d-a5c5-375d7108b66d	10bf1ff1-6319-4652-854d-ea3395062d22	\N	\N
2025-09-13 19:53:41.641075+00	415b34d9-c5b1-4a4d-a5c5-375d7108b66d	6dd019eb-af90-4782-a4b2-ce4a600b5287	\N	\N
2025-09-13 22:25:08.620963+00	726504a8-11a2-4c67-8856-583b259e6349	10bf1ff1-6319-4652-854d-ea3395062d22	\N	\N
2025-09-13 22:25:08.620963+00	726504a8-11a2-4c67-8856-583b259e6349	6dd019eb-af90-4782-a4b2-ce4a600b5287	\N	\N
2025-09-13 22:48:32.922984+00	67872087-4cf3-4bdd-b49d-94ae3700d929	10bf1ff1-6319-4652-854d-ea3395062d22	\N	\N
2025-09-13 07:54:08.77005+00	f18359d4-a20e-42f8-b963-f5e21fde64fc	6dd019eb-af90-4782-a4b2-ce4a600b5287	\N	\N
2025-09-13 07:54:08.77005+00	895ccb31-3a06-40bd-b1ea-54e2940930ef	4cc58856-c13e-4869-8e75-24ac0896839e	\N	\N
2025-09-13 07:54:08.77005+00	0080b875-dff0-458b-81aa-ac1f1414cb1e	10bf1ff1-6319-4652-854d-ea3395062d22	\N	\N
2025-09-13 07:54:08.77005+00	fb0988d3-f29a-44b5-a184-c9be6524c841	054f56c0-1a0b-443e-a54a-58d0c47847ba	\N	\N
2025-09-13 07:54:08.77005+00	f4b0e45d-4006-4692-bfe6-a718a9c24f99	10bf1ff1-6319-4652-854d-ea3395062d22	\N	\N
2025-09-13 07:54:08.77005+00	a021684d-705b-479e-aa0e-36219483e636	10bf1ff1-6319-4652-854d-ea3395062d22	\N	\N
2025-09-13 07:54:08.77005+00	f5849fb4-4e74-45fd-8df7-250df757be68	054f56c0-1a0b-443e-a54a-58d0c47847ba	\N	\N
2025-09-13 07:54:08.77005+00	3aca6699-ffc4-41bd-9a9e-458574ff1314	4cc58856-c13e-4869-8e75-24ac0896839e	\N	\N
2025-09-13 07:54:08.77005+00	973b8c71-ce10-4393-81ff-be556bedc77b	4cc58856-c13e-4869-8e75-24ac0896839e	\N	\N
2025-09-13 07:54:08.77005+00	2ab106a8-fb15-4c1a-bb89-23d80cc6548e	4cc58856-c13e-4869-8e75-24ac0896839e	\N	\N
2025-09-13 07:54:08.77005+00	0280d316-4a55-4ba1-8609-6381372149b0	10bf1ff1-6319-4652-854d-ea3395062d22	\N	\N
2025-09-13 07:54:08.77005+00	3956a7b4-cd13-44da-a2b2-9bae4908e11f	a9ddc972-2df1-4624-b36d-e9719d06f525	\N	\N
\.


--
-- Data for Name: fish_transgenes_unresolved_audit; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.fish_transgenes_unresolved_audit (logged_at, fish_code, transgene_name) FROM stdin;
\.


--
-- Data for Name: fish_treatments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.fish_treatments (id, fish_id, treatment_id, applied_at, amount, units, route, notes, created_by, created_at, updated_at, dye_id, fish_id_uuid, dye_id_uuid) FROM stdin;
\.


--
-- Data for Name: fish_year_counters; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.fish_year_counters (year, last_val) FROM stdin;
2025	161
\.


--
-- Data for Name: fluors; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.fluors (id, name, excitation, emission, tag, notes, id_uuid) FROM stdin;
7	Halo; tagbfp2	\N	\N	\N	\N	f0b8a466-714d-4ef6-86cb-e990330453ca
8	gfp; tdmSG; tdmChilada	\N	\N	\N	\N	66e1fb82-c9b5-4d83-aca6-36c0f255a1f6
9	gfp; tdmSG; tdmScarlet3S2	\N	\N	\N	\N	979796d5-811b-4244-a6cc-45bf09ffef32
28	mSG; Halo; Electra; mBeRFP; mScarlet3; mTFP1	\N	\N	\N	\N	ee6f677b-6974-4b28-86e1-e2e56d5bc55b
29	mSG; Halo; Electra; mBeRFP; mScarlet3S2; mTFP1	\N	\N	\N	\N	4f608408-608d-4af9-ab8a-5fc78c45eea7
30	mSG; mYH	\N	\N	\N	\N	e466c405-e7a9-4ccc-86e9-1f7a383e135d
54	tdmSG; tdmChilada	\N	\N	\N	\N	1dd1dfbf-3056-4ba0-aec3-d62ef81e5725
55	tdmSG; tdmScarlet3S2	\N	\N	\N	\N	70a88f40-7888-4f27-856d-4f0732f84ae1
56	tdmSG; tdmYH	\N	\N	\N	\N	5f50e9bd-4585-4b86-a536-bfb2ecd0817b
17	mCitrine (iCodon)	\N	\N	\N	\N	1a6bd0b4-e489-4940-85b3-72efa52a82d6
21	mKOK (iCodon)	\N	\N	\N	\N	3c48d814-7967-4731-8c59-1e5860b19f94
23	mKate2 (iCodon)	\N	\N	\N	\N	77f068ef-47b6-4396-a164-fe40b4d24462
24	mLychee (iCodon)	\N	\N	\N	\N	92621f8c-c2f8-4d17-b6de-431f6ff78107
40	mTFP1 (iCodon)	\N	\N	\N	\N	c9d5e059-5fe2-4ea1-8eac-c7caca1e8365
44	mYongHong (iCodon)	\N	\N	\N	\N	3faf49a0-1c28-42d4-a703-f8066038d24d
11	mBaoJin	\N	\N	\N	\N	aee3a898-deae-4273-8838-b2fc440a1ff8
26	mSG(B)_iCodon	\N	\N	\N	\N	430d818b-59e5-4fa3-8a4c-ff960ca5ed45
27	mSG(J)_iCodon	\N	\N	\N	\N	7cef2fdd-6ce3-49fc-8ac9-85fa0c48854d
45	mYongHong_iCodon	\N	\N	\N	\N	6bce8fb0-0101-499f-9d9e-a1b4458b5369
34	mScarlet3(iCodon)	\N	\N	\N	\N	a9139f11-bfd2-415a-961a-4fe8daae28ee
6	Halo	\N	\N	\N	\N	99190692-4a5c-4959-b092-ea5de27e404d
14	mChilada	\N	\N	\N	\N	0a8e1967-2975-4c2e-bf99-d7f0ff55143c
25	mSG	\N	\N	\N	\N	12336a23-9ea3-4265-b9fe-1f97d63be3be
35	mScarlet3S2	\N	\N	\N	\N	836c2c91-f9e7-41b5-8cb0-ac7c661e518c
51	tdmSG	\N	\N	\N	\N	d4c367bb-1b63-483b-b37d-9cf7320e1ff0
48	tdm:mScarlet3S2	\N	\N	\N	\N	a2ec30d3-02dc-4644-97c1-65ae58a80faf
38	mStayGold(J)	\N	\N	\N	\N	7f1b592b-23eb-4633-ac3a-15b5c0ec98b5
12	mBeRFP	\N	\N	\N	\N	36ed8d7c-5381-4a58-9e99-3ca34a00b66a
37	mStayGold C-term	\N	\N	\N	\N	31a16b12-4014-4d99-ac60-6206476316f4
39	mTFP1	\N	\N	\N	\N	5f7314ff-7fb6-4f15-bc25-a20d840aca29
33	mScarlet3	\N	\N	\N	\N	7fd3b215-1914-4cf4-a388-ae48172e8cbc
58	tdmScarlet3S2	\N	\N	\N	\N	400d6025-0e1b-4fd4-bdaa-1d26144a8004
49	tdmChilada	\N	\N	\N	\N	88269590-6694-4a4c-b513-1e1248155367
31	mSG_(J)_IDT_opt	\N	\N	\N	\N	9aacd2af-44d8-42de-91d3-cf87594ae228
36	mStayGold	\N	\N	\N	\N	ce5cbd9c-c89e-4f1e-b0e7-2a5c479ee603
41	mTagBFP2	\N	\N	\N	\N	38f1e60e-92ee-4734-ba3f-8a93ce7a0f55
18	mGold2s	\N	\N	\N	\N	734ef3a6-bdad-46bf-b3c4-f8b28100bd38
15	mChilada_MAGPV	\N	\N	\N	\N	0d4be622-70e5-4038-86bd-1b9678fc9228
42	mYH	\N	\N	\N	\N	a01010f6-93fc-4746-8a3e-0849c8534522
1	??	\N	\N	\N	\N	19f5bbc4-5e3a-4afa-b1a5-0f6fa4bd61bb
52	tdmSG(J)	\N	\N	\N	\N	3a0d39d1-3cfb-4991-b796-21c4bd06de90
57	tdmSG_syntrons(J)	\N	\N	\N	\N	81f8b9e6-39e0-4064-b3b4-33cdd23113d3
53	tdmSG(introns)	\N	\N	\N	\N	e2d5b942-5c1d-4689-b0fc-22c9bb8b965e
50	tdmChilada_MAGPV	\N	\N	\N	\N	44b5169a-109e-49a9-af93-1423ca5e8bad
2	E2Crimson_(iCodon)	\N	\N	\N	\N	176212e8-95ff-415d-9a4a-1d9197b8048f
3	Electra2	\N	\N	\N	\N	204e4964-dadf-463d-a2fe-11b6a474e8bc
16	mCitrine	\N	\N	\N	\N	22a9f736-fbdb-487c-b61a-a48dd17fdb11
19	mGold2t	\N	\N	\N	\N	fe62975c-bdb0-4734-8fcc-44bac61786cb
20	mKOK	\N	\N	\N	\N	bd77b86c-998d-42ed-acc9-662f0e6e30b7
22	mKate2	\N	\N	\N	\N	6f4aa032-c1eb-4b3f-9a50-76f978acbecb
43	mYongHong	\N	\N	\N	\N	0e910b2b-508b-49a0-b219-18e207c2c940
13	mCardinal_iCodon	\N	\N	\N	\N	7e5e1662-9216-4a6d-a247-e399d4590945
47	miRFP670-2 (iCodon)	\N	\N	\N	\N	326a82ea-12eb-4874-9298-f979d92862ee
5	GFP	\N	\N	\N	\N	0508a22e-d36b-4738-90a7-b265aa30dc3c
32	mScarlet	\N	\N	\N	\N	4d2b6ca6-7548-4222-b8c6-21f5910cec5b
4	Electra2 (iCodon)	\N	\N	\N	\N	c5bc2c02-42f6-403d-8787-2451101d5cff
62	Electra	\N	\N	\N	\N	5cc99f6f-94e9-4ec1-838a-e75a820e4c7c
63	tagbfp2	\N	\N	\N	\N	ab28079c-5e31-42e9-aa98-e372d393bd5f
64	tdmYH	\N	\N	\N	\N	54446eaf-16df-47be-b958-e80c198e62f0
\.


--
-- Data for Name: mounts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.mounts (id, type, name, description, date_mounted, time_mounted, mounting_orientation, created_at, created_by, id_uuid) FROM stdin;
fdc1b655-dc2d-4e17-b8bc-f102f263b550	brucker	1	\N	\N	\N	\N	2025-09-12 22:00:28.223616+00	00000000-0000-0000-0000-000000000000	3f8aeebd-eeda-446e-9844-e2994a64eb19
b8b74618-7b4e-47bb-b710-a87977bc18bc	brucker	2	\N	\N	\N	\N	2025-09-12 22:00:28.223616+00	00000000-0000-0000-0000-000000000000	b17b698b-c142-472e-976d-ea11fc4c8e4f
\.


--
-- Data for Name: mutations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.mutations (id, name, gene, notes, created_at, created_by, id_uuid) FROM stdin;
4	cntnap2	\N	\N	2025-09-12 22:00:28.223616+00	00000000-0000-0000-0000-000000000000	ca2a6ed2-be7f-4b73-b6f7-f709c7fdfaf3
5	scn1lab(s552)	\N	\N	2025-09-12 22:00:28.223616+00	00000000-0000-0000-0000-000000000000	8d2fd769-e329-4f78-b8a7-ab2545221e78
6	stxbp1b	\N	\N	2025-09-12 22:00:28.223616+00	00000000-0000-0000-0000-000000000000	eb386b98-0687-4767-8be7-79726aeda4f9
\.


--
-- Data for Name: plasmid_dyes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.plasmid_dyes (plasmid_id, dye_id, plasmid_id_uuid, dye_id_uuid) FROM stdin;
\.


--
-- Data for Name: plasmid_fluors; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.plasmid_fluors (plasmid_id, fluor_id, plasmid_id_uuid, fluor_id_uuid) FROM stdin;
59	1	33bef132-5daf-46e1-922b-7191723dd6ca	19f5bbc4-5e3a-4afa-b1a5-0f6fa4bd61bb
67	1	d94410c7-6a71-4eb5-b46c-6993631aa183	19f5bbc4-5e3a-4afa-b1a5-0f6fa4bd61bb
74	1	d779a275-cc70-4f08-bf57-18893696ac06	19f5bbc4-5e3a-4afa-b1a5-0f6fa4bd61bb
75	1	a412d457-1eb6-4fb6-ac09-6e2531e9c8bb	19f5bbc4-5e3a-4afa-b1a5-0f6fa4bd61bb
86	1	58e5a678-0706-4486-a39e-46e947b60347	19f5bbc4-5e3a-4afa-b1a5-0f6fa4bd61bb
88	1	4558a7be-c7e0-4028-9b22-a43a8923f576	19f5bbc4-5e3a-4afa-b1a5-0f6fa4bd61bb
110	1	ede5a312-2512-49e1-84e6-707cf29b35b0	19f5bbc4-5e3a-4afa-b1a5-0f6fa4bd61bb
127	1	27f73f48-a3f0-4888-9083-cbcd5857286f	19f5bbc4-5e3a-4afa-b1a5-0f6fa4bd61bb
145	2	9b44d1c1-5f60-4a16-865d-cb00c9fd525c	176212e8-95ff-415d-9a4a-1d9197b8048f
98	3	d244cd27-ab14-44e9-a427-a442404fdf8f	204e4964-dadf-463d-a2fe-11b6a474e8bc
60	4	ca2c0ef0-80d9-42b6-955d-638908d1fa72	c5bc2c02-42f6-403d-8787-2451101d5cff
111	5	40fb10fb-b350-475b-b230-4a3c7a34fe87	0508a22e-d36b-4738-90a7-b265aa30dc3c
119	5	b2d8f24c-87af-4522-b4ca-67c90926b973	0508a22e-d36b-4738-90a7-b265aa30dc3c
113	6	b5771f6f-8b85-4802-8c4d-cb04c1dc02fd	99190692-4a5c-4959-b092-ea5de27e404d
4	6	7b7051d4-71a2-4eab-a2fe-b244f83487c4	99190692-4a5c-4959-b092-ea5de27e404d
7	6	14368017-a418-4800-99b4-345c06051242	99190692-4a5c-4959-b092-ea5de27e404d
10	6	c958096e-2d4b-43a6-ad1f-effd5ed123d0	99190692-4a5c-4959-b092-ea5de27e404d
13	6	5500118f-9a93-47b3-8839-c46c8a1d3b11	99190692-4a5c-4959-b092-ea5de27e404d
15	6	d7613934-a9a9-4c02-ab52-757d6a077b70	99190692-4a5c-4959-b092-ea5de27e404d
19	6	2d5fee97-bf2d-4218-85f8-45e2dd30df53	99190692-4a5c-4959-b092-ea5de27e404d
21	6	93375546-21ba-4db6-997b-80c04d30bb3e	99190692-4a5c-4959-b092-ea5de27e404d
23	6	ae78b1c0-b1a4-462d-b1f6-7324d57eb26d	99190692-4a5c-4959-b092-ea5de27e404d
25	6	b499c9cc-a2ee-4f81-9462-3081ea41ce44	99190692-4a5c-4959-b092-ea5de27e404d
40	6	55c52917-f064-493d-8130-3a86b303c758	99190692-4a5c-4959-b092-ea5de27e404d
41	6	b88b9d0f-5f80-4378-b26e-b9f6671f6217	99190692-4a5c-4959-b092-ea5de27e404d
43	6	4c5d6615-24c5-4c76-87dc-594962dd9619	99190692-4a5c-4959-b092-ea5de27e404d
45	6	6e383555-701a-4c5e-91fe-0bd55fad853e	99190692-4a5c-4959-b092-ea5de27e404d
46	6	f90098fb-586c-4408-88cf-12cbdcfd175c	99190692-4a5c-4959-b092-ea5de27e404d
47	6	46205e06-0f35-4b4b-8909-3e6149ddc52f	99190692-4a5c-4959-b092-ea5de27e404d
48	6	120b5881-17a9-483d-971d-d0f816302d17	99190692-4a5c-4959-b092-ea5de27e404d
52	6	96d9da72-33a2-4553-8c5d-7c15468d747d	99190692-4a5c-4959-b092-ea5de27e404d
150	7	d877468b-cc9d-48db-8177-df36da3197f9	f0b8a466-714d-4ef6-86cb-e990330453ca
84	8	02870783-031b-4186-a450-626b6900e9fc	66e1fb82-c9b5-4d83-aca6-36c0f255a1f6
85	8	76f291ca-7ba2-420d-b0dc-5e17c4c03632	66e1fb82-c9b5-4d83-aca6-36c0f255a1f6
94	8	c0b6dc0b-e18b-418b-b041-272b887a9ef9	66e1fb82-c9b5-4d83-aca6-36c0f255a1f6
143	9	8177e6a8-bcd8-4555-8a19-ec5c92904321	979796d5-811b-4244-a6cc-45bf09ffef32
71	11	f5467d38-faa7-41e5-ba54-33b0ed12080e	aee3a898-deae-4273-8838-b2fc440a1ff8
124	12	5fc88a61-86c9-4932-aa20-051edbd24ca4	36ed8d7c-5381-4a58-9e99-3ca34a00b66a
125	12	6ec81ccf-1bce-4c59-90ea-013512f4930d	36ed8d7c-5381-4a58-9e99-3ca34a00b66a
51	12	55b7f16c-0839-4a6a-bb67-3846e362c9ce	36ed8d7c-5381-4a58-9e99-3ca34a00b66a
146	13	5dd136d1-9121-4497-97b6-6d83dc8d2020	7e5e1662-9216-4a6d-a247-e399d4590945
66	14	c011d5c8-68a7-45ee-8085-f508e06080d9	0a8e1967-2975-4c2e-bf99-d7f0ff55143c
78	14	4251f2ae-2852-4dab-8395-216de940cf5a	0a8e1967-2975-4c2e-bf99-d7f0ff55143c
104	14	488c8492-5a1a-437a-9f04-ab60549e80ec	0a8e1967-2975-4c2e-bf99-d7f0ff55143c
106	14	80edb624-2e28-4545-9532-1cbf35f8014e	0a8e1967-2975-4c2e-bf99-d7f0ff55143c
3	14	41ce2ceb-c845-4e9b-af56-6f488de9652a	0a8e1967-2975-4c2e-bf99-d7f0ff55143c
6	14	470f0fbd-2e9e-4a0d-ae29-0d906cea35be	0a8e1967-2975-4c2e-bf99-d7f0ff55143c
9	14	f8a992cd-8d22-4299-bcff-7401b984c204	0a8e1967-2975-4c2e-bf99-d7f0ff55143c
12	14	46717835-247f-40b3-a46d-e807a3a2d7f6	0a8e1967-2975-4c2e-bf99-d7f0ff55143c
17	14	9985dbc7-735a-4c93-a36c-d464db8402b4	0a8e1967-2975-4c2e-bf99-d7f0ff55143c
27	14	862e3ba2-7129-4a52-aad5-22202d47c715	0a8e1967-2975-4c2e-bf99-d7f0ff55143c
163	14	9ab80949-5071-4756-801b-180dfd86c7b9	0a8e1967-2975-4c2e-bf99-d7f0ff55143c
105	15	8deee4fc-0133-49cc-83be-144fc136b5eb	0d4be622-70e5-4038-86bd-1b9678fc9228
115	15	eddcb5ba-9471-4eaf-8344-631494c66dad	0d4be622-70e5-4038-86bd-1b9678fc9228
118	15	3d9d1bff-3387-4673-82e8-553a7b205fef	0d4be622-70e5-4038-86bd-1b9678fc9228
101	16	b7e78d79-2bb1-4d7e-9d77-e1e12ec195af	22a9f736-fbdb-487c-b61a-a48dd17fdb11
79	17	b2e45429-9d64-442e-9471-891e8dceb48d	1a6bd0b4-e489-4940-85b3-72efa52a82d6
139	18	33e17c7a-8577-4ec2-a6cf-1b7a196bb552	734ef3a6-bdad-46bf-b3c4-f8b28100bd38
140	18	e713e211-2ca3-408d-b9ec-b122571b08b5	734ef3a6-bdad-46bf-b3c4-f8b28100bd38
141	18	66ab71fe-ef88-4744-a59b-53cf243746f3	734ef3a6-bdad-46bf-b3c4-f8b28100bd38
142	19	a4a4818b-26f5-4be1-be4e-c47dfda686db	fe62975c-bdb0-4734-8fcc-44bac61786cb
99	20	819e94ac-1ca7-492e-89ef-4b532186e957	bd77b86c-998d-42ed-acc9-662f0e6e30b7
61	21	980f4894-a5cd-4e89-9fc5-72cae1ff1978	3c48d814-7967-4731-8c59-1e5860b19f94
100	22	7bf4ac5e-4b94-40c4-80b8-29ca223cc306	6f4aa032-c1eb-4b3f-9a50-76f978acbecb
62	23	da4b113f-9697-4690-9016-758e7af1053a	77f068ef-47b6-4396-a164-fe40b4d24462
65	24	45fd8195-7937-49db-bc30-5847aa63b761	92621f8c-c2f8-4d17-b6de-431f6ff78107
95	25	1f1561cd-eb58-4861-9786-230a6555a060	12336a23-9ea3-4265-b9fe-1f97d63be3be
96	25	1d1d2063-2d74-4409-9eb8-599da48f0f18	12336a23-9ea3-4265-b9fe-1f97d63be3be
152	25	47c16c2a-35a1-4f5d-b7d4-3f3843688499	12336a23-9ea3-4265-b9fe-1f97d63be3be
70	26	a21489f6-aa3d-4fd1-966d-9ef54906d1f5	430d818b-59e5-4fa3-8a4c-ff960ca5ed45
69	27	77fa23c9-aaef-4d32-9653-03931d18bb91	7cef2fdd-6ce3-49fc-8ac9-85fa0c48854d
138	28	ba81872c-7bc7-4e51-95fa-26c0b8f542e1	ee6f677b-6974-4b28-86e1-e2e56d5bc55b
153	28	1ad14276-9876-4758-aa32-952a8002f487	ee6f677b-6974-4b28-86e1-e2e56d5bc55b
130	29	6ab1b6a5-078a-4185-a506-d90ae0e9e082	4f608408-608d-4af9-ab8a-5fc78c45eea7
108	30	30c1a20c-c723-44b3-b62a-6cf49dc2c8ce	e466c405-e7a9-4ccc-86e9-1f7a383e135d
109	30	1e62b32a-508d-492d-88db-734d8b89fcc6	e466c405-e7a9-4ccc-86e9-1f7a383e135d
121	30	9d79d939-3827-4f0f-843a-1d45a64511ab	e466c405-e7a9-4ccc-86e9-1f7a383e135d
151	30	81f768d1-7d78-48dc-8d55-ba47addbc3b4	e466c405-e7a9-4ccc-86e9-1f7a383e135d
56	31	08f2f5d9-1c9f-41cd-b594-801271480ed9	9aacd2af-44d8-42de-91d3-cf87594ae228
112	32	afe9e636-e560-42d5-b90e-66299ebfd489	4d2b6ca6-7548-4222-b8c6-21f5910cec5b
120	32	848a0b58-96e1-444f-8d86-751668dd5293	4d2b6ca6-7548-4222-b8c6-21f5910cec5b
80	34	480fd428-9ce1-4d48-9ca8-6e567b5636fb	a9139f11-bfd2-415a-961a-4fe8daae28ee
122	35	764ca48f-e7d2-48b8-ab69-45756d652902	836c2c91-f9e7-41b5-8cb0-ac7c661e518c
123	35	8089bf51-0a6e-4d33-9975-2d26036abc9b	836c2c91-f9e7-41b5-8cb0-ac7c661e518c
128	35	9a99db4e-733e-40aa-8754-d34db9190692	836c2c91-f9e7-41b5-8cb0-ac7c661e518c
147	35	bb954965-26e2-45a4-9807-0a26ef24ef74	836c2c91-f9e7-41b5-8cb0-ac7c661e518c
158	35	0272698b-012e-4af4-b7c8-dc847d94aa79	836c2c91-f9e7-41b5-8cb0-ac7c661e518c
36	35	48d9447b-c268-486f-ac9e-972e7d106592	836c2c91-f9e7-41b5-8cb0-ac7c661e518c
37	35	8189a86e-2891-449d-a2cc-4f7787a0e9d3	836c2c91-f9e7-41b5-8cb0-ac7c661e518c
38	35	6ce5b76e-c602-4769-8cac-3f24a6142f81	836c2c91-f9e7-41b5-8cb0-ac7c661e518c
42	35	b09bebc3-4bb9-47e2-8b59-d34132ecd912	836c2c91-f9e7-41b5-8cb0-ac7c661e518c
44	35	f6701458-4732-43cc-8547-0c8aff18a96d	836c2c91-f9e7-41b5-8cb0-ac7c661e518c
49	35	e9e5eff9-a652-44ba-930a-694b7dd098ec	836c2c91-f9e7-41b5-8cb0-ac7c661e518c
55	35	d4e8218e-fe00-4d1a-805e-5f236d31b6fa	836c2c91-f9e7-41b5-8cb0-ac7c661e518c
161	35	1c7f99d5-3db1-4200-ba00-3656e32f166e	836c2c91-f9e7-41b5-8cb0-ac7c661e518c
148	36	e3d82211-edd8-41a4-838d-4deb95ee86a1	ce5cbd9c-c89e-4f1e-b0e7-2a5c479ee603
149	36	3bf0fa9e-edaa-49ec-af17-f80a9fb1413f	ce5cbd9c-c89e-4f1e-b0e7-2a5c479ee603
2	36	02b5aaf9-5a7b-480b-bdbd-66938a5074a8	ce5cbd9c-c89e-4f1e-b0e7-2a5c479ee603
5	36	06c20a2b-72ff-4de0-9c61-a3b023bd0985	ce5cbd9c-c89e-4f1e-b0e7-2a5c479ee603
8	36	b1c9a3ef-729c-4808-9a8e-550a82efdac8	ce5cbd9c-c89e-4f1e-b0e7-2a5c479ee603
11	36	b0eb262e-822e-44fb-a4b6-198ee190690e	ce5cbd9c-c89e-4f1e-b0e7-2a5c479ee603
14	36	2f56dc9a-af5e-47c6-84df-33dcc926b362	ce5cbd9c-c89e-4f1e-b0e7-2a5c479ee603
16	36	a11d6782-fa07-480b-be62-e5ef3850c8e2	ce5cbd9c-c89e-4f1e-b0e7-2a5c479ee603
18	36	bf049315-1e2c-4aee-80eb-bfded31e5284	ce5cbd9c-c89e-4f1e-b0e7-2a5c479ee603
20	36	b82efac0-f593-45d8-ae4c-ce540269f118	ce5cbd9c-c89e-4f1e-b0e7-2a5c479ee603
22	36	aac82191-00ae-4c99-ac6e-759848034b8b	ce5cbd9c-c89e-4f1e-b0e7-2a5c479ee603
24	36	a7ce3ca0-fa73-45fc-944a-d470f2c31a38	ce5cbd9c-c89e-4f1e-b0e7-2a5c479ee603
26	36	ae559e2c-1101-439a-816b-f2cb85f3b0b6	ce5cbd9c-c89e-4f1e-b0e7-2a5c479ee603
28	36	49c17eea-fa13-4814-89f8-779538d5ef1e	ce5cbd9c-c89e-4f1e-b0e7-2a5c479ee603
29	36	b4203af3-52f6-4784-a8ff-4cb1213f72a8	ce5cbd9c-c89e-4f1e-b0e7-2a5c479ee603
30	36	84b4ed64-da82-471b-83d4-05dc12996139	ce5cbd9c-c89e-4f1e-b0e7-2a5c479ee603
31	36	6cc9139a-bfc7-4399-9d59-1429305aa37b	ce5cbd9c-c89e-4f1e-b0e7-2a5c479ee603
32	36	fe2d0d79-8970-408a-89dd-58a5d72d0087	ce5cbd9c-c89e-4f1e-b0e7-2a5c479ee603
33	36	87e745aa-56c4-48e4-92d0-a35de7cdc870	ce5cbd9c-c89e-4f1e-b0e7-2a5c479ee603
34	36	33d33bc4-a2e0-4d7a-9bd5-8c143fbdfc1b	ce5cbd9c-c89e-4f1e-b0e7-2a5c479ee603
35	36	4d227a0d-a173-4607-b3bf-e83b49f918e4	ce5cbd9c-c89e-4f1e-b0e7-2a5c479ee603
39	36	86658104-60b5-44d4-8233-593445965941	ce5cbd9c-c89e-4f1e-b0e7-2a5c479ee603
54	37	b16c69fc-acc1-4477-9bfa-6c12c5041a1e	31a16b12-4014-4d99-ac60-6206476316f4
114	38	488ab318-c380-48cd-8ab6-70a70b3f029a	7f1b592b-23eb-4633-ac3a-15b5c0ec98b5
53	38	b564e41a-091f-4c71-b48c-8ab16b5dd156	7f1b592b-23eb-4633-ac3a-15b5c0ec98b5
102	39	45bb1c8c-445c-4c9f-8bd1-65a7e578eee7	5f7314ff-7fb6-4f15-bc25-a20d840aca29
50	39	22fa4951-1580-49ce-a950-eac22b9365fa	5f7314ff-7fb6-4f15-bc25-a20d840aca29
63	40	c738a9cf-d377-41f4-819e-6f0bcbeb288f	c9d5e059-5fe2-4ea1-8eac-c7caca1e8365
116	42	f0c140a7-ca64-4751-acb8-0ad868d1ba08	a01010f6-93fc-4746-8a3e-0849c8534522
103	43	8a719f60-8aeb-4049-a62c-24e4f6c64f4b	0e910b2b-508b-49a0-b219-18e207c2c940
73	44	b7752996-5fc0-43d4-8368-4dccb98651f0	3faf49a0-1c28-42d4-a703-f8066038d24d
72	45	80d09a12-8a49-4e9c-9ba3-fef186419985	6bce8fb0-0101-499f-9d9e-a1b4458b5369
64	47	f5d71bfe-00ff-4e3d-9e20-d2f70f02a176	326a82ea-12eb-4874-9298-f979d92862ee
117	47	98f73ad9-2fa3-4349-bd40-538a073ddff0	326a82ea-12eb-4874-9298-f979d92862ee
157	48	8b230d61-b01a-4cbf-bc3a-51e6c324d192	a2ec30d3-02dc-4644-97c1-65ae58a80faf
159	48	9adc1416-15ce-4c7f-8cdd-47fd1435ec2d	a2ec30d3-02dc-4644-97c1-65ae58a80faf
164	48	c36abc45-b863-4b87-bec8-49b92b12e948	a2ec30d3-02dc-4644-97c1-65ae58a80faf
162	48	8e0dad2d-9f5e-432d-8a46-fa54938e3b32	a2ec30d3-02dc-4644-97c1-65ae58a80faf
77	49	0bdb6791-f35d-4f70-a0b0-61d503b63f6c	88269590-6694-4a4c-b513-1e1248155367
82	49	c9e7e2ff-0ff0-4324-b42d-7adddeae116d	88269590-6694-4a4c-b513-1e1248155367
97	49	03056555-ad65-4664-8dcb-699ccce2b11d	88269590-6694-4a4c-b513-1e1248155367
107	50	1846215d-4c16-4a87-abbf-cb0e46394355	44b5169a-109e-49a9-af93-1423ca5e8bad
91	51	a11bfcc4-4d59-46fd-83dc-4ad5842d348d	d4c367bb-1b63-483b-b37d-9cf7320e1ff0
131	51	dae53867-1310-4a8e-9a3e-94bbc266b4ae	d4c367bb-1b63-483b-b37d-9cf7320e1ff0
132	51	b71e59ac-dc62-4cd9-94a2-c6c203b840c9	d4c367bb-1b63-483b-b37d-9cf7320e1ff0
156	51	95e3d1d8-2850-467f-8a89-d1ea283df981	d4c367bb-1b63-483b-b37d-9cf7320e1ff0
160	51	2fc72379-5c0b-4c73-b6b7-697a71af2eb8	d4c367bb-1b63-483b-b37d-9cf7320e1ff0
57	52	e9a2053b-b8ec-4d7f-85fa-eae4812c2582	3a0d39d1-3cfb-4991-b796-21c4bd06de90
92	53	6f96938a-98e2-4ad9-b428-1642f432dd1b	e2d5b942-5c1d-4689-b0fc-22c9bb8b965e
68	54	8b50ff59-f048-40c6-bcaf-eb493158bb69	1dd1dfbf-3056-4ba0-aec3-d62ef81e5725
76	54	38edec6b-6bb9-41a2-a094-773607d037fa	1dd1dfbf-3056-4ba0-aec3-d62ef81e5725
81	54	23912836-3627-4683-bc34-4cb296e150ac	1dd1dfbf-3056-4ba0-aec3-d62ef81e5725
83	54	4d22e510-17d5-4f2c-8eaa-7472bed67e6c	1dd1dfbf-3056-4ba0-aec3-d62ef81e5725
87	54	2be3e21a-f818-48de-972f-cd14dd2aa9ad	1dd1dfbf-3056-4ba0-aec3-d62ef81e5725
89	54	392efab2-1852-48ca-87ba-0b24953c6d54	1dd1dfbf-3056-4ba0-aec3-d62ef81e5725
93	54	fbec68d7-56d9-48c9-8fcd-7a52eea2452d	1dd1dfbf-3056-4ba0-aec3-d62ef81e5725
129	55	11900e3c-07f9-4ec7-9e7d-f0037e4f29bc	70a88f40-7888-4f27-856d-4f0732f84ae1
134	55	9219c2df-2ae3-4984-baf6-5f616d0087e1	70a88f40-7888-4f27-856d-4f0732f84ae1
136	55	3571d532-ca7a-44d4-80c2-15b97f9aa87f	70a88f40-7888-4f27-856d-4f0732f84ae1
154	55	6250fba6-3e6a-4785-b7f9-3cfd60768611	70a88f40-7888-4f27-856d-4f0732f84ae1
90	56	bde4596a-89de-47ff-a219-bde080388e80	5f50e9bd-4585-4b86-a536-bfb2ecd0817b
58	57	4211baeb-07e8-40cc-a08e-4b0dffed17da	81f8b9e6-39e0-4064-b3b4-33cdd23113d3
126	58	4a22b996-557e-4939-aeb8-da2250dc267a	400d6025-0e1b-4fd4-bdaa-1d26144a8004
135	58	3e1fd2e3-30c0-4e05-a28c-4017792cd2f2	400d6025-0e1b-4fd4-bdaa-1d26144a8004
137	58	9a22a344-4e21-4fcc-bd04-3ed9df9f3068	400d6025-0e1b-4fd4-bdaa-1d26144a8004
155	58	fbd5ee7c-9b9f-48dc-9269-9c668fc17c7d	400d6025-0e1b-4fd4-bdaa-1d26144a8004
\.


--
-- Data for Name: plasmids; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.plasmids (id, name, description, created_at, nickname, marker, resistance, notes, created_by, id_uuid) FROM stdin;
122	pDQM115	SP6:2xLynk:mScarlet3S2	2025-09-12 04:33:36.836566+00	\N	\N	\N	Clone 1	84c9b40f-0450-4311-af2b-220cebfb4c19	764ca48f-e7d2-48b8-ab69-45756d652902
224	pDQM002	CMV-SP6-mSG(J) IDT opt	2025-09-12 22:00:28.223616+00	\N	\N	\N	IDT optimized, for mRNA production with SP6 - clone 5	00000000-0000-0000-0000-000000000000	4dfdbae4-39c3-4ec3-b435-48f33c82c957
225	pDQM007	ef1a-tdmSG-syntrons(J)	2025-09-12 22:00:28.223616+00	\N	\N	\N	each mStayGold contains a 51bp syntron to boost expression - clone 3	00000000-0000-0000-0000-000000000000	d64a00c2-596b-4149-8973-942b1d968823
226	pDQM008	ef1a-tdmSG-syntrons(J)	2025-09-12 22:00:28.223616+00	\N	\N	\N	each mStayGold contains a 51bp syntron to boost expression - clone 8	00000000-0000-0000-0000-000000000000	8a10b634-8cc1-451f-9e59-d36491dad17a
227	pDQM010	skittles2.0-4FP	2025-09-12 22:00:28.223616+00	\N	\N	\N	iCodon optimized - contains cryaa:mScarlet-AttP-mKate2-Electra2-mKOK-mTFP1 (missing mCitrine) - clone SK4	00000000-0000-0000-0000-000000000000	e5182491-b55a-4871-b41b-f2f98f981ff9
228	pDQM012	pCM268_ccdB-Electra2	2025-09-12 22:00:28.223616+00	\N	\N	\N	Clone 2 - pIGLET backbone in NEB Turbo cells (for ccdB survival)	00000000-0000-0000-0000-000000000000	cf6c1acd-e5a3-4c36-b94b-d95fa2386b7e
229	pDQM015	pCM268_ccdB-mKate2	2025-09-12 22:00:28.223616+00	\N	\N	\N	Clone 2 - pIGLET backbone in NEB Turbo cells (for ccdB survival)	00000000-0000-0000-0000-000000000000	ad50b6b8-4ac5-492d-b919-189d0a723f1a
230	pDQM017	pCM268_ccdB-mTFP1	2025-09-12 22:00:28.223616+00	\N	\N	\N	Clone 2 - pIGLET backbone in NEB Turbo cells (for ccdB survival)	00000000-0000-0000-0000-000000000000	a589cb5d-ce24-4202-a6c6-0e95813504d7
231	pDQM019	pCM268_ccdB-miRFP670-2	2025-09-12 22:00:28.223616+00	\N	\N	\N	Clone 2 - pIGLET backbone in NEB Turbo cells (for ccdB survival)	00000000-0000-0000-0000-000000000000	90814e67-dd38-405a-8215-aa599f4cebf6
232	pDQM021	pCM268_ccdB-mLychee	2025-09-12 22:00:28.223616+00	\N	\N	\N	Clone 2 - pIGLET backbone in NEB Turbo cells (for ccdB survival)	00000000-0000-0000-0000-000000000000	7997105d-23db-4174-bfd1-e813a8d8ded8
233	pDQM023	pCM268_ccdB-mChilada	2025-09-12 22:00:28.223616+00	\N	\N	\N	Clone 2 - pIGLET backbone in NEB Turbo cells (for ccdB survival)	00000000-0000-0000-0000-000000000000	62406614-e20c-40de-8f31-3fe1b1599787
234	pDQM025	skittles2.0-5FP-mutation	2025-09-12 22:00:28.223616+00	\N	\N	\N	single deletion (frame shift) in mTFP1	00000000-0000-0000-0000-000000000000	bbff70d8-ad1a-40ab-bc97-dd60ddcdc294
235	pDQM031	pTwist-SP6-2xLynk:mYongHong-iCodon	2025-09-12 22:00:28.223616+00	\N	\N	\N	for mRNA - clone 2	00000000-0000-0000-0000-000000000000	48563cff-fde4-4c77-84b3-a0911886f2f0
236	pDQM033	pCM268_ccdB-mYongHong	2025-09-12 22:00:28.223616+00	\N	\N	\N	Clone 2 - pIGLET backbone in NEB Turbo cells (for ccdB survival)	00000000-0000-0000-0000-000000000000	831cca25-93d8-4fa7-b6d3-8d67fcd68912
237	pDQM035	skittles2.0-5FP	2025-09-12 22:00:28.223616+00	\N	\N	\N	5 FP version of skittles - clone 4	00000000-0000-0000-0000-000000000000	f6799c1d-fc58-429e-99bd-abdcd87f71d7
238	pDQM038	ef1a:dhb-tdmSG-tPT2A-tdmChilada-pcna (pCM268)	2025-09-12 22:00:28.223616+00	\N	\N	\N	ef1a driven cdk/pcna cell cycle sensor clone 2 (pIGLET)	00000000-0000-0000-0000-000000000000	a23e5d94-31aa-489b-8909-bfe5f528c140
239	pDQM040	hsp:dhb-tdmSG-tPT2A-tdmChilada-pcna (pCM268)	2025-09-12 22:00:28.223616+00	\N	\N	\N	hsp driven cdk/pcna cell cycle sensor clone 3 (pIGLET)	00000000-0000-0000-0000-000000000000	817a24c2-709c-47a8-a2a0-5ff5a85d06af
240	pDQM042	sox10:mChilada (pCM268)	2025-09-12 22:00:28.223616+00	\N	\N	\N	sox10p-driven mChilada (pIGLET) clone 2	00000000-0000-0000-0000-000000000000	a0b2bce2-b401-4f7c-9b3d-e0a03f8129f9
241	pDQM044	pCM268_ccdB-mCitrine	2025-09-12 22:00:28.223616+00	\N	\N	\N	Clone 2 - pIGLET backbone in NEB Turbo cells (for ccdB survival)	00000000-0000-0000-0000-000000000000	b388f37a-23e4-437c-9641-e729b17d0c4e
242	pDQM046	pTwist-SP6:2xLynk:mScarlet3	2025-09-12 22:00:28.223616+00	\N	\N	\N	\N	00000000-0000-0000-0000-000000000000	f1dc3dd0-4208-4854-8e41-7711d4c4c99f
243	pDQM047	pTwist-SP6-2xLynk:mSG(J)-iCodon	2025-09-12 22:00:28.223616+00	\N	\N	\N	Clone 1	00000000-0000-0000-0000-000000000000	16cb842d-771d-43b2-b1b2-401d1b934110
244	pDQM048	pTwist-SP6-2xLynk:mSG(J)-iCodon	2025-09-12 22:00:28.223616+00	\N	\N	\N	Clone 2	00000000-0000-0000-0000-000000000000	8bbd5cf0-9f9e-4a2c-9c21-1864314211b6
245	pDQM049	pTwist-SP6-2xLynk:mSG(B)-iCodon	2025-09-12 22:00:28.223616+00	\N	\N	\N	Clone 1	00000000-0000-0000-0000-000000000000	fd67d6a8-fbcd-48b0-8139-636728ef1a37
246	pDQM050	pTwist-SP6-2xLynk:mSG(B)-iCodon	2025-09-12 22:00:28.223616+00	\N	\N	\N	Clone 2	00000000-0000-0000-0000-000000000000	97e4a640-7829-45c7-99ac-d7990c562dc9
247	pDQM052	ef1a:dhb-tdmSG-tPT2A-tdmChilada-h2b (pCM268)	2025-09-12 22:00:28.223616+00	\N	\N	\N	Clone 2 - pIGLET	00000000-0000-0000-0000-000000000000	2d6599ae-6a64-4718-8df2-7a4c6d6d057c
248	pDQM054	hsp:dhb-tdmSG-tPT2A-tdmChilada-h2b (pCM268)	2025-09-12 22:00:28.223616+00	\N	\N	\N	Clone 3 - pIGLET	00000000-0000-0000-0000-000000000000	b29992d2-3dd9-4809-99cb-c1ab4625fddb
249	pDQM056	AAV-dhb-tdmSG-tPT2A-tdmChilada-pcna	2025-09-12 22:00:28.223616+00	\N	\N	\N	Clone 4 (truncated SV40)	00000000-0000-0000-0000-000000000000	04bf396f-31fb-41ca-9061-f8986b305635
250	pDQM061	AAV-dhb-tdmSG-tPT2A-tdmChilada-pcna	2025-09-12 22:00:28.223616+00	\N	\N	\N	Clone 2	00000000-0000-0000-0000-000000000000	1b5d06f9-47bc-4ac8-b667-d00dddc6a859
251	pDQM062	AAV-dhb-tdmSG-tPT2A-tdmChilada-pcna	2025-09-12 22:00:28.223616+00	\N	\N	\N	Clone 3	00000000-0000-0000-0000-000000000000	78a81210-b788-42cf-8f7e-682016c4e343
252	pDQM064	exorh skittles 2.0 5FP	2025-09-12 22:00:28.223616+00	\N	\N	\N	clone 5, iCodon optimized - contains exorH:GFP-AttP-mKate2-Electra2-mCitrine-mKOK-mTFP1	00000000-0000-0000-0000-000000000000	1a39296e-6053-4820-aff9-4dfc7daabdd5
253	pDQM066	tol2-ef1a:2xLynk-tdmSG-tPT2A-tdmChilada-h2b	2025-09-12 22:00:28.223616+00	\N	\N	\N	clone 2	00000000-0000-0000-0000-000000000000	8834af1e-a995-4c20-86d7-e038d410be0f
254	pDQM069	ef1a:2xLynk-tdmSG	2025-09-12 22:00:28.223616+00	\N	\N	\N	Clone 2	00000000-0000-0000-0000-000000000000	2a7d2eec-a346-475d-b64d-4e48df71f8a8
63	pDQM016	pCM268_ccdB-mTFP1	2025-09-12 04:33:36.836566+00	\N	\N	\N	Clone 1 - pIGLET backbone in NEB Turbo cells (for ccdB survival)	84c9b40f-0450-4311-af2b-220cebfb4c19	c738a9cf-d377-41f4-819e-6f0bcbeb288f
64	pDQM018	pCM268_ccdB-miRFP670-2	2025-09-12 04:33:36.836566+00	\N	\N	\N	Clone 1 - pIGLET backbone in NEB Turbo cells (for ccdB survival)	84c9b40f-0450-4311-af2b-220cebfb4c19	f5d71bfe-00ff-4e3d-9e20-d2f70f02a176
65	pDQM020	pCM268_ccdB-mLychee	2025-09-12 04:33:36.836566+00	\N	\N	\N	Clone 1 - pIGLET backbone in NEB Turbo cells (for ccdB survival)	84c9b40f-0450-4311-af2b-220cebfb4c19	45fd8195-7937-49db-bc30-5847aa63b761
66	pDQM022	pCM268_ccdB-mChilada	2025-09-12 04:33:36.836566+00	\N	\N	\N	Clone 1 - pIGLET backbone in NEB Turbo cells (for ccdB survival)	84c9b40f-0450-4311-af2b-220cebfb4c19	c011d5c8-68a7-45ee-8085-f508e06080d9
67	pDQM024	skittles2.0-5FP-mutation	2025-09-12 04:33:36.836566+00	\N	\N	\N	single base change (frame shift) in mKate2	84c9b40f-0450-4311-af2b-220cebfb4c19	d94410c7-6a71-4eb5-b46c-6993631aa183
68	pDQM026	pCM268_ccdB-dhb-tdmSG-tPT2A-tdmChilada-pcna	2025-09-12 04:33:36.836566+00	\N	\N	\N	promoterless 	84c9b40f-0450-4311-af2b-220cebfb4c19	8b50ff59-f048-40c6-bcaf-eb493158bb69
69	pDQM027	pTwist-SP6-2xLynk:mSG(J)-iCodon	2025-09-12 04:33:36.836566+00	\N	\N	\N	for mRNA	84c9b40f-0450-4311-af2b-220cebfb4c19	77fa23c9-aaef-4d32-9653-03931d18bb91
70	pDQM028	pTwist-SP6-2xLynk:mSG(B)-iCodon	2025-09-12 04:33:36.836566+00	\N	\N	\N	for mRNA	84c9b40f-0450-4311-af2b-220cebfb4c19	a21489f6-aa3d-4fd1-966d-9ef54906d1f5
71	pDQM029	pTwist-SP6-2xLynk:mBaoJin-iCodon	2025-09-12 04:33:36.836566+00	\N	\N	\N	for mRNA	84c9b40f-0450-4311-af2b-220cebfb4c19	f5467d38-faa7-41e5-ba54-33b0ed12080e
72	pDQM030	pTwist-SP6-2xLynk:mYongHong-iCodon	2025-09-12 04:33:36.836566+00	\N	\N	\N	for mRNA - clone 1	84c9b40f-0450-4311-af2b-220cebfb4c19	80d09a12-8a49-4e9c-9ba3-fef186419985
73	pDQM032	pCM268_ccdB-mYongHong	2025-09-12 04:33:36.836566+00	\N	\N	\N	Clone 1 - pIGLET backbone in NEB Turbo cells (for ccdB survival)	84c9b40f-0450-4311-af2b-220cebfb4c19	b7752996-5fc0-43d4-8368-4dccb98651f0
74	pDQM034	skittles2.0-5FP	2025-09-12 04:33:36.836566+00	\N	\N	\N	5 FP version of skittles - clone 1	84c9b40f-0450-4311-af2b-220cebfb4c19	d779a275-cc70-4f08-bf57-18893696ac06
75	pDQM036	skittles3.0-4FP	2025-09-12 04:33:36.836566+00	\N	\N	\N	4 FP version of skittles with SEC hsp-phiC (cryaa:mSc) - clone 3	84c9b40f-0450-4311-af2b-220cebfb4c19	a412d457-1eb6-4fb6-ac09-6e2531e9c8bb
76	pDQM037	ef1a:dhb-tdmSG-tPT2A-tdmChilada-pcna (pCM268)	2025-09-12 04:33:36.836566+00	\N	\N	\N	ef1a driven cdk/pcna cell cycle sensor clone 1 (pIGLET)	84c9b40f-0450-4311-af2b-220cebfb4c19	38edec6b-6bb9-41a2-a094-773607d037fa
113	pDQM101	ef1a:linker:Halo:linker-attB	2025-09-12 04:33:36.836566+00	\N	\N	\N	Clone 1	84c9b40f-0450-4311-af2b-220cebfb4c19	b5771f6f-8b85-4802-8c4d-cb04c1dc02fd
77	pDQM039	hsp:dhb-tdmSG-tPT2A-tdmChilada-pcna (pCM268)	2025-09-12 04:33:36.836566+00	\N	\N	\N	hsp driven cdk/pcna cell cycle sensor clone 2 (pIGLET)	84c9b40f-0450-4311-af2b-220cebfb4c19	0bdb6791-f35d-4f70-a0b0-61d503b63f6c
78	pDQM041	sox10:mChilada (pCM268)	2025-09-12 04:33:36.836566+00	\N	\N	\N	sox10p-driven mChilada (pIGLET) clone 1	84c9b40f-0450-4311-af2b-220cebfb4c19	4251f2ae-2852-4dab-8395-216de940cf5a
255	pDQM071	ef1a:2xLynk-tdmSG(introns)	2025-09-12 22:00:28.223616+00	\N	\N	\N	Clone 4	00000000-0000-0000-0000-000000000000	36fd84a4-cf21-487b-9d23-c85c1a28f356
256	pDQM073	ef1a:2xLynk-tdmSG-tPT2A-tdmChilada-h2b	2025-09-12 22:00:28.223616+00	\N	\N	\N	Clone 4	00000000-0000-0000-0000-000000000000	c53899c8-1c4c-4bd1-8220-97dff2b70cbc
257	pDQM074	ef1a:2xLynk-tdmSG(introns)	2025-09-12 22:00:28.223616+00	\N	\N	\N	Clone 1	00000000-0000-0000-0000-000000000000	570a29bd-0362-4299-97e7-c781c52054c2
258	pDQM075	ef1a:2xLynk-tdmSG(introns)	2025-09-12 22:00:28.223616+00	\N	\N	\N	Clone 3	00000000-0000-0000-0000-000000000000	7feeaf05-7c78-4605-a889-e88edc2f6a0a
259	pDQM077	exorh:gfp-hsp:dhb-tdmSG-tPT2A-tdmChilada-h2b (pRL093)	2025-09-12 22:00:28.223616+00	\N	\N	\N	Clone 3	00000000-0000-0000-0000-000000000000	36bcc9bb-e22b-419f-bb1a-ba76d087c887
260	pDQM078	ef1a:2xLynk-tdmSG	2025-09-12 22:00:28.223616+00	\N	\N	\N	Clone 5	00000000-0000-0000-0000-000000000000	3fe5fb5a-d0ff-4906-8eb1-29297f4af037
261	pDQM080	ef1a:2xLynk-mSG	2025-09-12 22:00:28.223616+00	\N	\N	\N	Clone 2	00000000-0000-0000-0000-000000000000	4326d304-7367-476b-b0ad-838ded3efdfe
262	pDQM091	ef1a:linker:mChilada-MAGPV:linker-attB	2025-09-12 22:00:28.223616+00	\N	\N	\N	Clone 2	00000000-0000-0000-0000-000000000000	404c15fc-8ba9-4023-a477-45d4aee75c8f
79	pDQM043	pCM268_ccdB-mCitrine	2025-09-12 04:33:36.836566+00	\N	\N	\N	Clone 1 - pIGLET backbone in NEB Turbo cells (for ccdB survival)	84c9b40f-0450-4311-af2b-220cebfb4c19	b2e45429-9d64-442e-9471-891e8dceb48d
263	pDQM093	SP6:2xLynk:mChialda-MAGPV	2025-09-12 22:00:28.223616+00	\N	\N	\N	Clone 2	00000000-0000-0000-0000-000000000000	ba81bc7c-8d0e-4336-9935-bdb81c1d806f
264	pDQM099	exorH:GFP; hsp:phiC(iC)	2025-09-12 22:00:28.223616+00	\N	\N	\N	new phiC cloned into Erin's plasmid	00000000-0000-0000-0000-000000000000	93a3f3b0-2a23-4676-832c-0922c2ccebd8
81	pDQM051	ef1a:dhb-tdmSG-tPT2A-tdmChilada-h2b (pCM268)	2025-09-12 04:33:36.836566+00	\N	\N	\N	Clone 1 - pIGLET	84c9b40f-0450-4311-af2b-220cebfb4c19	23912836-3627-4683-bc34-4cb296e150ac
82	pDQM053	hsp:dhb-tdmSG-tPT2A-tdmChilada-h2b (pCM268)	2025-09-12 04:33:36.836566+00	\N	\N	\N	Clone 2 - pIGLET	84c9b40f-0450-4311-af2b-220cebfb4c19	c9e7e2ff-0ff0-4324-b42d-7adddeae116d
83	pDQM055	AAV-dhb-tdmSG-tPT2A-tdmChilada-pcna	2025-09-12 04:33:36.836566+00	\N	\N	\N	Clone 3 (truncated SV40)	84c9b40f-0450-4311-af2b-220cebfb4c19	4d22e510-17d5-4f2c-8eaa-7472bed67e6c
84	pDQM057	exorh:gfp-hsp:dhb-tdmSG-tPT2A-tdmChilada-pcna (pCM268)	2025-09-12 04:33:36.836566+00	\N	\N	\N	Clone 4  	84c9b40f-0450-4311-af2b-220cebfb4c19	02870783-031b-4186-a450-626b6900e9fc
85	pDQM058	exorh:gfp-hsp:dhb-tdmSG-tPT2A-tdmChilada-h2b (pCM268)	2025-09-12 04:33:36.836566+00	\N	\N	\N	Clone 1	84c9b40f-0450-4311-af2b-220cebfb4c19	76f291ca-7ba2-420d-b0dc-5e17c4c03632
86	pDQM059	skittles3.1-4FP (exorh:GFP)	2025-09-12 04:33:36.836566+00	\N	\N	\N	Clone 3	84c9b40f-0450-4311-af2b-220cebfb4c19	58e5a678-0706-4486-a39e-46e947b60347
87	pDQM060	ef1a:2xLynk-tdmSG-tPT2A-tdmChilada-h2b (pCM268)	2025-09-12 04:33:36.836566+00	\N	\N	\N	Clone 3	84c9b40f-0450-4311-af2b-220cebfb4c19	2be3e21a-f818-48de-972f-cd14dd2aa9ad
88	pDQM063	exorh skittles 2.0 5FP	2025-09-12 04:33:36.836566+00	\N	\N	\N	clone 1,iCodon optimized - contains exorH:GFP-AttP-mKate2-Electra2-mCitrine-mKOK-mTFP1	84c9b40f-0450-4311-af2b-220cebfb4c19	4558a7be-c7e0-4028-9b22-a43a8923f576
89	pDQM065	tol2-ef1a:2xLynk-tdmSG-tPT2A-tdmChilada-h2b	2025-09-12 04:33:36.836566+00	\N	\N	\N	clone 1	84c9b40f-0450-4311-af2b-220cebfb4c19	392efab2-1852-48ca-87ba-0b24953c6d54
90	pDQM067	ef1a:2xLynk-tdmSG-tPT2A-tdmYH-h2b (pCM268)	2025-09-12 04:33:36.836566+00	\N	\N	\N	clone 1	84c9b40f-0450-4311-af2b-220cebfb4c19	bde4596a-89de-47ff-a219-bde080388e80
91	pDQM068	ef1a:2xLynk-tdmSG	2025-09-12 04:33:36.836566+00	\N	\N	\N	Clone 1	84c9b40f-0450-4311-af2b-220cebfb4c19	a11bfcc4-4d59-46fd-83dc-4ad5842d348d
92	pDQM070	ef1a:2xLynk-tdmSG(introns)	2025-09-12 04:33:36.836566+00	\N	\N	\N	Clone 2	84c9b40f-0450-4311-af2b-220cebfb4c19	6f96938a-98e2-4ad9-b428-1642f432dd1b
93	pDQM072	ef1a:2xLynk-tdmSG-tPT2A-tdmChilada-h2b	2025-09-12 04:33:36.836566+00	\N	\N	\N	Clone 2	84c9b40f-0450-4311-af2b-220cebfb4c19	fbec68d7-56d9-48c9-8fcd-7a52eea2452d
94	pDQM076	exorh:gfp-hsp:dhb-tdmSG-tPT2A-tdmChilada-h2b (pRL093)	2025-09-12 04:33:36.836566+00	\N	\N	\N	Clone 1	84c9b40f-0450-4311-af2b-220cebfb4c19	c0b6dc0b-e18b-418b-b041-272b887a9ef9
95	pDQM079	ef1a:2xLynk-mSG	2025-09-12 04:33:36.836566+00	\N	\N	\N	Clone 1	84c9b40f-0450-4311-af2b-220cebfb4c19	1f1561cd-eb58-4861-9786-230a6555a060
96	pDQM081	ef1a:2xLynk:mSG-tPT2A:mChilada	2025-09-12 04:33:36.836566+00	\N	\N	\N	Clone 4	84c9b40f-0450-4311-af2b-220cebfb4c19	1d1d2063-2d74-4409-9eb8-599da48f0f18
97	pDQM082	ef1a:2xLynk:tdmChilada	2025-09-12 04:33:36.836566+00	\N	\N	\N	Clone 4	84c9b40f-0450-4311-af2b-220cebfb4c19	03056555-ad65-4664-8dcb-699ccce2b11d
98	pDQM083	ef1a:linker:Electra2:linker-attB	2025-09-12 04:33:36.836566+00	\N	\N	\N	Clone 12-1	84c9b40f-0450-4311-af2b-220cebfb4c19	d244cd27-ab14-44e9-a427-a442404fdf8f
99	pDQM084	ef1a:linker:mKOK:linker-attB	2025-09-12 04:33:36.836566+00	\N	\N	\N	Clone 13-2	84c9b40f-0450-4311-af2b-220cebfb4c19	819e94ac-1ca7-492e-89ef-4b532186e957
100	pDQM085	ef1a:linker:mKate2:linker-attB	2025-09-12 04:33:36.836566+00	\N	\N	\N	Clone 14-2	84c9b40f-0450-4311-af2b-220cebfb4c19	7bf4ac5e-4b94-40c4-80b8-29ca223cc306
101	pDQM086	ef1a:linker:mCitrine:linker-attB	2025-09-12 04:33:36.836566+00	\N	\N	\N	Clone 43-1	84c9b40f-0450-4311-af2b-220cebfb4c19	b7e78d79-2bb1-4d7e-9d77-e1e12ec195af
102	pDQM087	ef1a:linker:mTFP1:linker-attB	2025-09-12 04:33:36.836566+00	\N	\N	\N	Clone 16-1	84c9b40f-0450-4311-af2b-220cebfb4c19	45bb1c8c-445c-4c9f-8bd1-65a7e578eee7
103	pDQM088	ef1a:linker:mYongHong:linker-attB	2025-09-12 04:33:36.836566+00	\N	\N	\N	Clone 32-1	84c9b40f-0450-4311-af2b-220cebfb4c19	8a719f60-8aeb-4049-a62c-24e4f6c64f4b
104	pDQM089	ef1a:linker:mChilada:linker-attB	2025-09-12 04:33:36.836566+00	\N	\N	\N	Clone 23-3	84c9b40f-0450-4311-af2b-220cebfb4c19	488c8492-5a1a-437a-9f04-ab60549e80ec
105	pDQM090	ef1a:linker:mChilada-MAGPV:linker-attB	2025-09-12 04:33:36.836566+00	\N	\N	\N	Clone 1	84c9b40f-0450-4311-af2b-220cebfb4c19	8deee4fc-0133-49cc-83be-144fc136b5eb
106	pDQM092	SP6:2xLynk:mChialda-MAGPV	2025-09-12 04:33:36.836566+00	\N	\N	\N	Clone 1	84c9b40f-0450-4311-af2b-220cebfb4c19	80edb624-2e28-4545-9532-1cbf35f8014e
107	pDQM094	ef1a:2xLynk:tdmSG:tPT2A:tdmChilada-MAGPV:H2B	2025-09-12 04:33:36.836566+00	\N	\N	\N	Clone 1	84c9b40f-0450-4311-af2b-220cebfb4c19	1846215d-4c16-4a87-abbf-cb0e46394355
108	pDQM095	ef1a:mSG:CDT1-tPT2A-mYH:GMN (iCodon) [FUCCI]	2025-09-12 04:33:36.836566+00	\N	\N	\N	Clone 2	84c9b40f-0450-4311-af2b-220cebfb4c19	30c1a20c-c723-44b3-b62a-6cf49dc2c8ce
109	pDQM096	ef1a:mSG:CDT1-tPT2A-mYH:GMN (endogenous) [FUCCI]	2025-09-12 04:33:36.836566+00	\N	\N	\N	Clone 2	84c9b40f-0450-4311-af2b-220cebfb4c19	1e62b32a-508d-492d-88db-734d8b89fcc6
110	pDQM097	cryaa skittles 3.1 5FP (new phiC (full length))	2025-09-12 04:33:36.836566+00	\N	\N	\N	Clone 2	84c9b40f-0450-4311-af2b-220cebfb4c19	ede5a312-2512-49e1-84e6-707cf29b35b0
111	pDQM098	exorH:GFP; hsp:phiC(iC)	2025-09-12 04:33:36.836566+00	\N	\N	\N	new phiC cloned into Erin's plasmid	84c9b40f-0450-4311-af2b-220cebfb4c19	40fb10fb-b350-475b-b230-4a3c7a34fe87
112	pDQM100	exorH:mScarlet; hsp:phiC(iC)	2025-09-12 04:33:36.836566+00	\N	\N	\N	new phiC cloned into Erin's plasmid	84c9b40f-0450-4311-af2b-220cebfb4c19	afe9e636-e560-42d5-b90e-66299ebfd489
114	pDQM102	efa1:linker:mStayGold(J):linker-attB	2025-09-12 04:33:36.836566+00	\N	\N	\N	Clone 1	84c9b40f-0450-4311-af2b-220cebfb4c19	488ab318-c380-48cd-8ab6-70a70b3f029a
115	pDQM104	SP6:mChialda-MAGPV-h2b	2025-09-12 04:33:36.836566+00	\N	\N	\N	Clone 1	84c9b40f-0450-4311-af2b-220cebfb4c19	eddcb5ba-9471-4eaf-8344-631494c66dad
116	pDQM105	SP6:mYH:h2b	2025-09-12 04:33:36.836566+00	\N	\N	\N	Clone 4	84c9b40f-0450-4311-af2b-220cebfb4c19	f0c140a7-ca64-4751-acb8-0ad868d1ba08
117	pDQM106	efa1:linker:miRFP670-2:linker-attB	2025-09-12 04:33:36.836566+00	\N	\N	\N	Clone 2	84c9b40f-0450-4311-af2b-220cebfb4c19	98f73ad9-2fa3-4349-bd40-538a073ddff0
118	pDQM108	ccdB:linker:mChilada-MAGPV:linker	2025-09-12 04:33:36.836566+00	\N	\N	\N	Clone 1	84c9b40f-0450-4311-af2b-220cebfb4c19	3d9d1bff-3387-4673-82e8-553a7b205fef
119	pDQM110	exorH:GFP; hsp:phiC(iC)-NLS	2025-09-12 04:33:36.836566+00	\N	\N	\N	Clone 1	84c9b40f-0450-4311-af2b-220cebfb4c19	b2d8f24c-87af-4522-b4ca-67c90926b973
120	pDQM112	exorH:mScarlet; hsp:phiC(iC)-NLS	2025-09-12 04:33:36.836566+00	\N	\N	\N	Clone 1	84c9b40f-0450-4311-af2b-220cebfb4c19	848a0b58-96e1-444f-8d86-751668dd5293
121	pDQM114	ef1a:mSG:CDT1-P2A-mYH:GMN (iCodon) [FUCCI]	2025-09-12 04:33:36.836566+00	\N	\N	\N	clone 2	84c9b40f-0450-4311-af2b-220cebfb4c19	9d79d939-3827-4f0f-843a-1d45a64511ab
123	pDQM117	SP6:mScarlet3S2:H2B	2025-09-12 04:33:36.836566+00	\N	\N	\N	Clone 2	84c9b40f-0450-4311-af2b-220cebfb4c19	8089bf51-0a6e-4d33-9975-2d26036abc9b
124	pDQM119	SP6:mBeRFP:H2B	2025-09-12 04:33:36.836566+00	\N	\N	\N	Clone 3	84c9b40f-0450-4311-af2b-220cebfb4c19	5fc88a61-86c9-4932-aa20-051edbd24ca4
125	pDQM120	ef1a:linker:mBeRFP:linker-attB	2025-09-12 04:33:36.836566+00	\N	\N	\N	Clone 1	84c9b40f-0450-4311-af2b-220cebfb4c19	6ec81ccf-1bce-4c59-90ea-013512f4930d
126	pDQM121	ef1a:2xLynk:tdmScarlet3-S2-tol2	2025-09-12 04:33:36.836566+00	\N	\N	\N	Clones 1-4	84c9b40f-0450-4311-af2b-220cebfb4c19	4a22b996-557e-4939-aeb8-da2250dc267a
127	pDQM122	ef1a:skittles 3.5 (2xLynk:mSG-attP-Halo-attP-3FPs)	2025-09-12 04:33:36.836566+00	\N	\N	\N	Clone 3	84c9b40f-0450-4311-af2b-220cebfb4c19	27f73f48-a3f0-4888-9083-cbcd5857286f
128	pDQM124	ef1a:linker:mScarlet3-S2:linker-attB (tol2)	2025-09-12 04:33:36.836566+00	\N	\N	\N	Clone 1 and 2	84c9b40f-0450-4311-af2b-220cebfb4c19	9a99db4e-733e-40aa-8754-d34db9190692
129	pDQM125	ef1a:2xLynk:tdmSG:tPT2A:tdmScarlet3-S2:H2B	2025-09-12 04:33:36.836566+00	\N	\N	\N	clone 65-1	84c9b40f-0450-4311-af2b-220cebfb4c19	11900e3c-07f9-4ec7-9e7d-f0037e4f29bc
130	pDQM127	ef1a:skittles 4.0 (2xLynk:mSG-attP-Halo-attP-Electra-attP-mBeRFP-attP-mScarlet3-S2-attP-mTFP1)	2025-09-12 04:33:36.836566+00	\N	\N	\N	Clone 1 & 2	84c9b40f-0450-4311-af2b-220cebfb4c19	6ab1b6a5-078a-4185-a506-d90ae0e9e082
131	pDQM128	A2UCOE-ef1a-2xLynk:tdmSG-tol2	2025-09-12 04:33:36.836566+00	\N	\N	\N	TBD (missing ~96bp?)	84c9b40f-0450-4311-af2b-220cebfb4c19	dae53867-1310-4a8e-9a3e-94bbc266b4ae
132	pDQM129	ef1a-extended-2xLynk:tdmSG-tol2	2025-09-12 04:33:36.836566+00	\N	\N	\N	Clones 1-4	84c9b40f-0450-4311-af2b-220cebfb4c19	b71e59ac-dc62-4cd9-94a2-c6c203b840c9
133	pDQM130	MBP-TEV-phiC-NLS	2025-09-12 04:33:36.836566+00	\N	\N	\N	TBD	84c9b40f-0450-4311-af2b-220cebfb4c19	b42e3445-72de-4c31-be0e-e2e5d7c60bea
134	pDQM132	ef1a-extended::2xLynk:tdmSG:tPT2A:tdmScarlet3-S2:H2B-tol2	2025-09-12 04:33:36.836566+00	\N	\N	\N	Clones 1-3	84c9b40f-0450-4311-af2b-220cebfb4c19	9219c2df-2ae3-4984-baf6-5f616d0087e1
135	pDQM133	ef1a-extened::tdmScarlet3-S2:H2B-tol2	2025-09-12 04:33:36.836566+00	\N	\N	\N	Clones 1-3	84c9b40f-0450-4311-af2b-220cebfb4c19	3e1fd2e3-30c0-4e05-a28c-4017792cd2f2
136	pDQM134	A2UCOE-ef1a:2xLynk:tdmSG:tPT2A:tdmScarlet3-S2:H2B-tol2	2025-09-12 04:33:36.836566+00	\N	\N	\N	still missing ~100bp	84c9b40f-0450-4311-af2b-220cebfb4c19	3571d532-ca7a-44d4-80c2-15b97f9aa87f
137	pDQM136	ef1a-extended:2xLynk:tdmScarlet3-S2-tol2	2025-09-12 04:33:36.836566+00	\N	\N	\N	clone 3	84c9b40f-0450-4311-af2b-220cebfb4c19	9a22a344-4e21-4fcc-bd04-3ed9df9f3068
138	pDQM137	ef1a:-extended-skittles 4.0 (2xLynk:mSG-attP-Halo-attP-Electra-attP-mBeRFP-attP-mScarlet3-S2-attP-mTFP1)	2025-09-12 04:33:36.836566+00	\N	\N	\N	clone 3	84c9b40f-0450-4311-af2b-220cebfb4c19	ba81872c-7bc7-4e51-95fa-26c0b8f542e1
139	pDQM138	SP6:2xLynk:mGold2s	2025-09-12 04:33:36.836566+00	\N	\N	\N	TBD	84c9b40f-0450-4311-af2b-220cebfb4c19	33e17c7a-8577-4ec2-a6cf-1b7a196bb552
140	pDQM139	SP6:2xLynk:mGold2t	2025-09-12 04:33:36.836566+00	\N	\N	\N	TBD	84c9b40f-0450-4311-af2b-220cebfb4c19	e713e211-2ca3-408d-b9ec-b122571b08b5
141	pDQM140	ef1a:linker:mGold2s:linker-attB (tol2)	2025-09-12 04:33:36.836566+00	\N	\N	\N	clones 1-3	84c9b40f-0450-4311-af2b-220cebfb4c19	66ab71fe-ef88-4744-a59b-53cf243746f3
142	pDQM141	ef1a:linker:mGold2t:linker-attB (tol2)	2025-09-12 04:33:36.836566+00	\N	\N	\N	clones 2-3	84c9b40f-0450-4311-af2b-220cebfb4c19	a4a4818b-26f5-4be1-be4e-c47dfda686db
143	pDQM142	exorh:gfp-hsp:dhb-tdmSG-tPT2A-tdmScarlet3-S2-h2b (pCM268)	2025-09-12 04:33:36.836566+00	\N	\N	\N	TBD	84c9b40f-0450-4311-af2b-220cebfb4c19	8177e6a8-bcd8-4555-8a19-ec5c92904321
144	pDQM143	SP6:tol2(iCodon)	2025-09-12 04:33:36.836566+00	\N	\N	\N	Clones 1,2 and 4	84c9b40f-0450-4311-af2b-220cebfb4c19	542613f9-2f90-4212-93c5-d06580c47c6d
145	pDQM144	ef1a:E2Crimson (iCodon)	2025-09-12 04:33:36.836566+00	\N	\N	\N	Clones 1-4	84c9b40f-0450-4311-af2b-220cebfb4c19	9b44d1c1-5f60-4a16-865d-cb00c9fd525c
146	pDQM145	ef1a:mCardinal (iCodon)	2025-09-12 04:33:36.836566+00	\N	\N	\N	Clones 1-4	84c9b40f-0450-4311-af2b-220cebfb4c19	5dd136d1-9121-4497-97b6-6d83dc8d2020
147	pDQM146	ef1a-extended:linker:mScarlet3-S2:linker-attB (tol2)	2025-09-12 04:33:36.836566+00	\N	\N	\N	made by Erin (Janelia)	84c9b40f-0450-4311-af2b-220cebfb4c19	bb954965-26e2-45a4-9807-0a26ef24ef74
148	pDQM147	ef1a-extended:linker:mStayGold:linker-attB (tol2)	2025-09-12 04:33:36.836566+00	\N	\N	\N	made by Erin (Janelia)	84c9b40f-0450-4311-af2b-220cebfb4c19	e3d82211-edd8-41a4-838d-4deb95ee86a1
149	pDQM148	ef1a-extended:linker:mStayGold-c4:linker-attB (tol2)	2025-09-12 04:33:36.836566+00	\N	\N	\N	made by Erin (Janelia)	84c9b40f-0450-4311-af2b-220cebfb4c19	3bf0fa9e-edaa-49ec-af17-f80a9fb1413f
150	pDQM149	ef1a-extended:linker:Halo:linker-sv40-he1.1-tagbfp2-attB (tol2)	2025-09-12 04:33:36.836566+00	\N	\N	\N	made by Erin (Janelia)	84c9b40f-0450-4311-af2b-220cebfb4c19	d877468b-cc9d-48db-8177-df36da3197f9
151	pDQM150	ef1a-extended-mSG:CDT1-tPT2A-mYH:GMN (endogenous)	2025-09-12 04:33:36.836566+00	\N	\N	\N	\N	84c9b40f-0450-4311-af2b-220cebfb4c19	81f768d1-7d78-48dc-8d55-ba47addbc3b4
152	pDQM151	ef1a-extended-mSG:CDT1 (endogenous)	2025-09-12 04:33:36.836566+00	\N	\N	\N	Clones 3 & 4	84c9b40f-0450-4311-af2b-220cebfb4c19	47c16c2a-35a1-4f5d-b7d4-3f3843688499
153	pDQM152	A2UCOE-ef1a-extended-skittles 4.0 (2xLynk:mSG-attP-Halo-attP-Electra-attP-mBeRFP-attP-mScarlet3-S2-attP-mTFP1)	2025-09-12 04:33:36.836566+00	\N	\N	\N	\N	84c9b40f-0450-4311-af2b-220cebfb4c19	1ad14276-9876-4758-aa32-952a8002f487
154	pDQM153	ef1a-extended::DHB:tdmSG:tPT2A:tdmScarlet3-S2:H2B-tol2	2025-09-12 04:33:36.836566+00	\N	\N	\N	clone 1	84c9b40f-0450-4311-af2b-220cebfb4c19	6250fba6-3e6a-4785-b7f9-3cfd60768611
155	pDQM154	ef1a-extened::tdmScarlet3-S2:PCNA-tol2	2025-09-12 04:33:36.836566+00	\N	\N	\N	clone 1 + 2	84c9b40f-0450-4311-af2b-220cebfb4c19	fbd5ee7c-9b9f-48dc-9269-9c668fc17c7d
156	pDQM155	ef1a-extended:DHB:tdmSG-tol2	2025-09-12 04:33:36.836566+00	\N	\N	\N	clone 2 + 4	84c9b40f-0450-4311-af2b-220cebfb4c19	95e3d1d8-2850-467f-8a89-d1ea283df981
157	pDQM156	A2UCOE-loxP-ef1a-extended-2xLynk:tdmSc3S2-SV40-lox2272-attB-tol2	2025-09-12 04:33:36.836566+00	\N	\N	\N	\N	84c9b40f-0450-4311-af2b-220cebfb4c19	8b230d61-b01a-4cbf-bc3a-51e6c324d192
158	pDQM157	A2UCOE-FRT-ef1a-extended-2xLynk:tdmSc3S2-SV40-FRT3-attB-tol2	2025-09-12 04:33:36.836566+00	\N	\N	\N	\N	84c9b40f-0450-4311-af2b-220cebfb4c19	0272698b-012e-4af4-b7c8-dc847d94aa79
159	pDQM158	A2UCOE-ef1a-extened::tdmScarlet3-S2:PCNA-tol2	2025-09-12 04:33:36.836566+00	\N	\N	\N	TBD	84c9b40f-0450-4311-af2b-220cebfb4c19	9adc1416-15ce-4c7f-8cdd-47fd1435ec2d
160	pDQM159	A2UCOE-ef1a-extended:DHB:tdmSG-tol2	2025-09-12 04:33:36.836566+00	\N	\N	\N	TBD	84c9b40f-0450-4311-af2b-220cebfb4c19	2fc72379-5c0b-4c73-b6b7-697a71af2eb8
2	MGCO-01	ef1a-2Xcox8A-linker-mStayGold-SV40-attb-tol2	2025-09-12 04:33:36.836566+00	\N	\N	\N	\N	84c9b40f-0450-4311-af2b-220cebfb4c19	02b5aaf9-5a7b-480b-bdbd-66938a5074a8
3	MGCO-02	ef1a-2Xcox8A-linker-mChilada-SV40-attb-tol2	2025-09-12 04:33:36.836566+00	\N	\N	\N	\N	84c9b40f-0450-4311-af2b-220cebfb4c19	41ce2ceb-c845-4e9b-af56-6f488de9652a
4	MGCO-03	ef1a-2Xcox8A-linker-Halo-SV40-attb-tol2	2025-09-12 04:33:36.836566+00	\N	\N	\N	\N	84c9b40f-0450-4311-af2b-220cebfb4c19	7b7051d4-71a2-4eab-a2fe-b244f83487c4
5	MGCO-04	ef1a-linker-mStayGold-C4linker-sec61b-SV40-attb-tol2	2025-09-12 04:33:36.836566+00	\N	\N	\N	\N	84c9b40f-0450-4311-af2b-220cebfb4c19	06c20a2b-72ff-4de0-9c61-a3b023bd0985
6	MGCO-05	ef1a-linker-mChilada-C4linker-sec61b-SV40-attb-tol2	2025-09-12 04:33:36.836566+00	\N	\N	\N	\N	84c9b40f-0450-4311-af2b-220cebfb4c19	470f0fbd-2e9e-4a0d-ae29-0d906cea35be
7	MGCO-06	ef1a-linker-Halo-sec61b-SV40-attb-tol2	2025-09-12 04:33:36.836566+00	\N	\N	\N	\N	84c9b40f-0450-4311-af2b-220cebfb4c19	14368017-a418-4800-99b4-345c06051242
8	MGCO-07	ef1a-linker-mStayGold-C4linker-GM130-SV40-attb-tol2	2025-09-12 04:33:36.836566+00	\N	\N	\N	\N	84c9b40f-0450-4311-af2b-220cebfb4c19	b1c9a3ef-729c-4808-9a8e-550a82efdac8
9	MGCO-08	ef1a-linker-mChilada-C4linker-GM130-SV40-attb-tol2	2025-09-12 04:33:36.836566+00	\N	\N	\N	\N	84c9b40f-0450-4311-af2b-220cebfb4c19	f8a992cd-8d22-4299-bcff-7401b984c204
10	MGCO-09	ef1a-linker-Halo-GM130-SV40-attb-tol2	2025-09-12 04:33:36.836566+00	\N	\N	\N	\N	84c9b40f-0450-4311-af2b-220cebfb4c19	c958096e-2d4b-43a6-ad1f-effd5ed123d0
11	MGCO-10	ef1a-TGN46-linker-mStayGold-SV40-attb-tol2	2025-09-12 04:33:36.836566+00	\N	\N	\N	\N	84c9b40f-0450-4311-af2b-220cebfb4c19	b0eb262e-822e-44fb-a4b6-198ee190690e
12	MGCO-11	ef1a-TGN46-linker-mChilada-SV40-attb-tol2	2025-09-12 04:33:36.836566+00	\N	\N	\N	\N	84c9b40f-0450-4311-af2b-220cebfb4c19	46717835-247f-40b3-a46d-e807a3a2d7f6
13	MGCO-12	ef1a-TGN46-linker-Halo-SV40-attb-tol2	2025-09-12 04:33:36.836566+00	\N	\N	\N	\N	84c9b40f-0450-4311-af2b-220cebfb4c19	5500118f-9a93-47b3-8839-c46c8a1d3b11
14	MGCO-13	ef1a-linker-mStayGold-C4linker-rab5a-SV40-attb-tol2	2025-09-12 04:33:36.836566+00	\N	\N	\N	\N	84c9b40f-0450-4311-af2b-220cebfb4c19	2f56dc9a-af5e-47c6-84df-33dcc926b362
15	MGCO-14	ef1a-linker-Halo-rab5a-SV40-attb-tol2	2025-09-12 04:33:36.836566+00	\N	\N	\N	\N	84c9b40f-0450-4311-af2b-220cebfb4c19	d7613934-a9a9-4c02-ab52-757d6a077b70
16	MGCO-15	ef1a-LAMP1-linker-mStayGold-SV40-attb-tol2	2025-09-12 04:33:36.836566+00	\N	\N	\N	\N	84c9b40f-0450-4311-af2b-220cebfb4c19	a11d6782-fa07-480b-be62-e5ef3850c8e2
17	MGCO-16	ef1a-LAMP1-linker-mChilada-SV40-attb-tol2	2025-09-12 04:33:36.836566+00	\N	\N	\N	\N	84c9b40f-0450-4311-af2b-220cebfb4c19	9985dbc7-735a-4c93-a36c-d464db8402b4
18	MGCO-17	ef1a-Arl13b-linker-mStayGold-SV40-attb-tol2	2025-09-12 04:33:36.836566+00	\N	\N	\N	\N	84c9b40f-0450-4311-af2b-220cebfb4c19	bf049315-1e2c-4aee-80eb-bfded31e5284
19	MGCO-18	ef1a-Arl13b-linker-Halo-SV40-attb-tol2	2025-09-12 04:33:36.836566+00	\N	\N	\N	\N	84c9b40f-0450-4311-af2b-220cebfb4c19	2d5fee97-bf2d-4218-85f8-45e2dd30df53
20	MGCO-19	ef1a-linker-mStayGold-C4linker-alphatubulin-SV40-attb-tol2	2025-09-12 04:33:36.836566+00	\N	\N	\N	\N	84c9b40f-0450-4311-af2b-220cebfb4c19	b82efac0-f593-45d8-ae4c-ce540269f118
21	MGCO-20	ef1a-linker-Halo-linker-alphatubulin-SV40-attb-tol2	2025-09-12 04:33:36.836566+00	\N	\N	\N	\N	84c9b40f-0450-4311-af2b-220cebfb4c19	93375546-21ba-4db6-997b-80c04d30bb3e
22	MGCO-21	ef1a-vimentin-linker-mStayGold-SV40-attb-tol2	2025-09-12 04:33:36.836566+00	\N	\N	\N	\N	84c9b40f-0450-4311-af2b-220cebfb4c19	aac82191-00ae-4c99-ac6e-759848034b8b
23	MGCO-22	ef1a-vimentin-linker-Halo-linker-SV40-attb-tol2	2025-09-12 04:33:36.836566+00	\N	\N	\N	\N	84c9b40f-0450-4311-af2b-220cebfb4c19	ae78b1c0-b1a4-462d-b1f6-7324d57eb26d
24	MGCO-23	ef1a-lifeact-linker-mStayGold-SV40-attb-tol2	2025-09-12 04:33:36.836566+00	\N	\N	\N	\N	84c9b40f-0450-4311-af2b-220cebfb4c19	a7ce3ca0-fa73-45fc-944a-d470f2c31a38
25	MGCO-24	ef1a-lifeact-linker-Halo-linker-SV40-attb-tol2	2025-09-12 04:33:36.836566+00	\N	\N	\N	\N	84c9b40f-0450-4311-af2b-220cebfb4c19	b499c9cc-a2ee-4f81-9462-3081ea41ce44
26	MGCO-25	ef1a-linker-mStayGold-C4linker-MYH10-SV40-attb-tol2	2025-09-12 04:33:36.836566+00	\N	\N	\N	\N	84c9b40f-0450-4311-af2b-220cebfb4c19	ae559e2c-1101-439a-816b-f2cb85f3b0b6
27	MGCO-26	ef1a-linker-mChilada-C4linker-MYH10-SV40-attb-tol2	2025-09-12 04:33:36.836566+00	\N	\N	\N	\N	84c9b40f-0450-4311-af2b-220cebfb4c19	862e3ba2-7129-4a52-aad5-22202d47c715
28	MGCO-27	ef1a-extended-linker-mStayGold-C4linker-sec61b-SV40-attb-tol2	2025-09-12 04:33:36.836566+00	\N	\N	\N	\N	84c9b40f-0450-4311-af2b-220cebfb4c19	49c17eea-fa13-4814-89f8-779538d5ef1e
29	MGCO-28	ef1a-extended-2Xcox8A-linker-mStayGold-SV40-attb-tol2	2025-09-12 04:33:36.836566+00	\N	\N	\N	\N	84c9b40f-0450-4311-af2b-220cebfb4c19	b4203af3-52f6-4784-a8ff-4cb1213f72a8
30	MGCO-29	ef1a-extended-linker-mStayGold-C4linker-GM130-SV40-attb-tol2	2025-09-12 04:33:36.836566+00	\N	\N	\N	\N	84c9b40f-0450-4311-af2b-220cebfb4c19	84b4ed64-da82-471b-83d4-05dc12996139
31	MGCO-30	ef1a-extended-TGN46-linker-mStayGold-SV40-attb-tol2	2025-09-12 04:33:36.836566+00	\N	\N	\N	\N	84c9b40f-0450-4311-af2b-220cebfb4c19	6cc9139a-bfc7-4399-9d59-1429305aa37b
32	MGCO-31	ef1a-extended-LAMP1-linker-mStayGold-SV40-attb-tol2	2025-09-12 04:33:36.836566+00	\N	\N	\N	\N	84c9b40f-0450-4311-af2b-220cebfb4c19	fe2d0d79-8970-408a-89dd-58a5d72d0087
33	MGCO-32	ef1a-extended-linker-mStayGold-C4linker-alphatubulin-SV40-attb-tol2	2025-09-12 04:33:36.836566+00	\N	\N	\N	\N	84c9b40f-0450-4311-af2b-220cebfb4c19	87e745aa-56c4-48e4-92d0-a35de7cdc870
34	MGCO-33	ef1a-extended-vimentin-linker-mStayGold-SV40-attb-tol2	2025-09-12 04:33:36.836566+00	\N	\N	\N	\N	84c9b40f-0450-4311-af2b-220cebfb4c19	33d33bc4-a2e0-4d7a-9bd5-8c143fbdfc1b
35	MGCO-34	ef1a-extended-lifeact-linker-mStayGold-SV40-attb-tol2	2025-09-12 04:33:36.836566+00	\N	\N	\N	\N	84c9b40f-0450-4311-af2b-220cebfb4c19	4d227a0d-a173-4607-b3bf-e83b49f918e4
36	MGCO-35	ef1a-extended-2Xcox8A-linker-mScarlet3S2-SV40-attb-tol2	2025-09-12 04:33:36.836566+00	\N	\N	\N	\N	84c9b40f-0450-4311-af2b-220cebfb4c19	48d9447b-c268-486f-ac9e-972e7d106592
37	MGCO-36	ef1a-extended-linker-mScarlet3S2-sec61b-SV40-attb-tol2	2025-09-12 04:33:36.836566+00	\N	\N	\N	\N	84c9b40f-0450-4311-af2b-220cebfb4c19	8189a86e-2891-449d-a2cc-4f7787a0e9d3
38	MGCO-37	ef1a-extended-LAMP1-linker-mScarlet3S2-SV40-attb-tol2	2025-09-12 04:33:36.836566+00	\N	\N	\N	\N	84c9b40f-0450-4311-af2b-220cebfb4c19	6ce5b76e-c602-4769-8cac-3f24a6142f81
39	MGCO-38	ef1a-extended-linker-mStayGold-C4linker-MyosinII-SV40-attb-tol2	2025-09-12 04:33:36.836566+00	\N	\N	\N	\N	84c9b40f-0450-4311-af2b-220cebfb4c19	86658104-60b5-44d4-8233-593445965941
40	MGCO-39	ef1a-extended-2Xcox8A-linker-Halo-SV40-attb-tol2	2025-09-12 04:33:36.836566+00	\N	\N	\N	\N	84c9b40f-0450-4311-af2b-220cebfb4c19	55c52917-f064-493d-8130-3a86b303c758
41	MGCO-40	ef1a-extended-linker-Halo-sec61b-SV40-attb-tol2	2025-09-12 04:33:36.836566+00	\N	\N	\N	\N	84c9b40f-0450-4311-af2b-220cebfb4c19	b88b9d0f-5f80-4378-b26e-b9f6671f6217
42	MGCO-41	ef1a-extended-linker-mScarlet3S2-GM130-SV40-attb-tol2	2025-09-12 04:33:36.836566+00	\N	\N	\N	\N	84c9b40f-0450-4311-af2b-220cebfb4c19	b09bebc3-4bb9-47e2-8b59-d34132ecd912
43	MGCO-42	ef1a-extended-linker-Halo-GM130-SV40-attb-tol2	2025-09-12 04:33:36.836566+00	\N	\N	\N	\N	84c9b40f-0450-4311-af2b-220cebfb4c19	4c5d6615-24c5-4c76-87dc-594962dd9619
44	MGCO-43	ef1a-extended-TGN46-linker-mScarlet3S2-SV40-attb-tol2	2025-09-12 04:33:36.836566+00	\N	\N	\N	\N	84c9b40f-0450-4311-af2b-220cebfb4c19	f6701458-4732-43cc-8547-0c8aff18a96d
45	MGCO-44	ef1a-extended-TGN46-linker-Halo-SV40-attb-tol2	2025-09-12 04:33:36.836566+00	\N	\N	\N	\N	84c9b40f-0450-4311-af2b-220cebfb4c19	6e383555-701a-4c5e-91fe-0bd55fad853e
46	MGCO-45	ef1a-extended-linker-Halo-linker-alphatubulin-SV40-attb-tol2	2025-09-12 04:33:36.836566+00	\N	\N	\N	\N	84c9b40f-0450-4311-af2b-220cebfb4c19	f90098fb-586c-4408-88cf-12cbdcfd175c
47	MGCO-46	ef1a-extended-vimentin-linker-Halo-linker-SV40-attb-tol2	2025-09-12 04:33:36.836566+00	\N	\N	\N	\N	84c9b40f-0450-4311-af2b-220cebfb4c19	46205e06-0f35-4b4b-8909-3e6149ddc52f
56	pDQM001	CMV-SP6-mSG(J) IDT opt	2025-09-12 04:33:36.836566+00	\N	\N	\N	IDT optimized, for mRNA production with SP6 - clone 2	84c9b40f-0450-4311-af2b-220cebfb4c19	08f2f5d9-1c9f-41cd-b594-801271480ed9
57	pDQM005	ef1a-tdmSG(J)	2025-09-12 04:33:36.836566+00	\N	\N	\N	iCodon optimized for tol2 insertions - clone 4	84c9b40f-0450-4311-af2b-220cebfb4c19	e9a2053b-b8ec-4d7f-85fa-eae4812c2582
58	pDQM006	ef1a-tdmSG-syntrons(J)	2025-09-12 04:33:36.836566+00	\N	\N	\N	each mStayGold contains a 51bp syntron to boost expression - clone 6	84c9b40f-0450-4311-af2b-220cebfb4c19	4211baeb-07e8-40cc-a08e-4b0dffed17da
59	pDQM009	skittles2.0-4FP	2025-09-12 04:33:36.836566+00	\N	\N	\N	iCodon optimized - contains cryaa:mScarlet-AttP-mKate2-Electra2-mKOK-mTFP1 (missing mCitrine) - clone SK1	84c9b40f-0450-4311-af2b-220cebfb4c19	33bef132-5daf-46e1-922b-7191723dd6ca
60	pDQM011	pCM268_ccdB-Electra2	2025-09-12 04:33:36.836566+00	\N	\N	\N	Clone 1 - pIGLET backbone in NEB Turbo cells (for ccdB survival)	84c9b40f-0450-4311-af2b-220cebfb4c19	ca2c0ef0-80d9-42b6-955d-638908d1fa72
61	pDQM013	pCM268_ccdB-mKOK	2025-09-12 04:33:36.836566+00	\N	\N	\N	Clone 2 - pIGLET backbone in NEB Turbo cells (for ccdB survival)	84c9b40f-0450-4311-af2b-220cebfb4c19	980f4894-a5cd-4e89-9fc5-72cae1ff1978
62	pDQM014	pCM268_ccdB-mKate2	2025-09-12 04:33:36.836566+00	\N	\N	\N	Clone 1 - pIGLET backbone in NEB Turbo cells (for ccdB survival)	84c9b40f-0450-4311-af2b-220cebfb4c19	da4b113f-9697-4690-9016-758e7af1053a
80	pDQM045	pTwist-SP6:2xLynk:mScarlet3	2025-09-12 04:33:36.836566+00	\N	\N	\N	\N	84c9b40f-0450-4311-af2b-220cebfb4c19	480fd428-9ce1-4d48-9ca8-6e567b5636fb
265	pDQM103	efa1:linker:mStayGold(J):linker-attB	2025-09-12 22:00:28.223616+00	\N	\N	\N	Clone 2	00000000-0000-0000-0000-000000000000	b6659ace-c5ca-4bdf-bf91-f14c8ec7e105
266	pDQM107	efa1:linker:miRFP670-2:linker-attB	2025-09-12 22:00:28.223616+00	\N	\N	\N	Clone 5	00000000-0000-0000-0000-000000000000	7dfa6856-b179-4024-9bfb-9fe10ca797b1
267	pDQM109	ccdB:linker:mChilada-MAGPV:linker	2025-09-12 22:00:28.223616+00	\N	\N	\N	Clone 3	00000000-0000-0000-0000-000000000000	335b70fa-a2ae-4252-b709-222e448c0c0b
268	pDQM111	exorH:GFP; hsp:phiC(iC)-NLS	2025-09-12 22:00:28.223616+00	\N	\N	\N	Clone 3	00000000-0000-0000-0000-000000000000	2d50ccc0-945b-484a-a0d5-79976e2f64c1
269	pDQM113	exorH:mScarlet; hsp:phiC(iC)-NLS	2025-09-12 22:00:28.223616+00	\N	\N	\N	Clone 2	00000000-0000-0000-0000-000000000000	ceee4456-d51c-4c91-a09d-26e14eacfb46
270	pDQM116	SP6:2xLynk:mScarlet3S2	2025-09-12 22:00:28.223616+00	\N	\N	\N	Clone 2	00000000-0000-0000-0000-000000000000	943f4caf-e567-49d8-98ac-fc8f71fdd845
271	pDQM118	SP6:mScarlet3S2:H2B	2025-09-12 22:00:28.223616+00	\N	\N	\N	Clone 3	00000000-0000-0000-0000-000000000000	39ea62b4-6ebb-43f7-925d-fdfcd00f90a8
272	pDQM123	ef1a:skittles 3.5 (2xLynk:mSG-attP-Halo-attP-3FPs)	2025-09-12 22:00:28.223616+00	\N	\N	\N	Clone 4	00000000-0000-0000-0000-000000000000	98258c6d-b175-444c-9838-f7d6a5fb95ef
273	pDQM126	ef1a:2xLynk:tdmSG:tPT2A:tdmScarlet3-S2:H2B	2025-09-12 22:00:28.223616+00	\N	\N	\N	clone 94-1	00000000-0000-0000-0000-000000000000	fa380739-b0f9-43e9-b890-d0c725533ce2
274	pDQM131	exorh:gfp-hsp:dhb-tdmSG-tPT2A-tdmChilada-h2b (pCM268)	2025-09-12 22:00:28.223616+00	\N	\N	\N	Clones 2,3	00000000-0000-0000-0000-000000000000	02989ced-f729-4eef-99b5-bea7d359c2e9
275	pDQM135	A2UCOE-ef1a-2xLynk:tdmSG-tol2	2025-09-12 22:00:28.223616+00	\N	\N	\N	still missing ~100bp	00000000-0000-0000-0000-000000000000	e876478f-123b-43a5-9863-96c86c1a9032
276	pDQM160	ef1a-extended-tdmScarlet3S2::GMN (endogenous)	2025-09-12 22:00:28.223616+00	\N	\N	\N	clones 1 + 2	00000000-0000-0000-0000-000000000000	7a014f12-bc7d-424e-8dad-dea5bb0e4a88
48	MGCO-47	ef1a-extended-lifeact-linker-Halo-linker-SV40-attb-tol2	2025-09-12 04:33:36.836566+00	\N	\N	\N	\N	84c9b40f-0450-4311-af2b-220cebfb4c19	120b5881-17a9-483d-971d-d0f816302d17
49	MGCO-48	ef1a-extended-linker-mScarlet3S2-linker-MyosinII-SV40-attb-tol2	2025-09-12 04:33:36.836566+00	\N	\N	\N	\N	84c9b40f-0450-4311-af2b-220cebfb4c19	e9e5eff9-a652-44ba-930a-694b7dd098ec
163	pMNM001	A2UCOE-sox10-linker-mChilada	2025-09-12 04:33:36.836566+00	\N	\N	\N	\N	84c9b40f-0450-4311-af2b-220cebfb4c19	9ab80949-5071-4756-801b-180dfd86c7b9
164	pMNM002	A2UCOE-ef1a-extended-link-tdm:mScarlet3S2	2025-09-12 04:33:36.836566+00	\N	\N	\N	\N	84c9b40f-0450-4311-af2b-220cebfb4c19	c36abc45-b863-4b87-bec8-49b92b12e948
165	pMNM003	phiC_opt-nanos3'UTR	2025-09-12 04:33:36.836566+00	\N	\N	\N	used to make phiC-nanos 3'utr mRNA for pIGLET insertions	84c9b40f-0450-4311-af2b-220cebfb4c19	85b064d3-090e-410b-a655-30785beb8086
166	pMNM004	SP6-tol2_opt-nanos3'UTR	2025-09-12 04:33:36.836566+00	\N	\N	\N	used to make tol2-nanos 3'utr mRNA for tol2 based integration	84c9b40f-0450-4311-af2b-220cebfb4c19	35e6aa4e-9426-4655-a014-63d8ed5a5217
167	pMNM005	SP6-FLP-Xl-hmglobin 3'utr	2025-09-12 04:33:36.836566+00	\N	\N	\N	used to make FLP mRNA (iCodon opt) for RCME with FLP	84c9b40f-0450-4311-af2b-220cebfb4c19	344a6d1d-f10d-4f6f-a18c-70272c9dd330
168	pMNM006	SP6-FLPw-Xl-hmglobin 3'utr	2025-09-12 04:33:36.836566+00	\N	\N	\N	used to make FLPw mRNA (iCodon opt) for RCME with FLP	84c9b40f-0450-4311-af2b-220cebfb4c19	7b014633-354a-4ff6-8623-9cc20dbfa5e9
169	pMNM007	SP6-iCre-Xl-hmglobin 3'utr	2025-09-12 04:33:36.836566+00	\N	\N	\N	used to make Cre mRNA (iCodon opt) for RCME with FLP	84c9b40f-0450-4311-af2b-220cebfb4c19	2c66aeb5-29b7-4433-af28-bd9901cd8c85
170	pMNM008	SP6-PhiC-ERT2-Xl-hmglobin 3'utr	2025-09-12 04:33:36.836566+00	\N	\N	\N	used to make PhiC-ERT2 inducible mRNA (iCodon opt) for skittles activation	84c9b40f-0450-4311-af2b-220cebfb4c19	d1dbb2fe-4384-45b8-9712-2b503760abb5
50	pCNH001	A2UCOE-ef1a-extended-linker-mTFP1	2025-09-12 04:33:36.836566+00	\N	\N	\N	\N	84c9b40f-0450-4311-af2b-220cebfb4c19	22fa4951-1580-49ce-a950-eac22b9365fa
51	pCNH002	A2UCOE-ef1a-extended-linker-mBeRFP	2025-09-12 04:33:36.836566+00	\N	\N	\N	\N	84c9b40f-0450-4311-af2b-220cebfb4c19	55b7f16c-0839-4a6a-bb67-3846e362c9ce
52	pCNH003	A2UCOE-ef1a-extended-linker-Halo	2025-09-12 04:33:36.836566+00	\N	\N	\N	\N	84c9b40f-0450-4311-af2b-220cebfb4c19	96d9da72-33a2-4553-8c5d-7c15468d747d
53	pCNH004	A2UCOE-ef1a-extended-N-term_linker-mStayGold (J)	2025-09-12 04:33:36.836566+00	\N	\N	\N	\N	84c9b40f-0450-4311-af2b-220cebfb4c19	b564e41a-091f-4c71-b48c-8ab16b5dd156
54	pCNH005	A2UCOE-ef1a-extended-linker-mStayGold(J)-C-term_linker	2025-09-12 04:33:36.836566+00	\N	\N	\N	\N	84c9b40f-0450-4311-af2b-220cebfb4c19	b16c69fc-acc1-4477-9bfa-6c12c5041a1e
55	pCNH006	A2UCOE-ef1a-extended-linker-mScarlet3S2	2025-09-12 04:33:36.836566+00	\N	\N	\N	\N	84c9b40f-0450-4311-af2b-220cebfb4c19	d4e8218e-fe00-4d1a-805e-5f236d31b6fa
161	pJWL001	ef1a-extended-2xLynk:tdmSc3S2-SV40-attB-tol2	2025-09-12 04:33:36.836566+00	\N	\N	\N	added attB site to pDQM136	84c9b40f-0450-4311-af2b-220cebfb4c19	1c7f99d5-3db1-4200-ba00-3656e32f166e
162	pJWL002	A2UCOE-ef1a-extended-2xLynk:tdmSc3S2-SV40-attB-tol2	2025-09-12 04:33:36.836566+00	\N	\N	\N	added attB site to pMNM002	84c9b40f-0450-4311-af2b-220cebfb4c19	8e0dad2d-9f5e-432d-8a46-fa54938e3b32
\.


--
-- Data for Name: plasmids_cassettes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.plasmids_cassettes (id, plasmid_id, cassette_id, "position", notes, created_by, created_at, updated_at, plasmid_id_uuid) FROM stdin;
\.


--
-- Data for Name: profiles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.profiles (id, email, full_name, created_at) FROM stdin;
\.


--
-- Data for Name: rna; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.rna (id, name, description, notes, source, created_by, created_at, updated_at, id_uuid) FROM stdin;
1312c590-e315-4d6c-8d42-b84f59b2c644	nan	\N	\N	\N	\N	2025-09-10 01:46:24.826812+00	2025-09-12 21:25:13.530649+00	b4834bcd-d042-4b9a-a42f-c259d82b9346
7b491838-3b05-4ba6-87df-823ea6190a44	Demo mRNA	Example mRNA for testing	\N	Lab	\N	2025-09-12 03:16:28.615736+00	2025-09-12 21:25:13.530649+00	bedd3ce2-6b6b-4dce-977c-5bc099353257
c5938807-ac4c-4662-9325-c47acd150f01	mYH:H2B	\N	\N	\N	\N	2025-09-10 01:46:24.826812+00	2025-09-12 21:25:13.530649+00	b67a6994-c7fd-412a-bed5-f2a23ffc9874
56fe49cd-a53e-477e-8a5e-50d9612c7eba	mScarlet3-S2:H2B	\N	\N	\N	\N	2025-09-10 01:46:24.826812+00	2025-09-12 21:25:13.530649+00	9ab20cce-d03d-4b6f-b68e-46854dc000a4
1ad5c4d1-a449-4295-8385-a18a2bd8219a	mBeRFP:H2B	\N	\N	\N	\N	2025-09-10 01:46:24.826812+00	2025-09-12 21:25:13.530649+00	cf1dd8a2-481e-4721-a6a0-26885caca024
5622da8c-2155-4791-ab92-95548b06c48b	mChilada:H2B	\N	\N	\N	\N	2025-09-10 01:46:24.826812+00	2025-09-12 21:25:13.530649+00	4321b6c9-c276-45ac-8355-458e4199f1f1
4359a5f3-59be-44e1-a262-c79e6f656177	2xLynk:mSG	\N	\N	\N	\N	2025-09-10 01:46:24.826812+00	2025-09-12 21:25:13.530649+00	7a572491-facb-4651-8ab7-7ec1edbe926d
f45e34c9-cf76-4d41-927f-1143589f5714	2xLynk:mChilada	\N	\N	\N	\N	2025-09-10 01:46:24.826812+00	2025-09-12 21:25:13.530649+00	9a727a16-c1c3-493b-97be-7055eb1f076d
6c03ac7b-81e5-4f62-8bb6-cb57a414f6b9	2xLynk:mScarlet3-S2	\N	\N	\N	\N	2025-09-10 01:46:24.826812+00	2025-09-12 21:25:13.530649+00	0c7ac4a7-0116-4f71-9ab5-9c33e1c19dc3
6f615141-d5d9-49a6-bfd8-e3523276dc38	phiC	\N	\N	\N	\N	2025-09-10 01:46:24.826812+00	2025-09-12 21:25:13.530649+00	b268621d-46f7-4303-97ff-3711dc41240c
3cd660f2-cf89-4d07-9cd4-8131ec568d3d	phiC-NLS	\N	\N	\N	\N	2025-09-10 01:46:24.826812+00	2025-09-12 21:25:13.530649+00	a9aeb4eb-1baf-44b1-87e9-def657536513
8c7e1c31-3c6e-4dc5-9f2c-feee0d7a27de	2xCox8A:mSG	\N	\N	\N	\N	2025-09-10 01:46:24.826812+00	2025-09-12 21:25:13.530649+00	bca56551-cfcf-47c9-a582-56ba0a0e4c7e
5a9bca67-13c4-4d87-a5f4-f17b1e9c63b6	2xCox8A:mChilada	\N	\N	\N	\N	2025-09-10 01:46:24.826812+00	2025-09-12 21:25:13.530649+00	24d89752-7491-472e-876d-327298f8b3f8
483dd1d1-387d-438d-8fd0-6ba361ea6c33	2xCox8A:Halo	\N	\N	\N	\N	2025-09-10 01:46:24.826812+00	2025-09-12 21:25:13.530649+00	b227215e-afe1-49a5-af8b-fb3c422310b3
49f9912b-f6f2-4105-9b0c-8a3638c4ffd7	2xCox8A:mScarlet3S2	\N	\N	\N	\N	2025-09-10 01:46:24.826812+00	2025-09-12 21:25:13.530649+00	f13b0251-0829-487d-8332-adf09443b6e8
8159b3c8-da4f-4f13-8aac-113e308f90b7	mSG:sec61b	\N	\N	\N	\N	2025-09-10 01:46:24.826812+00	2025-09-12 21:25:13.530649+00	0a909b37-f2fb-456b-8346-29e30429dce4
b75e9ba4-3d22-458b-9b5b-931dde443161	mChilada:sec61b	\N	\N	\N	\N	2025-09-10 01:46:24.826812+00	2025-09-12 21:25:13.530649+00	12ee1057-4f2b-4df9-ad14-155968224121
7daec6a9-8e0b-4544-ba78-b9b4c27d879c	Halo:sec61b	\N	\N	\N	\N	2025-09-10 01:46:24.826812+00	2025-09-12 21:25:13.530649+00	f7aee1a8-dba4-4985-9119-22aa5880ab05
f424eac4-c278-4047-8bb1-859e6eba3757	mSG:GM130	\N	\N	\N	\N	2025-09-10 01:46:24.826812+00	2025-09-12 21:25:13.530649+00	77ebcae2-444c-4f34-b0a9-05d37bf7387b
655829f9-60d8-4e49-83b8-3c9b73851bcd	mChilada:GM130	\N	\N	\N	\N	2025-09-10 01:46:24.826812+00	2025-09-12 21:25:13.530649+00	8340abb6-4a52-4922-ab24-abd4f8164e45
4025e934-3b26-4333-9d23-565c3f0e5b0c	Halo:GM130	\N	\N	\N	\N	2025-09-10 01:46:24.826812+00	2025-09-12 21:25:13.530649+00	23b83eff-9c30-4117-8be6-063d811ac054
b169d4e3-d9de-4f84-af98-ae7ea87c85cf	TGN:mSG	\N	\N	\N	\N	2025-09-10 01:46:24.826812+00	2025-09-12 21:25:13.530649+00	bb348285-3892-4ca9-b0df-3cf2a3fb262c
10795a9b-f825-4de7-a07b-0943625ffe60	TGN:mChilada	\N	\N	\N	\N	2025-09-10 01:46:24.826812+00	2025-09-12 21:25:13.530649+00	adb0011a-19cf-40ea-8788-30700bd2a5f6
8d9aa764-a23b-4b4d-8834-dad088f7d288	TGN:Halo	\N	\N	\N	\N	2025-09-10 01:46:24.826812+00	2025-09-12 21:25:13.530649+00	23a8778a-7d09-4779-8b03-b75ac1132448
67e20f99-daef-4b92-b6fa-fc57c1e70c0c	mSG:rab5a	\N	\N	\N	\N	2025-09-10 01:46:24.826812+00	2025-09-12 21:25:13.530649+00	2a3387e4-0cb2-4fab-aeea-373bce5fe07b
93d710e0-2a30-4329-a999-2f5e7c77c8ba	mChilada:rab5a	\N	\N	\N	\N	2025-09-10 01:46:24.826812+00	2025-09-12 21:25:13.530649+00	86bfc340-5915-4793-a7dd-a66fb342c4a8
d64a61d4-6014-4895-9dd8-85f68a6fdbd3	Halo:rab5a	\N	\N	\N	\N	2025-09-10 01:46:24.826812+00	2025-09-12 21:25:13.530649+00	550786ad-016c-4688-a92f-97a977e2d3a8
ea8d65df-cd6c-4b20-bbc6-1ae2608f3737	LAMP1:mSG	\N	\N	\N	\N	2025-09-10 01:46:24.826812+00	2025-09-12 21:25:13.530649+00	e4d430a6-f375-4952-a9ab-6c27cca2ef5b
082b8bd2-1482-47c5-b4de-5919418cf4de	LAMP1:mChilada	\N	\N	\N	\N	2025-09-10 01:46:24.826812+00	2025-09-12 21:25:13.530649+00	1f694da8-62c1-4298-b566-3ad96cedd2b0
338a5442-3084-4730-8b20-4f112b2f06e1	LAMP1:Halo	\N	\N	\N	\N	2025-09-10 01:46:24.826812+00	2025-09-12 21:25:13.530649+00	366cc763-7067-40c2-8ac1-2b2dd5017f97
cdce6a36-89b2-4793-a18b-b54d7a2df84a	Arl13b:mSG	\N	\N	\N	\N	2025-09-10 01:46:24.826812+00	2025-09-12 21:25:13.530649+00	114aa998-0373-4ecc-82ad-4e7c242fff79
04a01437-a121-49fb-a32b-d63a7b787b3d	Arl13b:mChilada	\N	\N	\N	\N	2025-09-10 01:46:24.826812+00	2025-09-12 21:25:13.530649+00	812666a4-461c-48bf-a455-6905bedd3fa7
d3491301-66ff-4004-ab00-7eba4089b05d	Arl13b:Halo	\N	\N	\N	\N	2025-09-10 01:46:24.826812+00	2025-09-12 21:25:13.530649+00	32021db2-6ab6-4076-ad71-870278098226
6281ab49-ddab-4772-a177-7a46228171a8	mSG:alpha-tub	\N	\N	\N	\N	2025-09-10 01:46:24.826812+00	2025-09-12 21:25:13.530649+00	ab42c02d-f016-48e6-a404-4b0f68052274
ed0b7bc2-0ac6-4230-8a83-5b1861dbde2c	mChilada:alpha-tub	\N	\N	\N	\N	2025-09-10 01:46:24.826812+00	2025-09-12 21:25:13.530649+00	9d4fac1e-e7ab-4e3a-bb33-bf8902b06e64
331cdc66-2b98-4e94-a1df-9757f2d6a813	Halo:alpha-tub	\N	\N	\N	\N	2025-09-10 01:46:24.826812+00	2025-09-12 21:25:13.530649+00	912b278f-416f-4ae3-8142-8212ff5c3a6d
bbb68302-d457-4bcf-890f-62b4fe0fc38d	Vimentin:mSG	\N	\N	\N	\N	2025-09-10 01:46:24.826812+00	2025-09-12 21:25:13.530649+00	3c584d0e-0b10-469c-885e-476eb9f7c36e
db3a5026-5889-4a26-9e2f-257cdd954e46	Vimentin:mChilada	\N	\N	\N	\N	2025-09-10 01:46:24.826812+00	2025-09-12 21:25:13.530649+00	78408a0e-0076-4b4b-93c9-02a4b665a17c
893821f3-1878-4309-a9e8-c5cbc3875d07	Vimentin:Halo	\N	\N	\N	\N	2025-09-10 01:46:24.826812+00	2025-09-12 21:25:13.530649+00	552f6f63-5419-434d-9121-2ad2ef5f0bc4
78bd2247-0927-47ae-b3b2-8a42bd56ed76	Lifeact:mSG	\N	\N	\N	\N	2025-09-10 01:46:24.826812+00	2025-09-12 21:25:13.530649+00	dcea2117-8958-485d-8672-0cdc6b142b0d
29bebcf2-25f4-4bda-a6df-0948b145303b	Lifeact:mChilada	\N	\N	\N	\N	2025-09-10 01:46:24.826812+00	2025-09-12 21:25:13.530649+00	1dee44dc-2e61-4d93-9686-29698cc4fae2
85ad110d-9c28-49e3-bbf0-014d3e3f354d	Lifeact:Halo	\N	\N	\N	\N	2025-09-10 01:46:24.826812+00	2025-09-12 21:25:13.530649+00	1793c66a-1b19-4d9c-858f-2638c81c082b
eda0b6e0-65c5-4054-a4a3-4daef60e27ad	mSG:MYH10	\N	\N	\N	\N	2025-09-10 01:46:24.826812+00	2025-09-12 21:25:13.530649+00	f2d2a807-c53a-43a3-a3ad-9087384ba171
fa91f168-e792-430b-b5ae-5d5a4c726397	mChilada:MYH10	\N	\N	\N	\N	2025-09-10 01:46:24.826812+00	2025-09-12 21:25:13.530649+00	4cc55295-ce52-4681-86d1-a2fce6b0e216
f4f7f4c4-fcd8-4148-8db0-0a4d52d30fb1	Halo:MYH10	\N	\N	\N	\N	2025-09-10 01:46:24.826812+00	2025-09-12 21:25:13.530649+00	255435e2-c595-46c3-9b77-7623012b5315
75ac2c9f-92a3-4be4-a215-f81448f26ef4	tdmChilada:PCNA	\N	\N	\N	\N	2025-09-10 01:46:24.826812+00	2025-09-12 21:25:13.530649+00	ab912db0-2d96-4258-9d84-62edd04d1913
027f49e9-cf8c-4df6-b595-f334254e8822	tdmScarlet3S2:PCNA	\N	\N	\N	\N	2025-09-10 01:46:24.826812+00	2025-09-12 21:25:13.530649+00	6b919610-7010-4850-b49b-982dfb591a0b
634a2825-ec00-483f-af55-a11e159d4c95	mScarlet3S2:sec61b	\N	\N	\N	\N	2025-09-10 01:46:24.826812+00	2025-09-12 21:25:13.530649+00	0e4aa7f5-a6e0-4cc7-9d97-49670a6194f6
81d57955-370f-4dbb-ab27-4398c2e57d8f	MGCO-23 (LifeAct-mStayGold)	\N	\N	\N	\N	2025-09-10 01:46:24.826812+00	2025-09-12 21:25:13.530649+00	d3b20f9d-e05f-4db5-ae56-7012e8d32825
bccf1747-284a-4204-805f-70c348f07728	HC-1 1:NLS-mScarlet3	\N	\N	\N	\N	2025-09-10 01:46:24.826812+00	2025-09-12 21:25:13.530649+00	8bc1ccbe-87fc-4310-92cf-9488fcba6cca
896ba60d-aadd-4f43-81f5-177ed8d4d5b1	HC-2 2:NLS-mScarlet3	\N	\N	\N	\N	2025-09-10 01:46:24.826812+00	2025-09-12 21:25:13.530649+00	d73b1f84-81bf-4cdd-9bf8-f21465e60cf6
7dc56366-c3be-43ae-a914-65ae1016eee4	HC-3 3:NLS-mScarlet3	\N	\N	\N	\N	2025-09-10 01:46:24.826812+00	2025-09-12 21:25:13.530649+00	edaeab29-e8ef-4883-b2c1-ab70085f79d1
a92e69b9-80fa-4862-a9ee-0cfc2ca6bde7	HC-4 5:NLS-mScarlet3	\N	\N	\N	\N	2025-09-10 01:46:24.826812+00	2025-09-12 21:25:13.530649+00	8220350b-66cb-4cee-bd0e-33103ca1c05c
c459e64a-9fca-4d13-9078-26d715d85b7a	HC-5 7:NLS-mScarlet3	\N	\N	\N	\N	2025-09-10 01:46:24.826812+00	2025-09-12 21:25:13.530649+00	e26a26a1-0a56-4c05-96ca-c74aa948e209
7bc5d0c8-949d-4991-9b6d-ae9437c631f5	HC-6 9:NLS-mScarlet3	\N	\N	\N	\N	2025-09-10 01:46:24.826812+00	2025-09-12 21:25:13.530649+00	69c89d24-c09a-43b3-ba79-5356363f7d0a
12f545c5-5035-4e0c-8d44-cf52ceb680ae	HC-7 Vimentin:mScarlet3	\N	\N	\N	\N	2025-09-10 01:46:24.826812+00	2025-09-12 21:25:13.530649+00	85696980-de37-408f-972a-d5e59a37f5c1
28501a44-9709-4a34-af30-0ef9409570cb	HC-8 Lifeact:mScarlet3	\N	\N	\N	\N	2025-09-10 01:46:24.826812+00	2025-09-12 21:25:13.530649+00	cf8f584c-d180-49e3-88d8-a9851721d9da
2e86854e-1371-48db-b6bc-812bad431c94	HC-9 Lifeact:mStayGold	\N	\N	\N	\N	2025-09-10 01:46:24.826812+00	2025-09-12 21:25:13.530649+00	6399a1b7-3ba1-484e-8c02-6d5821abdda8
40c34ace-243c-464a-a39d-5ccaf9c1e8f6	HC-10 4x-Cox8:mStayGold	\N	\N	\N	\N	2025-09-10 01:46:24.826812+00	2025-09-12 21:25:13.530649+00	f4bc9cfe-2fff-446f-8bea-637ee8c921d7
4ab502c4-0c2e-4032-b5b1-451253b2aea5	HC-11 mTagBFP2:SKL	\N	\N	\N	\N	2025-09-10 01:46:24.826812+00	2025-09-12 21:25:13.530649+00	877911be-392f-423e-807f-533203d9e5fe
\.


--
-- Data for Name: rna_fluors; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.rna_fluors (rna_id, fluor_id, rna_id_uuid, fluor_id_uuid) FROM stdin;
f4f7f4c4-fcd8-4148-8db0-0a4d52d30fb1	6	255435e2-c595-46c3-9b77-7623012b5315	99190692-4a5c-4959-b092-ea5de27e404d
85ad110d-9c28-49e3-bbf0-014d3e3f354d	6	1793c66a-1b19-4d9c-858f-2638c81c082b	99190692-4a5c-4959-b092-ea5de27e404d
893821f3-1878-4309-a9e8-c5cbc3875d07	6	552f6f63-5419-434d-9121-2ad2ef5f0bc4	99190692-4a5c-4959-b092-ea5de27e404d
331cdc66-2b98-4e94-a1df-9757f2d6a813	6	912b278f-416f-4ae3-8142-8212ff5c3a6d	99190692-4a5c-4959-b092-ea5de27e404d
d3491301-66ff-4004-ab00-7eba4089b05d	6	32021db2-6ab6-4076-ad71-870278098226	99190692-4a5c-4959-b092-ea5de27e404d
338a5442-3084-4730-8b20-4f112b2f06e1	6	366cc763-7067-40c2-8ac1-2b2dd5017f97	99190692-4a5c-4959-b092-ea5de27e404d
d64a61d4-6014-4895-9dd8-85f68a6fdbd3	6	550786ad-016c-4688-a92f-97a977e2d3a8	99190692-4a5c-4959-b092-ea5de27e404d
8d9aa764-a23b-4b4d-8834-dad088f7d288	6	23a8778a-7d09-4779-8b03-b75ac1132448	99190692-4a5c-4959-b092-ea5de27e404d
4025e934-3b26-4333-9d23-565c3f0e5b0c	6	23b83eff-9c30-4117-8be6-063d811ac054	99190692-4a5c-4959-b092-ea5de27e404d
7daec6a9-8e0b-4544-ba78-b9b4c27d879c	6	f7aee1a8-dba4-4985-9119-22aa5880ab05	99190692-4a5c-4959-b092-ea5de27e404d
483dd1d1-387d-438d-8fd0-6ba361ea6c33	6	b227215e-afe1-49a5-af8b-fb3c422310b3	99190692-4a5c-4959-b092-ea5de27e404d
fa91f168-e792-430b-b5ae-5d5a4c726397	14	4cc55295-ce52-4681-86d1-a2fce6b0e216	0a8e1967-2975-4c2e-bf99-d7f0ff55143c
29bebcf2-25f4-4bda-a6df-0948b145303b	14	1dee44dc-2e61-4d93-9686-29698cc4fae2	0a8e1967-2975-4c2e-bf99-d7f0ff55143c
db3a5026-5889-4a26-9e2f-257cdd954e46	14	78408a0e-0076-4b4b-93c9-02a4b665a17c	0a8e1967-2975-4c2e-bf99-d7f0ff55143c
ed0b7bc2-0ac6-4230-8a83-5b1861dbde2c	14	9d4fac1e-e7ab-4e3a-bb33-bf8902b06e64	0a8e1967-2975-4c2e-bf99-d7f0ff55143c
04a01437-a121-49fb-a32b-d63a7b787b3d	14	812666a4-461c-48bf-a455-6905bedd3fa7	0a8e1967-2975-4c2e-bf99-d7f0ff55143c
082b8bd2-1482-47c5-b4de-5919418cf4de	14	1f694da8-62c1-4298-b566-3ad96cedd2b0	0a8e1967-2975-4c2e-bf99-d7f0ff55143c
93d710e0-2a30-4329-a999-2f5e7c77c8ba	14	86bfc340-5915-4793-a7dd-a66fb342c4a8	0a8e1967-2975-4c2e-bf99-d7f0ff55143c
10795a9b-f825-4de7-a07b-0943625ffe60	14	adb0011a-19cf-40ea-8788-30700bd2a5f6	0a8e1967-2975-4c2e-bf99-d7f0ff55143c
655829f9-60d8-4e49-83b8-3c9b73851bcd	14	8340abb6-4a52-4922-ab24-abd4f8164e45	0a8e1967-2975-4c2e-bf99-d7f0ff55143c
b75e9ba4-3d22-458b-9b5b-931dde443161	14	12ee1057-4f2b-4df9-ad14-155968224121	0a8e1967-2975-4c2e-bf99-d7f0ff55143c
5a9bca67-13c4-4d87-a5f4-f17b1e9c63b6	14	24d89752-7491-472e-876d-327298f8b3f8	0a8e1967-2975-4c2e-bf99-d7f0ff55143c
f45e34c9-cf76-4d41-927f-1143589f5714	14	9a727a16-c1c3-493b-97be-7055eb1f076d	0a8e1967-2975-4c2e-bf99-d7f0ff55143c
5622da8c-2155-4791-ab92-95548b06c48b	14	4321b6c9-c276-45ac-8355-458e4199f1f1	0a8e1967-2975-4c2e-bf99-d7f0ff55143c
eda0b6e0-65c5-4054-a4a3-4daef60e27ad	25	f2d2a807-c53a-43a3-a3ad-9087384ba171	12336a23-9ea3-4265-b9fe-1f97d63be3be
78bd2247-0927-47ae-b3b2-8a42bd56ed76	25	dcea2117-8958-485d-8672-0cdc6b142b0d	12336a23-9ea3-4265-b9fe-1f97d63be3be
bbb68302-d457-4bcf-890f-62b4fe0fc38d	25	3c584d0e-0b10-469c-885e-476eb9f7c36e	12336a23-9ea3-4265-b9fe-1f97d63be3be
6281ab49-ddab-4772-a177-7a46228171a8	25	ab42c02d-f016-48e6-a404-4b0f68052274	12336a23-9ea3-4265-b9fe-1f97d63be3be
cdce6a36-89b2-4793-a18b-b54d7a2df84a	25	114aa998-0373-4ecc-82ad-4e7c242fff79	12336a23-9ea3-4265-b9fe-1f97d63be3be
ea8d65df-cd6c-4b20-bbc6-1ae2608f3737	25	e4d430a6-f375-4952-a9ab-6c27cca2ef5b	12336a23-9ea3-4265-b9fe-1f97d63be3be
67e20f99-daef-4b92-b6fa-fc57c1e70c0c	25	2a3387e4-0cb2-4fab-aeea-373bce5fe07b	12336a23-9ea3-4265-b9fe-1f97d63be3be
b169d4e3-d9de-4f84-af98-ae7ea87c85cf	25	bb348285-3892-4ca9-b0df-3cf2a3fb262c	12336a23-9ea3-4265-b9fe-1f97d63be3be
f424eac4-c278-4047-8bb1-859e6eba3757	25	77ebcae2-444c-4f34-b0a9-05d37bf7387b	12336a23-9ea3-4265-b9fe-1f97d63be3be
8159b3c8-da4f-4f13-8aac-113e308f90b7	25	0a909b37-f2fb-456b-8346-29e30429dce4	12336a23-9ea3-4265-b9fe-1f97d63be3be
8c7e1c31-3c6e-4dc5-9f2c-feee0d7a27de	25	bca56551-cfcf-47c9-a582-56ba0a0e4c7e	12336a23-9ea3-4265-b9fe-1f97d63be3be
4359a5f3-59be-44e1-a262-c79e6f656177	25	7a572491-facb-4651-8ab7-7ec1edbe926d	12336a23-9ea3-4265-b9fe-1f97d63be3be
634a2825-ec00-483f-af55-a11e159d4c95	35	0e4aa7f5-a6e0-4cc7-9d97-49670a6194f6	836c2c91-f9e7-41b5-8cb0-ac7c661e518c
49f9912b-f6f2-4105-9b0c-8a3638c4ffd7	35	f13b0251-0829-487d-8332-adf09443b6e8	836c2c91-f9e7-41b5-8cb0-ac7c661e518c
6c03ac7b-81e5-4f62-8bb6-cb57a414f6b9	35	0c7ac4a7-0116-4f71-9ab5-9c33e1c19dc3	836c2c91-f9e7-41b5-8cb0-ac7c661e518c
56fe49cd-a53e-477e-8a5e-50d9612c7eba	35	9ab20cce-d03d-4b6f-b68e-46854dc000a4	836c2c91-f9e7-41b5-8cb0-ac7c661e518c
1ad5c4d1-a449-4295-8385-a18a2bd8219a	12	cf1dd8a2-481e-4721-a6a0-26885caca024	36ed8d7c-5381-4a58-9e99-3ca34a00b66a
28501a44-9709-4a34-af30-0ef9409570cb	33	cf8f584c-d180-49e3-88d8-a9851721d9da	7fd3b215-1914-4cf4-a388-ae48172e8cbc
12f545c5-5035-4e0c-8d44-cf52ceb680ae	33	85696980-de37-408f-972a-d5e59a37f5c1	7fd3b215-1914-4cf4-a388-ae48172e8cbc
7bc5d0c8-949d-4991-9b6d-ae9437c631f5	33	69c89d24-c09a-43b3-ba79-5356363f7d0a	7fd3b215-1914-4cf4-a388-ae48172e8cbc
c459e64a-9fca-4d13-9078-26d715d85b7a	33	e26a26a1-0a56-4c05-96ca-c74aa948e209	7fd3b215-1914-4cf4-a388-ae48172e8cbc
a92e69b9-80fa-4862-a9ee-0cfc2ca6bde7	33	8220350b-66cb-4cee-bd0e-33103ca1c05c	7fd3b215-1914-4cf4-a388-ae48172e8cbc
7dc56366-c3be-43ae-a914-65ae1016eee4	33	edaeab29-e8ef-4883-b2c1-ab70085f79d1	7fd3b215-1914-4cf4-a388-ae48172e8cbc
896ba60d-aadd-4f43-81f5-177ed8d4d5b1	33	d73b1f84-81bf-4cdd-9bf8-f21465e60cf6	7fd3b215-1914-4cf4-a388-ae48172e8cbc
bccf1747-284a-4204-805f-70c348f07728	33	8bc1ccbe-87fc-4310-92cf-9488fcba6cca	7fd3b215-1914-4cf4-a388-ae48172e8cbc
027f49e9-cf8c-4df6-b595-f334254e8822	58	6b919610-7010-4850-b49b-982dfb591a0b	400d6025-0e1b-4fd4-bdaa-1d26144a8004
75ac2c9f-92a3-4be4-a215-f81448f26ef4	49	ab912db0-2d96-4258-9d84-62edd04d1913	88269590-6694-4a4c-b513-1e1248155367
40c34ace-243c-464a-a39d-5ccaf9c1e8f6	36	f4bc9cfe-2fff-446f-8bea-637ee8c921d7	ce5cbd9c-c89e-4f1e-b0e7-2a5c479ee603
2e86854e-1371-48db-b6bc-812bad431c94	36	6399a1b7-3ba1-484e-8c02-6d5821abdda8	ce5cbd9c-c89e-4f1e-b0e7-2a5c479ee603
81d57955-370f-4dbb-ab27-4398c2e57d8f	36	d3b20f9d-e05f-4db5-ae56-7012e8d32825	ce5cbd9c-c89e-4f1e-b0e7-2a5c479ee603
4ab502c4-0c2e-4032-b5b1-451253b2aea5	41	877911be-392f-423e-807f-533203d9e5fe	38f1e60e-92ee-4734-ba3f-8a93ce7a0f55
c5938807-ac4c-4662-9325-c47acd150f01	42	b67a6994-c7fd-412a-bed5-f2a23ffc9874	a01010f6-93fc-4746-8a3e-0849c8534522
\.


--
-- Data for Name: seedmap_dyes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.seedmap_dyes (seed_code, seed_name, id_uuid, id) FROM stdin;
\N	JFX650	baf10673-4565-47e2-ac79-a3542ee4f8aa	\N
\N	example_dye	76deac14-11b7-40e1-9f82-cf3d0ede1f5e	\N
\N	example_chemical	d42cdbd0-f12e-4e1f-937c-2fb7f963c67f	\N
\.


--
-- Data for Name: seedmap_fish; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.seedmap_fish (seed_code, seed_name, id_uuid, id) FROM stdin;
\.


--
-- Data for Name: seedmap_fluors; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.seedmap_fluors (seed_code, seed_name, id_uuid, id) FROM stdin;
\N	mGold2s	734ef3a6-bdad-46bf-b3c4-f8b28100bd38	\N
\N	mStayGold	ce5cbd9c-c89e-4f1e-b0e7-2a5c479ee603	\N
\N	mYongHong	0e910b2b-508b-49a0-b219-18e207c2c940	\N
\N	E2Crimson_(iCodon)	176212e8-95ff-415d-9a4a-1d9197b8048f	\N
\N	Electra2 (iCodon)	c5bc2c02-42f6-403d-8787-2451101d5cff	\N
\N	mBeRFP	36ed8d7c-5381-4a58-9e99-3ca34a00b66a	\N
\N	mSG; Halo; Electra; mBeRFP; mScarlet3S2; mTFP1	4f608408-608d-4af9-ab8a-5fc78c45eea7	\N
\N	mScarlet3(iCodon)	a9139f11-bfd2-415a-961a-4fe8daae28ee	\N
\N	Electra	5cc99f6f-94e9-4ec1-838a-e75a820e4c7c	\N
\N	tdmSG; tdmChilada	1dd1dfbf-3056-4ba0-aec3-d62ef81e5725	\N
\N	mYongHong (iCodon)	3faf49a0-1c28-42d4-a703-f8066038d24d	\N
\N	mScarlet	4d2b6ca6-7548-4222-b8c6-21f5910cec5b	\N
\N	mChilada	0a8e1967-2975-4c2e-bf99-d7f0ff55143c	\N
\N	mSG(B)_iCodon	430d818b-59e5-4fa3-8a4c-ff960ca5ed45	\N
\N	Halo	99190692-4a5c-4959-b092-ea5de27e404d	\N
\N	miRFP670-2 (iCodon)	326a82ea-12eb-4874-9298-f979d92862ee	\N
\N	gfp; tdmSG; tdmScarlet3S2	979796d5-811b-4244-a6cc-45bf09ffef32	\N
\N	GFP	0508a22e-d36b-4738-90a7-b265aa30dc3c	\N
\N	mCitrine	22a9f736-fbdb-487c-b61a-a48dd17fdb11	\N
\N	mSG; Halo; Electra; mBeRFP; mScarlet3; mTFP1	ee6f677b-6974-4b28-86e1-e2e56d5bc55b	\N
\N	mStayGold(J)	7f1b592b-23eb-4633-ac3a-15b5c0ec98b5	\N
\N	mScarlet3	7fd3b215-1914-4cf4-a388-ae48172e8cbc	\N
\N	mGold2t	fe62975c-bdb0-4734-8fcc-44bac61786cb	\N
\N	Halo; tagbfp2	f0b8a466-714d-4ef6-86cb-e990330453ca	\N
\N	mKate2	6f4aa032-c1eb-4b3f-9a50-76f978acbecb	\N
\N	gfp; tdmSG; tdmChilada	66e1fb82-c9b5-4d83-aca6-36c0f255a1f6	\N
\N	mKOK (iCodon)	3c48d814-7967-4731-8c59-1e5860b19f94	\N
\N	tdmScarlet3S2	400d6025-0e1b-4fd4-bdaa-1d26144a8004	\N
\N	mYH	a01010f6-93fc-4746-8a3e-0849c8534522	\N
\N	mChilada_MAGPV	0d4be622-70e5-4038-86bd-1b9678fc9228	\N
\N	mSG_(J)_IDT_opt	9aacd2af-44d8-42de-91d3-cf87594ae228	\N
\N	tdmSG(introns)	e2d5b942-5c1d-4689-b0fc-22c9bb8b965e	\N
\N	tdmSG; tdmScarlet3S2	70a88f40-7888-4f27-856d-4f0732f84ae1	\N
\N	tdmSG(J)	3a0d39d1-3cfb-4991-b796-21c4bd06de90	\N
\N	mCitrine (iCodon)	1a6bd0b4-e489-4940-85b3-72efa52a82d6	\N
\N	mSG; mYH	e466c405-e7a9-4ccc-86e9-1f7a383e135d	\N
\N	tdmSG_syntrons(J)	81f8b9e6-39e0-4064-b3b4-33cdd23113d3	\N
\N	mTagBFP2	38f1e60e-92ee-4734-ba3f-8a93ce7a0f55	\N
\N	Electra2	204e4964-dadf-463d-a2fe-11b6a474e8bc	\N
\N	mStayGold C-term	31a16b12-4014-4d99-ac60-6206476316f4	\N
\N	mBaoJin	aee3a898-deae-4273-8838-b2fc440a1ff8	\N
\N	mSG	12336a23-9ea3-4265-b9fe-1f97d63be3be	\N
\N	tdmYH	54446eaf-16df-47be-b958-e80c198e62f0	\N
\N	mTFP1 (iCodon)	c9d5e059-5fe2-4ea1-8eac-c7caca1e8365	\N
\N	??	19f5bbc4-5e3a-4afa-b1a5-0f6fa4bd61bb	\N
\N	mScarlet3S2	836c2c91-f9e7-41b5-8cb0-ac7c661e518c	\N
\N	tdmChilada_MAGPV	44b5169a-109e-49a9-af93-1423ca5e8bad	\N
\N	mTFP1	5f7314ff-7fb6-4f15-bc25-a20d840aca29	\N
\N	mKate2 (iCodon)	77f068ef-47b6-4396-a164-fe40b4d24462	\N
\N	mKOK	bd77b86c-998d-42ed-acc9-662f0e6e30b7	\N
\N	mCardinal_iCodon	7e5e1662-9216-4a6d-a247-e399d4590945	\N
\N	tdmChilada	88269590-6694-4a4c-b513-1e1248155367	\N
\N	tdmSG	d4c367bb-1b63-483b-b37d-9cf7320e1ff0	\N
\N	mYongHong_iCodon	6bce8fb0-0101-499f-9d9e-a1b4458b5369	\N
\N	mSG(J)_iCodon	7cef2fdd-6ce3-49fc-8ac9-85fa0c48854d	\N
\N	tagbfp2	ab28079c-5e31-42e9-aa98-e372d393bd5f	\N
\N	mLychee (iCodon)	92621f8c-c2f8-4d17-b6de-431f6ff78107	\N
\N	tdmSG; tdmYH	5f50e9bd-4585-4b86-a536-bfb2ecd0817b	\N
\N	tdm:mScarlet3S2	a2ec30d3-02dc-4644-97c1-65ae58a80faf	\N
\.


--
-- Data for Name: seedmap_mounts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.seedmap_mounts (seed_code, seed_name, id_uuid, id) FROM stdin;
\N	1	3f8aeebd-eeda-446e-9844-e2994a64eb19	\N
\N	2	b17b698b-c142-472e-976d-ea11fc4c8e4f	\N
\.


--
-- Data for Name: seedmap_mutations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.seedmap_mutations (seed_code, seed_name, id_uuid, id) FROM stdin;
\N	cntnap2	ca2a6ed2-be7f-4b73-b6f7-f709c7fdfaf3	\N
\N	stxbp1b	eb386b98-0687-4767-8be7-79726aeda4f9	\N
\N	scn1lab(s552)	8d2fd769-e329-4f78-b8a7-ab2545221e78	\N
\.


--
-- Data for Name: seedmap_plasmids; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.seedmap_plasmids (seed_code, seed_name, id_uuid, id) FROM stdin;
\N	pDQM115	764ca48f-e7d2-48b8-ab69-45756d652902	\N
\N	pDQM002	4dfdbae4-39c3-4ec3-b435-48f33c82c957	\N
\N	pDQM007	d64a00c2-596b-4149-8973-942b1d968823	\N
\N	pDQM008	8a10b634-8cc1-451f-9e59-d36491dad17a	\N
\N	pDQM010	e5182491-b55a-4871-b41b-f2f98f981ff9	\N
\N	pDQM012	cf6c1acd-e5a3-4c36-b94b-d95fa2386b7e	\N
\N	pDQM015	ad50b6b8-4ac5-492d-b919-189d0a723f1a	\N
\N	pDQM017	a589cb5d-ce24-4202-a6c6-0e95813504d7	\N
\N	pDQM019	90814e67-dd38-405a-8215-aa599f4cebf6	\N
\N	pDQM021	7997105d-23db-4174-bfd1-e813a8d8ded8	\N
\N	pDQM023	62406614-e20c-40de-8f31-3fe1b1599787	\N
\N	pDQM025	bbff70d8-ad1a-40ab-bc97-dd60ddcdc294	\N
\N	pDQM031	48563cff-fde4-4c77-84b3-a0911886f2f0	\N
\N	pDQM033	831cca25-93d8-4fa7-b6d3-8d67fcd68912	\N
\N	pDQM035	f6799c1d-fc58-429e-99bd-abdcd87f71d7	\N
\N	pDQM038	a23e5d94-31aa-489b-8909-bfe5f528c140	\N
\N	pDQM040	817a24c2-709c-47a8-a2a0-5ff5a85d06af	\N
\N	pDQM042	a0b2bce2-b401-4f7c-9b3d-e0a03f8129f9	\N
\N	pDQM044	b388f37a-23e4-437c-9641-e729b17d0c4e	\N
\N	pDQM046	f1dc3dd0-4208-4854-8e41-7711d4c4c99f	\N
\N	pDQM047	16cb842d-771d-43b2-b1b2-401d1b934110	\N
\N	pDQM048	8bbd5cf0-9f9e-4a2c-9c21-1864314211b6	\N
\N	pDQM049	fd67d6a8-fbcd-48b0-8139-636728ef1a37	\N
\N	pDQM050	97e4a640-7829-45c7-99ac-d7990c562dc9	\N
\N	pDQM052	2d6599ae-6a64-4718-8df2-7a4c6d6d057c	\N
\N	pDQM054	b29992d2-3dd9-4809-99cb-c1ab4625fddb	\N
\N	pDQM056	04bf396f-31fb-41ca-9061-f8986b305635	\N
\N	pDQM061	1b5d06f9-47bc-4ac8-b667-d00dddc6a859	\N
\N	pDQM062	78a81210-b788-42cf-8f7e-682016c4e343	\N
\N	pDQM064	1a39296e-6053-4820-aff9-4dfc7daabdd5	\N
\N	pDQM066	8834af1e-a995-4c20-86d7-e038d410be0f	\N
\N	pDQM069	2a7d2eec-a346-475d-b64d-4e48df71f8a8	\N
\N	pDQM016	c738a9cf-d377-41f4-819e-6f0bcbeb288f	\N
\N	pDQM018	f5d71bfe-00ff-4e3d-9e20-d2f70f02a176	\N
\N	pDQM020	45fd8195-7937-49db-bc30-5847aa63b761	\N
\N	pDQM022	c011d5c8-68a7-45ee-8085-f508e06080d9	\N
\N	pDQM024	d94410c7-6a71-4eb5-b46c-6993631aa183	\N
\N	pDQM026	8b50ff59-f048-40c6-bcaf-eb493158bb69	\N
\N	pDQM027	77fa23c9-aaef-4d32-9653-03931d18bb91	\N
\N	pDQM028	a21489f6-aa3d-4fd1-966d-9ef54906d1f5	\N
\N	pDQM029	f5467d38-faa7-41e5-ba54-33b0ed12080e	\N
\N	pDQM030	80d09a12-8a49-4e9c-9ba3-fef186419985	\N
\N	pDQM032	b7752996-5fc0-43d4-8368-4dccb98651f0	\N
\N	pDQM034	d779a275-cc70-4f08-bf57-18893696ac06	\N
\N	pDQM036	a412d457-1eb6-4fb6-ac09-6e2531e9c8bb	\N
\N	pDQM037	38edec6b-6bb9-41a2-a094-773607d037fa	\N
\N	pDQM101	b5771f6f-8b85-4802-8c4d-cb04c1dc02fd	\N
\N	pDQM039	0bdb6791-f35d-4f70-a0b0-61d503b63f6c	\N
\N	pDQM041	4251f2ae-2852-4dab-8395-216de940cf5a	\N
\N	pDQM071	36fd84a4-cf21-487b-9d23-c85c1a28f356	\N
\N	pDQM073	c53899c8-1c4c-4bd1-8220-97dff2b70cbc	\N
\N	pDQM074	570a29bd-0362-4299-97e7-c781c52054c2	\N
\N	pDQM075	7feeaf05-7c78-4605-a889-e88edc2f6a0a	\N
\N	pDQM077	36bcc9bb-e22b-419f-bb1a-ba76d087c887	\N
\N	pDQM078	3fe5fb5a-d0ff-4906-8eb1-29297f4af037	\N
\N	pDQM080	4326d304-7367-476b-b0ad-838ded3efdfe	\N
\N	pDQM091	404c15fc-8ba9-4023-a477-45d4aee75c8f	\N
\N	pDQM043	b2e45429-9d64-442e-9471-891e8dceb48d	\N
\N	pDQM093	ba81bc7c-8d0e-4336-9935-bdb81c1d806f	\N
\N	pDQM099	93a3f3b0-2a23-4676-832c-0922c2ccebd8	\N
\N	pDQM051	23912836-3627-4683-bc34-4cb296e150ac	\N
\N	pDQM053	c9e7e2ff-0ff0-4324-b42d-7adddeae116d	\N
\N	pDQM055	4d22e510-17d5-4f2c-8eaa-7472bed67e6c	\N
\N	pDQM057	02870783-031b-4186-a450-626b6900e9fc	\N
\N	pDQM058	76f291ca-7ba2-420d-b0dc-5e17c4c03632	\N
\N	pDQM059	58e5a678-0706-4486-a39e-46e947b60347	\N
\N	pDQM060	2be3e21a-f818-48de-972f-cd14dd2aa9ad	\N
\N	pDQM063	4558a7be-c7e0-4028-9b22-a43a8923f576	\N
\N	pDQM065	392efab2-1852-48ca-87ba-0b24953c6d54	\N
\N	pDQM067	bde4596a-89de-47ff-a219-bde080388e80	\N
\N	pDQM068	a11bfcc4-4d59-46fd-83dc-4ad5842d348d	\N
\N	pDQM070	6f96938a-98e2-4ad9-b428-1642f432dd1b	\N
\N	pDQM072	fbec68d7-56d9-48c9-8fcd-7a52eea2452d	\N
\N	pDQM076	c0b6dc0b-e18b-418b-b041-272b887a9ef9	\N
\N	pDQM079	1f1561cd-eb58-4861-9786-230a6555a060	\N
\N	pDQM081	1d1d2063-2d74-4409-9eb8-599da48f0f18	\N
\N	pDQM082	03056555-ad65-4664-8dcb-699ccce2b11d	\N
\N	pDQM083	d244cd27-ab14-44e9-a427-a442404fdf8f	\N
\N	pDQM084	819e94ac-1ca7-492e-89ef-4b532186e957	\N
\N	pDQM085	7bf4ac5e-4b94-40c4-80b8-29ca223cc306	\N
\N	pDQM086	b7e78d79-2bb1-4d7e-9d77-e1e12ec195af	\N
\N	pDQM087	45bb1c8c-445c-4c9f-8bd1-65a7e578eee7	\N
\N	pDQM088	8a719f60-8aeb-4049-a62c-24e4f6c64f4b	\N
\N	pDQM089	488c8492-5a1a-437a-9f04-ab60549e80ec	\N
\N	pDQM090	8deee4fc-0133-49cc-83be-144fc136b5eb	\N
\N	pDQM092	80edb624-2e28-4545-9532-1cbf35f8014e	\N
\N	pDQM094	1846215d-4c16-4a87-abbf-cb0e46394355	\N
\N	pDQM095	30c1a20c-c723-44b3-b62a-6cf49dc2c8ce	\N
\N	pDQM096	1e62b32a-508d-492d-88db-734d8b89fcc6	\N
\N	pDQM097	ede5a312-2512-49e1-84e6-707cf29b35b0	\N
\N	pDQM098	40fb10fb-b350-475b-b230-4a3c7a34fe87	\N
\N	pDQM100	afe9e636-e560-42d5-b90e-66299ebfd489	\N
\N	pDQM102	488ab318-c380-48cd-8ab6-70a70b3f029a	\N
\N	pDQM104	eddcb5ba-9471-4eaf-8344-631494c66dad	\N
\N	pDQM105	f0c140a7-ca64-4751-acb8-0ad868d1ba08	\N
\N	pDQM106	98f73ad9-2fa3-4349-bd40-538a073ddff0	\N
\N	pDQM108	3d9d1bff-3387-4673-82e8-553a7b205fef	\N
\N	pDQM110	b2d8f24c-87af-4522-b4ca-67c90926b973	\N
\N	pDQM112	848a0b58-96e1-444f-8d86-751668dd5293	\N
\N	pDQM114	9d79d939-3827-4f0f-843a-1d45a64511ab	\N
\N	pDQM117	8089bf51-0a6e-4d33-9975-2d26036abc9b	\N
\N	pDQM119	5fc88a61-86c9-4932-aa20-051edbd24ca4	\N
\N	pDQM120	6ec81ccf-1bce-4c59-90ea-013512f4930d	\N
\N	pDQM121	4a22b996-557e-4939-aeb8-da2250dc267a	\N
\N	pDQM122	27f73f48-a3f0-4888-9083-cbcd5857286f	\N
\N	pDQM124	9a99db4e-733e-40aa-8754-d34db9190692	\N
\N	pDQM125	11900e3c-07f9-4ec7-9e7d-f0037e4f29bc	\N
\N	pDQM127	6ab1b6a5-078a-4185-a506-d90ae0e9e082	\N
\N	pDQM128	dae53867-1310-4a8e-9a3e-94bbc266b4ae	\N
\N	pDQM129	b71e59ac-dc62-4cd9-94a2-c6c203b840c9	\N
\N	pDQM130	b42e3445-72de-4c31-be0e-e2e5d7c60bea	\N
\N	pDQM132	9219c2df-2ae3-4984-baf6-5f616d0087e1	\N
\N	pDQM133	3e1fd2e3-30c0-4e05-a28c-4017792cd2f2	\N
\N	pDQM134	3571d532-ca7a-44d4-80c2-15b97f9aa87f	\N
\N	pDQM136	9a22a344-4e21-4fcc-bd04-3ed9df9f3068	\N
\N	pDQM137	ba81872c-7bc7-4e51-95fa-26c0b8f542e1	\N
\N	pDQM138	33e17c7a-8577-4ec2-a6cf-1b7a196bb552	\N
\N	pDQM139	e713e211-2ca3-408d-b9ec-b122571b08b5	\N
\N	pDQM140	66ab71fe-ef88-4744-a59b-53cf243746f3	\N
\N	pDQM141	a4a4818b-26f5-4be1-be4e-c47dfda686db	\N
\N	pDQM142	8177e6a8-bcd8-4555-8a19-ec5c92904321	\N
\N	pDQM143	542613f9-2f90-4212-93c5-d06580c47c6d	\N
\N	pDQM144	9b44d1c1-5f60-4a16-865d-cb00c9fd525c	\N
\N	pDQM145	5dd136d1-9121-4497-97b6-6d83dc8d2020	\N
\N	pDQM146	bb954965-26e2-45a4-9807-0a26ef24ef74	\N
\N	pDQM147	e3d82211-edd8-41a4-838d-4deb95ee86a1	\N
\N	pDQM148	3bf0fa9e-edaa-49ec-af17-f80a9fb1413f	\N
\N	pDQM149	d877468b-cc9d-48db-8177-df36da3197f9	\N
\N	pDQM150	81f768d1-7d78-48dc-8d55-ba47addbc3b4	\N
\N	pDQM151	47c16c2a-35a1-4f5d-b7d4-3f3843688499	\N
\N	pDQM152	1ad14276-9876-4758-aa32-952a8002f487	\N
\N	pDQM153	6250fba6-3e6a-4785-b7f9-3cfd60768611	\N
\N	pDQM154	fbd5ee7c-9b9f-48dc-9269-9c668fc17c7d	\N
\N	pDQM155	95e3d1d8-2850-467f-8a89-d1ea283df981	\N
\N	pDQM156	8b230d61-b01a-4cbf-bc3a-51e6c324d192	\N
\N	pDQM157	0272698b-012e-4af4-b7c8-dc847d94aa79	\N
\N	pDQM158	9adc1416-15ce-4c7f-8cdd-47fd1435ec2d	\N
\N	pDQM159	2fc72379-5c0b-4c73-b6b7-697a71af2eb8	\N
\N	MGCO-01	02b5aaf9-5a7b-480b-bdbd-66938a5074a8	\N
\N	MGCO-02	41ce2ceb-c845-4e9b-af56-6f488de9652a	\N
\N	MGCO-03	7b7051d4-71a2-4eab-a2fe-b244f83487c4	\N
\N	MGCO-04	06c20a2b-72ff-4de0-9c61-a3b023bd0985	\N
\N	MGCO-05	470f0fbd-2e9e-4a0d-ae29-0d906cea35be	\N
\N	MGCO-06	14368017-a418-4800-99b4-345c06051242	\N
\N	MGCO-07	b1c9a3ef-729c-4808-9a8e-550a82efdac8	\N
\N	MGCO-08	f8a992cd-8d22-4299-bcff-7401b984c204	\N
\N	MGCO-09	c958096e-2d4b-43a6-ad1f-effd5ed123d0	\N
\N	MGCO-10	b0eb262e-822e-44fb-a4b6-198ee190690e	\N
\N	MGCO-11	46717835-247f-40b3-a46d-e807a3a2d7f6	\N
\N	MGCO-12	5500118f-9a93-47b3-8839-c46c8a1d3b11	\N
\N	MGCO-13	2f56dc9a-af5e-47c6-84df-33dcc926b362	\N
\N	MGCO-14	d7613934-a9a9-4c02-ab52-757d6a077b70	\N
\N	MGCO-15	a11d6782-fa07-480b-be62-e5ef3850c8e2	\N
\N	MGCO-16	9985dbc7-735a-4c93-a36c-d464db8402b4	\N
\N	MGCO-17	bf049315-1e2c-4aee-80eb-bfded31e5284	\N
\N	MGCO-18	2d5fee97-bf2d-4218-85f8-45e2dd30df53	\N
\N	MGCO-19	b82efac0-f593-45d8-ae4c-ce540269f118	\N
\N	MGCO-20	93375546-21ba-4db6-997b-80c04d30bb3e	\N
\N	MGCO-21	aac82191-00ae-4c99-ac6e-759848034b8b	\N
\N	MGCO-22	ae78b1c0-b1a4-462d-b1f6-7324d57eb26d	\N
\N	MGCO-23	a7ce3ca0-fa73-45fc-944a-d470f2c31a38	\N
\N	MGCO-24	b499c9cc-a2ee-4f81-9462-3081ea41ce44	\N
\N	MGCO-25	ae559e2c-1101-439a-816b-f2cb85f3b0b6	\N
\N	MGCO-26	862e3ba2-7129-4a52-aad5-22202d47c715	\N
\N	MGCO-27	49c17eea-fa13-4814-89f8-779538d5ef1e	\N
\N	MGCO-28	b4203af3-52f6-4784-a8ff-4cb1213f72a8	\N
\N	MGCO-29	84b4ed64-da82-471b-83d4-05dc12996139	\N
\N	MGCO-30	6cc9139a-bfc7-4399-9d59-1429305aa37b	\N
\N	MGCO-31	fe2d0d79-8970-408a-89dd-58a5d72d0087	\N
\N	MGCO-32	87e745aa-56c4-48e4-92d0-a35de7cdc870	\N
\N	MGCO-33	33d33bc4-a2e0-4d7a-9bd5-8c143fbdfc1b	\N
\N	MGCO-34	4d227a0d-a173-4607-b3bf-e83b49f918e4	\N
\N	MGCO-35	48d9447b-c268-486f-ac9e-972e7d106592	\N
\N	MGCO-36	8189a86e-2891-449d-a2cc-4f7787a0e9d3	\N
\N	MGCO-37	6ce5b76e-c602-4769-8cac-3f24a6142f81	\N
\N	MGCO-38	86658104-60b5-44d4-8233-593445965941	\N
\N	MGCO-39	55c52917-f064-493d-8130-3a86b303c758	\N
\N	MGCO-40	b88b9d0f-5f80-4378-b26e-b9f6671f6217	\N
\N	MGCO-41	b09bebc3-4bb9-47e2-8b59-d34132ecd912	\N
\N	MGCO-42	4c5d6615-24c5-4c76-87dc-594962dd9619	\N
\N	MGCO-43	f6701458-4732-43cc-8547-0c8aff18a96d	\N
\N	MGCO-44	6e383555-701a-4c5e-91fe-0bd55fad853e	\N
\N	MGCO-45	f90098fb-586c-4408-88cf-12cbdcfd175c	\N
\N	MGCO-46	46205e06-0f35-4b4b-8909-3e6149ddc52f	\N
\N	pDQM001	08f2f5d9-1c9f-41cd-b594-801271480ed9	\N
\N	pDQM005	e9a2053b-b8ec-4d7f-85fa-eae4812c2582	\N
\N	pDQM006	4211baeb-07e8-40cc-a08e-4b0dffed17da	\N
\N	pDQM009	33bef132-5daf-46e1-922b-7191723dd6ca	\N
\N	pDQM011	ca2c0ef0-80d9-42b6-955d-638908d1fa72	\N
\N	pDQM013	980f4894-a5cd-4e89-9fc5-72cae1ff1978	\N
\N	pDQM014	da4b113f-9697-4690-9016-758e7af1053a	\N
\N	pDQM045	480fd428-9ce1-4d48-9ca8-6e567b5636fb	\N
\N	pDQM103	b6659ace-c5ca-4bdf-bf91-f14c8ec7e105	\N
\N	pDQM107	7dfa6856-b179-4024-9bfb-9fe10ca797b1	\N
\N	pDQM109	335b70fa-a2ae-4252-b709-222e448c0c0b	\N
\N	pDQM111	2d50ccc0-945b-484a-a0d5-79976e2f64c1	\N
\N	pDQM113	ceee4456-d51c-4c91-a09d-26e14eacfb46	\N
\N	pDQM116	943f4caf-e567-49d8-98ac-fc8f71fdd845	\N
\N	pDQM118	39ea62b4-6ebb-43f7-925d-fdfcd00f90a8	\N
\N	pDQM123	98258c6d-b175-444c-9838-f7d6a5fb95ef	\N
\N	pDQM126	fa380739-b0f9-43e9-b890-d0c725533ce2	\N
\N	pDQM131	02989ced-f729-4eef-99b5-bea7d359c2e9	\N
\N	pDQM135	e876478f-123b-43a5-9863-96c86c1a9032	\N
\N	pDQM160	7a014f12-bc7d-424e-8dad-dea5bb0e4a88	\N
\N	MGCO-47	120b5881-17a9-483d-971d-d0f816302d17	\N
\N	MGCO-48	e9e5eff9-a652-44ba-930a-694b7dd098ec	\N
\N	pMNM001	9ab80949-5071-4756-801b-180dfd86c7b9	\N
\N	pMNM002	c36abc45-b863-4b87-bec8-49b92b12e948	\N
\N	pMNM003	85b064d3-090e-410b-a655-30785beb8086	\N
\N	pMNM004	35e6aa4e-9426-4655-a014-63d8ed5a5217	\N
\N	pMNM005	344a6d1d-f10d-4f6f-a18c-70272c9dd330	\N
\N	pMNM006	7b014633-354a-4ff6-8623-9cc20dbfa5e9	\N
\N	pMNM007	2c66aeb5-29b7-4433-af28-bd9901cd8c85	\N
\N	pMNM008	d1dbb2fe-4384-45b8-9712-2b503760abb5	\N
\N	pCNH001	22fa4951-1580-49ce-a950-eac22b9365fa	\N
\N	pCNH002	55b7f16c-0839-4a6a-bb67-3846e362c9ce	\N
\N	pCNH003	96d9da72-33a2-4553-8c5d-7c15468d747d	\N
\N	pCNH004	b564e41a-091f-4c71-b48c-8ab16b5dd156	\N
\N	pCNH005	b16c69fc-acc1-4477-9bfa-6c12c5041a1e	\N
\N	pCNH006	d4e8218e-fe00-4d1a-805e-5f236d31b6fa	\N
\N	pJWL001	1c7f99d5-3db1-4200-ba00-3656e32f166e	\N
\N	pJWL002	8e0dad2d-9f5e-432d-8a46-fa54938e3b32	\N
\.


--
-- Data for Name: seedmap_rna; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.seedmap_rna (seed_code, seed_name, id_uuid, id) FROM stdin;
\N	nan	b4834bcd-d042-4b9a-a42f-c259d82b9346	\N
\N	Demo mRNA	bedd3ce2-6b6b-4dce-977c-5bc099353257	\N
\N	mYH:H2B	b67a6994-c7fd-412a-bed5-f2a23ffc9874	\N
\N	mScarlet3-S2:H2B	9ab20cce-d03d-4b6f-b68e-46854dc000a4	\N
\N	mBeRFP:H2B	cf1dd8a2-481e-4721-a6a0-26885caca024	\N
\N	mChilada:H2B	4321b6c9-c276-45ac-8355-458e4199f1f1	\N
\N	2xLynk:mSG	7a572491-facb-4651-8ab7-7ec1edbe926d	\N
\N	2xLynk:mChilada	9a727a16-c1c3-493b-97be-7055eb1f076d	\N
\N	2xLynk:mScarlet3-S2	0c7ac4a7-0116-4f71-9ab5-9c33e1c19dc3	\N
\N	phiC	b268621d-46f7-4303-97ff-3711dc41240c	\N
\N	phiC-NLS	a9aeb4eb-1baf-44b1-87e9-def657536513	\N
\N	2xCox8A:mSG	bca56551-cfcf-47c9-a582-56ba0a0e4c7e	\N
\N	2xCox8A:mChilada	24d89752-7491-472e-876d-327298f8b3f8	\N
\N	2xCox8A:Halo	b227215e-afe1-49a5-af8b-fb3c422310b3	\N
\N	2xCox8A:mScarlet3S2	f13b0251-0829-487d-8332-adf09443b6e8	\N
\N	mSG:sec61b	0a909b37-f2fb-456b-8346-29e30429dce4	\N
\N	mChilada:sec61b	12ee1057-4f2b-4df9-ad14-155968224121	\N
\N	Halo:sec61b	f7aee1a8-dba4-4985-9119-22aa5880ab05	\N
\N	mSG:GM130	77ebcae2-444c-4f34-b0a9-05d37bf7387b	\N
\N	mChilada:GM130	8340abb6-4a52-4922-ab24-abd4f8164e45	\N
\N	Halo:GM130	23b83eff-9c30-4117-8be6-063d811ac054	\N
\N	TGN:mSG	bb348285-3892-4ca9-b0df-3cf2a3fb262c	\N
\N	TGN:mChilada	adb0011a-19cf-40ea-8788-30700bd2a5f6	\N
\N	TGN:Halo	23a8778a-7d09-4779-8b03-b75ac1132448	\N
\N	mSG:rab5a	2a3387e4-0cb2-4fab-aeea-373bce5fe07b	\N
\N	mChilada:rab5a	86bfc340-5915-4793-a7dd-a66fb342c4a8	\N
\N	Halo:rab5a	550786ad-016c-4688-a92f-97a977e2d3a8	\N
\N	LAMP1:mSG	e4d430a6-f375-4952-a9ab-6c27cca2ef5b	\N
\N	LAMP1:mChilada	1f694da8-62c1-4298-b566-3ad96cedd2b0	\N
\N	LAMP1:Halo	366cc763-7067-40c2-8ac1-2b2dd5017f97	\N
\N	Arl13b:mSG	114aa998-0373-4ecc-82ad-4e7c242fff79	\N
\N	Arl13b:mChilada	812666a4-461c-48bf-a455-6905bedd3fa7	\N
\N	Arl13b:Halo	32021db2-6ab6-4076-ad71-870278098226	\N
\N	mSG:alpha-tub	ab42c02d-f016-48e6-a404-4b0f68052274	\N
\N	mChilada:alpha-tub	9d4fac1e-e7ab-4e3a-bb33-bf8902b06e64	\N
\N	Halo:alpha-tub	912b278f-416f-4ae3-8142-8212ff5c3a6d	\N
\N	Vimentin:mSG	3c584d0e-0b10-469c-885e-476eb9f7c36e	\N
\N	Vimentin:mChilada	78408a0e-0076-4b4b-93c9-02a4b665a17c	\N
\N	Vimentin:Halo	552f6f63-5419-434d-9121-2ad2ef5f0bc4	\N
\N	Lifeact:mSG	dcea2117-8958-485d-8672-0cdc6b142b0d	\N
\N	Lifeact:mChilada	1dee44dc-2e61-4d93-9686-29698cc4fae2	\N
\N	Lifeact:Halo	1793c66a-1b19-4d9c-858f-2638c81c082b	\N
\N	mSG:MYH10	f2d2a807-c53a-43a3-a3ad-9087384ba171	\N
\N	mChilada:MYH10	4cc55295-ce52-4681-86d1-a2fce6b0e216	\N
\N	Halo:MYH10	255435e2-c595-46c3-9b77-7623012b5315	\N
\N	tdmChilada:PCNA	ab912db0-2d96-4258-9d84-62edd04d1913	\N
\N	tdmScarlet3S2:PCNA	6b919610-7010-4850-b49b-982dfb591a0b	\N
\N	mScarlet3S2:sec61b	0e4aa7f5-a6e0-4cc7-9d97-49670a6194f6	\N
\N	MGCO-23 (LifeAct-mStayGold)	d3b20f9d-e05f-4db5-ae56-7012e8d32825	\N
\N	HC-1 1:NLS-mScarlet3	8bc1ccbe-87fc-4310-92cf-9488fcba6cca	\N
\N	HC-2 2:NLS-mScarlet3	d73b1f84-81bf-4cdd-9bf8-f21465e60cf6	\N
\N	HC-3 3:NLS-mScarlet3	edaeab29-e8ef-4883-b2c1-ab70085f79d1	\N
\N	HC-4 5:NLS-mScarlet3	8220350b-66cb-4cee-bd0e-33103ca1c05c	\N
\N	HC-5 7:NLS-mScarlet3	e26a26a1-0a56-4c05-96ca-c74aa948e209	\N
\N	HC-6 9:NLS-mScarlet3	69c89d24-c09a-43b3-ba79-5356363f7d0a	\N
\N	HC-7 Vimentin:mScarlet3	85696980-de37-408f-972a-d5e59a37f5c1	\N
\N	HC-8 Lifeact:mScarlet3	cf8f584c-d180-49e3-88d8-a9851721d9da	\N
\N	HC-9 Lifeact:mStayGold	6399a1b7-3ba1-484e-8c02-6d5821abdda8	\N
\N	HC-10 4x-Cox8:mStayGold	f4bc9cfe-2fff-446f-8bea-637ee8c921d7	\N
\N	HC-11 mTagBFP2:SKL	877911be-392f-423e-807f-533203d9e5fe	\N
\.


--
-- Data for Name: seedmap_selectedphenotypes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.seedmap_selectedphenotypes (seed_code, seed_name, id_uuid, id) FROM stdin;
\.


--
-- Data for Name: seedmap_strains; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.seedmap_strains (seed_code, seed_name, id_uuid, id) FROM stdin;
\N	TUAB	1c318a0c-177b-4e82-9873-47c6ca220eb8	\N
\N	casper	a1c24336-e1ff-492a-9c5e-41ac6d12d5d4	\N
\N	WIK	1223f3ca-15b4-4d48-a60d-528c41084f29	\N
\N	AB	b618f4ce-2c5e-4da9-b979-93c888938936	\N
\N	TU	f8f5a767-fec1-4ac6-b05c-92597284a09e	\N
\N	unknown	8884902e-e766-496a-8ab1-a5dfe18ba8c2	\N
\.


--
-- Data for Name: seedmap_tanks; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.seedmap_tanks (seed_code, seed_name, id_uuid, id) FROM stdin;
\.


--
-- Data for Name: seedmap_transgenes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.seedmap_transgenes (seed_code, seed_name, id_uuid, id) FROM stdin;
\N	Tg(pDQM005)301	4cc58856-c13e-4869-8e75-24ac0896839e	\N
\N	Tg(pDQM005)302	10bf1ff1-6319-4652-854d-ea3395062d22	\N
\N	Tg(pDQM005)303	f1d83281-b122-4f78-8cc4-a335d5d99d9d	\N
\N	Tg(pDQM005)304	e7649271-27c7-455f-b228-49b77316ec2d	\N
\N	Tg(pDQM005)305	a9ddc972-2df1-4624-b36d-e9719d06f525	\N
\N	Tg(pDQM005)306	71ae54b7-4da8-4fb6-af08-1fb7008545fe	\N
\N	Tg(pDQM005)307	d29266fd-f153-42c0-b0a3-137a6006f6da	\N
\N	Tg(pDQM005)308	1a10d920-8597-47b5-833e-7797bee19299	\N
\N	Tg(pDQM034)309	6df5ca5a-05cb-48cf-89be-143e90a47e92	\N
\N	Tg(pDQM034)310	054f56c0-1a0b-443e-a54a-58d0c47847ba	\N
\N	Tg(pDQM063)311	a0a87dca-12c8-444e-94a1-9d106960c10d	\N
\N	Tg(pDQM063)312	163f0308-840f-485c-bc05-24de7dac04f1	\N
\N	Tg(pDQM063)313	04845ee0-936f-4dbd-b386-2532d2d2f756	\N
\N	Tg(pDQM063)314	db86082a-2cc4-43aa-b476-208f859ee52a	\N
\N	Tg(pDQM082)315	b14cdedf-9eb3-454c-abd2-ae76033a645a	\N
\N	Tg(pDQM082)328	16f4a8aa-e9a1-4019-a997-c40c0caf9123	\N
\N	Tg(pDQM059)316	e54880f4-ab1f-4b68-b6e3-570300089401	\N
\N	Tg(pDQM137)329	332afbec-b3b9-4f6c-b3a0-17d28892f153	\N
\N	Tg(pDQM034)317	39b59955-40e9-483d-a9e8-0d6913098904	\N
\N	Tg(pDQM036)318	6dd019eb-af90-4782-a4b2-ce4a600b5287	\N
\N	Tg(pDQM036)319	dc32f9e0-b8d3-430f-a480-0839311e03e5	\N
\N	Tg(pDQM059)320	4e2743a7-64c6-431d-aefa-d886f1eabb28	\N
\N	Tg(pDQM059)321	86c009a7-e613-4e85-b416-fbfb941c4283	\N
\N	Tg(pDQM112)322	c2c97dd1-9015-4fb8-99fb-ad815a878f2a	\N
\N	Tg(pDQM112)323	9b026b99-48ac-493d-a930-5f9230dd295b	\N
\N	Tg(pDQM133)324	dc35cc02-2805-4f2b-b322-5f84ee082190	\N
\N	Tg(pDQM136)325	f5d39b3b-aabd-4a3e-9773-f59e5e4c3e16	\N
\N	Tg(pDQM136)327	3eafe7a2-db78-41c9-9046-5a95eab28e60	\N
\N	Tg(pDQM094)326	ef43e821-2e6b-4efa-b0c1-96461a3038e2	\N
\N	Tg(pDQM112)334	ca164bab-0583-4aab-86b0-591ccaf28e21	\N
\N	Tg(pDQM112)335	8efc1c9c-637f-472e-ba2f-6dfb72cc356b	\N
\N	Tg(pDQM137)330	c68f7340-148b-4bed-a95c-d2c598d4d838	\N
\N	Tg(pDQM137)331	4f2e5303-eca9-426e-bb7f-4e932f36b25e	\N
\N	Tg(pDQM137)332	7a55d3ba-3c7c-4198-8e5d-2bf63fc118f6	\N
\N	Tg(pDQM137)333	c9ab00c7-f93e-4e46-9988-6e325956c428	\N
\.


--
-- Data for Name: seedmap_treatments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.seedmap_treatments (seed_code, seed_name, id_uuid, id) FROM stdin;
\.


--
-- Data for Name: selectedphenotypes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.selectedphenotypes (id, name, type, description, created_at, created_by, id_uuid) FROM stdin;
\.


--
-- Data for Name: staging_dyes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.staging_dyes (name, type, description, notes, excitation) FROM stdin;
example_dye				
example_chemical				
JFX650				
\.


--
-- Data for Name: staging_fish; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.staging_fish (name, fish_code, sex, date_birth, line_building_stage, status, background_strain_name, tank_code, mom_code, dad_code, notes, created_by) FROM stdin;
#1 4FP crya F2s	FSH-2025-0001	\N	2025-02-26	P0_founder	\N	\N	\N	\N	\N	\N	\N
#11 male Ben F2 male 2 x #7 female JIM F2 female 2	FSH-2025-0002	\N	\N	F1_ox	\N	\N	\N	\N	\N	\N	\N
#2 5FP crya F1 male (Chris); #1 4FP exorh F2 female(3) (LINN)	FSH-2025-0003	\N	2025-02-17	\N	\N	\N	\N	\N	\N	\N	\N
2xLynk:tdmSG (rescued)	FSH-2025-0004	\N	2024-11-18	\N	\N	\N	\N	\N	\N	\N	\N
301 ef1a:2xlynk:tdmSG female x skittles 5FP exorh male C	FSH-2025-0005	\N	2025-03-26	\N	\N	\N	\N	\N	\N	\N	\N
301 tdmSG x H2B:Halo csp	FSH-2025-0006	\N	2025-02-17	\N	\N	\N	\N	\N	\N	\N	\N
301 x H2B:Halo	FSH-2025-0007	\N	2025-02-17	\N	\N	\N	\N	\N	\N	\N	\N
Abe	FSH-2025-0008	\N	2024-10-01	P0_founder	\N	\N	\N	\N	\N	male #5 25%+ positive rate - currently best founder (but 2 alleles, one dim one bright(er)?	\N
Astrocytes mKate2	FSH-2025-0009	\N	2024-11-26	potential_founders	\N	\N	\N	\N	\N	1 tank started - screened all negative	\N
Ben	FSH-2025-0010	\N	2025-02-26	F1_ox	\N	\N	\N	\N	\N	F1s of male #11  ~20% positive rate (~5 fish survived to adulthood)	\N
Casper F2 (Monday)	FSH-2025-0011	\N	2024-08-27	na	\N	\N	\N	\N	\N	\N	\N
Casper F2 (Sunday)	FSH-2025-0012	\N	2024-08-27	na	\N	\N	\N	\N	\N	\N	\N
Casper F2 (thursday)	FSH-2025-0013	\N	2024-08-27	na	\N	\N	\N	\N	\N	\N	\N
Casper F2 (Tuesday)	FSH-2025-0014	\N	2024-08-27	na	\N	\N	\N	\N	\N	\N	\N
Casper F2 (Wednesday)	FSH-2025-0015	\N	2024-08-27	na	\N	\N	\N	\N	\N	\N	\N
casper F2 screen for mSG	FSH-2025-0016	\N	2024-08-27	\N	\N	\N	\N	\N	\N	\N	\N
casper/rnf	FSH-2025-0017	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
cell cycle state sensor + histone	FSH-2025-0018	\N	2024-12-05	potential_founders	\N	\N	\N	\N	\N	1 tank started	\N
Chris	FSH-2025-0019	\N	2024-10-01	P0_founder	\N	\N	\N	\N	\N	male #2 good founder	\N
crya:mSc;skittles 5FP founder #11: skittles 4FP exorhGFP	FSH-2025-0020	\N	2025-10-29	F1xF1	\N	\N	\N	\N	\N	\N	\N
crya+5FP skittles male #11 F2s	FSH-2025-0021	\N	2025-02-26	F1_ox	\N	\N	\N	\N	\N	\N	\N
csp/pIGLET 14a	FSH-2025-0022	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
csp/pIGLET 24b	FSH-2025-0023	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
Dennis	FSH-2025-0024	\N	2024-10-01	F1_ox	\N	\N	\N	\N	\N	F1s of male #14	\N
Ed	FSH-2025-0025	\N	2025-02-26	P0_founder	\N	\N	\N	\N	\N	male #1 - 10+ fish survived	\N
ef1:mem:Halo het/homo? csp?	FSH-2025-0026	\N	2025-04-29	\N	\N	\N	\N	\N	\N	\N	\N
ef1a: skittles 5FP	FSH-2025-0027	\N	2025-10-01	potential_founders	\N	\N	\N	\N	\N	\N	\N
ef1a:2lynx:tdmSG 301 ix + pDQM112 hsphiC:NLS	FSH-2025-0028	\N	2025-04-17	potential_founders	\N	\N	\N	\N	\N	\N	\N
ef1a:2xlynk:tdmSG #11 F2 inf ox	FSH-2025-0029	\N	2025-04-17	F2_ix	\N	\N	\N	\N	\N	\N	\N
ef1a:2xlynk:tdmSG #11 male x csp ox	FSH-2025-0030	\N	2024-11-25	F1_ox	\N	\N	\N	\N	\N	\N	\N
ef1a:2xLynk:tdmSG 301 ix F3	FSH-2025-0031	\N	2025-04-18	F2_ix	\N	\N	\N	\N	\N	\N	\N
ef1a:2xmem:tdmSG #8 male F2 less bright cs ox	FSH-2025-0032	\N	2024-11-12	to_kill	\N	\N	\N	\N	\N	\N	\N
ef1a:2xmem:tdmSG F2 ix (#11)	FSH-2025-0033	\N	2025-03-03	F2_ix	\N	\N	\N	\N	\N	\N	\N
ef1a:2xmemitdmSG 301 F1 (#2)	FSH-2025-0034	\N	2024-11-12	F1_ox	\N	\N	\N	\N	\N	\N	\N
ef1a:2xmemitdmSG F2 femal/male301 F1 (#1)	FSH-2025-0035	\N	2024-11-02	F1_ox	\N	\N	\N	\N	\N	\N	\N
ef1a:2xmemitdmSG male 8 x csp ox 301 F1 (#3)	FSH-2025-0036	\N	2024-11-12	F1_ox	\N	\N	\N	\N	\N	\N	\N
ef1a:2xmemitdmSG male 8 x csp ox 301 F1 (#4)	FSH-2025-0037	\N	2024-11-12	F1_ox	\N	\N	\N	\N	\N	\N	\N
ef1a:mem:Halo het or homo csp	FSH-2025-0038	\N	2025-04-29	F1_ox	\N	\N	\N	\N	\N	\N	\N
ef1a:mem:tdmSG #11 male FOUNDER	FSH-2025-0039	\N	2024-08-16	P0_founder	\N	\N	\N	\N	\N	\N	\N
ef1a:memHalo-Halo csp 1+ alleles	FSH-2025-0040	\N	2024-08-21	\N	\N	\N	\N	\N	\N	\N	\N
ef1a:memSG #8 ox H2B:mChilada	FSH-2025-0041	\N	2025-01-13	\N	\N	\N	\N	\N	\N	\N	\N
ef1a:skittles male #5 5FP crya:mSC ox csp	FSH-2025-0042	\N	2025-02-09	\N	\N	\N	\N	\N	\N	\N	\N
ef1a:slit #5 male F2 ox csp, #5 ABE F2 male(2) x #11Ben F2 female (2)	FSH-2025-0043	\N	2025-02-11	\N	\N	\N	\N	\N	\N	\N	\N
ef1a:tsmSG negative	FSH-2025-0044	\N	2024-08-16	to_kill	\N	\N	\N	\N	\N	\N	\N
exorh:GFP;crya skittles 5FP female 24 F2s x 301 ef1a:2xlynk:tdmSG	FSH-2025-0045	\N	2025-04-30	\N	\N	\N	\N	\N	\N	\N	\N
exorh:GFP;skittles 5FP female #29 F2s (dim 301?)	FSH-2025-0046	\N	2025-04-30	\N	\N	\N	\N	\N	\N	\N	\N
exorh+5FP skittles male	FSH-2025-0047	\N	2024-11-20	P0_founder	\N	\N	\N	\N	\N	\N	\N
F2 male #3 hspphiCNLS:exorh;mSC(+) ; 301(weak)	FSH-2025-0048	\N	2025-05-27	\N	\N	\N	\N	\N	\N	\N	\N
Gemma	FSH-2025-0049	\N	2024-11-20	P0_founder	\N	\N	\N	\N	\N	female #1  - low frequency (1-2%) exorH:GFP (+) embryos - will start tank	\N
Harry	FSH-2025-0050	\N	2025-03-19	F1_ox	\N	\N	\N	\N	\N	F1s of male C 	\N
heatshock PhiC	FSH-2025-0051	\N	2025-05-27	F1_ox	\N	\N	\N	\N	\N	F1s ox to mem:SG of male #1	\N
hspphiCNLS; exorh:mScarlet male #1 FOUNDER	FSH-2025-0052	\N	2025-02-22	P0_founder	\N	\N	\N	\N	\N	\N	\N
Isaac	FSH-2025-0053	\N	2024-11-20	P0_founder	\N	\N	\N	\N	\N	male K ~20%+ frequency exorH:GFP (+) embryos	\N
Jim	FSH-2025-0054	\N	2025-02-25	P0_founder	\N	\N	\N	\N	\N	male #7, 4 fish survived to adulthood	\N
Ken	FSH-2025-0055	\N	2025-02-25	F1_ox	\N	\N	\N	\N	\N	F1s of male #6	\N
Liam	FSH-2025-0056	\N	2024-11-03	P0_founder	\N	\N	\N	\N	\N	male #1 02012025	\N
mem-Halo	FSH-2025-0057	\N	2024-05-20	F1_ox	\N	\N	\N	\N	\N	\N	\N
mem:mStayGold (1x)	FSH-2025-0058	\N	2024-12-06	potential_founders	\N	\N	\N	\N	\N	1 tank started	\N
mem:tdmChilada	FSH-2025-0059	\N	\N	F1_ox	\N	\N	\N	\N	\N	F1s of allele 315	\N
mHalo ix F2	FSH-2025-0060	\N	2025-04-29	F2_ix	\N	\N	\N	\N	\N	\N	\N
mSG #19 bright/csp ef1a:2xlynk:tdmSG	FSH-2025-0061	\N	2024-12-06	to_kill	\N	\N	\N	\N	\N	\N	\N
mSG #23 male FOUNDER	FSH-2025-0062	\N	2024-08-16	to_kill	\N	\N	\N	\N	\N	\N	\N
mSg #26 bright male	FSH-2025-0063	\N	2024-08-14	P0_founder	\N	\N	\N	\N	\N	\N	\N
mSG male (+++)	FSH-2025-0064	\N	2024-08-16	\N	\N	\N	\N	\N	\N	\N	\N
mSG male #14 (++)	FSH-2025-0065	\N	2024-08-16	to_kill	\N	\N	\N	\N	\N	\N	\N
mSg male #19 ++ ~15%	FSH-2025-0066	\N	2024-08-16	P0_founder	\N	\N	\N	\N	\N	\N	\N
Neural Crest mChilada	FSH-2025-0067	\N	2024-11-05	potential_founders	\N	\N	\N	\N	\N	1 tank started - screened 2 fish (both negative)	\N
Neutrophils mChilada	FSH-2025-0068	\N	2024-12-11	potential_founders	\N	\N	\N	\N	\N	1 tank started - screened all negative	\N
pDQM06 tdmCh:H2B negative	FSH-2025-0069	\N	2024-11-25	to_kill	\N	\N	\N	\N	\N	\N	\N
pDQM068 piglet14a/csp eef1a:2xlynk:tdmSG	FSH-2025-0070	\N	2024-12-05	potential_founders	\N	\N	\N	\N	\N	\N	\N
pDQM072 ef1a:2xlynk:tdmSG tPT2A:tdmChilada:H2B	FSH-2025-0071	\N	2025-12-06	potential_founders	\N	\N	\N	\N	\N	\N	\N
pDQM076 piglet 14a/csp exorh:GFP:hsp:DHB:HmSC + T2A:tdmCh:H2B	FSH-2025-0072	\N	2024-12-05	potential_founders	\N	\N	\N	\N	\N	\N	\N
pDQM078 negative	FSH-2025-0073	\N	2024-12-05	to_kill	\N	\N	\N	\N	\N	\N	\N
pDQM079 ef1a:2xLynxmSG piglet14a/csp	FSH-2025-0074	\N	2024-12-05	potential_founders	\N	\N	\N	\N	\N	\N	\N
pDQM082 ef1a:2lynx:tdmChilada #1 male founder (++) mut alles	FSH-2025-0075	\N	2024-12-10	P0_founder	\N	\N	\N	\N	\N	\N	\N
pDQM082 F2 csp/AB	FSH-2025-0076	\N	2025-04-23	F1_ox	\N	\N	\N	\N	\N	\N	\N
pDQM082 F2 ef1a:2xlynk:tdmChilada male 1	FSH-2025-0077	\N	2025-04-25	P0_founder	\N	\N	\N	\N	\N	\N	\N
pDQM082 negative	FSH-2025-0078	\N	2024-12-18	to_kill	\N	\N	\N	\N	\N	\N	\N
pDQM082 rnf/AB F2s male #1	FSH-2025-0079	\N	2025-04-22	\N	\N	\N	\N	\N	\N	\N	\N
pDQM085 FOUNDER male #1	FSH-2025-0080	\N	2024-11-25	P0_founder	\N	\N	\N	\N	\N	\N	\N
pDQM094 (+) male #4	FSH-2025-0081	\N	2025-01-07	P0_founder	\N	\N	\N	\N	\N	\N	\N
pDQM094 female 1 F2 (++)	FSH-2025-0082	\N	2025-04-01	P0_founder	\N	\N	\N	\N	\N	\N	\N
pDQM094 negative	FSH-2025-0083	\N	\N	to_kill	\N	\N	\N	\N	\N	\N	\N
pDQM095 zFUCCIv1 + tol2	FSH-2025-0084	\N	2025-01-07	potential_founders	\N	\N	\N	\N	\N	\N	\N
pDQM0954 (+++) female #2 x csp F2 ox FOUNDER	FSH-2025-0085	\N	2025-01-07	P0_founder	\N	\N	\N	\N	\N	\N	\N
pDQM096 zFUCCI u2 +tol2	FSH-2025-0086	\N	2025-01-07	potential_founders	\N	\N	\N	\N	\N	\N	\N
pDQM125 301 inf ix tol2	FSH-2025-0087	\N	2025-04-18	potential_founders	\N	\N	\N	\N	\N	\N	\N
pDQM132 +tol2	FSH-2025-0088	\N	2025-04-21	potential_founders	\N	\N	\N	\N	\N	\N	\N
pDQM132 male FOUNDER	FSH-2025-0089	\N	2025-04-21	P0_founder	\N	\N	\N	\N	\N	\N	\N
pDQM132+tol2(iC)	FSH-2025-0090	\N	2025-05-23	potential_founders	\N	\N	\N	\N	\N	\N	\N
pDQM133	FSH-2025-0091	\N	2025-04-17	potential_founders	\N	\N	\N	\N	\N	\N	\N
pDQM133 301 ix +tol2	FSH-2025-0092	\N	2025-04-18	potential_founders	\N	\N	\N	\N	\N	\N	\N
pDQM133 301ix +tol2	FSH-2025-0093	\N	2025-04-18	potential_founders	\N	\N	\N	\N	\N	\N	\N
pDQM133 P0 male ef1aext:tdmSc3s2:H2B	FSH-2025-0094	\N	2025-04-08	P0_founder	\N	\N	\N	\N	\N	\N	\N
pDQM136	FSH-2025-0095	\N	2025-04-27	potential_founders	\N	\N	\N	\N	\N	\N	\N
pDQM136 Bright	FSH-2025-0096	\N	2025-04-28	potential_founders	\N	\N	\N	\N	\N	bright	\N
pDQM136 FOUNDER male #1	FSH-2025-0097	\N	2025-04-28	P0_founder	\N	\N	\N	\N	\N	\N	\N
pDQM136 screened negative	FSH-2025-0098	\N	2025-04-28	to_kill	\N	\N	\N	\N	\N	\N	\N
piglet 14a /csp	FSH-2025-0099	\N	2024-12-05	\N	\N	\N	\N	\N	\N	\N	\N
piglet 14a mpx:mChilada( 1 allele)	FSH-2025-0100	\N	2025-01-15	\N	\N	\N	\N	\N	\N	\N	\N
piglet 14a pDQM078 ef1a:2xlynx:tdmSg	FSH-2025-0101	\N	2024-12-05	potential_founders	\N	\N	\N	\N	\N	\N	\N
piglet 14a/csp hets slc1a3b:mKate2(1 pr 2 alleles) negative	FSH-2025-0102	\N	2024-11-26	to_kill	\N	\N	\N	\N	\N	\N	\N
piglet 20pg ef1a:mStayGold test	FSH-2025-0103	\N	2025-02-01	potential_founders	\N	\N	\N	\N	\N	\N	\N
piglet 24b ox csp(IX) slc1a3b:mKate2 (1 or 2 alleles)	FSH-2025-0104	\N	2024-12-06	potential_founders	\N	\N	\N	\N	\N	\N	\N
piglet 24b pDQM076 exorh:GFP hsp:DHB:tdmSG+ PT2a:tdmCh:H2B	FSH-2025-0105	\N	2024-12-06	potential_founders	\N	\N	\N	\N	\N	\N	\N
piglet 24b pDQM079 (+)	FSH-2025-0106	\N	\N	P0_founder	\N	\N	\N	\N	\N	\N	\N
piglet 24b pDQM079 ef1a:2xlynk:mSG	FSH-2025-0107	\N	2024-12-06	potential_founders	\N	\N	\N	\N	\N	\N	\N
piglet 24b pDQM131 exorh:GFP;hsp:DHB/H2B	FSH-2025-0108	\N	2025-04-23	potential_founders	\N	\N	\N	\N	\N	\N	\N
piglet14a	FSH-2025-0109	\N	2025-01-08	to_kill	\N	\N	\N	\N	\N	\N	\N
piglet24b ef1a:2xlynk:tdmSG pDQM078	FSH-2025-0110	\N	2024-12-06	potential_founders	\N	\N	\N	\N	\N	\N	\N
piglet24b sox10:mCh	FSH-2025-0111	\N	2025-03-18	\N	\N	\N	\N	\N	\N	\N	\N
rnf+pDQM112 exorh:mSc:hsp:phiCNLS	FSH-2025-0112	\N	2025-02-28	potential_founders	\N	\N	\N	\N	\N	\N	\N
rnf+pDQM137 Skittles 4.0	FSH-2025-0113	\N	2025-04-22	potential_founders	\N	\N	\N	\N	\N	\N	\N
screened negative	FSH-2025-0114	\N	2024-11-20	to_kill	\N	\N	\N	\N	\N	\N	\N
skittles 2.0 male #5	FSH-2025-0115	\N	2024-09-16	P0_founder	\N	\N	\N	\N	\N	\N	\N
skittles 2.0 negative	FSH-2025-0116	\N	2024-09-16	to_kill	\N	\N	\N	\N	\N	\N	\N
skittles 3.0 exorh 3FP(+) male 1	FSH-2025-0117	\N	2024-10-25	P0_founder	\N	\N	\N	\N	\N	\N	\N
skittles 3.0 male exorhGFP 4 FP	FSH-2025-0118	\N	2024-10-29	potential_founders	\N	\N	\N	\N	\N	\N	\N
skittles 4 FP cryaa:mScarlet	FSH-2025-0119	\N	2025-02-26	F1_ox	\N	\N	\N	\N	\N	F1s of male #1	\N
skittles 4 FP exorh 3.0 ix csp male #1	FSH-2025-0120	\N	2025-02-17	\N	\N	\N	\N	\N	\N	\N	\N
skittles 4 FP male #3 exorh 3.0 ox csp	FSH-2025-0121	\N	2025-02-17	\N	\N	\N	\N	\N	\N	\N	\N
skittles 4 FP tol2 (clone 4)	FSH-2025-0122	\N	2024-09-17	potential_founders	\N	\N	\N	\N	\N	\N	\N
skittles 4.0 mfix+pDQM137	FSH-2025-0123	\N	2025-04-22	potential_founders	\N	\N	\N	\N	\N	\N	\N
skittles 4.0 pDQM137 male #4 weak FOUNDER	FSH-2025-0124	\N	2025-04-22	P0_founder	\N	\N	\N	\N	\N	\N	\N
skittles 4.0 x csp FOUNDER female #1 and male #2	FSH-2025-0125	\N	2025-04-22	P0_founder	\N	\N	\N	\N	\N	\N	\N
skittles 4.0 x csp FOUNDER male #1	FSH-2025-0126	\N	2025-04-22	P0_founder	\N	\N	\N	\N	\N	\N	\N
Skittles 4.1	FSH-2025-0127	\N	2025-08-19	F1_ox	\N	\N	\N	\N	\N	F1s of male #2 multiple alleles, good founder (?) but not super bright	\N
skittles 4FP #1 male F2s ox csp crya+	FSH-2025-0128	\N	2025-02-26	F1_ox	\N	\N	\N	\N	\N	\N	\N
skittles 4FP exorh x ox	FSH-2025-0129	\N	2024-11-20	potential_founders	\N	\N	\N	\N	\N	\N	\N
skittles 4FP exorh:GFP	FSH-2025-0130	\N	2025-02-25	P0_founder	\N	\N	\N	\N	\N	male #7, 4 fish survived to adulthood	\N
skittles 4FP exorh+ male #6 ox csp	FSH-2025-0131	\N	2025-03-19	\N	\N	\N	\N	\N	\N	\N	\N
skittles 4FP male #14 x csp	FSH-2025-0132	\N	2025-03-04	\N	\N	\N	\N	\N	\N	\N	\N
Skittles 5 FP cryaa:mScarlet	FSH-2025-0133	\N	2024-10-01	potential_founders	\N	\N	\N	\N	\N	20-25 fish in 1 tank - 2 good founders?, phiC mRNA injection results ++	\N
Skittles 5 FP exorH	FSH-2025-0134	\N	2024-11-20	potential_founders	\N	\N	\N	\N	\N	1 tank started	\N
Skittles 5 FP exorh:GFP	FSH-2025-0135	\N	2024-11-20	P0_founder	\N	\N	\N	\N	\N	female  - low frequency (1-2%) exorH:GFP (+) embryos - will start tank 311	\N
skittles 5-FP exorh F2 ox rnf male	FSH-2025-0136	\N	2025-03-12	\N	\N	\N	\N	\N	\N	\N	\N
skittles 5FP crya+	FSH-2025-0137	\N	2024-11-20	potential_founders	\N	\N	\N	\N	\N	\N	\N
skittles 5FP exorh+ male K ox csp F2s	FSH-2025-0138	\N	2025-03-12	\N	\N	\N	\N	\N	\N	\N	\N
skittles 5FP female #1 crya+ ox csp	FSH-2025-0139	\N	2025-03-19	\N	\N	\N	\N	\N	\N	\N	\N
skittles 5FP male "C" exorh+	FSH-2025-0140	\N	2025-03-19	\N	\N	\N	\N	\N	\N	\N	\N
skittles 5FP male #5 crya x 301 female ef1a:2xlynk:tdmSG (+++)	FSH-2025-0141	\N	2025-04-29	\N	\N	\N	\N	\N	\N	\N	\N
skittles exorh:GFP +4FP male 7 F2s ox csp	FSH-2025-0142	\N	2025-02-25	\N	\N	\N	\N	\N	\N	\N	\N
skittles exorh+5FP	FSH-2025-0143	\N	2025-11-20	potential_founders	\N	\N	\N	\N	\N	\N	\N
skittles exorh+5FP female 1	FSH-2025-0144	\N	2025-11-20	P0_founder	\N	\N	\N	\N	\N	\N	\N
skittles negative	FSH-2025-0145	\N	2025-10-01	to_kill	\N	\N	\N	\N	\N	\N	\N
skittles pDQM137 isce-1	FSH-2025-0146	\N	2025-05-18	P0_founder	\N	\N	\N	\N	\N	\N	\N
skittles screened negative	FSH-2025-0147	\N	2025-10-01	to_kill	\N	\N	\N	\N	\N	\N	\N
skittles- 5FP female #24 exorh	FSH-2025-0148	\N	2024-11-25	P0_founder	\N	\N	\N	\N	\N	\N	\N
skittles-4FP male #1	FSH-2025-0149	\N	2024-09-17	P0_founder	\N	\N	\N	\N	\N	\N	\N
skittles-5FP	FSH-2025-0150	\N	2025-10-24	potential_founders	\N	\N	\N	\N	\N	\N	\N
slc1a3:mKate2 in piglet 14a	FSH-2025-0151	\N	2025-09-13	\N	\N	\N	\N	\N	\N	\N	\N
sox10:mCH piglet124b screened (-)	FSH-2025-0152	\N	2024-10-11	\N	\N	\N	\N	\N	\N	\N	\N
sox10:mCh piglet14a	FSH-2025-0153	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
sox10:mChilada piglet 14a	FSH-2025-0154	\N	2025-02-07	\N	\N	\N	\N	\N	\N	\N	\N
sox10mCh (-) screened	FSH-2025-0155	\N	\N	to_kill	\N	\N	\N	\N	\N	\N	\N
tandem mem:mStayGold	FSH-2025-0156	\N	2024-08-16	P0_founder	\N	\N	\N	\N	\N	male #19 - bright, low frequency transmission (<10%)	\N
tandem mem:mStayGold; tdmChilada:Histone	FSH-2025-0157	\N	2024-12-06	potential_founders	\N	\N	\N	\N	\N	1 tank started	\N
tandem mem:mStayGold; tdmChilada(MAGPV):Histone	FSH-2025-0158	\N	\N	potential_founders	\N	\N	\N	\N	\N	\N	\N
tdmScarlet3S2	FSH-2025-0159	\N	\N	F1_ox	\N	\N	\N	\N	\N	F1s of male #1??? ox casper	\N
tdmScarlet3S2:H2B-tol2	FSH-2025-0160	\N	\N	P0_founder	\N	\N	\N	\N	\N	male #1	\N
white tape	FSH-2025-0161	\N	\N	to_kill	\N	\N	\N	\N	\N	\N	\N
Test Fry 1	TESTF001	\N	2025-09-05	\N	\N	\N	\N	\N	\N	TEMP	\N
Test Fry 1	TESTF001	\N	2025-09-05	\N	\N	\N	\N	\N	\N	TEMP	\N
Test Fry 1	TESTF001	\N	2025-09-05	\N	\N	\N	\N	\N	\N	TEMP	\N
Test Fry 2	TESTF002	\N	2025-09-10	\N	\N	\N	\N	\N	\N	TEMP	\N
Test Fry 2	TESTF002	\N	2025-09-10	\N	\N	\N	\N	\N	\N	TEMP	\N
\.


--
-- Data for Name: staging_fish_parents; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.staging_fish_parents (child_fish_code, parent_fish_code, role, notes, created_by) FROM stdin;
\.


--
-- Data for Name: staging_fish_tank_history; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.staging_fish_tank_history (fish_code, tank_code, start_dt, end_dt, notes, created_by) FROM stdin;
\.


--
-- Data for Name: staging_fish_transgenes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.staging_fish_transgenes (fish_code, transgene_name, transgene_id_uuid, zygosity, notes) FROM stdin;
\.


--
-- Data for Name: staging_fluors; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.staging_fluors (emission, excitation, name, notes, tag) FROM stdin;
		Halo		
		mChilada		
		mSG		
		mScarlet3S2		
		tdmSG		
		tdm:mScarlet3S2		
		mStayGold(J)		
		mBeRFP		
		mStayGold C-term		
		mTFP1		
		Electra		
		mScarlet3		
		tdmScarlet3S2		
		tdmChilada		
		mSG_(J)_IDT_opt		
		mStayGold		
		mTagBFP2		
		mGold2s		
		mChilada_MAGPV		
		mYH		
		??		
		tagbfp2		
		tdmSG(J)		
		tdmSG_syntrons(J)		
		tdmSG(introns)		
		tdmYH		
		tdmChilada_MAGPV		
		E2Crimson_(iCodon)		
		Electra2		
		mCitrine		
		mGold2t		
		mKOK		
		mKate2		
		mYongHong		
		mCardinal_iCodon		
		miRFP670-2 (iCodon)		
		GFP		
		mScarlet		
		Electra2 (iCodon)		
		mCitrine (iCodon)		
		mKOK (iCodon)		
		mKate2 (iCodon)		
		mLychee (iCodon)		
		mTFP1 (iCodon)		
		mYongHong (iCodon)		
		mBaoJin		
		mSG(B)_iCodon		
		mSG(J)_iCodon		
		mYongHong_iCodon		
		mScarlet3(iCodon)		
\.


--
-- Data for Name: staging_mounts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.staging_mounts (type, name, description, date_mounted, time_mounted, mounting_orientation) FROM stdin;
brucker	1		2025-09-10	130254	DH
brucker	2		2025-09-10	130274	DH
\.


--
-- Data for Name: staging_mutations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.staging_mutations (name) FROM stdin;
scn1lab(s552)
stxbp1b
cntnap2
\.


--
-- Data for Name: staging_plasmid_fluors; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.staging_plasmid_fluors (plasmid_name, fluor_name) FROM stdin;
MGCO-01	mStayGold
MGCO-02	mChilada
MGCO-03	Halo
MGCO-04	mStayGold
MGCO-05	mChilada
MGCO-06	Halo
MGCO-07	mStayGold
MGCO-08	mChilada
MGCO-09	Halo
MGCO-10	mStayGold
MGCO-11	mChilada
MGCO-12	Halo
MGCO-13	mStayGold
MGCO-14	Halo
MGCO-15	mStayGold
MGCO-16	mChilada
MGCO-17	mStayGold
MGCO-18	Halo
MGCO-19	mStayGold
MGCO-20	Halo
MGCO-21	mStayGold
MGCO-22	Halo
MGCO-23	mStayGold
MGCO-24	Halo
MGCO-25	mStayGold
MGCO-26	mChilada
MGCO-27	mStayGold
MGCO-28	mStayGold
MGCO-29	mStayGold
MGCO-30	mStayGold
MGCO-31	mStayGold
MGCO-32	mStayGold
MGCO-33	mStayGold
MGCO-34	mStayGold
MGCO-35	mScarlet3S2
MGCO-36	mScarlet3S2
MGCO-37	mScarlet3S2
MGCO-38	mStayGold
MGCO-39	Halo
MGCO-40	Halo
MGCO-41	mScarlet3S2
MGCO-42	Halo
MGCO-43	mScarlet3S2
MGCO-44	Halo
MGCO-45	Halo
MGCO-46	Halo
MGCO-47	Halo
MGCO-48	mScarlet3S2
pCNH001	mTFP1
pCNH002	mBeRFP
pCNH003	Halo
pCNH004	mStayGold(J)
pCNH005	mStayGold C-term
pCNH006	mScarlet3S2
pDQM001	mSG_(J)_IDT_opt
pDQM005	tdmSG(J)
pDQM006	tdmSG_syntrons(J)
pDQM009	??
pDQM011	Electra2 (iCodon)
pDQM013	mKOK (iCodon)
pDQM014	mKate2 (iCodon)
pDQM016	mTFP1 (iCodon)
pDQM018	miRFP670-2 (iCodon)
pDQM020	mLychee (iCodon)
pDQM022	mChilada
pDQM024	??
pDQM026	tdmSG; tdmChilada
pDQM027	mSG(J)_iCodon
pDQM028	mSG(B)_iCodon
pDQM029	mBaoJin
pDQM030	mYongHong_iCodon
pDQM032	mYongHong (iCodon)
pDQM034	??
pDQM036	??
pDQM037	tdmSG; tdmChilada
pDQM039	tdmChilada
pDQM041	mChilada
pDQM043	mCitrine (iCodon)
pDQM045	mScarlet3(iCodon)
pDQM051	tdmSG; tdmChilada
pDQM053	tdmChilada
pDQM055	tdmSG; tdmChilada
pDQM057	gfp; tdmSG; tdmChilada
pDQM058	gfp; tdmSG; tdmChilada
pDQM059	??
pDQM060	tdmSG; tdmChilada
pDQM063	??
pDQM065	tdmSG; tdmChilada
pDQM067	tdmSG; tdmYH
pDQM068	tdmSG
pDQM070	tdmSG(introns)
pDQM072	tdmSG; tdmChilada
pDQM076	gfp; tdmSG; tdmChilada
pDQM079	mSG
pDQM081	mSG
pDQM082	tdmChilada
pDQM083	Electra2
pDQM084	mKOK
pDQM085	mKate2
pDQM086	mCitrine
pDQM087	mTFP1
pDQM088	mYongHong
pDQM089	mChilada
pDQM090	mChilada_MAGPV
pDQM092	mChilada
pDQM094	tdmChilada_MAGPV
pDQM095	mSG; mYH
pDQM096	mSG; mYH
pDQM097	??
pDQM098	GFP
pDQM100	mScarlet
pDQM101	Halo
pDQM102	mStayGold(J)
pDQM104	mChilada_MAGPV
pDQM105	mYH
pDQM106	miRFP670-2 (iCodon)
pDQM108	mChilada_MAGPV
pDQM110	GFP
pDQM112	mScarlet
pDQM114	mSG; mYH
pDQM115	mScarlet3S2
pDQM117	mScarlet3S2
pDQM119	mBeRFP
pDQM120	mBeRFP
pDQM121	tdmScarlet3S2
pDQM122	??
pDQM124	mScarlet3S2
pDQM125	tdmSG; tdmScarlet3S2
pDQM127	mSG; Halo; Electra; mBeRFP; mScarlet3S2; mTFP1
pDQM128	tdmSG
pDQM129	tdmSG
pDQM130	
pDQM132	tdmSG; tdmScarlet3S2
pDQM133	tdmScarlet3S2
pDQM134	tdmSG; tdmScarlet3S2
pDQM136	tdmScarlet3S2
pDQM137	mSG; Halo; Electra; mBeRFP; mScarlet3; mTFP1
pDQM138	mGold2s
pDQM139	mGold2s
pDQM140	mGold2s
pDQM141	mGold2t
pDQM142	gfp; tdmSG; tdmScarlet3S2
pDQM143	
pDQM144	E2Crimson_(iCodon)
pDQM145	mCardinal_iCodon
pDQM146	mScarlet3S2
pDQM147	mStayGold
pDQM148	mStayGold
pDQM149	Halo; tagbfp2
pDQM150	mSG; mYH
pDQM151	mSG
pDQM152	mSG; Halo; Electra; mBeRFP; mScarlet3; mTFP1
pDQM153	tdmSG; tdmScarlet3S2
pDQM154	tdmScarlet3S2
pDQM155	tdmSG
pDQM156	tdm:mScarlet3S2
pDQM157	mScarlet3S2
pDQM158	tdm:mScarlet3S2
pDQM159	tdmSG
pJWL001	mScarlet3S2
pJWL002	tdm:mScarlet3S2
pMNM001	mChilada
pMNM002	tdm:mScarlet3S2
pMNM003	
pMNM004	
pMNM005	
pMNM006	
pMNM007	
pMNM008	
\.


--
-- Data for Name: staging_plasmids; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.staging_plasmids (name, description, notes, source, created_by) FROM stdin;
pDQM001	CMV-SP6-mSG(J) IDT opt	IDT optimized, for mRNA production with SP6 - clone 2		
pDQM002	CMV-SP6-mSG(J) IDT opt	IDT optimized, for mRNA production with SP6 - clone 5		
pDQM005	ef1a-tdmSG(J)	iCodon optimized for tol2 insertions - clone 4		
pDQM006	ef1a-tdmSG-syntrons(J)	each mStayGold contains a 51bp syntron to boost expression - clone 6		
pDQM007	ef1a-tdmSG-syntrons(J)	each mStayGold contains a 51bp syntron to boost expression - clone 3		
pDQM008	ef1a-tdmSG-syntrons(J)	each mStayGold contains a 51bp syntron to boost expression - clone 8		
pDQM009	skittles2.0-4FP	iCodon optimized - contains cryaa:mScarlet-AttP-mKate2-Electra2-mKOK-mTFP1 (missing mCitrine) - clone SK1		
pDQM010	skittles2.0-4FP	iCodon optimized - contains cryaa:mScarlet-AttP-mKate2-Electra2-mKOK-mTFP1 (missing mCitrine) - clone SK4		
pDQM011	pCM268_ccdB-Electra2	Clone 1 - pIGLET backbone in NEB Turbo cells (for ccdB survival)		
pDQM012	pCM268_ccdB-Electra2	Clone 2 - pIGLET backbone in NEB Turbo cells (for ccdB survival)		
pDQM013	pCM268_ccdB-mKOK	Clone 2 - pIGLET backbone in NEB Turbo cells (for ccdB survival)		
pDQM014	pCM268_ccdB-mKate2	Clone 1 - pIGLET backbone in NEB Turbo cells (for ccdB survival)		
pDQM015	pCM268_ccdB-mKate2	Clone 2 - pIGLET backbone in NEB Turbo cells (for ccdB survival)		
pDQM016	pCM268_ccdB-mTFP1	Clone 1 - pIGLET backbone in NEB Turbo cells (for ccdB survival)		
pDQM017	pCM268_ccdB-mTFP1	Clone 2 - pIGLET backbone in NEB Turbo cells (for ccdB survival)		
pDQM018	pCM268_ccdB-miRFP670-2	Clone 1 - pIGLET backbone in NEB Turbo cells (for ccdB survival)		
pDQM019	pCM268_ccdB-miRFP670-2	Clone 2 - pIGLET backbone in NEB Turbo cells (for ccdB survival)		
pDQM020	pCM268_ccdB-mLychee	Clone 1 - pIGLET backbone in NEB Turbo cells (for ccdB survival)		
pDQM021	pCM268_ccdB-mLychee	Clone 2 - pIGLET backbone in NEB Turbo cells (for ccdB survival)		
pDQM022	pCM268_ccdB-mChilada	Clone 1 - pIGLET backbone in NEB Turbo cells (for ccdB survival)		
pDQM023	pCM268_ccdB-mChilada	Clone 2 - pIGLET backbone in NEB Turbo cells (for ccdB survival)		
pDQM024	skittles2.0-5FP-mutation	single base change (frame shift) in mKate2		
pDQM025	skittles2.0-5FP-mutation	single deletion (frame shift) in mTFP1		
pDQM026	pCM268_ccdB-dhb-tdmSG-tPT2A-tdmChilada-pcna	promoterless 		
pDQM027	pTwist-SP6-2xLynk:mSG(J)-iCodon	for mRNA		
pDQM028	pTwist-SP6-2xLynk:mSG(B)-iCodon	for mRNA		
pDQM029	pTwist-SP6-2xLynk:mBaoJin-iCodon	for mRNA		
pDQM030	pTwist-SP6-2xLynk:mYongHong-iCodon	for mRNA - clone 1		
pDQM031	pTwist-SP6-2xLynk:mYongHong-iCodon	for mRNA - clone 2		
pDQM032	pCM268_ccdB-mYongHong	Clone 1 - pIGLET backbone in NEB Turbo cells (for ccdB survival)		
pDQM033	pCM268_ccdB-mYongHong	Clone 2 - pIGLET backbone in NEB Turbo cells (for ccdB survival)		
pDQM034	skittles2.0-5FP	5 FP version of skittles - clone 1		
pDQM035	skittles2.0-5FP	5 FP version of skittles - clone 4		
pDQM036	skittles3.0-4FP	4 FP version of skittles with SEC hsp-phiC (cryaa:mSc) - clone 3		
pDQM037	ef1a:dhb-tdmSG-tPT2A-tdmChilada-pcna (pCM268)	ef1a driven cdk/pcna cell cycle sensor clone 1 (pIGLET)		
pDQM038	ef1a:dhb-tdmSG-tPT2A-tdmChilada-pcna (pCM268)	ef1a driven cdk/pcna cell cycle sensor clone 2 (pIGLET)		
pDQM039	hsp:dhb-tdmSG-tPT2A-tdmChilada-pcna (pCM268)	hsp driven cdk/pcna cell cycle sensor clone 2 (pIGLET)		
pDQM040	hsp:dhb-tdmSG-tPT2A-tdmChilada-pcna (pCM268)	hsp driven cdk/pcna cell cycle sensor clone 3 (pIGLET)		
pDQM041	sox10:mChilada (pCM268)	sox10p-driven mChilada (pIGLET) clone 1		
pDQM042	sox10:mChilada (pCM268)	sox10p-driven mChilada (pIGLET) clone 2		
pDQM043	pCM268_ccdB-mCitrine	Clone 1 - pIGLET backbone in NEB Turbo cells (for ccdB survival)		
pDQM044	pCM268_ccdB-mCitrine	Clone 2 - pIGLET backbone in NEB Turbo cells (for ccdB survival)		
pDQM045	pTwist-SP6:2xLynk:mScarlet3			
pDQM046	pTwist-SP6:2xLynk:mScarlet3			
pDQM047	pTwist-SP6-2xLynk:mSG(J)-iCodon	Clone 1		
pDQM048	pTwist-SP6-2xLynk:mSG(J)-iCodon	Clone 2		
pDQM049	pTwist-SP6-2xLynk:mSG(B)-iCodon	Clone 1		
pDQM050	pTwist-SP6-2xLynk:mSG(B)-iCodon	Clone 2		
pDQM051	ef1a:dhb-tdmSG-tPT2A-tdmChilada-h2b (pCM268)	Clone 1 - pIGLET		
pDQM052	ef1a:dhb-tdmSG-tPT2A-tdmChilada-h2b (pCM268)	Clone 2 - pIGLET		
pDQM053	hsp:dhb-tdmSG-tPT2A-tdmChilada-h2b (pCM268)	Clone 2 - pIGLET		
pDQM054	hsp:dhb-tdmSG-tPT2A-tdmChilada-h2b (pCM268)	Clone 3 - pIGLET		
pDQM055	AAV-dhb-tdmSG-tPT2A-tdmChilada-pcna	Clone 3 (truncated SV40)		
pDQM056	AAV-dhb-tdmSG-tPT2A-tdmChilada-pcna	Clone 4 (truncated SV40)		
pDQM057	exorh:gfp-hsp:dhb-tdmSG-tPT2A-tdmChilada-pcna (pCM268)	Clone 4  		
pDQM058	exorh:gfp-hsp:dhb-tdmSG-tPT2A-tdmChilada-h2b (pCM268)	Clone 1		
pDQM059	skittles3.1-4FP (exorh:GFP)	Clone 3		
pDQM060	ef1a:2xLynk-tdmSG-tPT2A-tdmChilada-h2b (pCM268)	Clone 3		
pDQM061	AAV-dhb-tdmSG-tPT2A-tdmChilada-pcna	Clone 2		
pDQM062	AAV-dhb-tdmSG-tPT2A-tdmChilada-pcna	Clone 3		
pDQM063	exorh skittles 2.0 5FP	clone 1,iCodon optimized - contains exorH:GFP-AttP-mKate2-Electra2-mCitrine-mKOK-mTFP1		
pDQM064	exorh skittles 2.0 5FP	clone 5, iCodon optimized - contains exorH:GFP-AttP-mKate2-Electra2-mCitrine-mKOK-mTFP1		
pDQM065	tol2-ef1a:2xLynk-tdmSG-tPT2A-tdmChilada-h2b	clone 1		
pDQM066	tol2-ef1a:2xLynk-tdmSG-tPT2A-tdmChilada-h2b	clone 2		
pDQM067	ef1a:2xLynk-tdmSG-tPT2A-tdmYH-h2b (pCM268)	clone 1		
pDQM068	ef1a:2xLynk-tdmSG	Clone 1		
pDQM069	ef1a:2xLynk-tdmSG	Clone 2		
pDQM070	ef1a:2xLynk-tdmSG(introns)	Clone 2		
pDQM071	ef1a:2xLynk-tdmSG(introns)	Clone 4		
pDQM072	ef1a:2xLynk-tdmSG-tPT2A-tdmChilada-h2b	Clone 2		
pDQM073	ef1a:2xLynk-tdmSG-tPT2A-tdmChilada-h2b	Clone 4		
pDQM074	ef1a:2xLynk-tdmSG(introns)	Clone 1		
pDQM075	ef1a:2xLynk-tdmSG(introns)	Clone 3		
pDQM076	exorh:gfp-hsp:dhb-tdmSG-tPT2A-tdmChilada-h2b (pRL093)	Clone 1		
pDQM077	exorh:gfp-hsp:dhb-tdmSG-tPT2A-tdmChilada-h2b (pRL093)	Clone 3		
pDQM078	ef1a:2xLynk-tdmSG	Clone 5		
pDQM079	ef1a:2xLynk-mSG	Clone 1		
pDQM080	ef1a:2xLynk-mSG	Clone 2		
pDQM081	ef1a:2xLynk:mSG-tPT2A:mChilada	Clone 4		
pDQM082	ef1a:2xLynk:tdmChilada	Clone 4		
pDQM083	ef1a:linker:Electra2:linker-attB	Clone 12-1		
pDQM084	ef1a:linker:mKOK:linker-attB	Clone 13-2		
pDQM085	ef1a:linker:mKate2:linker-attB	Clone 14-2		
pDQM086	ef1a:linker:mCitrine:linker-attB	Clone 43-1		
pDQM087	ef1a:linker:mTFP1:linker-attB	Clone 16-1		
pDQM088	ef1a:linker:mYongHong:linker-attB	Clone 32-1		
pDQM089	ef1a:linker:mChilada:linker-attB	Clone 23-3		
pDQM090	ef1a:linker:mChilada-MAGPV:linker-attB	Clone 1		
pDQM091	ef1a:linker:mChilada-MAGPV:linker-attB	Clone 2		
pDQM092	SP6:2xLynk:mChialda-MAGPV	Clone 1		
pDQM093	SP6:2xLynk:mChialda-MAGPV	Clone 2		
pDQM094	ef1a:2xLynk:tdmSG:tPT2A:tdmChilada-MAGPV:H2B	Clone 1		
pDQM095	ef1a:mSG:CDT1-tPT2A-mYH:GMN (iCodon) [FUCCI]	Clone 2		
pDQM096	ef1a:mSG:CDT1-tPT2A-mYH:GMN (endogenous) [FUCCI]	Clone 2		
pDQM097	cryaa skittles 3.1 5FP (new phiC (full length))	Clone 2		
pDQM098	exorH:GFP; hsp:phiC(iC)	new phiC cloned into Erin's plasmid		
pDQM099	exorH:GFP; hsp:phiC(iC)	new phiC cloned into Erin's plasmid		
pDQM100	exorH:mScarlet; hsp:phiC(iC)	new phiC cloned into Erin's plasmid		
pDQM101	ef1a:linker:Halo:linker-attB	Clone 1		
pDQM102	efa1:linker:mStayGold(J):linker-attB	Clone 1		
pDQM103	efa1:linker:mStayGold(J):linker-attB	Clone 2		
pDQM104	SP6:mChialda-MAGPV-h2b	Clone 1		
pDQM105	SP6:mYH:h2b	Clone 4		
pDQM106	efa1:linker:miRFP670-2:linker-attB	Clone 2		
pDQM107	efa1:linker:miRFP670-2:linker-attB	Clone 5		
pDQM108	ccdB:linker:mChilada-MAGPV:linker	Clone 1		
pDQM109	ccdB:linker:mChilada-MAGPV:linker	Clone 3		
pDQM110	exorH:GFP; hsp:phiC(iC)-NLS	Clone 1		
pDQM111	exorH:GFP; hsp:phiC(iC)-NLS	Clone 3		
pDQM112	exorH:mScarlet; hsp:phiC(iC)-NLS	Clone 1		
pDQM113	exorH:mScarlet; hsp:phiC(iC)-NLS	Clone 2		
pDQM114	ef1a:mSG:CDT1-P2A-mYH:GMN (iCodon) [FUCCI]	clone 2		
pDQM115	SP6:2xLynk:mScarlet3S2	Clone 1		
pDQM116	SP6:2xLynk:mScarlet3S2	Clone 2		
pDQM117	SP6:mScarlet3S2:H2B	Clone 2		
pDQM118	SP6:mScarlet3S2:H2B	Clone 3		
pDQM119	SP6:mBeRFP:H2B	Clone 3		
pDQM120	ef1a:linker:mBeRFP:linker-attB	Clone 1		
pDQM121	ef1a:2xLynk:tdmScarlet3-S2-tol2	Clones 1-4		
pDQM122	ef1a:skittles 3.5 (2xLynk:mSG-attP-Halo-attP-3FPs)	Clone 3		
pDQM123	ef1a:skittles 3.5 (2xLynk:mSG-attP-Halo-attP-3FPs)	Clone 4		
pDQM124	ef1a:linker:mScarlet3-S2:linker-attB (tol2)	Clone 1 and 2		
pDQM125	ef1a:2xLynk:tdmSG:tPT2A:tdmScarlet3-S2:H2B	clone 65-1		
pDQM126	ef1a:2xLynk:tdmSG:tPT2A:tdmScarlet3-S2:H2B	clone 94-1		
pDQM127	ef1a:skittles 4.0 (2xLynk:mSG-attP-Halo-attP-Electra-attP-mBeRFP-attP-mScarlet3-S2-attP-mTFP1)	Clone 1 & 2		
pDQM128	A2UCOE-ef1a-2xLynk:tdmSG-tol2	TBD (missing ~96bp?)		
pDQM129	ef1a-extended-2xLynk:tdmSG-tol2	Clones 1-4		
pDQM130	MBP-TEV-phiC-NLS	TBD		
pDQM131	exorh:gfp-hsp:dhb-tdmSG-tPT2A-tdmChilada-h2b (pCM268)	Clones 2,3		
pDQM132	ef1a-extended::2xLynk:tdmSG:tPT2A:tdmScarlet3-S2:H2B-tol2	Clones 1-3		
pDQM133	ef1a-extened::tdmScarlet3-S2:H2B-tol2	Clones 1-3		
pDQM134	A2UCOE-ef1a:2xLynk:tdmSG:tPT2A:tdmScarlet3-S2:H2B-tol2	still missing ~100bp		
pDQM135	A2UCOE-ef1a-2xLynk:tdmSG-tol2	still missing ~100bp		
pDQM136	ef1a-extended:2xLynk:tdmScarlet3-S2-tol2	clone 3		
pDQM137	ef1a:-extended-skittles 4.0 (2xLynk:mSG-attP-Halo-attP-Electra-attP-mBeRFP-attP-mScarlet3-S2-attP-mTFP1)	clone 3		
pDQM138	SP6:2xLynk:mGold2s	TBD		
pDQM139	SP6:2xLynk:mGold2t	TBD		
pDQM140	ef1a:linker:mGold2s:linker-attB (tol2)	clones 1-3		
pDQM141	ef1a:linker:mGold2t:linker-attB (tol2)	clones 2-3		
pDQM142	exorh:gfp-hsp:dhb-tdmSG-tPT2A-tdmScarlet3-S2-h2b (pCM268)	TBD		
pDQM143	SP6:tol2(iCodon)	Clones 1,2 and 4		
pDQM144	ef1a:E2Crimson (iCodon)	Clones 1-4		
pDQM145	ef1a:mCardinal (iCodon)	Clones 1-4		
pDQM146	ef1a-extended:linker:mScarlet3-S2:linker-attB (tol2)	made by Erin (Janelia)		
pDQM147	ef1a-extended:linker:mStayGold:linker-attB (tol2)	made by Erin (Janelia)		
pDQM148	ef1a-extended:linker:mStayGold-c4:linker-attB (tol2)	made by Erin (Janelia)		
pDQM149	ef1a-extended:linker:Halo:linker-sv40-he1.1-tagbfp2-attB (tol2)	made by Erin (Janelia)		
pDQM150	ef1a-extended-mSG:CDT1-tPT2A-mYH:GMN (endogenous)			
pDQM151	ef1a-extended-mSG:CDT1 (endogenous)	Clones 3 & 4		
pDQM152	A2UCOE-ef1a-extended-skittles 4.0 (2xLynk:mSG-attP-Halo-attP-Electra-attP-mBeRFP-attP-mScarlet3-S2-attP-mTFP1)			
pDQM153	ef1a-extended::DHB:tdmSG:tPT2A:tdmScarlet3-S2:H2B-tol2	clone 1		
pDQM154	ef1a-extened::tdmScarlet3-S2:PCNA-tol2	clone 1 + 2		
pDQM155	ef1a-extended:DHB:tdmSG-tol2	clone 2 + 4		
pDQM156	A2UCOE-loxP-ef1a-extended-2xLynk:tdmSc3S2-SV40-lox2272-attB-tol2			
pDQM157	A2UCOE-FRT-ef1a-extended-2xLynk:tdmSc3S2-SV40-FRT3-attB-tol2			
pDQM158	A2UCOE-ef1a-extened::tdmScarlet3-S2:PCNA-tol2	TBD		
pDQM159	A2UCOE-ef1a-extended:DHB:tdmSG-tol2	TBD		
pDQM160	ef1a-extended-tdmScarlet3S2::GMN (endogenous)	clones 1 + 2		
MGCO-01	ef1a-2Xcox8A-linker-mStayGold-SV40-attb-tol2			
MGCO-02	ef1a-2Xcox8A-linker-mChilada-SV40-attb-tol2			
MGCO-03	ef1a-2Xcox8A-linker-Halo-SV40-attb-tol2			
MGCO-04	ef1a-linker-mStayGold-C4linker-sec61b-SV40-attb-tol2			
MGCO-05	ef1a-linker-mChilada-C4linker-sec61b-SV40-attb-tol2			
MGCO-06	ef1a-linker-Halo-sec61b-SV40-attb-tol2			
MGCO-07	ef1a-linker-mStayGold-C4linker-GM130-SV40-attb-tol2			
MGCO-08	ef1a-linker-mChilada-C4linker-GM130-SV40-attb-tol2			
MGCO-09	ef1a-linker-Halo-GM130-SV40-attb-tol2			
MGCO-10	ef1a-TGN46-linker-mStayGold-SV40-attb-tol2			
MGCO-11	ef1a-TGN46-linker-mChilada-SV40-attb-tol2			
MGCO-12	ef1a-TGN46-linker-Halo-SV40-attb-tol2			
MGCO-13	ef1a-linker-mStayGold-C4linker-rab5a-SV40-attb-tol2			
MGCO-14	ef1a-linker-Halo-rab5a-SV40-attb-tol2			
MGCO-15	ef1a-LAMP1-linker-mStayGold-SV40-attb-tol2			
MGCO-16	ef1a-LAMP1-linker-mChilada-SV40-attb-tol2			
MGCO-17	ef1a-Arl13b-linker-mStayGold-SV40-attb-tol2			
MGCO-18	ef1a-Arl13b-linker-Halo-SV40-attb-tol2			
MGCO-19	ef1a-linker-mStayGold-C4linker-alphatubulin-SV40-attb-tol2			
MGCO-20	ef1a-linker-Halo-linker-alphatubulin-SV40-attb-tol2			
MGCO-21	ef1a-vimentin-linker-mStayGold-SV40-attb-tol2			
MGCO-22	ef1a-vimentin-linker-Halo-linker-SV40-attb-tol2			
MGCO-23	ef1a-lifeact-linker-mStayGold-SV40-attb-tol2			
MGCO-24	ef1a-lifeact-linker-Halo-linker-SV40-attb-tol2			
MGCO-25	ef1a-linker-mStayGold-C4linker-MYH10-SV40-attb-tol2			
MGCO-26	ef1a-linker-mChilada-C4linker-MYH10-SV40-attb-tol2			
MGCO-27	ef1a-extended-linker-mStayGold-C4linker-sec61b-SV40-attb-tol2			
MGCO-28	ef1a-extended-2Xcox8A-linker-mStayGold-SV40-attb-tol2			
MGCO-29	ef1a-extended-linker-mStayGold-C4linker-GM130-SV40-attb-tol2			
MGCO-30	ef1a-extended-TGN46-linker-mStayGold-SV40-attb-tol2			
MGCO-31	ef1a-extended-LAMP1-linker-mStayGold-SV40-attb-tol2			
MGCO-32	ef1a-extended-linker-mStayGold-C4linker-alphatubulin-SV40-attb-tol2			
MGCO-33	ef1a-extended-vimentin-linker-mStayGold-SV40-attb-tol2			
MGCO-34	ef1a-extended-lifeact-linker-mStayGold-SV40-attb-tol2			
MGCO-35	ef1a-extended-2Xcox8A-linker-mScarlet3S2-SV40-attb-tol2			
MGCO-36	ef1a-extended-linker-mScarlet3S2-sec61b-SV40-attb-tol2			
MGCO-37	ef1a-extended-LAMP1-linker-mScarlet3S2-SV40-attb-tol2			
MGCO-38	ef1a-extended-linker-mStayGold-C4linker-MyosinII-SV40-attb-tol2			
MGCO-39	ef1a-extended-2Xcox8A-linker-Halo-SV40-attb-tol2			
MGCO-40	ef1a-extended-linker-Halo-sec61b-SV40-attb-tol2			
MGCO-41	ef1a-extended-linker-mScarlet3S2-GM130-SV40-attb-tol2			
MGCO-42	ef1a-extended-linker-Halo-GM130-SV40-attb-tol2			
MGCO-43	ef1a-extended-TGN46-linker-mScarlet3S2-SV40-attb-tol2			
MGCO-44	ef1a-extended-TGN46-linker-Halo-SV40-attb-tol2			
MGCO-45	ef1a-extended-linker-Halo-linker-alphatubulin-SV40-attb-tol2			
MGCO-46	ef1a-extended-vimentin-linker-Halo-linker-SV40-attb-tol2			
MGCO-47	ef1a-extended-lifeact-linker-Halo-linker-SV40-attb-tol2			
MGCO-48	ef1a-extended-linker-mScarlet3S2-linker-MyosinII-SV40-attb-tol2			
pMNM001	A2UCOE-sox10-linker-mChilada			
pMNM002	A2UCOE-ef1a-extended-link-tdm:mScarlet3S2			
pMNM003	phiC_opt-nanos3'UTR	used to make phiC-nanos 3'utr mRNA for pIGLET insertions		
pMNM004	SP6-tol2_opt-nanos3'UTR	used to make tol2-nanos 3'utr mRNA for tol2 based integration		
pMNM005	SP6-FLP-Xl-hmglobin 3'utr	used to make FLP mRNA (iCodon opt) for RCME with FLP		
pMNM006	SP6-FLPw-Xl-hmglobin 3'utr	used to make FLPw mRNA (iCodon opt) for RCME with FLP		
pMNM007	SP6-iCre-Xl-hmglobin 3'utr	used to make Cre mRNA (iCodon opt) for RCME with FLP		
pMNM008	SP6-PhiC-ERT2-Xl-hmglobin 3'utr	used to make PhiC-ERT2 inducible mRNA (iCodon opt) for skittles activation		
pCNH001	A2UCOE-ef1a-extended-linker-mTFP1			
pCNH002	A2UCOE-ef1a-extended-linker-mBeRFP			
pCNH003	A2UCOE-ef1a-extended-linker-Halo			
pCNH004	A2UCOE-ef1a-extended-N-term_linker-mStayGold (J)			
pCNH005	A2UCOE-ef1a-extended-linker-mStayGold(J)-C-term_linker			
pCNH006	A2UCOE-ef1a-extended-linker-mScarlet3S2			
pJWL001	ef1a-extended-2xLynk:tdmSc3S2-SV40-attB-tol2	added attB site to pDQM136		
pJWL002	A2UCOE-ef1a-extended-2xLynk:tdmSc3S2-SV40-attB-tol2	added attB site to pMNM002		
\.


--
-- Data for Name: staging_rna; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.staging_rna (name, description, notes, source, created_by) FROM stdin;
mYH:H2B				
mScarlet3-S2:H2B				
mBeRFP:H2B				
mChilada:H2B				
2xLynk:mSG				
2xLynk:mChilada				
2xLynk:mScarlet3-S2				
phiC				
phiC-NLS				
2xCox8A:mSG				
2xCox8A:mChilada				
2xCox8A:Halo				
2xCox8A:mScarlet3S2				
mSG:sec61b				
mChilada:sec61b				
Halo:sec61b				
mSG:GM130				
mChilada:GM130				
Halo:GM130				
TGN:mSG				
TGN:mChilada				
TGN:Halo				
mSG:rab5a				
mChilada:rab5a				
Halo:rab5a				
LAMP1:mSG				
LAMP1:mChilada				
LAMP1:Halo				
Arl13b:mSG				
Arl13b:mChilada				
Arl13b:Halo				
mSG:alpha-tub				
mChilada:alpha-tub				
Halo:alpha-tub				
Vimentin:mSG				
Vimentin:mChilada				
Vimentin:Halo				
Lifeact:mSG				
Lifeact:mChilada				
Lifeact:Halo				
mSG:MYH10				
mChilada:MYH10				
Halo:MYH10				
tdmChilada:PCNA				
tdmScarlet3S2:PCNA				
mScarlet3S2:sec61b				
MGCO-23 (LifeAct-mStayGold)				
HC-1 1:NLS-mScarlet3				
HC-2 2:NLS-mScarlet3				
HC-3 3:NLS-mScarlet3				
HC-4 5:NLS-mScarlet3				
HC-5 7:NLS-mScarlet3				
HC-6 9:NLS-mScarlet3				
HC-7 Vimentin:mScarlet3				
HC-8 Lifeact:mScarlet3				
HC-9 Lifeact:mStayGold				
HC-10 4x-Cox8:mStayGold				
HC-11 mTagBFP2:SKL				
\.


--
-- Data for Name: staging_rna_fluors; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.staging_rna_fluors (rna_name, fluor_name) FROM stdin;
2xCox8A:Halo	Halo
2xCox8A:mChilada	mChilada
2xCox8A:mSG	mSG
2xCox8A:mScarlet3S2	mScarlet3S2
2xLynk:mChilada	mChilada
2xLynk:mSG	mSG
2xLynk:mScarlet3-S2	mScarlet3S2
Arl13b:Halo	Halo
Arl13b:mChilada	mchilada
Arl13b:mSG	mSG
HC-1 1:NLS-mScarlet3	mScarlet3
HC-10 4x-Cox8:mStayGold	mStayGold
HC-11 mTagBFP2:SKL	mTagBFP2
HC-2 2:NLS-mScarlet3	mScarlet3
HC-3 3:NLS-mScarlet3	mScarlet3
HC-4 5:NLS-mScarlet3	mScarlet3
HC-5 7:NLS-mScarlet3	mScarlet3
HC-6 9:NLS-mScarlet3	mScarlet3
HC-7 Vimentin:mScarlet3	mScarlet3
HC-8 Lifeact:mScarlet3	mScarlet3
HC-9 Lifeact:mStayGold	mStayGold
Halo:GM130	halo
Halo:MYH10	halo
Halo:alpha-tub	halo
Halo:rab5a	halo
Halo:sec61b	halo
LAMP1:Halo	halo
LAMP1:mChilada	mchilada
LAMP1:mSG	mSG
Lifeact:Halo	halo
Lifeact:mChilada	mchilada
Lifeact:mSG	mSG
MGCO-23 (LifeAct-mStayGold)	mStayGold
TGN:Halo	Halo
TGN:mChilada	mChilada
TGN:mSG	mSG
Vimentin:Halo	Halo
Vimentin:mChilada	mChilada
Vimentin:mSG	mSG
mBeRFP:H2B	mBeRFP
mChilada:GM130	mChilada
mChilada:H2B	mChilada
mChilada:MYH10	mChilada
mChilada:alpha-tub	mChilada
mChilada:rab5a	mChilada
mChilada:sec61b	mChilada
mSG:GM130	mSG
mSG:MYH10	mSG
mSG:alpha-tub	mSG
mSG:rab5a	mSG
mSG:sec61b	mSG
mScarlet3-S2:H2B	mScarlet3S2
mScarlet3S2:sec61b	mScarlet3S2
mYH:H2B	mYH
phiC	
phiC-NLS	
tdmChilada:PCNA	tdmChilada
tdmScarlet3S2:PCNA	tdmScarlet3S2
\.


--
-- Data for Name: staging_selectedphenotypes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.staging_selectedphenotypes (name, type, description) FROM stdin;
\.


--
-- Data for Name: staging_strains; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.staging_strains (name, description) FROM stdin;
casper	
AB	
TU	
TUAB	
WIK	
unknown	
\.


--
-- Data for Name: staging_tanks; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.staging_tanks (tank_code, fish_code, tank_type, status, room, rack, "position", capacity, date_started, notes, created_by, name, type, location, background_strain_name) FROM stdin;
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Nursery A	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Growout 1	\N	\N	\N
\.


--
-- Data for Name: staging_tanks_optional; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.staging_tanks_optional (tank_name, fish_name, location, description) FROM stdin;
\.


--
-- Data for Name: staging_transgene_fluors; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.staging_transgene_fluors (transgene_name, fluor_name) FROM stdin;
Tg(pDQM005)301	tdmSG(J)
Tg(pDQM005)302	tdmSG(J)
Tg(pDQM005)303	tdmSG(J)
Tg(pDQM005)304	tdmSG(J)
Tg(pDQM005)305	tdmSG(J)
Tg(pDQM005)306	tdmSG(J)
Tg(pDQM005)307	tdmSG(J)
Tg(pDQM005)308	tdmSG(J)
Tg(pDQM034)309	??
Tg(pDQM034)310	??
Tg(pDQM034)317	??
Tg(pDQM036)318	??
Tg(pDQM036)319	??
Tg(pDQM059)316	??
Tg(pDQM059)320	??
Tg(pDQM059)321	??
Tg(pDQM063)311	??
Tg(pDQM063)312	??
Tg(pDQM063)313	??
Tg(pDQM063)314	??
Tg(pDQM082)315	tdmChilada
Tg(pDQM082)328	tdmChilada
Tg(pDQM094)326	tdmChilada_MAGPV
Tg(pDQM112)322	mScarlet
Tg(pDQM112)323	mScarlet
Tg(pDQM112)334	mScarlet
Tg(pDQM112)335	mScarlet
Tg(pDQM133)324	tdmScarlet3S2
Tg(pDQM136)325	tdmScarlet3S2
Tg(pDQM136)327	tdmScarlet3S2
Tg(pDQM137)329	mSG; Halo; Electra; mBeRFP; mScarlet3; mTFP1
Tg(pDQM137)330	mSG; Halo; Electra; mBeRFP; mScarlet3; mTFP1
Tg(pDQM137)331	mSG; Halo; Electra; mBeRFP; mScarlet3; mTFP1
Tg(pDQM137)332	mSG; Halo; Electra; mBeRFP; mScarlet3; mTFP1
Tg(pDQM137)333	mSG; Halo; Electra; mBeRFP; mScarlet3; mTFP1
\.


--
-- Data for Name: staging_transgenes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.staging_transgenes (name, type, description) FROM stdin;
Tg(pDQM005)301	integrated	ef1a:2xLynk:tdmSG(J)
Tg(pDQM005)301	integrated	ef1a:2xLynk:tdmSG(J)
Tg(pDQM005)301	integrated	ef1a:2xLynk:tdmSG(J)
Tg(pDQM005)302	integrated	ef1a:2xLynk:tdmSG(J)
Tg(pDQM005)302	integrated	ef1a:2xLynk:tdmSG(J)
Tg(pDQM005)302	integrated	ef1a:2xLynk:tdmSG(J)
Tg(pDQM005)303	integrated	ef1a:2xLynk:tdmSG(J)
Tg(pDQM005)303	integrated	ef1a:2xLynk:tdmSG(J)
Tg(pDQM005)304	integrated	ef1a:2xLynk:tdmSG(J)
Tg(pDQM005)305	integrated	ef1a:2xLynk:tdmSG(J)
Tg(pDQM005)306	integrated	ef1a:2xLynk:tdmSG(J)
Tg(pDQM005)307	integrated	ef1a:2xLynk:tdmSG(J)
Tg(pDQM005)308	integrated	ef1a:2xLynk:tdmSG(J)
Tg(pDQM034)309	integrated	ef1a:<cryaa:mSc>mKate2/mCitrine/Electra2/mKOK/mTFP1
Tg(pDQM034)309	integrated	ef1a:<cryaa:mSc>mKate2/mCitrine/Electra2/mKOK/mTFP1
Tg(pDQM034)309	integrated	ef1a:<cryaa:mSc>mKate2/mCitrine/Electra2/mKOK/mTFP1
Tg(pDQM034)309	integrated	ef1a:<cryaa:mSc>mKate2/mCitrine/Electra2/mKOK/mTFP1
Tg(pDQM034)310	integrated	ef1a:<cryaa:mSc>mKate2/mCitrine/Electra2/mKOK/mTFP1
Tg(pDQM034)310	integrated	ef1a:<cryaa:mSc>mKate2/mCitrine/Electra2/mKOK/mTFP1
Tg(pDQM034)310	integrated	ef1a:<cryaa:mSc>mKate2/mCitrine/Electra2/mKOK/mTFP1
Tg(pDQM034)310	integrated	ef1a:<cryaa:mSc>mKate2/mCitrine/Electra2/mKOK/mTFP1
Tg(pDQM063)311	integrated	ef1a:<exorh:GFP>mKate2/mCitrine/Electra2/mKOK/mTFP1
Tg(pDQM063)312	integrated	ef1a:<exorh:GFP>mKate2/mCitrine/Electra2/mKOK/mTFP1
Tg(pDQM063)311	integrated	ef1a:<exorh:GFP>mKate2/mCitrine/Electra2/mKOK/mTFP1
Tg(pDQM063)311	integrated	ef1a:<exorh:GFP>mKate2/mCitrine/Electra2/mKOK/mTFP1
Tg(pDQM063)313	integrated	ef1a:<exorh:GFP>mKate2/mCitrine/Electra2/mKOK/mTFP1
Tg(pDQM063)313	integrated	ef1a:<exorh:GFP>mKate2/mCitrine/Electra2/mKOK/mTFP1
Tg(pDQM063)313	integrated	ef1a:<exorh:GFP>mKate2/mCitrine/Electra2/mKOK/mTFP1
Tg(pDQM063)313	integrated	ef1a:<exorh:GFP>mKate2/mCitrine/Electra2/mKOK/mTFP1
Tg(pDQM063)314	integrated	ef1a:<exorh:GFP>mKate2/mCitrine/Electra2/mKOK/mTFP1
Tg(pDQM063)314	integrated	ef1a:<exorh:GFP>mKate2/mCitrine/Electra2/mKOK/mTFP1
Tg(pDQM063)314	integrated	ef1a:<exorh:GFP>mKate2/mCitrine/Electra2/mKOK/mTFP1
Tg(pDQM063)314	integrated	ef1a:<exorh:GFP>mKate2/mCitrine/Electra2/mKOK/mTFP1
Tg(pDQM082)315	integrated	ef1a:2xLynk:tdmChilada
Tg(pDQM082)315	integrated	ef1a:2xLynk:tdmChilada
Tg(pDQM082)328	integrated	ef1a:2xLynk:tdmChilada
Tg(pDQM059)316	integrated	ef1a:<exorh:GFP>mKate2/Electra2/mKOK/mTFP1
Tg(pDQM059)316	integrated	ef1a:<exorh:GFP>mKate2/Electra2/mKOK/mTFP1
Tg(pDQM059)316	integrated	ef1a:<exorh:GFP>mKate2/Electra2/mKOK/mTFP1
Tg(pDQM059)316	integrated	ef1a:<exorh:GFP>mKate2/Electra2/mKOK/mTFP1
Tg(pDQM034)317	integrated	ef1a:<cryaa:mSc>mKate2/mCitrine/Electra2/mKOK/mTFP1
Tg(pDQM034)317	integrated	ef1a:<cryaa:mSc>mKate2/mCitrine/Electra2/mKOK/mTFP1
Tg(pDQM036)318	integrated	ef1a:<cryaa:mSc>mKate2/Electra2/mKOK/mTFP1
Tg(pDQM036)318	integrated	ef1a:<cryaa:mSc>mKate2/Electra2/mKOK/mTFP1
Tg(pDQM036)318	integrated	ef1a:<cryaa:mSc>mKate2/Electra2/mKOK/mTFP1
Tg(pDQM036)318	integrated	ef1a:<cryaa:mSc>mKate2/Electra2/mKOK/mTFP1
Tg(pDQM036)319	integrated	ef1a:<cryaa:mSc>mKate2/Electra2/mKOK/mTFP1
Tg(pDQM036)319	integrated	ef1a:<cryaa:mSc>mKate2/Electra2/mKOK/mTFP1
Tg(pDQM036)319	integrated	ef1a:<cryaa:mSc>mKate2/Electra2/mKOK/mTFP1
Tg(pDQM036)319	integrated	ef1a:<cryaa:mSc>mKate2/Electra2/mKOK/mTFP1
Tg(pDQM059)320	integrated	ef1a:<exorh:GFP>mKate2/Electra2/mKOK/mTFP1
Tg(pDQM059)320	integrated	ef1a:<exorh:GFP>mKate2/Electra2/mKOK/mTFP1
Tg(pDQM059)320	integrated	ef1a:<exorh:GFP>mKate2/Electra2/mKOK/mTFP1
Tg(pDQM059)320	integrated	ef1a:<exorh:GFP>mKate2/Electra2/mKOK/mTFP1
Tg(pDQM059)321	integrated	ef1a:<exorh:GFP>mKate2/Electra2/mKOK/mTFP1
Tg(pDQM059)321	integrated	ef1a:<exorh:GFP>mKate2/Electra2/mKOK/mTFP1
Tg(pDQM059)321	integrated	ef1a:<exorh:GFP>mKate2/Electra2/mKOK/mTFP1
Tg(pDQM059)321	integrated	ef1a:<exorh:GFP>mKate2/Electra2/mKOK/mTFP1
Tg(pDQM112)322	integrated	hsp:PhiC-NLS;exorh:mScarlet
Tg(pDQM112)323	integrated	hsp:PhiC-NLS;exorh:mScarlet
Tg(pDQM133)324	integrated	ef1a-extened::tdmScarlet3-S2:H2B-tol2
Tg(pDQM133)324	integrated	ef1a-extened::tdmScarlet3-S2:H2B-tol2
Tg(pDQM136)325	integrated	ef1a-extended:2xLynk:tdmScarlet3-S2-tol2
Tg(pDQM136)325	integrated	ef1a-extended:2xLynk:tdmScarlet3-S2-tol2
Tg(pDQM136)327	integrated	ef1a-extended:2xLynk:tdmScarlet3-S2-tol2
Tg(pDQM136)327	integrated	ef1a-extended:2xLynk:tdmScarlet3-S2-tol2
Tg(pDQM094)326	integrated	ef1a:2xLynk:tdmSG(J)-tPT2A-tdmChilada(MAGPV):H2B
Tg(pDQM112)334	integrated	hsp:PhiC-NLS;exorh:mScarlet
Tg(pDQM112)334	integrated	hsp:PhiC-NLS;exorh:mScarlet
Tg(pDQM112)335	integrated	hsp:PhiC-NLS;exorh:mScarlet
Tg(pDQM137)330	integrated	ef1a-ext:<mem:mSG>Halo/Electra2/mBeRFP/mScarlet3S2/mTFP1
Tg(pDQM137)329	integrated	ef1a-ext:<mem:mSG>Halo/Electra2/mBeRFP/mScarlet3S2/mTFP1
Tg(pDQM137)329	integrated	ef1a-ext:<mem:mSG>Halo/Electra2/mBeRFP/mScarlet3S2/mTFP1
Tg(pDQM137)331	integrated	ef1a-ext:<mem:mSG>Halo/Electra2/mBeRFP/mScarlet3S2/mTFP1
Tg(pDQM137)331	integrated	ef1a-ext:<mem:mSG>Halo/Electra2/mBeRFP/mScarlet3S2/mTFP1
Tg(pDQM137)332	integrated	ef1a-ext:<mem:mSG>Halo/Electra2/mBeRFP/mScarlet3S2/mTFP1
Tg(pDQM137)333	integrated	ef1a-ext:<mem:mSG>Halo/Electra2/mBeRFP/mScarlet3S2/mTFP1
Tg(pDQM137)333	integrated	ef1a-ext:<mem:mSG>Halo/Electra2/mBeRFP/mScarlet3S2/mTFP1
Tg(pDQM137)332	integrated	ef1a-ext:<mem:mSG>Halo/Electra2/mBeRFP/mScarlet3S2/mTFP1
Tg(pDQM137)330	integrated	ef1a-ext:<mem:mSG>Halo/Electra2/mBeRFP/mScarlet3S2/mTFP1
\.


--
-- Data for Name: staging_treatment_dyes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.staging_treatment_dyes (treatment_label_or_name, dye_name, conc_um, notes) FROM stdin;
\.


--
-- Data for Name: staging_treatment_plasmids; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.staging_treatment_plasmids (treatment_label_or_name, plasmid_name, amount_ng, conc_ng_per_ul, notes) FROM stdin;
\.


--
-- Data for Name: staging_treatment_rnas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.staging_treatment_rnas (treatment_label_or_name, rna_name, amount_ng, notes) FROM stdin;
\.


--
-- Data for Name: staging_treatments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.staging_treatments (label, notes) FROM stdin;
\.


--
-- Data for Name: strains; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.strains (id, name, description, created_at, created_by, id_uuid) FROM stdin;
7	AB	\N	2025-09-12 22:00:28.223616+00	00000000-0000-0000-0000-000000000000	b618f4ce-2c5e-4da9-b979-93c888938936
8	casper	\N	2025-09-12 22:00:28.223616+00	00000000-0000-0000-0000-000000000000	a1c24336-e1ff-492a-9c5e-41ac6d12d5d4
9	TU	\N	2025-09-12 22:00:28.223616+00	00000000-0000-0000-0000-000000000000	f8f5a767-fec1-4ac6-b05c-92597284a09e
10	TUAB	\N	2025-09-12 22:00:28.223616+00	00000000-0000-0000-0000-000000000000	1c318a0c-177b-4e82-9873-47c6ca220eb8
11	unknown	\N	2025-09-12 22:00:28.223616+00	00000000-0000-0000-0000-000000000000	8884902e-e766-496a-8ab1-a5dfe18ba8c2
12	WIK	\N	2025-09-12 22:00:28.223616+00	00000000-0000-0000-0000-000000000000	1223f3ca-15b4-4d48-a60d-528c41084f29
\.


--
-- Data for Name: tank_categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tank_categories (id, name, is_nursery, max_age_days, notes) FROM stdin;
6	growout	f	\N	\N
1	nursery	t	5	\N
\.


--
-- Data for Name: tank_code_counters_site_yy; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tank_code_counters_site_yy (yy, site_code, last_num) FROM stdin;
25	ADULT	6
25	NURSERY	2
\.


--
-- Data for Name: tank_year_counters; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tank_year_counters (site, yy, next_serial) FROM stdin;
SITE	25	1
ADULT	25	3
NURSERY	25	10
\.


--
-- Data for Name: tanks; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tanks (id, name, location, description, created_at, created_by, tank_category_id, max_age_days_override, rack, code, id_uuid, type, notes, site_code, tank_code, tank_type) FROM stdin;
9	my favorite tank	\N	\N	2025-09-13 19:53:36.314366+00	d51b73e3-2c57-427c-9f9b-9c4c067f921f	\N	\N	\N	TK000003	b4b6e60b-c2a7-492f-a3aa-72eebad82bf1	\N	\N	ADULT	ADULT-tank-25-0003	4L
12	my favorite tank 2	\N	\N	2025-09-13 22:25:05.09844+00	d51b73e3-2c57-427c-9f9b-9c4c067f921f	\N	\N	\N	TK000006	69b83983-2ff1-422a-ad19-6942b0332e60	\N	\N	ADULT	ADULT-tank-25-0004	4L
13	tst tank	\N	\N	2025-09-13 22:48:29.533905+00	d51b73e3-2c57-427c-9f9b-9c4c067f921f	\N	\N	\N	TK000007	b491659b-e6d0-4951-9c32-6053a0df0763	\N	\N	ADULT	ADULT-tank-25-0005	4L
14	my tank	\N	\N	2025-09-13 23:14:09.361438+00	d51b73e3-2c57-427c-9f9b-9c4c067f921f	\N	\N	\N	TK000008	bc72e9fa-c6b8-493f-9996-a4869ecf7853	\N	\N	ADULT	ADULT-tank-25-0006	4L
5	Nursery A	\N	\N	2025-09-12 16:53:30.846248+00	00000000-0000-0000-0000-000000000000	1	\N	\N	ADULT-TANK-25-0001	b2feb31c-79eb-44d8-9558-df12ae786c5b	\N	\N	ADULT	ADULT-tank-25-0001	4L
6	Growout 1	\N	\N	2025-09-12 16:53:30.846248+00	00000000-0000-0000-0000-000000000000	6	\N	\N	ADULT-TANK-25-0002	5863ecc3-2a29-4940-b111-6e1bf55315fd	\N	\N	ADULT	ADULT-tank-25-0002	4L
19	Counter Test	NURSERY	\N	2025-09-14 02:31:24.202351+00	d51b73e3-2c57-427c-9f9b-9c4c067f921f	\N	\N	\N	NURSERY-TANK-25-0001	afcb2d8b-19d6-4dc7-861e-4769eab52b33	\N	\N	NURSERY	NURSERY-tank-25-0001	4L
22	Counter Test 2	NURSERY	\N	2025-09-14 02:32:49.245442+00	d51b73e3-2c57-427c-9f9b-9c4c067f921f	\N	\N	\N	NURSERY-TANK-25-0002	c8e402df-87b3-47d1-8852-297e79e4be6a	\N	\N	NURSERY	NURSERY-tank-25-0002	4L
25	Counter Test 043117	NURSERY	\N	2025-09-14 04:31:17.637774+00	d51b73e3-2c57-427c-9f9b-9c4c067f921f	\N	\N	\N	NURSERY-TANK-25-0004	07abfacc-166c-4840-9a98-f0897f35d61b	\N	\N	NURSERY	NURSERY-TANK-25-0004	4L
27	Tank for F-A91F9B21 21e25e87	NURSERY	\N	2025-09-14 06:20:31.941922+00	00000000-0000-0000-0000-000000000000	\N	\N	\N	NURSERY-TANK-25-0006	f9ab239d-28f5-435a-9313-73904cfb53ca	\N	\N	NURSERY	NURSERY-TANK-25-0006	4L
28	Tank for F-A91F9B21 cb63fbbf	NURSERY	\N	2025-09-14 06:22:26.669398+00	00000000-0000-0000-0000-000000000000	\N	\N	\N	NURSERY-TANK-25-0007	c0b2cb6b-53cc-43b2-8af5-4dc20dcc8bf4	\N	\N	NURSERY	NURSERY-TANK-25-0007	4L
29	tank of mem:tdmChilada 0a12898d	NURSERY	\N	2025-09-14 06:25:36.810067+00	00000000-0000-0000-0000-000000000000	\N	\N	\N	NURSERY-TANK-25-0008	ec3f67aa-7325-41d0-8342-ee4a0c2916bd	\N	\N	NURSERY	NURSERY-TANK-25-0008	4L
30	tank of mem:tdmChilada 2df5c042	NURSERY	\N	2025-09-14 06:31:08.255719+00	00000000-0000-0000-0000-000000000000	\N	\N	\N	NURSERY-TANK-25-0009	1be88494-3834-4237-8cd5-2f85ee63d3cd	\N	\N	NURSERY	NURSERY-TANK-25-0009	4L
31	tank of mem:tdmChilada 2d7bc191	NURSERY	\N	2025-09-14 06:32:25.57823+00	00000000-0000-0000-0000-000000000000	\N	\N	\N	NURSERY-TANK-25-0010	3191cede-2816-40b1-869b-8868684fab8b	\N	\N	NURSERY	NURSERY-TANK-25-0010	4L
\.


--
-- Data for Name: transgene_fluors; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.transgene_fluors (id, transgene_id, fluor_id, transgene_id_uuid, fluor_id_uuid) FROM stdin;
1	35	28	c9ab00c7-f93e-4e46-9988-6e325956c428	ee6f677b-6974-4b28-86e1-e2e56d5bc55b
2	20	1	db86082a-2cc4-43aa-b476-208f859ee52a	19f5bbc4-5e3a-4afa-b1a5-0f6fa4bd61bb
3	22	49	16f4a8aa-e9a1-4019-a997-c40c0caf9123	88269590-6694-4a4c-b513-1e1248155367
4	19	1	04845ee0-936f-4dbd-b386-2532d2d2f756	19f5bbc4-5e3a-4afa-b1a5-0f6fa4bd61bb
5	17	1	a0a87dca-12c8-444e-94a1-9d106960c10d	19f5bbc4-5e3a-4afa-b1a5-0f6fa4bd61bb
6	32	28	c68f7340-148b-4bed-a95c-d2c598d4d838	ee6f677b-6974-4b28-86e1-e2e56d5bc55b
7	3	52	f1d83281-b122-4f78-8cc4-a335d5d99d9d	3a0d39d1-3cfb-4991-b796-21c4bd06de90
8	33	28	4f2e5303-eca9-426e-bb7f-4e932f36b25e	ee6f677b-6974-4b28-86e1-e2e56d5bc55b
9	26	32	ca164bab-0583-4aab-86b0-591ccaf28e21	4d2b6ca6-7548-4222-b8c6-21f5910cec5b
10	30	58	3eafe7a2-db78-41c9-9046-5a95eab28e60	400d6025-0e1b-4fd4-bdaa-1d26144a8004
11	8	52	1a10d920-8597-47b5-833e-7797bee19299	3a0d39d1-3cfb-4991-b796-21c4bd06de90
12	13	1	dc32f9e0-b8d3-430f-a480-0839311e03e5	19f5bbc4-5e3a-4afa-b1a5-0f6fa4bd61bb
13	7	52	d29266fd-f153-42c0-b0a3-137a6006f6da	3a0d39d1-3cfb-4991-b796-21c4bd06de90
14	34	28	7a55d3ba-3c7c-4198-8e5d-2bf63fc118f6	ee6f677b-6974-4b28-86e1-e2e56d5bc55b
15	27	32	8efc1c9c-637f-472e-ba2f-6dfb72cc356b	4d2b6ca6-7548-4222-b8c6-21f5910cec5b
16	23	50	ef43e821-2e6b-4efa-b0c1-96461a3038e2	44b5169a-109e-49a9-af93-1423ca5e8bad
17	1	52	4cc58856-c13e-4869-8e75-24ac0896839e	3a0d39d1-3cfb-4991-b796-21c4bd06de90
18	25	32	9b026b99-48ac-493d-a930-5f9230dd295b	4d2b6ca6-7548-4222-b8c6-21f5910cec5b
19	14	1	e54880f4-ab1f-4b68-b6e3-570300089401	19f5bbc4-5e3a-4afa-b1a5-0f6fa4bd61bb
20	10	1	054f56c0-1a0b-443e-a54a-58d0c47847ba	19f5bbc4-5e3a-4afa-b1a5-0f6fa4bd61bb
21	31	28	332afbec-b3b9-4f6c-b3a0-17d28892f153	ee6f677b-6974-4b28-86e1-e2e56d5bc55b
22	5	52	a9ddc972-2df1-4624-b36d-e9719d06f525	3a0d39d1-3cfb-4991-b796-21c4bd06de90
23	21	49	b14cdedf-9eb3-454c-abd2-ae76033a645a	88269590-6694-4a4c-b513-1e1248155367
24	9	1	6df5ca5a-05cb-48cf-89be-143e90a47e92	19f5bbc4-5e3a-4afa-b1a5-0f6fa4bd61bb
25	6	52	71ae54b7-4da8-4fb6-af08-1fb7008545fe	3a0d39d1-3cfb-4991-b796-21c4bd06de90
26	11	1	39b59955-40e9-483d-a9e8-0d6913098904	19f5bbc4-5e3a-4afa-b1a5-0f6fa4bd61bb
27	15	1	4e2743a7-64c6-431d-aefa-d886f1eabb28	19f5bbc4-5e3a-4afa-b1a5-0f6fa4bd61bb
28	24	32	c2c97dd1-9015-4fb8-99fb-ad815a878f2a	4d2b6ca6-7548-4222-b8c6-21f5910cec5b
29	29	58	f5d39b3b-aabd-4a3e-9773-f59e5e4c3e16	400d6025-0e1b-4fd4-bdaa-1d26144a8004
30	28	58	dc35cc02-2805-4f2b-b322-5f84ee082190	400d6025-0e1b-4fd4-bdaa-1d26144a8004
31	4	52	e7649271-27c7-455f-b228-49b77316ec2d	3a0d39d1-3cfb-4991-b796-21c4bd06de90
32	16	1	86c009a7-e613-4e85-b416-fbfb941c4283	19f5bbc4-5e3a-4afa-b1a5-0f6fa4bd61bb
33	12	1	6dd019eb-af90-4782-a4b2-ce4a600b5287	19f5bbc4-5e3a-4afa-b1a5-0f6fa4bd61bb
34	2	52	10bf1ff1-6319-4652-854d-ea3395062d22	3a0d39d1-3cfb-4991-b796-21c4bd06de90
35	18	1	163f0308-840f-485c-bc05-24de7dac04f1	19f5bbc4-5e3a-4afa-b1a5-0f6fa4bd61bb
\.


--
-- Data for Name: transgenes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.transgenes (id, name, plasmid_id, description, created_at, created_by, type, plasmid_id_uuid, id_uuid) FROM stdin;
1	Tg(pDQM005)301	\N	ef1a:2xLynk:tdmSG(J)	2025-09-12 04:33:36.836566+00	84c9b40f-0450-4311-af2b-220cebfb4c19	integrated	\N	4cc58856-c13e-4869-8e75-24ac0896839e
2	Tg(pDQM005)302	\N	ef1a:2xLynk:tdmSG(J)	2025-09-12 04:33:36.836566+00	84c9b40f-0450-4311-af2b-220cebfb4c19	integrated	\N	10bf1ff1-6319-4652-854d-ea3395062d22
3	Tg(pDQM005)303	\N	ef1a:2xLynk:tdmSG(J)	2025-09-12 04:33:36.836566+00	84c9b40f-0450-4311-af2b-220cebfb4c19	integrated	\N	f1d83281-b122-4f78-8cc4-a335d5d99d9d
4	Tg(pDQM005)304	\N	ef1a:2xLynk:tdmSG(J)	2025-09-12 04:33:36.836566+00	84c9b40f-0450-4311-af2b-220cebfb4c19	integrated	\N	e7649271-27c7-455f-b228-49b77316ec2d
5	Tg(pDQM005)305	\N	ef1a:2xLynk:tdmSG(J)	2025-09-12 04:33:36.836566+00	84c9b40f-0450-4311-af2b-220cebfb4c19	integrated	\N	a9ddc972-2df1-4624-b36d-e9719d06f525
6	Tg(pDQM005)306	\N	ef1a:2xLynk:tdmSG(J)	2025-09-12 04:33:36.836566+00	84c9b40f-0450-4311-af2b-220cebfb4c19	integrated	\N	71ae54b7-4da8-4fb6-af08-1fb7008545fe
7	Tg(pDQM005)307	\N	ef1a:2xLynk:tdmSG(J)	2025-09-12 04:33:36.836566+00	84c9b40f-0450-4311-af2b-220cebfb4c19	integrated	\N	d29266fd-f153-42c0-b0a3-137a6006f6da
8	Tg(pDQM005)308	\N	ef1a:2xLynk:tdmSG(J)	2025-09-12 04:33:36.836566+00	84c9b40f-0450-4311-af2b-220cebfb4c19	integrated	\N	1a10d920-8597-47b5-833e-7797bee19299
9	Tg(pDQM034)309	\N	ef1a:<cryaa:mSc>mKate2/mCitrine/Electra2/mKOK/mTFP1	2025-09-12 04:33:36.836566+00	84c9b40f-0450-4311-af2b-220cebfb4c19	integrated	\N	6df5ca5a-05cb-48cf-89be-143e90a47e92
10	Tg(pDQM034)310	\N	ef1a:<cryaa:mSc>mKate2/mCitrine/Electra2/mKOK/mTFP1	2025-09-12 04:33:36.836566+00	84c9b40f-0450-4311-af2b-220cebfb4c19	integrated	\N	054f56c0-1a0b-443e-a54a-58d0c47847ba
17	Tg(pDQM063)311	\N	ef1a:<exorh:GFP>mKate2/mCitrine/Electra2/mKOK/mTFP1	2025-09-12 04:33:36.836566+00	84c9b40f-0450-4311-af2b-220cebfb4c19	integrated	\N	a0a87dca-12c8-444e-94a1-9d106960c10d
18	Tg(pDQM063)312	\N	ef1a:<exorh:GFP>mKate2/mCitrine/Electra2/mKOK/mTFP1	2025-09-12 04:33:36.836566+00	84c9b40f-0450-4311-af2b-220cebfb4c19	integrated	\N	163f0308-840f-485c-bc05-24de7dac04f1
19	Tg(pDQM063)313	\N	ef1a:<exorh:GFP>mKate2/mCitrine/Electra2/mKOK/mTFP1	2025-09-12 04:33:36.836566+00	84c9b40f-0450-4311-af2b-220cebfb4c19	integrated	\N	04845ee0-936f-4dbd-b386-2532d2d2f756
20	Tg(pDQM063)314	\N	ef1a:<exorh:GFP>mKate2/mCitrine/Electra2/mKOK/mTFP1	2025-09-12 04:33:36.836566+00	84c9b40f-0450-4311-af2b-220cebfb4c19	integrated	\N	db86082a-2cc4-43aa-b476-208f859ee52a
21	Tg(pDQM082)315	\N	ef1a:2xLynk:tdmChilada	2025-09-12 04:33:36.836566+00	84c9b40f-0450-4311-af2b-220cebfb4c19	integrated	\N	b14cdedf-9eb3-454c-abd2-ae76033a645a
22	Tg(pDQM082)328	\N	ef1a:2xLynk:tdmChilada	2025-09-12 04:33:36.836566+00	84c9b40f-0450-4311-af2b-220cebfb4c19	integrated	\N	16f4a8aa-e9a1-4019-a997-c40c0caf9123
14	Tg(pDQM059)316	\N	ef1a:<exorh:GFP>mKate2/Electra2/mKOK/mTFP1	2025-09-12 04:33:36.836566+00	84c9b40f-0450-4311-af2b-220cebfb4c19	integrated	\N	e54880f4-ab1f-4b68-b6e3-570300089401
31	Tg(pDQM137)329	\N	ef1a-ext:<mem:mSG>Halo/Electra2/mBeRFP/mScarlet3S2/mTFP1	2025-09-12 04:33:36.836566+00	84c9b40f-0450-4311-af2b-220cebfb4c19	integrated	\N	332afbec-b3b9-4f6c-b3a0-17d28892f153
11	Tg(pDQM034)317	\N	ef1a:<cryaa:mSc>mKate2/mCitrine/Electra2/mKOK/mTFP1	2025-09-12 04:33:36.836566+00	84c9b40f-0450-4311-af2b-220cebfb4c19	integrated	\N	39b59955-40e9-483d-a9e8-0d6913098904
12	Tg(pDQM036)318	\N	ef1a:<cryaa:mSc>mKate2/Electra2/mKOK/mTFP1	2025-09-12 04:33:36.836566+00	84c9b40f-0450-4311-af2b-220cebfb4c19	integrated	\N	6dd019eb-af90-4782-a4b2-ce4a600b5287
13	Tg(pDQM036)319	\N	ef1a:<cryaa:mSc>mKate2/Electra2/mKOK/mTFP1	2025-09-12 04:33:36.836566+00	84c9b40f-0450-4311-af2b-220cebfb4c19	integrated	\N	dc32f9e0-b8d3-430f-a480-0839311e03e5
15	Tg(pDQM059)320	\N	ef1a:<exorh:GFP>mKate2/Electra2/mKOK/mTFP1	2025-09-12 04:33:36.836566+00	84c9b40f-0450-4311-af2b-220cebfb4c19	integrated	\N	4e2743a7-64c6-431d-aefa-d886f1eabb28
16	Tg(pDQM059)321	\N	ef1a:<exorh:GFP>mKate2/Electra2/mKOK/mTFP1	2025-09-12 04:33:36.836566+00	84c9b40f-0450-4311-af2b-220cebfb4c19	integrated	\N	86c009a7-e613-4e85-b416-fbfb941c4283
24	Tg(pDQM112)322	\N	hsp:PhiC-NLS;exorh:mScarlet	2025-09-12 04:33:36.836566+00	84c9b40f-0450-4311-af2b-220cebfb4c19	integrated	\N	c2c97dd1-9015-4fb8-99fb-ad815a878f2a
25	Tg(pDQM112)323	\N	hsp:PhiC-NLS;exorh:mScarlet	2025-09-12 04:33:36.836566+00	84c9b40f-0450-4311-af2b-220cebfb4c19	integrated	\N	9b026b99-48ac-493d-a930-5f9230dd295b
28	Tg(pDQM133)324	\N	ef1a-extened::tdmScarlet3-S2:H2B-tol2	2025-09-12 04:33:36.836566+00	84c9b40f-0450-4311-af2b-220cebfb4c19	integrated	\N	dc35cc02-2805-4f2b-b322-5f84ee082190
29	Tg(pDQM136)325	\N	ef1a-extended:2xLynk:tdmScarlet3-S2-tol2	2025-09-12 04:33:36.836566+00	84c9b40f-0450-4311-af2b-220cebfb4c19	integrated	\N	f5d39b3b-aabd-4a3e-9773-f59e5e4c3e16
30	Tg(pDQM136)327	\N	ef1a-extended:2xLynk:tdmScarlet3-S2-tol2	2025-09-12 04:33:36.836566+00	84c9b40f-0450-4311-af2b-220cebfb4c19	integrated	\N	3eafe7a2-db78-41c9-9046-5a95eab28e60
23	Tg(pDQM094)326	\N	ef1a:2xLynk:tdmSG(J)-tPT2A-tdmChilada(MAGPV):H2B	2025-09-12 04:33:36.836566+00	84c9b40f-0450-4311-af2b-220cebfb4c19	integrated	\N	ef43e821-2e6b-4efa-b0c1-96461a3038e2
26	Tg(pDQM112)334	\N	hsp:PhiC-NLS;exorh:mScarlet	2025-09-12 04:33:36.836566+00	84c9b40f-0450-4311-af2b-220cebfb4c19	integrated	\N	ca164bab-0583-4aab-86b0-591ccaf28e21
27	Tg(pDQM112)335	\N	hsp:PhiC-NLS;exorh:mScarlet	2025-09-12 04:33:36.836566+00	84c9b40f-0450-4311-af2b-220cebfb4c19	integrated	\N	8efc1c9c-637f-472e-ba2f-6dfb72cc356b
32	Tg(pDQM137)330	\N	ef1a-ext:<mem:mSG>Halo/Electra2/mBeRFP/mScarlet3S2/mTFP1	2025-09-12 04:33:36.836566+00	84c9b40f-0450-4311-af2b-220cebfb4c19	integrated	\N	c68f7340-148b-4bed-a95c-d2c598d4d838
33	Tg(pDQM137)331	\N	ef1a-ext:<mem:mSG>Halo/Electra2/mBeRFP/mScarlet3S2/mTFP1	2025-09-12 04:33:36.836566+00	84c9b40f-0450-4311-af2b-220cebfb4c19	integrated	\N	4f2e5303-eca9-426e-bb7f-4e932f36b25e
34	Tg(pDQM137)332	\N	ef1a-ext:<mem:mSG>Halo/Electra2/mBeRFP/mScarlet3S2/mTFP1	2025-09-12 04:33:36.836566+00	84c9b40f-0450-4311-af2b-220cebfb4c19	integrated	\N	7a55d3ba-3c7c-4198-8e5d-2bf63fc118f6
35	Tg(pDQM137)333	\N	ef1a-ext:<mem:mSG>Halo/Electra2/mBeRFP/mScarlet3S2/mTFP1	2025-09-12 04:33:36.836566+00	84c9b40f-0450-4311-af2b-220cebfb4c19	integrated	\N	c9ab00c7-f93e-4e46-9988-6e325956c428
\.


--
-- Data for Name: transgenes_fluors; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.transgenes_fluors (transgene_id, fluor_id, transgene_id_uuid, fluor_id_uuid) FROM stdin;
35	28	c9ab00c7-f93e-4e46-9988-6e325956c428	ee6f677b-6974-4b28-86e1-e2e56d5bc55b
34	28	7a55d3ba-3c7c-4198-8e5d-2bf63fc118f6	ee6f677b-6974-4b28-86e1-e2e56d5bc55b
33	28	4f2e5303-eca9-426e-bb7f-4e932f36b25e	ee6f677b-6974-4b28-86e1-e2e56d5bc55b
31	28	332afbec-b3b9-4f6c-b3a0-17d28892f153	ee6f677b-6974-4b28-86e1-e2e56d5bc55b
32	28	c68f7340-148b-4bed-a95c-d2c598d4d838	ee6f677b-6974-4b28-86e1-e2e56d5bc55b
30	58	3eafe7a2-db78-41c9-9046-5a95eab28e60	400d6025-0e1b-4fd4-bdaa-1d26144a8004
29	58	f5d39b3b-aabd-4a3e-9773-f59e5e4c3e16	400d6025-0e1b-4fd4-bdaa-1d26144a8004
28	58	dc35cc02-2805-4f2b-b322-5f84ee082190	400d6025-0e1b-4fd4-bdaa-1d26144a8004
22	49	16f4a8aa-e9a1-4019-a997-c40c0caf9123	88269590-6694-4a4c-b513-1e1248155367
21	49	b14cdedf-9eb3-454c-abd2-ae76033a645a	88269590-6694-4a4c-b513-1e1248155367
16	1	86c009a7-e613-4e85-b416-fbfb941c4283	19f5bbc4-5e3a-4afa-b1a5-0f6fa4bd61bb
15	1	4e2743a7-64c6-431d-aefa-d886f1eabb28	19f5bbc4-5e3a-4afa-b1a5-0f6fa4bd61bb
13	1	dc32f9e0-b8d3-430f-a480-0839311e03e5	19f5bbc4-5e3a-4afa-b1a5-0f6fa4bd61bb
12	1	6dd019eb-af90-4782-a4b2-ce4a600b5287	19f5bbc4-5e3a-4afa-b1a5-0f6fa4bd61bb
11	1	39b59955-40e9-483d-a9e8-0d6913098904	19f5bbc4-5e3a-4afa-b1a5-0f6fa4bd61bb
14	1	e54880f4-ab1f-4b68-b6e3-570300089401	19f5bbc4-5e3a-4afa-b1a5-0f6fa4bd61bb
20	1	db86082a-2cc4-43aa-b476-208f859ee52a	19f5bbc4-5e3a-4afa-b1a5-0f6fa4bd61bb
19	1	04845ee0-936f-4dbd-b386-2532d2d2f756	19f5bbc4-5e3a-4afa-b1a5-0f6fa4bd61bb
18	1	163f0308-840f-485c-bc05-24de7dac04f1	19f5bbc4-5e3a-4afa-b1a5-0f6fa4bd61bb
17	1	a0a87dca-12c8-444e-94a1-9d106960c10d	19f5bbc4-5e3a-4afa-b1a5-0f6fa4bd61bb
10	1	054f56c0-1a0b-443e-a54a-58d0c47847ba	19f5bbc4-5e3a-4afa-b1a5-0f6fa4bd61bb
9	1	6df5ca5a-05cb-48cf-89be-143e90a47e92	19f5bbc4-5e3a-4afa-b1a5-0f6fa4bd61bb
8	52	1a10d920-8597-47b5-833e-7797bee19299	3a0d39d1-3cfb-4991-b796-21c4bd06de90
7	52	d29266fd-f153-42c0-b0a3-137a6006f6da	3a0d39d1-3cfb-4991-b796-21c4bd06de90
6	52	71ae54b7-4da8-4fb6-af08-1fb7008545fe	3a0d39d1-3cfb-4991-b796-21c4bd06de90
5	52	a9ddc972-2df1-4624-b36d-e9719d06f525	3a0d39d1-3cfb-4991-b796-21c4bd06de90
4	52	e7649271-27c7-455f-b228-49b77316ec2d	3a0d39d1-3cfb-4991-b796-21c4bd06de90
3	52	f1d83281-b122-4f78-8cc4-a335d5d99d9d	3a0d39d1-3cfb-4991-b796-21c4bd06de90
2	52	10bf1ff1-6319-4652-854d-ea3395062d22	3a0d39d1-3cfb-4991-b796-21c4bd06de90
1	52	4cc58856-c13e-4869-8e75-24ac0896839e	3a0d39d1-3cfb-4991-b796-21c4bd06de90
23	50	ef43e821-2e6b-4efa-b0c1-96461a3038e2	44b5169a-109e-49a9-af93-1423ca5e8bad
27	32	8efc1c9c-637f-472e-ba2f-6dfb72cc356b	4d2b6ca6-7548-4222-b8c6-21f5910cec5b
26	32	ca164bab-0583-4aab-86b0-591ccaf28e21	4d2b6ca6-7548-4222-b8c6-21f5910cec5b
25	32	9b026b99-48ac-493d-a930-5f9230dd295b	4d2b6ca6-7548-4222-b8c6-21f5910cec5b
24	32	c2c97dd1-9015-4fb8-99fb-ad815a878f2a	4d2b6ca6-7548-4222-b8c6-21f5910cec5b
\.


--
-- Data for Name: treatment_dyes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.treatment_dyes (treatment_id, dye_id_uuid, conc_um, notes, created_at, created_by) FROM stdin;
0e6dcd15-5ae5-4fb3-be4b-07afd7014db4	baf10673-4565-47e2-ac79-a3542ee4f8aa	\N	\N	2025-09-13 17:13:20.742189+00	\N
b8c81454-3a46-45a3-ad7c-652499ba722f	d42cdbd0-f12e-4e1f-937c-2fb7f963c67f	\N	\N	2025-09-13 23:13:49.173061+00	\N
b8c81454-3a46-45a3-ad7c-652499ba722f	baf10673-4565-47e2-ac79-a3542ee4f8aa	\N	\N	2025-09-13 23:13:49.173061+00	\N
\.


--
-- Data for Name: treatment_dyes_old; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.treatment_dyes_old (treatment_id, dye_id, conc_um, notes, dye_id_uuid) FROM stdin;
\.


--
-- Data for Name: treatment_plasmids; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.treatment_plasmids (treatment_id, plasmid_id, amount_ng, conc_ng_per_ul, notes, plasmid_id_uuid) FROM stdin;
bcb5fbde-94e3-4134-8f1a-3be164170644	8	\N	\N	\N	\N
b8c81454-3a46-45a3-ad7c-652499ba722f	8	\N	\N	\N	\N
b8c81454-3a46-45a3-ad7c-652499ba722f	5	\N	\N	\N	\N
\.


--
-- Data for Name: treatment_rnas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.treatment_rnas (treatment_id, rna_id, amount_ng, notes, rna_id_uuid) FROM stdin;
bcb5fbde-94e3-4134-8f1a-3be164170644	7a572491-facb-4651-8ab7-7ec1edbe926d	\N	\N	\N
bcb5fbde-94e3-4134-8f1a-3be164170644	9a727a16-c1c3-493b-97be-7055eb1f076d	\N	\N	\N
b8c81454-3a46-45a3-ad7c-652499ba722f	bedd3ce2-6b6b-4dce-977c-5bc099353257	\N	\N	\N
b8c81454-3a46-45a3-ad7c-652499ba722f	9ab20cce-d03d-4b6f-b68e-46854dc000a4	\N	\N	\N
b8c81454-3a46-45a3-ad7c-652499ba722f	b4834bcd-d042-4b9a-a42f-c259d82b9346	\N	\N	\N
\.


--
-- Data for Name: treatments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.treatments (id, notes) FROM stdin;
0e6dcd15-5ae5-4fb3-be4b-07afd7014db4	\N
bcb5fbde-94e3-4134-8f1a-3be164170644	test
b8c81454-3a46-45a3-ad7c-652499ba722f	test
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: realtime; Owner: supabase_admin
--

COPY realtime.schema_migrations (version, inserted_at) FROM stdin;
20211116024918	2025-09-05 23:14:19
20211116045059	2025-09-05 23:14:21
20211116050929	2025-09-05 23:14:23
20211116051442	2025-09-05 23:14:25
20211116212300	2025-09-05 23:14:27
20211116213355	2025-09-05 23:14:28
20211116213934	2025-09-05 23:14:30
20211116214523	2025-09-05 23:14:33
20211122062447	2025-09-05 23:14:34
20211124070109	2025-09-05 23:14:36
20211202204204	2025-09-05 23:14:38
20211202204605	2025-09-05 23:14:40
20211210212804	2025-09-05 23:14:45
20211228014915	2025-09-05 23:14:47
20220107221237	2025-09-05 23:14:49
20220228202821	2025-09-05 23:14:50
20220312004840	2025-09-05 23:14:52
20220603231003	2025-09-05 23:14:55
20220603232444	2025-09-05 23:14:57
20220615214548	2025-09-05 23:14:59
20220712093339	2025-09-05 23:15:00
20220908172859	2025-09-05 23:15:02
20220916233421	2025-09-05 23:15:04
20230119133233	2025-09-05 23:15:06
20230128025114	2025-09-05 23:15:08
20230128025212	2025-09-05 23:15:10
20230227211149	2025-09-05 23:15:11
20230228184745	2025-09-05 23:15:13
20230308225145	2025-09-05 23:15:15
20230328144023	2025-09-05 23:15:17
20231018144023	2025-09-05 23:15:19
20231204144023	2025-09-05 23:15:21
20231204144024	2025-09-05 23:15:23
20231204144025	2025-09-05 23:15:25
20240108234812	2025-09-05 23:15:27
20240109165339	2025-09-05 23:15:28
20240227174441	2025-09-05 23:15:31
20240311171622	2025-09-05 23:15:34
20240321100241	2025-09-05 23:15:38
20240401105812	2025-09-05 23:15:42
20240418121054	2025-09-05 23:15:45
20240523004032	2025-09-05 23:15:51
20240618124746	2025-09-05 23:15:53
20240801235015	2025-09-05 23:15:55
20240805133720	2025-09-05 23:15:56
20240827160934	2025-09-05 23:15:58
20240919163303	2025-09-05 23:16:00
20240919163305	2025-09-05 23:16:02
20241019105805	2025-09-05 23:16:04
20241030150047	2025-09-05 23:16:10
20241108114728	2025-09-05 23:16:13
20241121104152	2025-09-05 23:16:15
20241130184212	2025-09-05 23:16:17
20241220035512	2025-09-05 23:16:18
20241220123912	2025-09-05 23:16:20
20241224161212	2025-09-05 23:16:22
20250107150512	2025-09-05 23:16:24
20250110162412	2025-09-05 23:16:25
20250123174212	2025-09-05 23:16:27
20250128220012	2025-09-05 23:16:29
20250506224012	2025-09-05 23:16:30
20250523164012	2025-09-05 23:16:32
20250714121412	2025-09-05 23:16:34
\.


--
-- Data for Name: subscription; Type: TABLE DATA; Schema: realtime; Owner: supabase_admin
--

COPY realtime.subscription (id, subscription_id, entity, filters, claims, created_at) FROM stdin;
\.


--
-- Data for Name: buckets; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.buckets (id, name, owner, created_at, updated_at, public, avif_autodetection, file_size_limit, allowed_mime_types, owner_id) FROM stdin;
\.


--
-- Data for Name: migrations; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.migrations (id, name, hash, executed_at) FROM stdin;
0	create-migrations-table	e18db593bcde2aca2a408c4d1100f6abba2195df	2025-09-05 23:14:16.778275
1	initialmigration	6ab16121fbaa08bbd11b712d05f358f9b555d777	2025-09-05 23:14:16.784793
2	storage-schema	5c7968fd083fcea04050c1b7f6253c9771b99011	2025-09-05 23:14:16.791986
3	pathtoken-column	2cb1b0004b817b29d5b0a971af16bafeede4b70d	2025-09-05 23:14:16.819535
4	add-migrations-rls	427c5b63fe1c5937495d9c635c263ee7a5905058	2025-09-05 23:14:16.880515
5	add-size-functions	79e081a1455b63666c1294a440f8ad4b1e6a7f84	2025-09-05 23:14:16.886006
6	change-column-name-in-get-size	f93f62afdf6613ee5e7e815b30d02dc990201044	2025-09-05 23:14:16.892024
7	add-rls-to-buckets	e7e7f86adbc51049f341dfe8d30256c1abca17aa	2025-09-05 23:14:16.898168
8	add-public-to-buckets	fd670db39ed65f9d08b01db09d6202503ca2bab3	2025-09-05 23:14:16.903582
9	fix-search-function	3a0af29f42e35a4d101c259ed955b67e1bee6825	2025-09-05 23:14:16.909135
10	search-files-search-function	68dc14822daad0ffac3746a502234f486182ef6e	2025-09-05 23:14:16.914834
11	add-trigger-to-auto-update-updated_at-column	7425bdb14366d1739fa8a18c83100636d74dcaa2	2025-09-05 23:14:16.920699
12	add-automatic-avif-detection-flag	8e92e1266eb29518b6a4c5313ab8f29dd0d08df9	2025-09-05 23:14:16.928581
13	add-bucket-custom-limits	cce962054138135cd9a8c4bcd531598684b25e7d	2025-09-05 23:14:16.934029
14	use-bytes-for-max-size	941c41b346f9802b411f06f30e972ad4744dad27	2025-09-05 23:14:16.940054
15	add-can-insert-object-function	934146bc38ead475f4ef4b555c524ee5d66799e5	2025-09-05 23:14:16.97103
16	add-version	76debf38d3fd07dcfc747ca49096457d95b1221b	2025-09-05 23:14:16.977037
17	drop-owner-foreign-key	f1cbb288f1b7a4c1eb8c38504b80ae2a0153d101	2025-09-05 23:14:16.983034
18	add_owner_id_column_deprecate_owner	e7a511b379110b08e2f214be852c35414749fe66	2025-09-05 23:14:16.989548
19	alter-default-value-objects-id	02e5e22a78626187e00d173dc45f58fa66a4f043	2025-09-05 23:14:16.99762
20	list-objects-with-delimiter	cd694ae708e51ba82bf012bba00caf4f3b6393b7	2025-09-05 23:14:17.004274
21	s3-multipart-uploads	8c804d4a566c40cd1e4cc5b3725a664a9303657f	2025-09-05 23:14:17.013925
22	s3-multipart-uploads-big-ints	9737dc258d2397953c9953d9b86920b8be0cdb73	2025-09-05 23:14:17.031137
23	optimize-search-function	9d7e604cddc4b56a5422dc68c9313f4a1b6f132c	2025-09-05 23:14:17.045116
24	operation-function	8312e37c2bf9e76bbe841aa5fda889206d2bf8aa	2025-09-05 23:14:17.051046
25	custom-metadata	d974c6057c3db1c1f847afa0e291e6165693b990	2025-09-05 23:14:17.058525
\.


--
-- Data for Name: objects; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.objects (id, bucket_id, name, owner, created_at, updated_at, last_accessed_at, metadata, version, owner_id, user_metadata) FROM stdin;
\.


--
-- Data for Name: s3_multipart_uploads; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.s3_multipart_uploads (id, in_progress_size, upload_signature, bucket_id, key, version, owner_id, created_at, user_metadata) FROM stdin;
\.


--
-- Data for Name: s3_multipart_uploads_parts; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.s3_multipart_uploads_parts (id, upload_id, size, part_number, bucket_id, key, etag, owner_id, version, created_at) FROM stdin;
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: supabase_migrations; Owner: postgres
--

COPY supabase_migrations.schema_migrations (version, statements, name) FROM stdin;
20250831000000	{"CREATE SCHEMA IF NOT EXISTS extensions","CREATE EXTENSION IF NOT EXISTS pg_trgm WITH SCHEMA extensions","CREATE EXTENSION IF NOT EXISTS pgcrypto WITH SCHEMA extensions","CREATE EXTENSION IF NOT EXISTS \\"uuid-ossp\\" WITH SCHEMA extensions"}	enable_extensions
20250901000000	{"SET search_path = public, extensions","--\n-- PostgreSQL database dump\n--\n\n-- Dumped from database version 17.4\n-- Dumped by pg_dump version 17.4\n\nSET statement_timeout = 0","SET lock_timeout = 0","SET idle_in_transaction_session_timeout = 0","SET transaction_timeout = 0","SET client_encoding = 'UTF8'","SET standard_conforming_strings = on","SELECT pg_catalog.set_config('search_path', '', false)","SET check_function_bodies = false","SET xmloption = content","SET client_min_messages = warning","SET row_security = off","--\n-- Name: public; Type: SCHEMA; Schema: -; Owner: -\n--\n\n\n\n--\n-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: -\n--\n\n\n\n--\n-- Name: element_type; Type: TYPE; Schema: public; Owner: -\n--\n\nCREATE TYPE public.element_type AS ENUM (\n    'linker',\n    'backbone',\n    'backbone_selection_gene',\n    'enzyme_hatching',\n    'enzyme_integrase',\n    'enzyme_protease',\n    'enzyme_transposon',\n    'fluor',\n    'peptide_self_cleaving',\n    'promoter',\n    'sequence_enhancer',\n    'sequence_expression_enhancer',\n    'sequence_recombination_site',\n    'tag',\n    'tag_localization',\n    'tag_solubility',\n    'unspecified'\n)","--\n-- Name: fish_treatment_types; Type: TYPE; Schema: public; Owner: -\n--\n\nCREATE TYPE public.fish_treatment_types AS ENUM (\n    'dye',\n    'heat_shock',\n    'drug',\n    'chemical_switch',\n    'injection_rna',\n    'injection_plasmid'\n)","--\n-- Name: handle_new_user(); Type: FUNCTION; Schema: public; Owner: -\n--\n\nCREATE FUNCTION public.handle_new_user() RETURNS trigger\n    LANGUAGE plpgsql SECURITY DEFINER\n    AS $$\nbegin\n  insert into public.profiles (id, email)\n  values (new.id, new.email)\n  on conflict (id) do nothing;\n  return new;\nend;\n$$","--\n-- Name: set_created_by(); Type: FUNCTION; Schema: public; Owner: -\n--\n\nCREATE FUNCTION public.set_created_by() RETURNS trigger\n    LANGUAGE plpgsql\n    AS $$\nBEGIN\n  IF NEW.created_by IS NULL THEN\n    NEW.created_by := auth.uid();\n  END IF;\n  RETURN NEW;\nEND;\n$$","--\n-- Name: set_fish_code_per_year(); Type: FUNCTION; Schema: public; Owner: -\n--\n\nCREATE FUNCTION public.set_fish_code_per_year() RETURNS trigger\n    LANGUAGE plpgsql\n    AS $$\nDECLARE\n  yr       integer;\n  next_val integer;\nBEGIN\n  IF NEW.created_at IS NULL THEN\n    NEW.created_at := now();\n  END IF;\n\n  yr := CAST(to_char(NEW.created_at, 'YYYY') AS integer);\n\n  INSERT INTO fish_year_counters AS c (year, last_val)\n       VALUES (yr, 1)\n  ON CONFLICT (year)\n    DO UPDATE SET last_val = c.last_val + 1\n  RETURNING last_val\n    INTO next_val;\n\n  NEW.fish_code := 'FSH-' || yr::text || '-' || lpad(next_val::text, 4, '0');\n  RETURN NEW;\nEND;\n$$","--\n-- Name: set_updated_at(); Type: FUNCTION; Schema: public; Owner: -\n--\n\nCREATE FUNCTION public.set_updated_at() RETURNS trigger\n    LANGUAGE plpgsql\n    AS $$\nbegin\n  new.updated_at := now();\n  return new;\nend$$","SET default_tablespace = ''","SET default_table_access_method = heap","--\n-- Name: cassettes; Type: TABLE; Schema: public; Owner: -\n--\n\nCREATE TABLE public.cassettes (\n    id bigint NOT NULL,\n    name text NOT NULL,\n    notes text,\n    created_by uuid DEFAULT '00000000-0000-0000-0000-000000000000'::uuid NOT NULL,\n    created_at timestamp with time zone DEFAULT now() NOT NULL,\n    updated_at timestamp with time zone DEFAULT now() NOT NULL\n)","--\n-- Name: cassettes_elements; Type: TABLE; Schema: public; Owner: -\n--\n\nCREATE TABLE public.cassettes_elements (\n    id bigint NOT NULL,\n    cassette_id bigint NOT NULL,\n    element_id bigint NOT NULL,\n    \\"position\\" integer DEFAULT 1 NOT NULL,\n    role text,\n    notes text,\n    created_by uuid DEFAULT '00000000-0000-0000-0000-000000000000'::uuid NOT NULL,\n    created_at timestamp with time zone DEFAULT now() NOT NULL,\n    updated_at timestamp with time zone DEFAULT now() NOT NULL\n)","--\n-- Name: cassettes_elements_id_seq; Type: SEQUENCE; Schema: public; Owner: -\n--\n\nCREATE SEQUENCE public.cassettes_elements_id_seq\n    START WITH 1\n    INCREMENT BY 1\n    NO MINVALUE\n    NO MAXVALUE\n    CACHE 1","--\n-- Name: cassettes_elements_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -\n--\n\nALTER SEQUENCE public.cassettes_elements_id_seq OWNED BY public.cassettes_elements.id","--\n-- Name: cassettes_id_seq; Type: SEQUENCE; Schema: public; Owner: -\n--\n\nCREATE SEQUENCE public.cassettes_id_seq\n    START WITH 1\n    INCREMENT BY 1\n    NO MINVALUE\n    NO MAXVALUE\n    CACHE 1","--\n-- Name: cassettes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -\n--\n\nALTER SEQUENCE public.cassettes_id_seq OWNED BY public.cassettes.id","--\n-- Name: elements; Type: TABLE; Schema: public; Owner: -\n--\n\nCREATE TABLE public.elements (\n    id bigint NOT NULL,\n    name text NOT NULL,\n    element_type public.element_type DEFAULT 'unspecified'::public.element_type NOT NULL,\n    description text,\n    created_at timestamp with time zone DEFAULT now() NOT NULL,\n    created_by uuid DEFAULT '00000000-0000-0000-0000-000000000000'::uuid NOT NULL\n)","--\n-- Name: fish; Type: TABLE; Schema: public; Owner: -\n--\n\nCREATE TABLE public.fish (\n    id bigint NOT NULL,\n    name text NOT NULL,\n    date_birth date,\n    notes text,\n    mother_fish_id bigint,\n    father_fish_id bigint,\n    line_building_stage text,\n    created_at timestamp with time zone DEFAULT now() NOT NULL,\n    fish_code text,\n    created_by uuid DEFAULT auth.uid() NOT NULL,\n    CONSTRAINT fish_name_btrim CHECK ((name = btrim(name)))\n)","--\n-- Name: fish_mutations; Type: TABLE; Schema: public; Owner: -\n--\n\nCREATE TABLE public.fish_mutations (\n    fish_id bigint NOT NULL,\n    mutation_id bigint NOT NULL,\n    created_at timestamp with time zone DEFAULT now() NOT NULL\n)","--\n-- Name: fish_strains; Type: TABLE; Schema: public; Owner: -\n--\n\nCREATE TABLE public.fish_strains (\n    fish_id bigint NOT NULL,\n    strain_id bigint NOT NULL,\n    created_at timestamp with time zone DEFAULT now() NOT NULL\n)","--\n-- Name: fish_transgenes; Type: TABLE; Schema: public; Owner: -\n--\n\nCREATE TABLE public.fish_transgenes (\n    fish_id bigint NOT NULL,\n    transgene_id bigint NOT NULL,\n    created_at timestamp with time zone DEFAULT now() NOT NULL\n)","--\n-- Name: fish_treatments; Type: TABLE; Schema: public; Owner: -\n--\n\nCREATE TABLE public.fish_treatments (\n    fish_id bigint NOT NULL,\n    treatment_id bigint NOT NULL,\n    created_at timestamp with time zone DEFAULT now() NOT NULL\n)","--\n-- Name: mutations; Type: TABLE; Schema: public; Owner: -\n--\n\nCREATE TABLE public.mutations (\n    id bigint NOT NULL,\n    name text NOT NULL,\n    gene text,\n    notes text,\n    created_at timestamp with time zone DEFAULT now() NOT NULL,\n    created_by uuid DEFAULT auth.uid() NOT NULL\n)","--\n-- Name: strains; Type: TABLE; Schema: public; Owner: -\n--\n\nCREATE TABLE public.strains (\n    id bigint NOT NULL,\n    name text NOT NULL,\n    notes text,\n    created_at timestamp with time zone DEFAULT now() NOT NULL,\n    created_by uuid DEFAULT auth.uid() NOT NULL\n)","--\n-- Name: transgenes; Type: TABLE; Schema: public; Owner: -\n--\n\nCREATE TABLE public.transgenes (\n    id bigint NOT NULL,\n    name text NOT NULL,\n    plasmid_id bigint,\n    notes text,\n    created_at timestamp with time zone DEFAULT now() NOT NULL,\n    created_by uuid DEFAULT auth.uid() NOT NULL\n)","--\n-- Name: treatments; Type: TABLE; Schema: public; Owner: -\n--\n\nCREATE TABLE public.treatments (\n    id bigint NOT NULL,\n    treatment_type public.fish_treatment_types NOT NULL,\n    treatment_name text NOT NULL,\n    notes text,\n    created_at timestamp with time zone DEFAULT now() NOT NULL,\n    created_by uuid DEFAULT auth.uid() NOT NULL\n)","--\n-- Name: fish_feature_summary; Type: VIEW; Schema: public; Owner: -\n--\n\nCREATE VIEW public.fish_feature_summary AS\n SELECT f.id AS fish_id,\n    f.name,\n    string_agg(DISTINCT tg.name, ', '::text ORDER BY tg.name) AS transgenes,\n    string_agg(DISTINCT mu.name, ', '::text ORDER BY mu.name) AS mutations,\n    string_agg(DISTINCT st.name, ', '::text ORDER BY st.name) AS strains,\n    string_agg(DISTINCT ((COALESCE((t.treatment_type)::text, ''::text) || ':'::text) || COALESCE(t.treatment_name, ''::text)), ', '::text ORDER BY ((COALESCE((t.treatment_type)::text, ''::text) || ':'::text) || COALESCE(t.treatment_name, ''::text))) AS treatments\n   FROM ((((((((public.fish f\n     LEFT JOIN public.fish_transgenes ftg ON ((ftg.fish_id = f.id)))\n     LEFT JOIN public.transgenes tg ON ((tg.id = ftg.transgene_id)))\n     LEFT JOIN public.fish_mutations fmu ON ((fmu.fish_id = f.id)))\n     LEFT JOIN public.mutations mu ON ((mu.id = fmu.mutation_id)))\n     LEFT JOIN public.fish_strains fs ON ((fs.fish_id = f.id)))\n     LEFT JOIN public.strains st ON ((st.id = fs.strain_id)))\n     LEFT JOIN public.fish_treatments ftr ON ((ftr.fish_id = f.id)))\n     LEFT JOIN public.treatments t ON ((t.id = ftr.treatment_id)))\n  GROUP BY f.id, f.name","--\n-- Name: fish_id_seq; Type: SEQUENCE; Schema: public; Owner: -\n--\n\nCREATE SEQUENCE public.fish_id_seq\n    START WITH 1\n    INCREMENT BY 1\n    NO MINVALUE\n    NO MAXVALUE\n    CACHE 1","--\n-- Name: fish_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -\n--\n\nALTER SEQUENCE public.fish_id_seq OWNED BY public.fish.id","--\n-- Name: fish_year_counters; Type: TABLE; Schema: public; Owner: -\n--\n\nCREATE TABLE public.fish_year_counters (\n    year integer NOT NULL,\n    last_val integer NOT NULL\n)","--\n-- Name: mutations_id_seq; Type: SEQUENCE; Schema: public; Owner: -\n--\n\nCREATE SEQUENCE public.mutations_id_seq\n    START WITH 1\n    INCREMENT BY 1\n    NO MINVALUE\n    NO MAXVALUE\n    CACHE 1","--\n-- Name: mutations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -\n--\n\nALTER SEQUENCE public.mutations_id_seq OWNED BY public.mutations.id","--\n-- Name: notes; Type: TABLE; Schema: public; Owner: -\n--\n\nCREATE TABLE public.notes (\n    id bigint NOT NULL,\n    user_id uuid NOT NULL,\n    title text NOT NULL,\n    body text,\n    created_at timestamp with time zone DEFAULT now()\n)","--\n-- Name: notes_id_seq; Type: SEQUENCE; Schema: public; Owner: -\n--\n\nCREATE SEQUENCE public.notes_id_seq\n    START WITH 1\n    INCREMENT BY 1\n    NO MINVALUE\n    NO MAXVALUE\n    CACHE 1","--\n-- Name: notes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -\n--\n\nALTER SEQUENCE public.notes_id_seq OWNED BY public.notes.id","--\n-- Name: plasmids; Type: TABLE; Schema: public; Owner: -\n--\n\nCREATE TABLE public.plasmids (\n    id bigint NOT NULL,\n    name text NOT NULL,\n    description text,\n    created_at timestamp with time zone DEFAULT now() NOT NULL,\n    nickname text,\n    marker text,\n    resistance text,\n    notes text,\n    created_by uuid DEFAULT auth.uid() NOT NULL\n)","--\n-- Name: plasmids_cassettes; Type: TABLE; Schema: public; Owner: -\n--\n\nCREATE TABLE public.plasmids_cassettes (\n    id bigint NOT NULL,\n    plasmid_id bigint NOT NULL,\n    cassette_id bigint NOT NULL,\n    \\"position\\" integer DEFAULT 1 NOT NULL,\n    notes text,\n    created_by uuid DEFAULT '00000000-0000-0000-0000-000000000000'::uuid NOT NULL,\n    created_at timestamp with time zone DEFAULT now() NOT NULL,\n    updated_at timestamp with time zone DEFAULT now() NOT NULL\n)","--\n-- Name: plasmid_cassettes_agg; Type: VIEW; Schema: public; Owner: -\n--\n\nCREATE VIEW public.plasmid_cassettes_agg AS\n SELECT p.id AS plasmid_id,\n    p.name AS plasmid_name,\n    string_agg(format('%s: %s'::text, c.name, COALESCE(( SELECT string_agg(e2.name, ' | '::text ORDER BY ce2.\\"position\\") AS string_agg\n           FROM (public.cassettes_elements ce2\n             JOIN public.elements e2 ON ((e2.id = ce2.element_id)))\n          WHERE (ce2.cassette_id = c.id)), ''::text)), ' ; '::text ORDER BY pc.\\"position\\") AS cassettes_joined\n   FROM ((public.plasmids p\n     LEFT JOIN public.plasmids_cassettes pc ON ((pc.plasmid_id = p.id)))\n     LEFT JOIN public.cassettes c ON ((c.id = pc.cassette_id)))\n  GROUP BY p.id, p.name","--\n-- Name: plasmid_elements_id_seq; Type: SEQUENCE; Schema: public; Owner: -\n--\n\nALTER TABLE public.elements ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (\n    SEQUENCE NAME public.plasmid_elements_id_seq\n    START WITH 1\n    INCREMENT BY 1\n    NO MINVALUE\n    NO MAXVALUE\n    CACHE 1\n)","--\n-- Name: plasmids_cassettes_id_seq; Type: SEQUENCE; Schema: public; Owner: -\n--\n\nCREATE SEQUENCE public.plasmids_cassettes_id_seq\n    START WITH 1\n    INCREMENT BY 1\n    NO MINVALUE\n    NO MAXVALUE\n    CACHE 1","--\n-- Name: plasmids_cassettes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -\n--\n\nALTER SEQUENCE public.plasmids_cassettes_id_seq OWNED BY public.plasmids_cassettes.id","--\n-- Name: plasmids_id_seq; Type: SEQUENCE; Schema: public; Owner: -\n--\n\nCREATE SEQUENCE public.plasmids_id_seq\n    START WITH 1\n    INCREMENT BY 1\n    NO MINVALUE\n    NO MAXVALUE\n    CACHE 1","--\n-- Name: plasmids_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -\n--\n\nALTER SEQUENCE public.plasmids_id_seq OWNED BY public.plasmids.id","--\n-- Name: profiles; Type: TABLE; Schema: public; Owner: -\n--\n\nCREATE TABLE public.profiles (\n    id uuid NOT NULL,\n    email text,\n    full_name text,\n    created_at timestamp with time zone DEFAULT now()\n)","--\n-- Name: strains_id_seq; Type: SEQUENCE; Schema: public; Owner: -\n--\n\nCREATE SEQUENCE public.strains_id_seq\n    START WITH 1\n    INCREMENT BY 1\n    NO MINVALUE\n    NO MAXVALUE\n    CACHE 1","--\n-- Name: strains_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -\n--\n\nALTER SEQUENCE public.strains_id_seq OWNED BY public.strains.id","--\n-- Name: tanks; Type: TABLE; Schema: public; Owner: -\n--\n\nCREATE TABLE public.tanks (\n    id bigint NOT NULL,\n    name text NOT NULL,\n    fish_id bigint NOT NULL,\n    location text,\n    notes text,\n    created_at timestamp with time zone DEFAULT now() NOT NULL,\n    created_by uuid DEFAULT auth.uid() NOT NULL,\n    CONSTRAINT tanks_fish_id_check CHECK ((fish_id IS NOT NULL))\n)","--\n-- Name: tanks_id_seq; Type: SEQUENCE; Schema: public; Owner: -\n--\n\nCREATE SEQUENCE public.tanks_id_seq\n    START WITH 1\n    INCREMENT BY 1\n    NO MINVALUE\n    NO MAXVALUE\n    CACHE 1","--\n-- Name: tanks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -\n--\n\nALTER SEQUENCE public.tanks_id_seq OWNED BY public.tanks.id","--\n-- Name: transgenes_id_seq; Type: SEQUENCE; Schema: public; Owner: -\n--\n\nCREATE SEQUENCE public.transgenes_id_seq\n    START WITH 1\n    INCREMENT BY 1\n    NO MINVALUE\n    NO MAXVALUE\n    CACHE 1","--\n-- Name: transgenes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -\n--\n\nALTER SEQUENCE public.transgenes_id_seq OWNED BY public.transgenes.id","--\n-- Name: treatments_id_seq; Type: SEQUENCE; Schema: public; Owner: -\n--\n\nCREATE SEQUENCE public.treatments_id_seq\n    START WITH 1\n    INCREMENT BY 1\n    NO MINVALUE\n    NO MAXVALUE\n    CACHE 1","--\n-- Name: treatments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -\n--\n\nALTER SEQUENCE public.treatments_id_seq OWNED BY public.treatments.id","--\n-- Name: cassettes id; Type: DEFAULT; Schema: public; Owner: -\n--\n\nALTER TABLE ONLY public.cassettes ALTER COLUMN id SET DEFAULT nextval('public.cassettes_id_seq'::regclass)","--\n-- Name: cassettes_elements id; Type: DEFAULT; Schema: public; Owner: -\n--\n\nALTER TABLE ONLY public.cassettes_elements ALTER COLUMN id SET DEFAULT nextval('public.cassettes_elements_id_seq'::regclass)","--\n-- Name: fish id; Type: DEFAULT; Schema: public; Owner: -\n--\n\nALTER TABLE ONLY public.fish ALTER COLUMN id SET DEFAULT nextval('public.fish_id_seq'::regclass)","--\n-- Name: mutations id; Type: DEFAULT; Schema: public; Owner: -\n--\n\nALTER TABLE ONLY public.mutations ALTER COLUMN id SET DEFAULT nextval('public.mutations_id_seq'::regclass)","--\n-- Name: notes id; Type: DEFAULT; Schema: public; Owner: -\n--\n\nALTER TABLE ONLY public.notes ALTER COLUMN id SET DEFAULT nextval('public.notes_id_seq'::regclass)","--\n-- Name: plasmids id; Type: DEFAULT; Schema: public; Owner: -\n--\n\nALTER TABLE ONLY public.plasmids ALTER COLUMN id SET DEFAULT nextval('public.plasmids_id_seq'::regclass)","--\n-- Name: plasmids_cassettes id; Type: DEFAULT; Schema: public; Owner: -\n--\n\nALTER TABLE ONLY public.plasmids_cassettes ALTER COLUMN id SET DEFAULT nextval('public.plasmids_cassettes_id_seq'::regclass)","--\n-- Name: strains id; Type: DEFAULT; Schema: public; Owner: -\n--\n\nALTER TABLE ONLY public.strains ALTER COLUMN id SET DEFAULT nextval('public.strains_id_seq'::regclass)","--\n-- Name: tanks id; Type: DEFAULT; Schema: public; Owner: -\n--\n\nALTER TABLE ONLY public.tanks ALTER COLUMN id SET DEFAULT nextval('public.tanks_id_seq'::regclass)","--\n-- Name: transgenes id; Type: DEFAULT; Schema: public; Owner: -\n--\n\nALTER TABLE ONLY public.transgenes ALTER COLUMN id SET DEFAULT nextval('public.transgenes_id_seq'::regclass)","--\n-- Name: treatments id; Type: DEFAULT; Schema: public; Owner: -\n--\n\nALTER TABLE ONLY public.treatments ALTER COLUMN id SET DEFAULT nextval('public.treatments_id_seq'::regclass)","--\n-- Name: cassettes_elements cassettes_elements_cassette_id_element_id_key; Type: CONSTRAINT; Schema: public; Owner: -\n--\n\nALTER TABLE ONLY public.cassettes_elements\n    ADD CONSTRAINT cassettes_elements_cassette_id_element_id_key UNIQUE (cassette_id, element_id)","--\n-- Name: cassettes_elements cassettes_elements_cassette_id_position_key; Type: CONSTRAINT; Schema: public; Owner: -\n--\n\nALTER TABLE ONLY public.cassettes_elements\n    ADD CONSTRAINT cassettes_elements_cassette_id_position_key UNIQUE (cassette_id, \\"position\\")","--\n-- Name: cassettes_elements cassettes_elements_pkey; Type: CONSTRAINT; Schema: public; Owner: -\n--\n\nALTER TABLE ONLY public.cassettes_elements\n    ADD CONSTRAINT cassettes_elements_pkey PRIMARY KEY (id)","--\n-- Name: cassettes cassettes_pkey; Type: CONSTRAINT; Schema: public; Owner: -\n--\n\nALTER TABLE ONLY public.cassettes\n    ADD CONSTRAINT cassettes_pkey PRIMARY KEY (id)","--\n-- Name: elements elements_name_key; Type: CONSTRAINT; Schema: public; Owner: -\n--\n\nALTER TABLE ONLY public.elements\n    ADD CONSTRAINT elements_name_key UNIQUE (name)","--\n-- Name: elements elements_pkey; Type: CONSTRAINT; Schema: public; Owner: -\n--\n\nALTER TABLE ONLY public.elements\n    ADD CONSTRAINT elements_pkey PRIMARY KEY (id)","--\n-- Name: fish_mutations fish_mutations_pkey; Type: CONSTRAINT; Schema: public; Owner: -\n--\n\nALTER TABLE ONLY public.fish_mutations\n    ADD CONSTRAINT fish_mutations_pkey PRIMARY KEY (fish_id, mutation_id)","--\n-- Name: fish fish_pkey; Type: CONSTRAINT; Schema: public; Owner: -\n--\n\nALTER TABLE ONLY public.fish\n    ADD CONSTRAINT fish_pkey PRIMARY KEY (id)","--\n-- Name: fish_strains fish_strains_pkey; Type: CONSTRAINT; Schema: public; Owner: -\n--\n\nALTER TABLE ONLY public.fish_strains\n    ADD CONSTRAINT fish_strains_pkey PRIMARY KEY (fish_id, strain_id)","--\n-- Name: fish_transgenes fish_transgenes_pkey; Type: CONSTRAINT; Schema: public; Owner: -\n--\n\nALTER TABLE ONLY public.fish_transgenes\n    ADD CONSTRAINT fish_transgenes_pkey PRIMARY KEY (fish_id, transgene_id)","--\n-- Name: fish_treatments fish_treatments_pkey; Type: CONSTRAINT; Schema: public; Owner: -\n--\n\nALTER TABLE ONLY public.fish_treatments\n    ADD CONSTRAINT fish_treatments_pkey PRIMARY KEY (fish_id, treatment_id)","--\n-- Name: fish_year_counters fish_year_counters_pkey; Type: CONSTRAINT; Schema: public; Owner: -\n--\n\nALTER TABLE ONLY public.fish_year_counters\n    ADD CONSTRAINT fish_year_counters_pkey PRIMARY KEY (year)","--\n-- Name: mutations mutations_name_key; Type: CONSTRAINT; Schema: public; Owner: -\n--\n\nALTER TABLE ONLY public.mutations\n    ADD CONSTRAINT mutations_name_key UNIQUE (name)","--\n-- Name: mutations mutations_pkey; Type: CONSTRAINT; Schema: public; Owner: -\n--\n\nALTER TABLE ONLY public.mutations\n    ADD CONSTRAINT mutations_pkey PRIMARY KEY (id)","--\n-- Name: notes notes_pkey; Type: CONSTRAINT; Schema: public; Owner: -\n--\n\nALTER TABLE ONLY public.notes\n    ADD CONSTRAINT notes_pkey PRIMARY KEY (id)","--\n-- Name: plasmids_cassettes plasmids_cassettes_pkey; Type: CONSTRAINT; Schema: public; Owner: -\n--\n\nALTER TABLE ONLY public.plasmids_cassettes\n    ADD CONSTRAINT plasmids_cassettes_pkey PRIMARY KEY (id)","--\n-- Name: plasmids_cassettes plasmids_cassettes_plasmid_id_cassette_id_key; Type: CONSTRAINT; Schema: public; Owner: -\n--\n\nALTER TABLE ONLY public.plasmids_cassettes\n    ADD CONSTRAINT plasmids_cassettes_plasmid_id_cassette_id_key UNIQUE (plasmid_id, cassette_id)","--\n-- Name: plasmids_cassettes plasmids_cassettes_plasmid_id_position_key; Type: CONSTRAINT; Schema: public; Owner: -\n--\n\nALTER TABLE ONLY public.plasmids_cassettes\n    ADD CONSTRAINT plasmids_cassettes_plasmid_id_position_key UNIQUE (plasmid_id, \\"position\\")","--\n-- Name: plasmids plasmids_name_key; Type: CONSTRAINT; Schema: public; Owner: -\n--\n\nALTER TABLE ONLY public.plasmids\n    ADD CONSTRAINT plasmids_name_key UNIQUE (name)","--\n-- Name: plasmids plasmids_nickname_key; Type: CONSTRAINT; Schema: public; Owner: -\n--\n\nALTER TABLE ONLY public.plasmids\n    ADD CONSTRAINT plasmids_nickname_key UNIQUE (nickname)","--\n-- Name: plasmids plasmids_pkey; Type: CONSTRAINT; Schema: public; Owner: -\n--\n\nALTER TABLE ONLY public.plasmids\n    ADD CONSTRAINT plasmids_pkey PRIMARY KEY (id)","--\n-- Name: profiles profiles_email_key; Type: CONSTRAINT; Schema: public; Owner: -\n--\n\nALTER TABLE ONLY public.profiles\n    ADD CONSTRAINT profiles_email_key UNIQUE (email)","--\n-- Name: profiles profiles_pkey; Type: CONSTRAINT; Schema: public; Owner: -\n--\n\nALTER TABLE ONLY public.profiles\n    ADD CONSTRAINT profiles_pkey PRIMARY KEY (id)","--\n-- Name: strains strains_name_key; Type: CONSTRAINT; Schema: public; Owner: -\n--\n\nALTER TABLE ONLY public.strains\n    ADD CONSTRAINT strains_name_key UNIQUE (name)","--\n-- Name: strains strains_pkey; Type: CONSTRAINT; Schema: public; Owner: -\n--\n\nALTER TABLE ONLY public.strains\n    ADD CONSTRAINT strains_pkey PRIMARY KEY (id)","--\n-- Name: tanks tanks_name_key; Type: CONSTRAINT; Schema: public; Owner: -\n--\n\nALTER TABLE ONLY public.tanks\n    ADD CONSTRAINT tanks_name_key UNIQUE (name)","--\n-- Name: tanks tanks_pkey; Type: CONSTRAINT; Schema: public; Owner: -\n--\n\nALTER TABLE ONLY public.tanks\n    ADD CONSTRAINT tanks_pkey PRIMARY KEY (id)","--\n-- Name: transgenes transgenes_name_key; Type: CONSTRAINT; Schema: public; Owner: -\n--\n\nALTER TABLE ONLY public.transgenes\n    ADD CONSTRAINT transgenes_name_key UNIQUE (name)","--\n-- Name: transgenes transgenes_pkey; Type: CONSTRAINT; Schema: public; Owner: -\n--\n\nALTER TABLE ONLY public.transgenes\n    ADD CONSTRAINT transgenes_pkey PRIMARY KEY (id)","--\n-- Name: treatments treatments_pkey; Type: CONSTRAINT; Schema: public; Owner: -\n--\n\nALTER TABLE ONLY public.treatments\n    ADD CONSTRAINT treatments_pkey PRIMARY KEY (id)","--\n-- Name: treatments treatments_treatment_type_treatment_name_key; Type: CONSTRAINT; Schema: public; Owner: -\n--\n\nALTER TABLE ONLY public.treatments\n    ADD CONSTRAINT treatments_treatment_type_treatment_name_key UNIQUE (treatment_type, treatment_name)","--\n-- Name: cassettes_elements_cassette_idx; Type: INDEX; Schema: public; Owner: -\n--\n\nCREATE INDEX cassettes_elements_cassette_idx ON public.cassettes_elements USING btree (cassette_id)","--\n-- Name: cassettes_elements_element_idx; Type: INDEX; Schema: public; Owner: -\n--\n\nCREATE INDEX cassettes_elements_element_idx ON public.cassettes_elements USING btree (element_id)","--\n-- Name: cassettes_name_unq; Type: INDEX; Schema: public; Owner: -\n--\n\nCREATE UNIQUE INDEX cassettes_name_unq ON public.cassettes USING btree (lower(name))","--\n-- Name: idx_elements_created_by; Type: INDEX; Schema: public; Owner: -\n--\n\nCREATE INDEX idx_elements_created_by ON public.elements USING btree (created_by)","--\n-- Name: idx_fish_created_by; Type: INDEX; Schema: public; Owner: -\n--\n\nCREATE INDEX idx_fish_created_by ON public.fish USING btree (created_by)","--\n-- Name: idx_fish_father; Type: INDEX; Schema: public; Owner: -\n--\n\nCREATE INDEX idx_fish_father ON public.fish USING btree (father_fish_id)","--\n-- Name: idx_fish_mother; Type: INDEX; Schema: public; Owner: -\n--\n\nCREATE INDEX idx_fish_mother ON public.fish USING btree (mother_fish_id)","--\n-- Name: idx_fish_mutations__fish; Type: INDEX; Schema: public; Owner: -\n--\n\nCREATE INDEX idx_fish_mutations__fish ON public.fish_mutations USING btree (fish_id)","--\n-- Name: idx_fish_mutations__mut; Type: INDEX; Schema: public; Owner: -\n--\n\nCREATE INDEX idx_fish_mutations__mut ON public.fish_mutations USING btree (mutation_id)","--\n-- Name: idx_fish_strains__fish; Type: INDEX; Schema: public; Owner: -\n--\n\nCREATE INDEX idx_fish_strains__fish ON public.fish_strains USING btree (fish_id)","--\n-- Name: idx_fish_strains__strain; Type: INDEX; Schema: public; Owner: -\n--\n\nCREATE INDEX idx_fish_strains__strain ON public.fish_strains USING btree (strain_id)","--\n-- Name: idx_fish_transgenes__fish; Type: INDEX; Schema: public; Owner: -\n--\n\nCREATE INDEX idx_fish_transgenes__fish ON public.fish_transgenes USING btree (fish_id)","--\n-- Name: idx_fish_transgenes__tg; Type: INDEX; Schema: public; Owner: -\n--\n\nCREATE INDEX idx_fish_transgenes__tg ON public.fish_transgenes USING btree (transgene_id)","--\n-- Name: idx_fish_treatments__fish; Type: INDEX; Schema: public; Owner: -\n--\n\nCREATE INDEX idx_fish_treatments__fish ON public.fish_treatments USING btree (fish_id)","--\n-- Name: idx_fish_treatments__trt; Type: INDEX; Schema: public; Owner: -\n--\n\nCREATE INDEX idx_fish_treatments__trt ON public.fish_treatments USING btree (treatment_id)","--\n-- Name: idx_mutations_created_by; Type: INDEX; Schema: public; Owner: -\n--\n\nCREATE INDEX idx_mutations_created_by ON public.mutations USING btree (created_by)","--\n-- Name: idx_plasmids_created_by; Type: INDEX; Schema: public; Owner: -\n--\n\nCREATE INDEX idx_plasmids_created_by ON public.plasmids USING btree (created_by)","--\n-- Name: idx_strains_created_by; Type: INDEX; Schema: public; Owner: -\n--\n\nCREATE INDEX idx_strains_created_by ON public.strains USING btree (created_by)","--\n-- Name: idx_tanks_created_by; Type: INDEX; Schema: public; Owner: -\n--\n\nCREATE INDEX idx_tanks_created_by ON public.tanks USING btree (created_by)","--\n-- Name: idx_tanks_fish; Type: INDEX; Schema: public; Owner: -\n--\n\nCREATE INDEX idx_tanks_fish ON public.tanks USING btree (fish_id)","--\n-- Name: idx_transgenes_created_by; Type: INDEX; Schema: public; Owner: -\n--\n\nCREATE INDEX idx_transgenes_created_by ON public.transgenes USING btree (created_by)","--\n-- Name: idx_treatments_created_by; Type: INDEX; Schema: public; Owner: -\n--\n\nCREATE INDEX idx_treatments_created_by ON public.treatments USING btree (created_by)","--\n-- Name: plasmids_cassettes_cassette_idx; Type: INDEX; Schema: public; Owner: -\n--\n\nCREATE INDEX plasmids_cassettes_cassette_idx ON public.plasmids_cassettes USING btree (cassette_id)","--\n-- Name: plasmids_cassettes_plasmid_idx; Type: INDEX; Schema: public; Owner: -\n--\n\nCREATE INDEX plasmids_cassettes_plasmid_idx ON public.plasmids_cassettes USING btree (plasmid_id)","--\n-- Name: plasmids_resistance_idx; Type: INDEX; Schema: public; Owner: -\n--\n\nCREATE INDEX plasmids_resistance_idx ON public.plasmids USING btree (resistance)","--\n-- Name: plasmids_resistance_trgm_idx; Type: INDEX; Schema: public; Owner: -\n--\n\nCREATE INDEX plasmids_resistance_trgm_idx ON public.plasmids USING gin (resistance extensions.gin_trgm_ops)","--\n-- Name: ux_fish_fish_code; Type: INDEX; Schema: public; Owner: -\n--\n\nCREATE UNIQUE INDEX ux_fish_fish_code ON public.fish USING btree (fish_code)","--\n-- Name: ux_fish_name_ci; Type: INDEX; Schema: public; Owner: -\n--\n\nCREATE UNIQUE INDEX ux_fish_name_ci ON public.fish USING btree (lower(name))","--\n-- Name: elements set_created_by_trigger; Type: TRIGGER; Schema: public; Owner: -\n--\n\nCREATE TRIGGER set_created_by_trigger BEFORE INSERT ON public.elements FOR EACH ROW EXECUTE FUNCTION public.set_created_by()","--\n-- Name: cassettes_elements trg_cassettes_elements_updated_at; Type: TRIGGER; Schema: public; Owner: -\n--\n\nCREATE TRIGGER trg_cassettes_elements_updated_at BEFORE UPDATE ON public.cassettes_elements FOR EACH ROW EXECUTE FUNCTION public.set_updated_at()","--\n-- Name: cassettes trg_cassettes_updated_at; Type: TRIGGER; Schema: public; Owner: -\n--\n\nCREATE TRIGGER trg_cassettes_updated_at BEFORE UPDATE ON public.cassettes FOR EACH ROW EXECUTE FUNCTION public.set_updated_at()","--\n-- Name: plasmids_cassettes trg_plasmids_cassettes_updated_at; Type: TRIGGER; Schema: public; Owner: -\n--\n\nCREATE TRIGGER trg_plasmids_cassettes_updated_at BEFORE UPDATE ON public.plasmids_cassettes FOR EACH ROW EXECUTE FUNCTION public.set_updated_at()","--\n-- Name: fish trg_set_fish_code_per_year; Type: TRIGGER; Schema: public; Owner: -\n--\n\nCREATE TRIGGER trg_set_fish_code_per_year BEFORE INSERT ON public.fish FOR EACH ROW WHEN ((new.fish_code IS NULL)) EXECUTE FUNCTION public.set_fish_code_per_year()","--\n-- Name: cassettes_elements cassettes_elements_cassette_fk; Type: FK CONSTRAINT; Schema: public; Owner: -\n--\n\nALTER TABLE ONLY public.cassettes_elements\n    ADD CONSTRAINT cassettes_elements_cassette_fk FOREIGN KEY (cassette_id) REFERENCES public.cassettes(id) ON DELETE CASCADE","--\n-- Name: cassettes_elements cassettes_elements_element_fk; Type: FK CONSTRAINT; Schema: public; Owner: -\n--\n\nALTER TABLE ONLY public.cassettes_elements\n    ADD CONSTRAINT cassettes_elements_element_fk FOREIGN KEY (element_id) REFERENCES public.elements(id) ON DELETE RESTRICT","--\n-- Name: fish fish_father_fish_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -\n--\n\nALTER TABLE ONLY public.fish\n    ADD CONSTRAINT fish_father_fish_id_fkey FOREIGN KEY (father_fish_id) REFERENCES public.fish(id) ON DELETE SET NULL","--\n-- Name: fish fish_mother_fish_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -\n--\n\nALTER TABLE ONLY public.fish\n    ADD CONSTRAINT fish_mother_fish_id_fkey FOREIGN KEY (mother_fish_id) REFERENCES public.fish(id) ON DELETE SET NULL","--\n-- Name: fish_mutations fish_mutations_fish_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -\n--\n\nALTER TABLE ONLY public.fish_mutations\n    ADD CONSTRAINT fish_mutations_fish_id_fkey FOREIGN KEY (fish_id) REFERENCES public.fish(id) ON DELETE CASCADE","--\n-- Name: fish_mutations fish_mutations_mutation_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -\n--\n\nALTER TABLE ONLY public.fish_mutations\n    ADD CONSTRAINT fish_mutations_mutation_id_fkey FOREIGN KEY (mutation_id) REFERENCES public.mutations(id) ON DELETE CASCADE","--\n-- Name: fish_strains fish_strains_fish_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -\n--\n\nALTER TABLE ONLY public.fish_strains\n    ADD CONSTRAINT fish_strains_fish_id_fkey FOREIGN KEY (fish_id) REFERENCES public.fish(id) ON DELETE CASCADE","--\n-- Name: fish_strains fish_strains_strain_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -\n--\n\nALTER TABLE ONLY public.fish_strains\n    ADD CONSTRAINT fish_strains_strain_id_fkey FOREIGN KEY (strain_id) REFERENCES public.strains(id) ON DELETE CASCADE","--\n-- Name: fish_transgenes fish_transgenes_fish_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -\n--\n\nALTER TABLE ONLY public.fish_transgenes\n    ADD CONSTRAINT fish_transgenes_fish_id_fkey FOREIGN KEY (fish_id) REFERENCES public.fish(id) ON DELETE CASCADE","--\n-- Name: fish_transgenes fish_transgenes_transgene_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -\n--\n\nALTER TABLE ONLY public.fish_transgenes\n    ADD CONSTRAINT fish_transgenes_transgene_id_fkey FOREIGN KEY (transgene_id) REFERENCES public.transgenes(id) ON DELETE CASCADE","--\n-- Name: fish_treatments fish_treatments_fish_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -\n--\n\nALTER TABLE ONLY public.fish_treatments\n    ADD CONSTRAINT fish_treatments_fish_id_fkey FOREIGN KEY (fish_id) REFERENCES public.fish(id) ON DELETE CASCADE","--\n-- Name: fish_treatments fish_treatments_treatment_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -\n--\n\nALTER TABLE ONLY public.fish_treatments\n    ADD CONSTRAINT fish_treatments_treatment_id_fkey FOREIGN KEY (treatment_id) REFERENCES public.treatments(id) ON DELETE CASCADE","--\n-- Name: notes notes_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -\n--\n\nALTER TABLE ONLY public.notes\n    ADD CONSTRAINT notes_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE","--\n-- Name: plasmids_cassettes plasmids_cassettes_cassette_fk; Type: FK CONSTRAINT; Schema: public; Owner: -\n--\n\nALTER TABLE ONLY public.plasmids_cassettes\n    ADD CONSTRAINT plasmids_cassettes_cassette_fk FOREIGN KEY (cassette_id) REFERENCES public.cassettes(id) ON DELETE RESTRICT","--\n-- Name: plasmids_cassettes plasmids_cassettes_plasmid_fk; Type: FK CONSTRAINT; Schema: public; Owner: -\n--\n\nALTER TABLE ONLY public.plasmids_cassettes\n    ADD CONSTRAINT plasmids_cassettes_plasmid_fk FOREIGN KEY (plasmid_id) REFERENCES public.plasmids(id) ON DELETE CASCADE","--\n-- Name: profiles profiles_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -\n--\n\nALTER TABLE ONLY public.profiles\n    ADD CONSTRAINT profiles_id_fkey FOREIGN KEY (id) REFERENCES auth.users(id) ON DELETE CASCADE","--\n-- Name: tanks tanks_fish_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -\n--\n\nALTER TABLE ONLY public.tanks\n    ADD CONSTRAINT tanks_fish_id_fkey FOREIGN KEY (fish_id) REFERENCES public.fish(id) ON DELETE CASCADE","--\n-- Name: transgenes transgenes_plasmid_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -\n--\n\nALTER TABLE ONLY public.transgenes\n    ADD CONSTRAINT transgenes_plasmid_id_fkey FOREIGN KEY (plasmid_id) REFERENCES public.plasmids(id) ON DELETE SET NULL","--\n-- Name: cassettes; Type: ROW SECURITY; Schema: public; Owner: -\n--\n\nALTER TABLE public.cassettes ENABLE ROW LEVEL SECURITY","--\n-- Name: cassettes_elements; Type: ROW SECURITY; Schema: public; Owner: -\n--\n\nALTER TABLE public.cassettes_elements ENABLE ROW LEVEL SECURITY","--\n-- Name: cassettes_elements cassettes_elements_select_all; Type: POLICY; Schema: public; Owner: -\n--\n\nCREATE POLICY cassettes_elements_select_all ON public.cassettes_elements FOR SELECT USING (true)","--\n-- Name: cassettes_elements cassettes_elements_write_auth; Type: POLICY; Schema: public; Owner: -\n--\n\nCREATE POLICY cassettes_elements_write_auth ON public.cassettes_elements TO authenticated USING (true) WITH CHECK (true)","--\n-- Name: cassettes cassettes_select_all; Type: POLICY; Schema: public; Owner: -\n--\n\nCREATE POLICY cassettes_select_all ON public.cassettes FOR SELECT USING (true)","--\n-- Name: cassettes cassettes_write_auth; Type: POLICY; Schema: public; Owner: -\n--\n\nCREATE POLICY cassettes_write_auth ON public.cassettes TO authenticated USING (true) WITH CHECK (true)","--\n-- Name: notes delete own notes; Type: POLICY; Schema: public; Owner: -\n--\n\nCREATE POLICY \\"delete own notes\\" ON public.notes FOR DELETE USING ((auth.uid() = user_id))","--\n-- Name: notes insert own notes; Type: POLICY; Schema: public; Owner: -\n--\n\nCREATE POLICY \\"insert own notes\\" ON public.notes FOR INSERT WITH CHECK ((auth.uid() = user_id))","--\n-- Name: notes; Type: ROW SECURITY; Schema: public; Owner: -\n--\n\nALTER TABLE public.notes ENABLE ROW LEVEL SECURITY","--\n-- Name: elements pe_shared_rw; Type: POLICY; Schema: public; Owner: -\n--\n\nCREATE POLICY pe_shared_rw ON public.elements USING ((auth.role() = 'authenticated'::text)) WITH CHECK ((auth.role() = 'authenticated'::text))","--\n-- Name: elements plasmid_elements_delete_owner; Type: POLICY; Schema: public; Owner: -\n--\n\nCREATE POLICY plasmid_elements_delete_owner ON public.elements FOR DELETE TO authenticated USING ((created_by = auth.uid()))","--\n-- Name: elements plasmid_elements_insert_self; Type: POLICY; Schema: public; Owner: -\n--\n\nCREATE POLICY plasmid_elements_insert_self ON public.elements FOR INSERT TO authenticated WITH CHECK ((created_by = auth.uid()))","--\n-- Name: elements plasmid_elements_select_all; Type: POLICY; Schema: public; Owner: -\n--\n\nCREATE POLICY plasmid_elements_select_all ON public.elements FOR SELECT TO authenticated, anon USING (true)","--\n-- Name: elements plasmid_elements_update_owner; Type: POLICY; Schema: public; Owner: -\n--\n\nCREATE POLICY plasmid_elements_update_owner ON public.elements FOR UPDATE TO authenticated USING ((created_by = auth.uid())) WITH CHECK ((created_by = auth.uid()))","--\n-- Name: plasmids_cassettes; Type: ROW SECURITY; Schema: public; Owner: -\n--\n\nALTER TABLE public.plasmids_cassettes ENABLE ROW LEVEL SECURITY","--\n-- Name: plasmids_cassettes plasmids_cassettes_select_all; Type: POLICY; Schema: public; Owner: -\n--\n\nCREATE POLICY plasmids_cassettes_select_all ON public.plasmids_cassettes FOR SELECT USING (true)","--\n-- Name: plasmids_cassettes plasmids_cassettes_write_auth; Type: POLICY; Schema: public; Owner: -\n--\n\nCREATE POLICY plasmids_cassettes_write_auth ON public.plasmids_cassettes TO authenticated USING (true) WITH CHECK (true)","--\n-- Name: profiles; Type: ROW SECURITY; Schema: public; Owner: -\n--\n\nALTER TABLE public.profiles ENABLE ROW LEVEL SECURITY","--\n-- Name: notes read own notes; Type: POLICY; Schema: public; Owner: -\n--\n\nCREATE POLICY \\"read own notes\\" ON public.notes FOR SELECT USING ((auth.uid() = user_id))","--\n-- Name: profiles read own profile; Type: POLICY; Schema: public; Owner: -\n--\n\nCREATE POLICY \\"read own profile\\" ON public.profiles FOR SELECT USING ((auth.uid() = id))","--\n-- Name: notes update own notes; Type: POLICY; Schema: public; Owner: -\n--\n\nCREATE POLICY \\"update own notes\\" ON public.notes FOR UPDATE USING ((auth.uid() = user_id))","--\n-- Name: profiles update own profile; Type: POLICY; Schema: public; Owner: -\n--\n\nCREATE POLICY \\"update own profile\\" ON public.profiles FOR UPDATE USING ((auth.uid() = id))","--\n-- PostgreSQL database dump complete\n--"}	0001_init
20250907194542	{"SET search_path = public, extensions","CREATE OR REPLACE VIEW public.plasmid_cassettes_agg AS  SELECT p.id AS plasmid_id,\n    p.name AS plasmid_name,\n    string_agg(format('%s: %s'::text, c.name, COALESCE(( SELECT string_agg(e2.name, ' | '::text ORDER BY ce2.\\"position\\") AS string_agg\n           FROM cassettes_elements ce2\n             JOIN elements e2 ON e2.id = ce2.element_id\n          WHERE ce2.cassette_id = c.id), ''::text)), ' ; '::text ORDER BY pc.\\"position\\") AS cassettes_joined\n   FROM plasmids p\n     LEFT JOIN plasmids_cassettes pc ON pc.plasmid_id = p.id\n     LEFT JOIN cassettes c ON c.id = pc.cassette_id\n  GROUP BY p.id, p.name","CREATE OR REPLACE VIEW public.fish_feature_summary AS  SELECT f.id AS fish_id,\n    f.name,\n    string_agg(DISTINCT tg.name, ', '::text ORDER BY tg.name) AS transgenes,\n    string_agg(DISTINCT mu.name, ', '::text ORDER BY mu.name) AS mutations,\n    string_agg(DISTINCT st.name, ', '::text ORDER BY st.name) AS strains,\n    string_agg(DISTINCT (COALESCE(t.treatment_type::text, ''::text) || ':'::text) || COALESCE(t.treatment_name, ''::text), ', '::text ORDER BY ((COALESCE(t.treatment_type::text, ''::text) || ':'::text) || COALESCE(t.treatment_name, ''::text))) AS treatments\n   FROM fish f\n     LEFT JOIN fish_transgenes ftg ON ftg.fish_id = f.id\n     LEFT JOIN transgenes tg ON tg.id = ftg.transgene_id\n     LEFT JOIN fish_mutations fmu ON fmu.fish_id = f.id\n     LEFT JOIN mutations mu ON mu.id = fmu.mutation_id\n     LEFT JOIN fish_strains fs ON fs.fish_id = f.id\n     LEFT JOIN strains st ON st.id = fs.strain_id\n     LEFT JOIN fish_treatments ftr ON ftr.fish_id = f.id\n     LEFT JOIN treatments t ON t.id = ftr.treatment_id\n  GROUP BY f.id, f.name"}	add_views_plasmids_and_fish_summary
20250907225549	{"-- One row per (plasmid, cassette, element) with full JSON blobs\n-- View name: public.plasmids_cassettes_elements_long\n-- Depends on: public.plasmids, public.plasmids_cassettes, public.cassettes, public.cassettes_elements, public.elements\n\ncreate or replace view public.plasmids_cassettes_elements_long as\nselect\n  p.id                            as plasmid_id,\n  p.name                          as plasmid_name,\n\n  pc.cassette_id                  as cassette_id,\n  pc.position                     as cassette_position,\n\n  ce.element_id                   as element_id,\n  ce.position                     as element_position,\n\n  -- convenient labels\n  c.name                          as cassette_name,\n  e.name                          as element_name,\n\n  -- full records as JSON (keeps ALL columns even if schema grows)\n  row_to_json(p)                  as plasmid,\n  row_to_json(c)                  as cassette,\n  row_to_json(e)                  as element\n\nfrom public.plasmids p\njoin public.plasmids_cassettes pc\n  on pc.plasmid_id = p.id\njoin public.cassettes c\n  on c.id = pc.cassette_id\nleft join public.cassettes_elements ce\n  on ce.cassette_id = c.id\nleft join public.elements e\n  on e.id = ce.element_id\norder by p.id, pc.position, ce.position","-- Expose the view to typical API roles (underlying tables' RLS still applies)\ngrant select on public.plasmids_cassettes_elements_long to anon, authenticated"}	plasmids_cassettes_elements_long_view
20250907230959	{"-- Add treatment_description column to treatments table\nalter table public.treatments\nadd column if not exists treatment_description text"}	add_treatment_description_to_treatments
20250907233848	{"drop extension if exists \\"pg_net\\"","drop extension if exists \\"pg_trgm\\"","create extension if not exists \\"pg_trgm\\" with schema \\"public\\"","drop view if exists \\"public\\".\\"plasmids_cassettes_elements_long\\"","drop view if exists \\"public\\".\\"fish_feature_summary\\"","alter table \\"public\\".\\"treatments\\" drop column \\"treatment_description\\"","create or replace view \\"public\\".\\"fish_feature_summary\\" as  SELECT f.id AS fish_id,\n    f.name,\n    string_agg(DISTINCT tg.name, ', '::text ORDER BY tg.name) AS transgenes,\n    string_agg(DISTINCT mu.name, ', '::text ORDER BY mu.name) AS mutations,\n    string_agg(DISTINCT st.name, ', '::text ORDER BY st.name) AS strains,\n    string_agg(DISTINCT ((COALESCE((t.treatment_type)::text, ''::text) || ':'::text) || COALESCE(t.treatment_name, ''::text)), ', '::text ORDER BY ((COALESCE((t.treatment_type)::text, ''::text) || ':'::text) || COALESCE(t.treatment_name, ''::text))) AS treatments\n   FROM ((((((((fish f\n     LEFT JOIN fish_transgenes ftg ON ((ftg.fish_id = f.id)))\n     LEFT JOIN transgenes tg ON ((tg.id = ftg.transgene_id)))\n     LEFT JOIN fish_mutations fmu ON ((fmu.fish_id = f.id)))\n     LEFT JOIN mutations mu ON ((mu.id = fmu.mutation_id)))\n     LEFT JOIN fish_strains fs ON ((fs.fish_id = f.id)))\n     LEFT JOIN strains st ON ((st.id = fs.strain_id)))\n     LEFT JOIN fish_treatments ftr ON ((ftr.fish_id = f.id)))\n     LEFT JOIN treatments t ON ((t.id = ftr.treatment_id)))\n  GROUP BY f.id, f.name"}	remote_schema
20250907234536	{"-- Drop the notes table and its dependent objects\ndrop table if exists public.notes cascade"}	drop_notes_table
20250907234835	{"do $$\nbegin\n  if to_regclass('public.notes') is not null then\n    if to_regclass('public.notes_backup') is null then\n      create table public.notes_backup as table public.notes with no data;\n    end if;\n\n    insert into public.notes_backup\n    select * from public.notes;\n\n    drop table if exists public.notes cascade;\n  else\n    raise notice 'public.notes does not exist; skipping backup and drop';\n  end if;\nend $$"}	drop_notes_table
20250908002105	{"-- Migration: standardize column names across treatments, transgenes, tanks, strains\n-- Created: 2025-09-08 00:18:25 \n-- Notes:\n-- - Uses conditional DO blocks so the migration can be re-run safely.\n-- - Column renames cascade to dependent constraints/indexes automatically in Postgres.\n-- - After applying, review any views, functions, or RLS policies that referenced old names.\n\nBEGIN","-- =============== TREATMENTS ======================\nDO $$\nBEGIN\n    -- treatment_name -> name\n    IF EXISTS (\n        SELECT 1\n        FROM information_schema.columns\n        WHERE table_schema = 'public' AND table_name = 'treatments' AND column_name = 'treatment_name'\n    ) THEN\n        EXECUTE 'ALTER TABLE public.treatments RENAME COLUMN treatment_name TO name';\n    END IF;\n\n    -- treatment_type -> type\n    IF EXISTS (\n        SELECT 1\n        FROM information_schema.columns\n        WHERE table_schema = 'public' AND table_name = 'treatments' AND column_name = 'treatment_type'\n    ) THEN\n        EXECUTE 'ALTER TABLE public.treatments RENAME COLUMN treatment_type TO type';\n    END IF;\n\n    -- treatment_description -> description\n    IF EXISTS (\n        SELECT 1\n        FROM information_schema.columns\n        WHERE table_schema = 'public' AND table_name = 'treatments' AND column_name = 'treatment_description'\n    ) THEN\n        EXECUTE 'ALTER TABLE public.treatments RENAME COLUMN treatment_description TO description';\n    END IF;\n\n    -- Drop notes if present\n    IF EXISTS (\n        SELECT 1\n        FROM information_schema.columns\n        WHERE table_schema = 'public' AND table_name = 'treatments' AND column_name = 'notes'\n    ) THEN\n        EXECUTE 'ALTER TABLE public.treatments DROP COLUMN notes';\n    END IF;\nEND$$","-- =============== TRANSGENES ======================\nDO $$\nBEGIN\n    -- notes -> description\n    IF EXISTS (\n        SELECT 1\n        FROM information_schema.columns\n        WHERE table_schema = 'public' AND table_name = 'transgenes' AND column_name = 'notes'\n    ) THEN\n        EXECUTE 'ALTER TABLE public.transgenes RENAME COLUMN notes TO description';\n    END IF;\n\n    -- Add type column if missing\n    IF NOT EXISTS (\n        SELECT 1\n        FROM information_schema.columns\n        WHERE table_schema = 'public' AND table_name = 'transgenes' AND column_name = 'type'\n    ) THEN\n        EXECUTE 'ALTER TABLE public.transgenes ADD COLUMN type text';\n    END IF;\nEND$$","-- =============== TANKS ======================\nDO $$\nBEGIN\n    -- notes -> description\n    IF EXISTS (\n        SELECT 1\n        FROM information_schema.columns\n        WHERE table_schema = 'public' AND table_name = 'tanks' AND column_name = 'notes'\n    ) THEN\n        EXECUTE 'ALTER TABLE public.tanks RENAME COLUMN notes TO description';\n    END IF;\nEND$$","-- =============== STRAINS ======================\nDO $$\nBEGIN\n    -- notes -> description\n    IF EXISTS (\n        SELECT 1\n        FROM information_schema.columns\n        WHERE table_schema = 'public' AND table_name = 'strains' AND column_name = 'notes'\n    ) THEN\n        EXECUTE 'ALTER TABLE public.strains RENAME COLUMN notes TO description';\n    END IF;\nEND$$",COMMIT,"-- =============== Post-migration checks (run manually) ======================\n-- SELECT column_name FROM information_schema.columns WHERE table_schema='public' AND table_name='treatments';\n-- SELECT column_name FROM information_schema.columns WHERE table_schema='public' AND table_name='transgenes';\n-- SELECT column_name FROM information_schema.columns WHERE table_schema='public' AND table_name='tanks';\n-- SELECT column_name FROM information_schema.columns WHERE table_schema='public' AND table_name='strains';\n\n-- Grep your repo for old names that might appear in views/RLS/functions:\n--   git grep -nE 'treatment_name|treatment_type|treatment_description|\\\\bnotes\\\\b'"}	standardize_columns
20250908003149	{BEGIN,"ALTER TYPE public.fish_treatment_types ADD VALUE IF NOT EXISTS 'synthetic_RNA_microinjection'","ALTER TYPE public.fish_treatment_types ADD VALUE IF NOT EXISTS 'plasmid_DNA_microinjection'","ALTER TYPE public.fish_treatment_types ADD VALUE IF NOT EXISTS 'DiI_labeling'","ALTER TYPE public.fish_treatment_types ADD VALUE IF NOT EXISTS 'Tricaine'","ALTER TYPE public.fish_treatment_types ADD VALUE IF NOT EXISTS '42C_heat_shock'","ALTER TYPE public.fish_treatment_types ADD VALUE IF NOT EXISTS 'DMSO'",COMMIT}	extend_fish_treatment_types
20250908003905	{BEGIN,"CREATE TABLE IF NOT EXISTS public.selectedphenotypes (\n  id bigint GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,\n  name text NOT NULL,\n  type text,\n  description text,\n  created_at timestamptz DEFAULT now(),\n  created_by uuid REFERENCES auth.users (id) DEFAULT auth.uid()\n)","CREATE TABLE IF NOT EXISTS public.fish_selectedphenotypes (\n  fish_id bigint NOT NULL REFERENCES public.fish (id) ON DELETE CASCADE,\n  selectedphenotype_id bigint NOT NULL REFERENCES public.selectedphenotypes (id) ON DELETE CASCADE,\n  created_at timestamptz DEFAULT now(),\n  created_by uuid REFERENCES auth.users (id) DEFAULT auth.uid(),\n  PRIMARY KEY (fish_id, selectedphenotype_id)\n)","CREATE INDEX IF NOT EXISTS idx_fish_selectedphenotypes_fish_id ON public.fish_selectedphenotypes (fish_id)","CREATE INDEX IF NOT EXISTS idx_fish_selectedphenotypes_selectedphenotype_id ON public.fish_selectedphenotypes (selectedphenotype_id)",COMMIT}	add_selectedphenotypes
20250908161034	{"create table if not exists public.mounts (\n  id uuid primary key default gen_random_uuid(),\n  type text not null,\n  name text not null,\n  description text,\n  date_mounted date,\n  time_mounted time without time zone,\n  mounting_orientation text,\n  created_at timestamptz not null default now(),\n  created_by uuid not null default auth.uid()\n)","drop table if exists public.fish_mounts cascade","create table public.fish_mounts (\n  id uuid primary key default gen_random_uuid(),\n  fish_id bigint not null,\n  mount_id uuid not null,\n  created_at timestamptz not null default now(),\n  created_by uuid not null default auth.uid(),\n  unique (fish_id, mount_id),\n  constraint fk_fish foreign key (fish_id) references public.fish(id) on delete cascade,\n  constraint fk_mount foreign key (mount_id) references public.mounts(id) on delete cascade\n)","alter table public.mounts enable row level security","alter table public.fish_mounts enable row level security","create policy \\"mounts_owner_rw\\"\non public.mounts\nfor all\nto authenticated\nusing (created_by = auth.uid())\nwith check (created_by = auth.uid())","create policy \\"fish_mounts_owner_rw\\"\non public.fish_mounts\nfor all\nto authenticated\nusing (created_by = auth.uid())\nwith check (created_by = auth.uid())","create index if not exists idx_fish_mounts_fish_id on public.fish_mounts(fish_id)","create index if not exists idx_fish_mounts_mount_id on public.fish_mounts(mount_id)","create index if not exists idx_mounts_created_by on public.mounts(created_by)"}	add_mounts
20250909170051	{"drop extension if exists \\"pg_net\\"","drop extension if exists \\"pg_trgm\\"","create extension if not exists \\"pg_trgm\\" with schema \\"public\\"","drop view if exists \\"public\\".\\"plasmids_cassettes_elements_long\\"","drop view if exists \\"public\\".\\"fish_feature_summary\\"","drop view if exists \\"public\\".\\"plasmid_cassettes_agg\\"","alter table \\"public\\".\\"cassettes_elements\\" drop column \\"role\\"","alter table \\"public\\".\\"elements\\" drop column \\"element_type\\"","alter table \\"public\\".\\"elements\\" add column \\"type\\" element_type not null default 'unspecified'::element_type","alter table \\"public\\".\\"treatments\\" drop column \\"description\\"","create or replace view \\"public\\".\\"fish_feature_summary\\" as  SELECT f.id AS fish_id,\n    f.name,\n    string_agg(DISTINCT tg.name, ', '::text ORDER BY tg.name) AS transgenes,\n    string_agg(DISTINCT mu.name, ', '::text ORDER BY mu.name) AS mutations,\n    string_agg(DISTINCT st.name, ', '::text ORDER BY st.name) AS strains,\n    string_agg(DISTINCT ((COALESCE((t.type)::text, ''::text) || ':'::text) || COALESCE(t.name, ''::text)), ', '::text ORDER BY ((COALESCE((t.type)::text, ''::text) || ':'::text) || COALESCE(t.name, ''::text))) AS treatments\n   FROM ((((((((fish f\n     LEFT JOIN fish_transgenes ftg ON ((ftg.fish_id = f.id)))\n     LEFT JOIN transgenes tg ON ((tg.id = ftg.transgene_id)))\n     LEFT JOIN fish_mutations fmu ON ((fmu.fish_id = f.id)))\n     LEFT JOIN mutations mu ON ((mu.id = fmu.mutation_id)))\n     LEFT JOIN fish_strains fs ON ((fs.fish_id = f.id)))\n     LEFT JOIN strains st ON ((st.id = fs.strain_id)))\n     LEFT JOIN fish_treatments ftr ON ((ftr.fish_id = f.id)))\n     LEFT JOIN treatments t ON ((t.id = ftr.treatment_id)))\n  GROUP BY f.id, f.name","create or replace view \\"public\\".\\"plasmid_cassettes_agg\\" as  SELECT p.id AS plasmid_id,\n    p.name AS plasmid_name,\n    string_agg(format('%s: %s'::text, c.name, COALESCE(( SELECT string_agg(e2.name, ' | '::text ORDER BY ce2.\\"position\\") AS string_agg\n           FROM (cassettes_elements ce2\n             JOIN elements e2 ON ((e2.id = ce2.element_id)))\n          WHERE (ce2.cassette_id = c.id)), ''::text)), ' ; '::text ORDER BY pc.\\"position\\") AS cassettes_joined\n   FROM ((plasmids p\n     LEFT JOIN plasmids_cassettes pc ON ((pc.plasmid_id = p.id)))\n     LEFT JOIN cassettes c ON ((c.id = pc.cassette_id)))\n  GROUP BY p.id, p.name"}	remote_schema
20250909170859	{"-- add_rna_and_rebuild_treatments.sql (drop-and-recreate)\n-- Creates public.rna, rebuilds public.treatments, and drops/recreates public.fish_treatments.\n-- Assumptions:\n--   - plasmids.id = BIGINT\n--   - fish.id     = BIGINT\n--   - treatments.id = UUID\n-- Adjust types below if your ids differ.\n\nbegin","-- ---------------------------------------------------------------------------\n-- Extensions + helper\n-- ---------------------------------------------------------------------------\ncreate extension if not exists \\"pgcrypto\\"","create or replace function public.set_updated_at()\nreturns trigger\nlanguage plpgsql\nas $$\nbegin\n  new.updated_at = now();\n  return new;\nend;\n$$","-- ---------------------------------------------------------------------------\n-- 1) New table: RNA\n-- ---------------------------------------------------------------------------\ncreate table if not exists public.rna (\n  id           uuid primary key default gen_random_uuid(),\n  name         text not null unique,\n  description  text,\n  notes        text,\n  source       text,\n  created_by   uuid references auth.users(id) on delete set null,\n  created_at   timestamptz not null default now(),\n  updated_at   timestamptz not null default now()\n)","drop trigger if exists set_updated_at_rna on public.rna","create trigger set_updated_at_rna\nbefore update on public.rna\nfor each row execute procedure public.set_updated_at()","comment on table public.rna is 'RNA entities referenced by treatments (e.g., mRNA, sgRNA pools).'","-- ---------------------------------------------------------------------------\n-- 2) Rebuild treatments\n--    We’ll park any existing table as treatments_old (non-destructive),\n--    then create the new canonical definition.\n-- ---------------------------------------------------------------------------\ndo $$\nbegin\n  if exists (select 1 from information_schema.tables\n             where table_schema='public' and table_name='treatments') then\n    execute 'alter table public.treatments rename to treatments_old';\n  end if;\nend$$","create table public.treatments (\n  id            uuid primary key default gen_random_uuid(),\n  name          text not null,\n  description   text,\n\n  -- Optional link-outs\n  rna_id        uuid   references public.rna(id)       on delete set null,\n  plasmid_id    bigint references public.plasmids(id)  on delete set null,\n\n  -- Optional defaults (per-application values live in fish_treatments)\n  default_dose  text,\n  default_route text,\n\n  created_by    uuid references auth.users(id) on delete set null,\n  created_at    timestamptz not null default now(),\n  updated_at    timestamptz not null default now()\n)","create index if not exists treatments_rna_id_idx     on public.treatments (rna_id)","create index if not exists treatments_plasmid_id_idx on public.treatments (plasmid_id)","drop trigger if exists set_updated_at_treatments on public.treatments","create trigger set_updated_at_treatments\nbefore update on public.treatments\nfor each row execute procedure public.set_updated_at()","comment on table public.treatments is 'Reusable treatment definitions (may link to RNA and/or plasmids).'","-- ---------------------------------------------------------------------------\n-- 3) Many-to-many: fish ⇄ treatments  (DROP + RECREATE to guarantee shape)\n-- ---------------------------------------------------------------------------\ndrop table if exists public.fish_treatments cascade","create table public.fish_treatments (\n  id             bigserial primary key,\n  fish_id        bigint not null references public.fish(id) on delete cascade,\n  treatment_id   uuid   not null references public.treatments(id) on delete cascade,\n\n  -- Per-application metadata\n  applied_at     timestamptz not null default now(),\n  amount         text,\n  units          text,\n  route          text,\n  notes          text,\n\n  created_by     uuid references auth.users(id) on delete set null,\n  created_at     timestamptz not null default now(),\n  updated_at     timestamptz not null default now()\n)","create index if not exists fish_treatments_fish_id_idx\n  on public.fish_treatments (fish_id)","create index if not exists fish_treatments_treatment_id_idx\n  on public.fish_treatments (treatment_id)","create index if not exists fish_treatments_applied_at_idx\n  on public.fish_treatments (applied_at)","drop trigger if exists set_updated_at_fish_treatments on public.fish_treatments","create trigger set_updated_at_fish_treatments\nbefore update on public.fish_treatments\nfor each row execute procedure public.set_updated_at()","comment on table public.fish_treatments is 'Join table: which fish received which treatment and when.'","-- ---------------------------------------------------------------------------\n-- 4) (Optional) RLS stubs – adjust to your security model\n-- ---------------------------------------------------------------------------\nalter table public.rna enable row level security","do $body$\nbegin\n  if not exists (\n    select 1\n    from pg_policies\n    where schemaname = 'public'\n      and tablename  = 'rna'\n      and policyname = 'rna_select_all_auth'\n  ) then\n    execute 'create policy rna_select_all_auth on public.rna for select to authenticated using (true)';\n  end if;\n\n  if not exists (\n    select 1\n    from pg_policies\n    where schemaname = 'public'\n      and tablename  = 'rna'\n      and policyname = 'rna_modify_own'\n  ) then\n    execute 'create policy rna_modify_own on public.rna for all to authenticated ' ||\n            'using (auth.uid() = created_by or created_by is null) ' ||\n            'with check (auth.uid() = created_by or created_by is null)';\n  end if;\nend\n$body$ language plpgsql","alter table public.treatments enable row level security","do $body$\nbegin\n  if not exists (\n    select 1 from pg_policies\n    where schemaname='public' and tablename='treatments' and policyname='treatments_select_all_auth'\n  ) then\n    execute 'create policy treatments_select_all_auth on public.treatments for select to authenticated using (true)';\n  end if;\n\n  if not exists (\n    select 1 from pg_policies\n    where schemaname='public' and tablename='treatments' and policyname='treatments_modify_own'\n  ) then\n    execute 'create policy treatments_modify_own on public.treatments for all to authenticated ' ||\n            'using (auth.uid() = created_by or created_by is null) ' ||\n            'with check (auth.uid() = created_by or created_by is null)';\n  end if;\nend\n$body$ language plpgsql","alter table public.fish_treatments enable row level security","do $body$\nbegin\n  if not exists (\n    select 1 from pg_policies\n    where schemaname='public' and tablename='fish_treatments' and policyname='fish_treatments_select_all_auth'\n  ) then\n    execute 'create policy fish_treatments_select_all_auth on public.fish_treatments for select to authenticated using (true)';\n  end if;\n\n  if not exists (\n    select 1 from pg_policies\n    where schemaname='public' and tablename='fish_treatments' and policyname='fish_treatments_modify_own'\n  ) then\n    execute 'create policy fish_treatments_modify_own on public.fish_treatments for all to authenticated ' ||\n            'using (auth.uid() = created_by or created_by is null) ' ||\n            'with check (auth.uid() = created_by or created_by is null)';\n  end if;\nend\n$body$ language plpgsql",commit,"-- (Optional after validation) If you intentionally want to discard parked data:\n-- drop table if exists public.treatments_old cascade;"}	add_rna_and_rebuild_treatments
20250910042553	{"ALTER TABLE public.rna ADD CONSTRAINT rna_name_unique UNIQUE (name)"}	add_unique_on_rna_name
20250910043405	{"-- drop duplicate unique constraint on rna.name\nALTER TABLE public.rna DROP CONSTRAINT IF EXISTS rna_name_key"}	drop_duplicate_rna_name_key
20250910140659	{"create table if not exists public.fluors (\n  id bigserial primary key,\n  name text not null unique,\n  excitation integer,\n  emission integer,\n  tag text,\n  notes text\n)","create table if not exists public.transgenes_fluors (\n  transgene_id bigint not null references public.transgenes(id) on delete cascade,\n  fluor_id bigint not null references public.fluors(id) on delete cascade,\n  primary key (transgene_id, fluor_id)\n)","create index if not exists idx_transgenes_fluors_fluor on public.transgenes_fluors(fluor_id)"}	create_fluors
20250910140700	{"drop table if exists public.elements cascade","drop table if exists public.cassettes cascade","drop table if exists public.selected_phenotypes cascade"}	drop_elements_cassettes_selected_phenotypes
20250910204546	{"alter table if exists public.tanks add column if not exists fish_id bigint","create index if not exists idx_tanks_fish on public.tanks(fish_id)"}	add_fish_fk_to_tanks
20250911091559	{"DO $$\nBEGIN\n  IF to_regclass('public.dyes') IS NULL AND to_regclass('public.fluors') IS NOT NULL THEN\n    ALTER TABLE public.fluors RENAME TO dyes;\n  END IF;\nEND $$"}	rename_fluors_to_dyes
20250911091609	{"ALTER TABLE public.dyes\n  ADD COLUMN IF NOT EXISTS excitation integer"}	a_add_excitation_to_dyes
20250911091610	{"CREATE EXTENSION IF NOT EXISTS pgcrypto","CREATE TABLE IF NOT EXISTS public.injections (\n  id          uuid DEFAULT gen_random_uuid() PRIMARY KEY,\n  rna_fk      uuid REFERENCES public.rna(id)        ON DELETE SET NULL,\n  plasmids_fk bigint REFERENCES public.plasmids(id) ON DELETE SET NULL,\n  notes       text\n)","INSERT INTO public.injections (id, rna_fk, plasmids_fk, notes)\nSELECT t.id, t.rna_id, t.plasmid_id, COALESCE(NULLIF(t.description,''), t.name)\nFROM public.treatments t\nON CONFLICT (id) DO NOTHING","ALTER TABLE public.fish_treatments\n  DROP CONSTRAINT IF EXISTS fish_treatments_treatment_id_fkey","ALTER TABLE public.fish_treatments\n  RENAME COLUMN treatment_id TO injection_id","ALTER TABLE public.fish_treatments\n  ADD CONSTRAINT fish_treatments_injection_id_fkey\n  FOREIGN KEY (injection_id) REFERENCES public.injections(id) ON DELETE CASCADE","DROP TABLE IF EXISTS public.treatments"}	replace_treatments_with_injections
20250911093127	{"DO $$\nBEGIN\n  IF to_regclass('public.injections') IS NOT NULL AND to_regclass('public.treatments') IS NULL THEN\n    EXECUTE 'ALTER TABLE public.injections RENAME TO treatments';\n  END IF;\n\n  IF to_regclass('public.injections_dyes') IS NOT NULL AND to_regclass('public.treatments_dyes') IS NULL THEN\n    EXECUTE 'ALTER TABLE public.injections_dyes RENAME TO treatments_dyes';\n  END IF;\nEND$$","CREATE TABLE IF NOT EXISTS public.treatments_dyes (\n  treatment_id uuid   NOT NULL,\n  dye_id       bigint NOT NULL,\n  PRIMARY KEY (treatment_id, dye_id)\n)","DO $$\nBEGIN\n  IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'treatments_dyes_treatment_fk') THEN\n    EXECUTE 'ALTER TABLE public.treatments_dyes\n             ADD CONSTRAINT treatments_dyes_treatment_fk\n             FOREIGN KEY (treatment_id) REFERENCES public.treatments(id) ON DELETE CASCADE';\n  END IF;\n\n  IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'treatments_dyes_dye_fk') THEN\n    EXECUTE 'ALTER TABLE public.treatments_dyes\n             ADD CONSTRAINT treatments_dyes_dye_fk\n             FOREIGN KEY (dye_id) REFERENCES public.dyes(id) ON DELETE CASCADE';\n  END IF;\nEND$$","CREATE INDEX IF NOT EXISTS idx_treatments_dyes_dye_id ON public.treatments_dyes(dye_id)","DO $$\nBEGIN\n  IF EXISTS (\n    SELECT 1 FROM information_schema.columns\n    WHERE table_schema='public' AND table_name='fish_treatments' AND column_name='injection_id'\n  ) THEN\n    EXECUTE 'ALTER TABLE public.fish_treatments DROP CONSTRAINT IF EXISTS fish_treatments_injection_id_fkey';\n    EXECUTE 'ALTER TABLE public.fish_treatments RENAME COLUMN injection_id TO treatment_id';\n  END IF;\n\n  IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname='fish_treatments_treatment_id_fkey') THEN\n    EXECUTE 'ALTER TABLE public.fish_treatments\n             ADD CONSTRAINT fish_treatments_treatment_id_fkey\n             FOREIGN KEY (treatment_id) REFERENCES public.treatments(id) ON DELETE CASCADE';\n  END IF;\nEND$$"}	rename_injections_and_join_dyes
20250911100406	{"ALTER TABLE public.treatments\n  ADD COLUMN IF NOT EXISTS dyes_fk bigint","DO $$\nBEGIN\n  IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'treatments_dyes_fk_fkey') THEN\n    EXECUTE 'ALTER TABLE public.treatments\n             ADD CONSTRAINT treatments_dyes_fk_fkey\n             FOREIGN KEY (dyes_fk) REFERENCES public.dyes(id) ON DELETE SET NULL';\n  END IF;\nEND$$","CREATE INDEX IF NOT EXISTS idx_treatments_dyes_fk ON public.treatments(dyes_fk)"}	add_dyes_fk_to_treatments
20250911102658	{BEGIN,"CREATE TABLE IF NOT EXISTS public.treatment_plasmids (\n  treatment_id uuid   NOT NULL REFERENCES public.treatments(id) ON DELETE CASCADE,\n  plasmid_id   bigint NOT NULL REFERENCES public.plasmids(id)   ON DELETE RESTRICT,\n  amount_ng    numeric,\n  conc_ng_per_ul numeric,\n  notes        text,\n  PRIMARY KEY (treatment_id, plasmid_id)\n)","CREATE TABLE IF NOT EXISTS public.treatment_rnas (\n  treatment_id uuid NOT NULL REFERENCES public.treatments(id) ON DELETE CASCADE,\n  rna_id       uuid NOT NULL REFERENCES public.rna(id)        ON DELETE RESTRICT,\n  amount_ng    numeric,\n  notes        text,\n  PRIMARY KEY (treatment_id, rna_id)\n)","CREATE TABLE IF NOT EXISTS public.treatment_dyes (\n  treatment_id uuid   NOT NULL REFERENCES public.treatments(id) ON DELETE CASCADE,\n  dye_id       bigint NOT NULL REFERENCES public.dyes(id)        ON DELETE RESTRICT,\n  conc_uM      numeric,\n  notes        text,\n  PRIMARY KEY (treatment_id, dye_id)\n)","CREATE INDEX IF NOT EXISTS idx_treatment_plasmids_plasmid ON public.treatment_plasmids(plasmid_id)","CREATE INDEX IF NOT EXISTS idx_treatment_rnas_rna         ON public.treatment_rnas(rna_id)","CREATE INDEX IF NOT EXISTS idx_treatment_dyes_dye         ON public.treatment_dyes(dye_id)","INSERT INTO public.treatment_plasmids (treatment_id, plasmid_id)\nSELECT id, plasmids_fk FROM public.treatments WHERE plasmids_fk IS NOT NULL\nON CONFLICT DO NOTHING","INSERT INTO public.treatment_rnas (treatment_id, rna_id)\nSELECT id, rna_fk FROM public.treatments WHERE rna_fk IS NOT NULL\nON CONFLICT DO NOTHING","INSERT INTO public.treatment_dyes (treatment_id, dye_id)\nSELECT id, dyes_fk FROM public.treatments WHERE dyes_fk IS NOT NULL\nON CONFLICT DO NOTHING","DO $$\nBEGIN\n  IF to_regclass('public.treatments_dyes') IS NOT NULL THEN\n    INSERT INTO public.treatment_dyes (treatment_id, dye_id)\n    SELECT treatment_id, dye_id FROM public.treatments_dyes\n    ON CONFLICT DO NOTHING;\n  END IF;\nEND$$",COMMIT}	add_treatment_component_joins
20250911102724	{"CREATE OR REPLACE VIEW public.treatment_components_v AS\nSELECT t.id AS treatment_id, 'plasmid'::text AS component_type, tp.plasmid_id::text AS component_id, tp.amount_ng, tp.conc_ng_per_ul AS conc, tp.notes\nFROM public.treatments t JOIN public.treatment_plasmids tp ON t.id = tp.treatment_id\nUNION ALL\nSELECT t.id, 'rna'::text, tr.rna_id::text, tr.amount_ng, NULL::numeric AS conc, tr.notes\nFROM public.treatments t JOIN public.treatment_rnas tr ON t.id = tr.treatment_id\nUNION ALL\nSELECT t.id, 'dye'::text, td.dye_id::text, NULL::numeric AS amount_ng, td.conc_uM AS conc, td.notes\nFROM public.treatments t JOIN public.treatment_dyes td ON t.id = td.treatment_id"}	add_treatment_components_view
20250911102732	{"ALTER TABLE public.treatments DROP COLUMN IF EXISTS plasmids_fk","ALTER TABLE public.treatments DROP COLUMN IF EXISTS rna_fk","ALTER TABLE public.treatments DROP COLUMN IF EXISTS dyes_fk"}	drop_legacy_single_fk_cols
20250911102751	{"DO $$\nBEGIN\n  IF to_regclass('public.treatments_dyes') IS NOT NULL THEN\n    EXECUTE 'DROP TABLE public.treatments_dyes CASCADE';\n  END IF;\n  IF to_regclass('public.treatments_old') IS NOT NULL THEN\n    EXECUTE 'DROP TABLE public.treatments_old CASCADE';\n  END IF;\n  IF to_regclass('public.cassettes_elements') IS NOT NULL THEN\n    EXECUTE 'DROP TABLE public.cassettes_elements CASCADE';\n  END IF;\nEND$$"}	drop_legacy_tables
20250911103547	{BEGIN,"DROP TABLE IF EXISTS public.plasmid_fluors","CREATE TABLE IF NOT EXISTS public.plasmid_dyes (\n  plasmid_id bigint NOT NULL REFERENCES public.plasmids(id) ON DELETE CASCADE,\n  dye_id     bigint NOT NULL REFERENCES public.dyes(id)     ON DELETE RESTRICT,\n  PRIMARY KEY (plasmid_id, dye_id)\n)",COMMIT}	add_component_dye_links
20250911110404	{BEGIN,"DROP TABLE IF EXISTS public.transgenes_fluors CASCADE","ALTER TABLE public.treatments\n  DROP COLUMN IF EXISTS rna_fk,\n  DROP COLUMN IF EXISTS plasmids_fk,\n  DROP COLUMN IF EXISTS dyes_fk,\n  DROP COLUMN IF EXISTS rna_id,\n  DROP COLUMN IF EXISTS plasmid_id,\n  DROP COLUMN IF EXISTS dye_id","DROP INDEX IF EXISTS treatments_rna_id_idx","DROP INDEX IF EXISTS treatments_plasmid_id_idx","DROP INDEX IF EXISTS idx_treatments_dyes_fk",COMMIT}	a_cleanup_drops
20250911110818	{BEGIN,"DROP TABLE IF EXISTS public.transgenes_fluors CASCADE","ALTER TABLE public.treatments\n  DROP COLUMN IF EXISTS rna_fk,\n  DROP COLUMN IF EXISTS plasmids_fk,\n  DROP COLUMN IF EXISTS dyes_fk,\n  DROP COLUMN IF EXISTS rna_id,\n  DROP COLUMN IF EXISTS plasmid_id,\n  DROP COLUMN IF EXISTS dye_id","DROP INDEX IF EXISTS treatments_rna_id_idx","DROP INDEX IF EXISTS treatments_plasmid_id_idx","DROP INDEX IF EXISTS idx_treatments_dyes_fk",COMMIT}	a_cleanup_drops
20250911171537	{BEGIN,"DROP TABLE IF EXISTS public.treatments_dyes","CREATE TABLE IF NOT EXISTS public.treatments_dyes (\n  treatment_id uuid   NOT NULL REFERENCES public.treatments(id) ON DELETE CASCADE,\n  dye_id       bigint NOT NULL REFERENCES public.dyes(id)       ON DELETE CASCADE,\n  created_at   timestamptz NOT NULL DEFAULT now(),\n  created_by   text,\n  PRIMARY KEY (treatment_id, dye_id)\n)","CREATE INDEX IF NOT EXISTS idx_treatments_dyes_dye_id ON public.treatments_dyes(dye_id)",COMMIT}	create_treatments_dyes
20250911171805	{"DO $$\nBEGIN\n  IF to_regclass('public.fluors_id_seq') IS NOT NULL AND to_regclass('public.dyes_id_seq') IS NULL THEN\n    ALTER SEQUENCE public.fluors_id_seq RENAME TO dyes_id_seq;\n    IF to_regclass('public.dyes') IS NOT NULL THEN\n      ALTER TABLE public.dyes ALTER COLUMN id SET DEFAULT nextval('dyes_id_seq'::regclass);\n    END IF;\n  END IF;\nEND $$"}	rename_fluors_seq_to_dyes
20250911172557	{BEGIN,"CREATE TABLE IF NOT EXISTS public.treatments_dyes (\n  treatment_id bigint NOT NULL REFERENCES public.treatments(id) ON DELETE CASCADE,\n  dye_id       bigint NOT NULL REFERENCES public.dyes(id)       ON DELETE CASCADE,\n  created_at   timestamptz NOT NULL DEFAULT now(),\n  created_by   text,\n  PRIMARY KEY (treatment_id, dye_id)\n)","CREATE INDEX IF NOT EXISTS idx_treatments_dyes_dye_id ON public.treatments_dyes(dye_id)",COMMIT}	create_treatments_dyes
20250911173033	{"DO $$\nBEGIN\n  IF NOT EXISTS (\n    SELECT 1 FROM information_schema.columns\n    WHERE table_schema='public' AND table_name='dyes' AND column_name='excitation'\n  ) THEN\n    ALTER TABLE public.dyes ADD COLUMN excitation integer;\n  END IF;\n\n  IF NOT EXISTS (\n    SELECT 1 FROM information_schema.columns\n    WHERE table_schema='public' AND table_name='dyes' AND column_name='emission'\n  ) THEN\n    ALTER TABLE public.dyes ADD COLUMN emission integer;\n  END IF;\n\n  IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname='dyes_excitation_range') THEN\n    ALTER TABLE public.dyes\n      ADD CONSTRAINT dyes_excitation_range\n      CHECK (excitation IS NULL OR excitation BETWEEN 200 AND 1200) NOT VALID;\n  END IF;\n\n  IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname='dyes_emission_range') THEN\n    ALTER TABLE public.dyes\n      ADD CONSTRAINT dyes_emission_range\n      CHECK (emission IS NULL OR emission BETWEEN 200 AND 1200) NOT VALID;\n  END IF;\nEND $$","CREATE INDEX IF NOT EXISTS ix_dyes_name_ci ON public.dyes (lower(name))","CREATE UNIQUE INDEX IF NOT EXISTS ux_dyes_name_ci ON public.dyes (lower(name))"}	dyes_constraints
20250911181453	{BEGIN,"-- 🔧 Examples (edit to your real changes):\n-- 1) Add/rename columns safely\nALTER TABLE public.dyes\n  ADD COLUMN IF NOT EXISTS type text,\n  ADD COLUMN IF NOT EXISTS notes text","-- 2) Create tables if needed\n-- CREATE TABLE IF NOT EXISTS public.dyes (\n--   id bigint generated always as identity primary key,\n--   name text not null unique,\n--   description text,\n--   type text,\n--   notes text,\n--   created_at timestamptz not null default now(),\n--   created_by uuid\n-- );\n\n-- 3) Link tables (no FKs yet; we’ll add FKs in Step D)\n-- ALTER TABLE public.fish_treatments\n--   ADD COLUMN IF NOT EXISTS dye_id bigint;\n\nCOMMIT"}	b_alters_adds
20250911181940	{BEGIN,"ALTER TABLE public.fish_treatments\n  ADD COLUMN IF NOT EXISTS dye_id bigint","DO $$\nBEGIN\n  IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname='fish_treatments_dye_id_fkey') THEN\n    ALTER TABLE public.fish_treatments\n      ADD CONSTRAINT fish_treatments_dye_id_fkey\n      FOREIGN KEY (dye_id) REFERENCES public.dyes(id) ON DELETE SET NULL;\n  END IF;\nEND$$",COMMIT}	d_fish_treatments_dye
20250911182328	{BEGIN,"CREATE INDEX IF NOT EXISTS idx_fish_treatments_dye ON public.fish_treatments(dye_id)",COMMIT}	e_idx_fish_treatments_dye
20250911182339	{"DO $$\nBEGIN\n  IF to_regclass('public.plasmid_dyes') IS NOT NULL THEN\n    EXECUTE 'CREATE UNIQUE INDEX IF NOT EXISTS plasmid_dyes_unique_pair ON public.plasmid_dyes (plasmid_id, dye_id)';\n  END IF;\n\n  IF to_regclass('public.transgenes_fluors') IS NOT NULL THEN\n    EXECUTE 'CREATE UNIQUE INDEX IF NOT EXISTS transgene_fluors_unique_pair ON public.transgenes_fluors (transgene_id, fluor_id)';\n  END IF;\nEND $$"}	f_unique_link_pairs
20250911211550	{BEGIN,"CREATE TABLE IF NOT EXISTS public.fluors (\n  id bigserial PRIMARY KEY,\n  name       text    NOT NULL UNIQUE,\n  excitation integer,\n  emission   integer,\n  tag        text,\n  notes      text\n)","CREATE TABLE IF NOT EXISTS public.transgenes_fluors (\n  transgene_id bigint NOT NULL REFERENCES public.transgenes(id) ON DELETE CASCADE,\n  fluor_id     bigint NOT NULL REFERENCES public.fluors(id)     ON DELETE RESTRICT,\n  PRIMARY KEY (transgene_id, fluor_id)\n)","CREATE INDEX IF NOT EXISTS idx_transgenes_fluors_fluor ON public.transgenes_fluors(fluor_id)","CREATE UNIQUE INDEX IF NOT EXISTS transgene_fluors_unique_pair ON public.transgenes_fluors (transgene_id, fluor_id)","CREATE TABLE IF NOT EXISTS public.plasmid_fluors (\n  plasmid_id bigint NOT NULL REFERENCES public.plasmids(id) ON DELETE CASCADE,\n  fluor_id   bigint NOT NULL REFERENCES public.fluors(id)   ON DELETE RESTRICT,\n  PRIMARY KEY (plasmid_id, fluor_id)\n)","CREATE INDEX IF NOT EXISTS idx_plasmid_fluors_fluor ON public.plasmid_fluors(fluor_id)","CREATE UNIQUE INDEX IF NOT EXISTS plasmid_fluors_unique_pair ON public.plasmid_fluors (plasmid_id, fluor_id)","CREATE TABLE IF NOT EXISTS public.rna_fluors (\n  rna_id   uuid   NOT NULL REFERENCES public.rna(id)     ON DELETE CASCADE,\n  fluor_id bigint NOT NULL REFERENCES public.fluors(id)  ON DELETE RESTRICT,\n  PRIMARY KEY (rna_id, fluor_id)\n)","CREATE INDEX IF NOT EXISTS idx_rna_fluors_fluor ON public.rna_fluors(fluor_id)","CREATE UNIQUE INDEX IF NOT EXISTS rna_fluors_unique_pair ON public.rna_fluors (rna_id, fluor_id)",COMMIT}	restore_fluors_and_links
20250912044103	{BEGIN,"CREATE UNIQUE INDEX IF NOT EXISTS ux_fluors_name_ci ON public.fluors (lower(name))",COMMIT}	fluors_ci_unique
20250912044148	{BEGIN,"CREATE INDEX IF NOT EXISTS ix_plasmid_fluors_plasmid_id   ON public.plasmid_fluors(plasmid_id)","CREATE INDEX IF NOT EXISTS ix_plasmid_fluors_fluor_id     ON public.plasmid_fluors(fluor_id)","CREATE INDEX IF NOT EXISTS ix_transgenes_fluors_transgene ON public.transgenes_fluors(transgene_id)","CREATE INDEX IF NOT EXISTS ix_transgenes_fluors_fluor     ON public.transgenes_fluors(fluor_id)","CREATE INDEX IF NOT EXISTS ix_rna_fluors_rna_id           ON public.rna_fluors(rna_id)","CREATE INDEX IF NOT EXISTS ix_rna_fluors_fluor_id         ON public.rna_fluors(fluor_id)",COMMIT}	fluor_link_indexes
20250911220424	{BEGIN,"-- Merge case-variants of public.fluors by lower(name), keep the smallest id\nDO $$\nDECLARE rec record;\nBEGIN\n  FOR rec IN\n    SELECT lower(name) AS key, MIN(id) AS keep_id, array_agg(id) AS ids\n    FROM public.fluors\n    GROUP BY 1\n    HAVING COUNT(*) > 1\n  LOOP\n    UPDATE public.rna_fluors\n      SET fluor_id = rec.keep_id\n      WHERE fluor_id <> rec.keep_id AND fluor_id = ANY(rec.ids);\n\n    UPDATE public.plasmid_fluors\n      SET fluor_id = rec.keep_id\n      WHERE fluor_id <> rec.keep_id AND fluor_id = ANY(rec.ids);\n\n    UPDATE public.transgenes_fluors\n      SET fluor_id = rec.keep_id\n      WHERE fluor_id <> rec.keep_id AND fluor_id = ANY(rec.ids);\n\n    DELETE FROM public.fluors\n      WHERE id <> rec.keep_id AND id = ANY(rec.ids);\n  END LOOP;\nEND $$","-- Case-insensitive unique name\nCREATE UNIQUE INDEX IF NOT EXISTS ux_fluors_name_ci ON public.fluors (lower(name))",COMMIT}	fluors_ci_unique
\.


--
-- Data for Name: seed_files; Type: TABLE DATA; Schema: supabase_migrations; Owner: postgres
--

COPY supabase_migrations.seed_files (path, hash) FROM stdin;
supabase/seeds/000-truncate.sql	0fd4c0d14299abc014a5b09b44d0b9f0db4ef81d599e72619d487039006510af
supabase/seeds/001-snapshot.sql	07ef81ecf578bd9d22afb47443293b13de37765f335669e19821f5f4c6ba6f32
supabase/seed.sql	b81820b6ced2f68ee5c17724962a3e001e6c3a92602f16014738dce8fd79e65d
\.


--
-- Data for Name: secrets; Type: TABLE DATA; Schema: vault; Owner: supabase_admin
--

COPY vault.secrets (id, name, description, secret, key_id, nonce, created_at, updated_at) FROM stdin;
\.


--
-- Name: refresh_tokens_id_seq; Type: SEQUENCE SET; Schema: auth; Owner: supabase_auth_admin
--

SELECT pg_catalog.setval('auth.refresh_tokens_id_seq', 204, true);


--
-- Name: dyes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.dyes_id_seq', 6, true);


--
-- Name: fish_code_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.fish_code_seq', 489, true);


--
-- Name: fish_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.fish_id_seq', 661, true);


--
-- Name: fish_tank_memberships_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.fish_tank_memberships_id_seq', 13, true);


--
-- Name: fish_treatments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.fish_treatments_id_seq', 1, false);


--
-- Name: fluors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.fluors_id_seq', 64, true);


--
-- Name: mutations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.mutations_id_seq', 6, true);


--
-- Name: plasmids_cassettes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.plasmids_cassettes_id_seq', 1, false);


--
-- Name: plasmids_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.plasmids_id_seq', 276, true);


--
-- Name: selectedphenotypes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.selectedphenotypes_id_seq', 1, false);


--
-- Name: strains_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.strains_id_seq', 12, true);


--
-- Name: tank_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tank_categories_id_seq', 6, true);


--
-- Name: tanks_code_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tanks_code_seq', 8, true);


--
-- Name: tanks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tanks_id_seq', 31, true);


--
-- Name: transgene_fluors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.transgene_fluors_id_seq', 35, true);


--
-- Name: transgenes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.transgenes_id_seq', 35, true);


--
-- Name: subscription_id_seq; Type: SEQUENCE SET; Schema: realtime; Owner: supabase_admin
--

SELECT pg_catalog.setval('realtime.subscription_id_seq', 1, false);


--
-- Name: mfa_amr_claims amr_id_pk; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_amr_claims
    ADD CONSTRAINT amr_id_pk PRIMARY KEY (id);


--
-- Name: audit_log_entries audit_log_entries_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.audit_log_entries
    ADD CONSTRAINT audit_log_entries_pkey PRIMARY KEY (id);


--
-- Name: flow_state flow_state_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.flow_state
    ADD CONSTRAINT flow_state_pkey PRIMARY KEY (id);


--
-- Name: identities identities_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.identities
    ADD CONSTRAINT identities_pkey PRIMARY KEY (id);


--
-- Name: identities identities_provider_id_provider_unique; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.identities
    ADD CONSTRAINT identities_provider_id_provider_unique UNIQUE (provider_id, provider);


--
-- Name: instances instances_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.instances
    ADD CONSTRAINT instances_pkey PRIMARY KEY (id);


--
-- Name: mfa_amr_claims mfa_amr_claims_session_id_authentication_method_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_amr_claims
    ADD CONSTRAINT mfa_amr_claims_session_id_authentication_method_pkey UNIQUE (session_id, authentication_method);


--
-- Name: mfa_challenges mfa_challenges_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_challenges
    ADD CONSTRAINT mfa_challenges_pkey PRIMARY KEY (id);


--
-- Name: mfa_factors mfa_factors_last_challenged_at_key; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_factors
    ADD CONSTRAINT mfa_factors_last_challenged_at_key UNIQUE (last_challenged_at);


--
-- Name: mfa_factors mfa_factors_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_factors
    ADD CONSTRAINT mfa_factors_pkey PRIMARY KEY (id);


--
-- Name: oauth_clients oauth_clients_client_id_key; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.oauth_clients
    ADD CONSTRAINT oauth_clients_client_id_key UNIQUE (client_id);


--
-- Name: oauth_clients oauth_clients_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.oauth_clients
    ADD CONSTRAINT oauth_clients_pkey PRIMARY KEY (id);


--
-- Name: one_time_tokens one_time_tokens_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.one_time_tokens
    ADD CONSTRAINT one_time_tokens_pkey PRIMARY KEY (id);


--
-- Name: refresh_tokens refresh_tokens_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.refresh_tokens
    ADD CONSTRAINT refresh_tokens_pkey PRIMARY KEY (id);


--
-- Name: refresh_tokens refresh_tokens_token_unique; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.refresh_tokens
    ADD CONSTRAINT refresh_tokens_token_unique UNIQUE (token);


--
-- Name: saml_providers saml_providers_entity_id_key; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_providers
    ADD CONSTRAINT saml_providers_entity_id_key UNIQUE (entity_id);


--
-- Name: saml_providers saml_providers_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_providers
    ADD CONSTRAINT saml_providers_pkey PRIMARY KEY (id);


--
-- Name: saml_relay_states saml_relay_states_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_relay_states
    ADD CONSTRAINT saml_relay_states_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: sessions sessions_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);


--
-- Name: sso_domains sso_domains_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.sso_domains
    ADD CONSTRAINT sso_domains_pkey PRIMARY KEY (id);


--
-- Name: sso_providers sso_providers_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.sso_providers
    ADD CONSTRAINT sso_providers_pkey PRIMARY KEY (id);


--
-- Name: users users_phone_key; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.users
    ADD CONSTRAINT users_phone_key UNIQUE (phone);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: dyes dyes_emission_range; Type: CHECK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE public.dyes
    ADD CONSTRAINT dyes_emission_range CHECK (((emission IS NULL) OR ((emission >= 200) AND (emission <= 1200)))) NOT VALID;


--
-- Name: dyes dyes_excitation_range; Type: CHECK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE public.dyes
    ADD CONSTRAINT dyes_excitation_range CHECK (((excitation IS NULL) OR ((excitation >= 200) AND (excitation <= 1200)))) NOT VALID;


--
-- Name: dyes dyes_id_uuid_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dyes
    ADD CONSTRAINT dyes_id_uuid_key UNIQUE (id_uuid);


--
-- Name: dyes dyes_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dyes
    ADD CONSTRAINT dyes_name_key UNIQUE (name);


--
-- Name: dyes dyes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dyes
    ADD CONSTRAINT dyes_pkey PRIMARY KEY (id_uuid);


--
-- Name: fish fish_id_uuid_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fish
    ADD CONSTRAINT fish_id_uuid_key UNIQUE (id_uuid);


--
-- Name: fish_mounts fish_mounts_fish_id_mount_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fish_mounts
    ADD CONSTRAINT fish_mounts_fish_id_mount_id_key UNIQUE (fish_id, mount_id);


--
-- Name: fish_mounts fish_mounts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fish_mounts
    ADD CONSTRAINT fish_mounts_pkey PRIMARY KEY (id);


--
-- Name: fish_mutations fish_mutations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fish_mutations
    ADD CONSTRAINT fish_mutations_pkey PRIMARY KEY (fish_id, mutation_id);


--
-- Name: fish_parents fish_parents_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fish_parents
    ADD CONSTRAINT fish_parents_pkey PRIMARY KEY (child_id);


--
-- Name: fish fish_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fish
    ADD CONSTRAINT fish_pkey PRIMARY KEY (id_uuid);


--
-- Name: fish_selectedphenotypes fish_selectedphenotypes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fish_selectedphenotypes
    ADD CONSTRAINT fish_selectedphenotypes_pkey PRIMARY KEY (fish_id, selectedphenotype_id);


--
-- Name: fish_strains fish_strains_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fish_strains
    ADD CONSTRAINT fish_strains_pkey PRIMARY KEY (fish_id, strain_id);


--
-- Name: fish_tank_memberships fish_tank_memberships_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fish_tank_memberships
    ADD CONSTRAINT fish_tank_memberships_pkey PRIMARY KEY (id);


--
-- Name: fish_tank_memberships fish_tank_no_overlap; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fish_tank_memberships
    ADD CONSTRAINT fish_tank_no_overlap EXCLUDE USING gist (fish_id_uuid WITH =, tstzrange(valid_from, COALESCE(valid_to, 'infinity'::timestamp with time zone), '[)'::text) WITH &&);


--
-- Name: fish_treatments fish_treatments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fish_treatments
    ADD CONSTRAINT fish_treatments_pkey PRIMARY KEY (id);


--
-- Name: fish_year_counters fish_year_counters_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fish_year_counters
    ADD CONSTRAINT fish_year_counters_pkey PRIMARY KEY (year);


--
-- Name: fluors fluors_id_uuid_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fluors
    ADD CONSTRAINT fluors_id_uuid_key UNIQUE (id_uuid);


--
-- Name: fluors fluors_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fluors
    ADD CONSTRAINT fluors_name_key UNIQUE (name);


--
-- Name: fluors fluors_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fluors
    ADD CONSTRAINT fluors_pkey PRIMARY KEY (id_uuid);


--
-- Name: treatments injections_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.treatments
    ADD CONSTRAINT injections_pkey PRIMARY KEY (id);


--
-- Name: mounts mounts_id_uuid_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mounts
    ADD CONSTRAINT mounts_id_uuid_key UNIQUE (id_uuid);


--
-- Name: mounts mounts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mounts
    ADD CONSTRAINT mounts_pkey PRIMARY KEY (id_uuid);


--
-- Name: mutations mutations_id_uuid_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mutations
    ADD CONSTRAINT mutations_id_uuid_key UNIQUE (id_uuid);


--
-- Name: mutations mutations_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mutations
    ADD CONSTRAINT mutations_name_key UNIQUE (name);


--
-- Name: mutations mutations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mutations
    ADD CONSTRAINT mutations_pkey PRIMARY KEY (id_uuid);


--
-- Name: plasmid_dyes plasmid_dyes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plasmid_dyes
    ADD CONSTRAINT plasmid_dyes_pkey PRIMARY KEY (plasmid_id, dye_id);


--
-- Name: plasmid_fluors plasmid_fluors_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plasmid_fluors
    ADD CONSTRAINT plasmid_fluors_pkey PRIMARY KEY (plasmid_id, fluor_id);


--
-- Name: plasmids_cassettes plasmids_cassettes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plasmids_cassettes
    ADD CONSTRAINT plasmids_cassettes_pkey PRIMARY KEY (id);


--
-- Name: plasmids_cassettes plasmids_cassettes_plasmid_id_cassette_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plasmids_cassettes
    ADD CONSTRAINT plasmids_cassettes_plasmid_id_cassette_id_key UNIQUE (plasmid_id, cassette_id);


--
-- Name: plasmids_cassettes plasmids_cassettes_plasmid_id_position_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plasmids_cassettes
    ADD CONSTRAINT plasmids_cassettes_plasmid_id_position_key UNIQUE (plasmid_id, "position");


--
-- Name: plasmids plasmids_id_uuid_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plasmids
    ADD CONSTRAINT plasmids_id_uuid_key UNIQUE (id_uuid);


--
-- Name: plasmids plasmids_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plasmids
    ADD CONSTRAINT plasmids_name_key UNIQUE (name);


--
-- Name: plasmids plasmids_nickname_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plasmids
    ADD CONSTRAINT plasmids_nickname_key UNIQUE (nickname);


--
-- Name: plasmids plasmids_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plasmids
    ADD CONSTRAINT plasmids_pkey PRIMARY KEY (id_uuid);


--
-- Name: profiles profiles_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.profiles
    ADD CONSTRAINT profiles_email_key UNIQUE (email);


--
-- Name: profiles profiles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.profiles
    ADD CONSTRAINT profiles_pkey PRIMARY KEY (id);


--
-- Name: rna_fluors rna_fluors_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rna_fluors
    ADD CONSTRAINT rna_fluors_pkey PRIMARY KEY (rna_id, fluor_id);


--
-- Name: rna rna_id_uuid_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rna
    ADD CONSTRAINT rna_id_uuid_key UNIQUE (id_uuid);


--
-- Name: rna rna_name_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rna
    ADD CONSTRAINT rna_name_unique UNIQUE (name);


--
-- Name: rna rna_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rna
    ADD CONSTRAINT rna_pkey PRIMARY KEY (id_uuid);


--
-- Name: selectedphenotypes selectedphenotypes_id_uuid_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.selectedphenotypes
    ADD CONSTRAINT selectedphenotypes_id_uuid_key UNIQUE (id_uuid);


--
-- Name: selectedphenotypes selectedphenotypes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.selectedphenotypes
    ADD CONSTRAINT selectedphenotypes_pkey PRIMARY KEY (id_uuid);


--
-- Name: strains strains_id_uuid_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strains
    ADD CONSTRAINT strains_id_uuid_key UNIQUE (id_uuid);


--
-- Name: strains strains_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strains
    ADD CONSTRAINT strains_name_key UNIQUE (name);


--
-- Name: strains strains_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strains
    ADD CONSTRAINT strains_pkey PRIMARY KEY (id_uuid);


--
-- Name: tank_categories tank_categories_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tank_categories
    ADD CONSTRAINT tank_categories_name_key UNIQUE (name);


--
-- Name: tank_categories tank_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tank_categories
    ADD CONSTRAINT tank_categories_pkey PRIMARY KEY (id);


--
-- Name: tank_code_counters_site_yy tank_code_counters_site_yy_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tank_code_counters_site_yy
    ADD CONSTRAINT tank_code_counters_site_yy_pkey PRIMARY KEY (yy, site_code);


--
-- Name: tank_year_counters tank_year_counters_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tank_year_counters
    ADD CONSTRAINT tank_year_counters_pkey PRIMARY KEY (site, yy);


--
-- Name: tanks tanks_id_uuid_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tanks
    ADD CONSTRAINT tanks_id_uuid_key UNIQUE (id_uuid);


--
-- Name: tanks tanks_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tanks
    ADD CONSTRAINT tanks_name_key UNIQUE (name);


--
-- Name: tanks tanks_name_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tanks
    ADD CONSTRAINT tanks_name_unique UNIQUE (name);


--
-- Name: tanks tanks_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tanks
    ADD CONSTRAINT tanks_pkey PRIMARY KEY (id_uuid);


--
-- Name: transgene_fluors transgene_fluors_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transgene_fluors
    ADD CONSTRAINT transgene_fluors_pkey PRIMARY KEY (id);


--
-- Name: transgene_fluors transgene_fluors_transgene_id_fluor_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transgene_fluors
    ADD CONSTRAINT transgene_fluors_transgene_id_fluor_id_key UNIQUE (transgene_id, fluor_id);


--
-- Name: transgenes_fluors transgenes_fluors_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transgenes_fluors
    ADD CONSTRAINT transgenes_fluors_pkey PRIMARY KEY (transgene_id, fluor_id);


--
-- Name: transgenes transgenes_id_uuid_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transgenes
    ADD CONSTRAINT transgenes_id_uuid_key UNIQUE (id_uuid);


--
-- Name: transgenes transgenes_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transgenes
    ADD CONSTRAINT transgenes_name_key UNIQUE (name);


--
-- Name: transgenes transgenes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transgenes
    ADD CONSTRAINT transgenes_pkey PRIMARY KEY (id_uuid);


--
-- Name: treatment_dyes_old treatment_dyes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.treatment_dyes_old
    ADD CONSTRAINT treatment_dyes_pkey PRIMARY KEY (treatment_id, dye_id);


--
-- Name: treatment_dyes treatment_dyes_unified_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.treatment_dyes
    ADD CONSTRAINT treatment_dyes_unified_pkey PRIMARY KEY (treatment_id, dye_id_uuid);


--
-- Name: treatment_plasmids treatment_plasmids_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.treatment_plasmids
    ADD CONSTRAINT treatment_plasmids_pkey PRIMARY KEY (treatment_id, plasmid_id);


--
-- Name: treatment_rnas treatment_rnas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.treatment_rnas
    ADD CONSTRAINT treatment_rnas_pkey PRIMARY KEY (treatment_id, rna_id);


--
-- Name: messages messages_pkey; Type: CONSTRAINT; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER TABLE ONLY realtime.messages
    ADD CONSTRAINT messages_pkey PRIMARY KEY (id, inserted_at);


--
-- Name: subscription pk_subscription; Type: CONSTRAINT; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.subscription
    ADD CONSTRAINT pk_subscription PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: buckets buckets_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.buckets
    ADD CONSTRAINT buckets_pkey PRIMARY KEY (id);


--
-- Name: migrations migrations_name_key; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.migrations
    ADD CONSTRAINT migrations_name_key UNIQUE (name);


--
-- Name: migrations migrations_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);


--
-- Name: objects objects_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.objects
    ADD CONSTRAINT objects_pkey PRIMARY KEY (id);


--
-- Name: s3_multipart_uploads_parts s3_multipart_uploads_parts_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.s3_multipart_uploads_parts
    ADD CONSTRAINT s3_multipart_uploads_parts_pkey PRIMARY KEY (id);


--
-- Name: s3_multipart_uploads s3_multipart_uploads_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.s3_multipart_uploads
    ADD CONSTRAINT s3_multipart_uploads_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: supabase_migrations; Owner: postgres
--

ALTER TABLE ONLY supabase_migrations.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: seed_files seed_files_pkey; Type: CONSTRAINT; Schema: supabase_migrations; Owner: postgres
--

ALTER TABLE ONLY supabase_migrations.seed_files
    ADD CONSTRAINT seed_files_pkey PRIMARY KEY (path);


--
-- Name: audit_logs_instance_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX audit_logs_instance_id_idx ON auth.audit_log_entries USING btree (instance_id);


--
-- Name: confirmation_token_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX confirmation_token_idx ON auth.users USING btree (confirmation_token) WHERE ((confirmation_token)::text !~ '^[0-9 ]*$'::text);


--
-- Name: email_change_token_current_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX email_change_token_current_idx ON auth.users USING btree (email_change_token_current) WHERE ((email_change_token_current)::text !~ '^[0-9 ]*$'::text);


--
-- Name: email_change_token_new_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX email_change_token_new_idx ON auth.users USING btree (email_change_token_new) WHERE ((email_change_token_new)::text !~ '^[0-9 ]*$'::text);


--
-- Name: factor_id_created_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX factor_id_created_at_idx ON auth.mfa_factors USING btree (user_id, created_at);


--
-- Name: flow_state_created_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX flow_state_created_at_idx ON auth.flow_state USING btree (created_at DESC);


--
-- Name: identities_email_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX identities_email_idx ON auth.identities USING btree (email text_pattern_ops);


--
-- Name: INDEX identities_email_idx; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON INDEX auth.identities_email_idx IS 'Auth: Ensures indexed queries on the email column';


--
-- Name: identities_user_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX identities_user_id_idx ON auth.identities USING btree (user_id);


--
-- Name: idx_auth_code; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX idx_auth_code ON auth.flow_state USING btree (auth_code);


--
-- Name: idx_user_id_auth_method; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX idx_user_id_auth_method ON auth.flow_state USING btree (user_id, authentication_method);


--
-- Name: mfa_challenge_created_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX mfa_challenge_created_at_idx ON auth.mfa_challenges USING btree (created_at DESC);


--
-- Name: mfa_factors_user_friendly_name_unique; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX mfa_factors_user_friendly_name_unique ON auth.mfa_factors USING btree (friendly_name, user_id) WHERE (TRIM(BOTH FROM friendly_name) <> ''::text);


--
-- Name: mfa_factors_user_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX mfa_factors_user_id_idx ON auth.mfa_factors USING btree (user_id);


--
-- Name: oauth_clients_client_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX oauth_clients_client_id_idx ON auth.oauth_clients USING btree (client_id);


--
-- Name: oauth_clients_deleted_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX oauth_clients_deleted_at_idx ON auth.oauth_clients USING btree (deleted_at);


--
-- Name: one_time_tokens_relates_to_hash_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX one_time_tokens_relates_to_hash_idx ON auth.one_time_tokens USING hash (relates_to);


--
-- Name: one_time_tokens_token_hash_hash_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX one_time_tokens_token_hash_hash_idx ON auth.one_time_tokens USING hash (token_hash);


--
-- Name: one_time_tokens_user_id_token_type_key; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX one_time_tokens_user_id_token_type_key ON auth.one_time_tokens USING btree (user_id, token_type);


--
-- Name: reauthentication_token_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX reauthentication_token_idx ON auth.users USING btree (reauthentication_token) WHERE ((reauthentication_token)::text !~ '^[0-9 ]*$'::text);


--
-- Name: recovery_token_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX recovery_token_idx ON auth.users USING btree (recovery_token) WHERE ((recovery_token)::text !~ '^[0-9 ]*$'::text);


--
-- Name: refresh_tokens_instance_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX refresh_tokens_instance_id_idx ON auth.refresh_tokens USING btree (instance_id);


--
-- Name: refresh_tokens_instance_id_user_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX refresh_tokens_instance_id_user_id_idx ON auth.refresh_tokens USING btree (instance_id, user_id);


--
-- Name: refresh_tokens_parent_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX refresh_tokens_parent_idx ON auth.refresh_tokens USING btree (parent);


--
-- Name: refresh_tokens_session_id_revoked_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX refresh_tokens_session_id_revoked_idx ON auth.refresh_tokens USING btree (session_id, revoked);


--
-- Name: refresh_tokens_updated_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX refresh_tokens_updated_at_idx ON auth.refresh_tokens USING btree (updated_at DESC);


--
-- Name: saml_providers_sso_provider_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX saml_providers_sso_provider_id_idx ON auth.saml_providers USING btree (sso_provider_id);


--
-- Name: saml_relay_states_created_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX saml_relay_states_created_at_idx ON auth.saml_relay_states USING btree (created_at DESC);


--
-- Name: saml_relay_states_for_email_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX saml_relay_states_for_email_idx ON auth.saml_relay_states USING btree (for_email);


--
-- Name: saml_relay_states_sso_provider_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX saml_relay_states_sso_provider_id_idx ON auth.saml_relay_states USING btree (sso_provider_id);


--
-- Name: sessions_not_after_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX sessions_not_after_idx ON auth.sessions USING btree (not_after DESC);


--
-- Name: sessions_user_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX sessions_user_id_idx ON auth.sessions USING btree (user_id);


--
-- Name: sso_domains_domain_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX sso_domains_domain_idx ON auth.sso_domains USING btree (lower(domain));


--
-- Name: sso_domains_sso_provider_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX sso_domains_sso_provider_id_idx ON auth.sso_domains USING btree (sso_provider_id);


--
-- Name: sso_providers_resource_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX sso_providers_resource_id_idx ON auth.sso_providers USING btree (lower(resource_id));


--
-- Name: sso_providers_resource_id_pattern_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX sso_providers_resource_id_pattern_idx ON auth.sso_providers USING btree (resource_id text_pattern_ops);


--
-- Name: unique_phone_factor_per_user; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX unique_phone_factor_per_user ON auth.mfa_factors USING btree (user_id, phone);


--
-- Name: user_id_created_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX user_id_created_at_idx ON auth.sessions USING btree (user_id, created_at);


--
-- Name: users_email_partial_key; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX users_email_partial_key ON auth.users USING btree (email) WHERE (is_sso_user = false);


--
-- Name: INDEX users_email_partial_key; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON INDEX auth.users_email_partial_key IS 'Auth: A partial unique index that applies only when is_sso_user is false';


--
-- Name: users_instance_id_email_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX users_instance_id_email_idx ON auth.users USING btree (instance_id, lower((email)::text));


--
-- Name: users_instance_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX users_instance_id_idx ON auth.users USING btree (instance_id);


--
-- Name: users_is_anonymous_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX users_is_anonymous_idx ON auth.users USING btree (is_anonymous);


--
-- Name: fish_treatments_applied_at_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fish_treatments_applied_at_idx ON public.fish_treatments USING btree (applied_at);


--
-- Name: fish_treatments_fish_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fish_treatments_fish_id_idx ON public.fish_treatments USING btree (fish_id);


--
-- Name: fish_treatments_treatment_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fish_treatments_treatment_id_idx ON public.fish_treatments USING btree (treatment_id);


--
-- Name: idx_fish_code_unique; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX idx_fish_code_unique ON public.fish USING btree (code);


--
-- Name: idx_fish_created_by; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_fish_created_by ON public.fish USING btree (created_by);


--
-- Name: idx_fish_father; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_fish_father ON public.fish USING btree (father_fish_id);


--
-- Name: idx_fish_mother; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_fish_mother ON public.fish USING btree (mother_fish_id);


--
-- Name: idx_fish_mounts_fish_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_fish_mounts_fish_id ON public.fish_mounts USING btree (fish_id);


--
-- Name: idx_fish_mounts_mount_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_fish_mounts_mount_id ON public.fish_mounts USING btree (mount_id);


--
-- Name: idx_fish_mutations__fish; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_fish_mutations__fish ON public.fish_mutations USING btree (fish_id);


--
-- Name: idx_fish_mutations__mut; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_fish_mutations__mut ON public.fish_mutations USING btree (mutation_id);


--
-- Name: idx_fish_selectedphenotypes_fish_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_fish_selectedphenotypes_fish_id ON public.fish_selectedphenotypes USING btree (fish_id);


--
-- Name: idx_fish_selectedphenotypes_selectedphenotype_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_fish_selectedphenotypes_selectedphenotype_id ON public.fish_selectedphenotypes USING btree (selectedphenotype_id);


--
-- Name: idx_fish_strains__fish; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_fish_strains__fish ON public.fish_strains USING btree (fish_id);


--
-- Name: idx_fish_strains__strain; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_fish_strains__strain ON public.fish_strains USING btree (strain_id);


--
-- Name: idx_fish_treatments_dye; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_fish_treatments_dye ON public.fish_treatments USING btree (dye_id);


--
-- Name: idx_ftm_fish_current; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_ftm_fish_current ON public.fish_tank_memberships USING btree (fish_id, valid_to);


--
-- Name: idx_ftm_tank_current; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_ftm_tank_current ON public.fish_tank_memberships USING btree (tank_id) WHERE (valid_to IS NULL);


--
-- Name: idx_mounts_created_by; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_mounts_created_by ON public.mounts USING btree (created_by);


--
-- Name: idx_mutations_created_by; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_mutations_created_by ON public.mutations USING btree (created_by);


--
-- Name: idx_plasmid_fluors_fluor; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_plasmid_fluors_fluor ON public.plasmid_fluors USING btree (fluor_id);


--
-- Name: idx_plasmids_created_by; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_plasmids_created_by ON public.plasmids USING btree (created_by);


--
-- Name: idx_rna_fluors_fluor; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_rna_fluors_fluor ON public.rna_fluors USING btree (fluor_id);


--
-- Name: idx_strains_created_by; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_strains_created_by ON public.strains USING btree (created_by);


--
-- Name: idx_tanks_code_unique; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX idx_tanks_code_unique ON public.tanks USING btree (code);


--
-- Name: idx_tanks_created_by; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_tanks_created_by ON public.tanks USING btree (created_by);


--
-- Name: idx_transgenes_created_by; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_transgenes_created_by ON public.transgenes USING btree (created_by);


--
-- Name: idx_transgenes_fluors_fluor; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_transgenes_fluors_fluor ON public.transgenes_fluors USING btree (fluor_id);


--
-- Name: idx_treatment_dyes_dye; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_treatment_dyes_dye ON public.treatment_dyes_old USING btree (dye_id);


--
-- Name: idx_treatment_plasmids_plasmid; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_treatment_plasmids_plasmid ON public.treatment_plasmids USING btree (plasmid_id);


--
-- Name: idx_treatment_rnas_rna; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_treatment_rnas_rna ON public.treatment_rnas USING btree (rna_id);


--
-- Name: ix_dyes_name_ci; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ix_dyes_name_ci ON public.dyes USING btree (lower(name));


--
-- Name: ix_plasmid_fluors_fluor_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ix_plasmid_fluors_fluor_id ON public.plasmid_fluors USING btree (fluor_id);


--
-- Name: ix_plasmid_fluors_plasmid_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ix_plasmid_fluors_plasmid_id ON public.plasmid_fluors USING btree (plasmid_id);


--
-- Name: ix_rna_fluors_fluor_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ix_rna_fluors_fluor_id ON public.rna_fluors USING btree (fluor_id);


--
-- Name: ix_rna_fluors_rna_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ix_rna_fluors_rna_id ON public.rna_fluors USING btree (rna_id);


--
-- Name: ix_transgenes_fluors_fluor; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ix_transgenes_fluors_fluor ON public.transgenes_fluors USING btree (fluor_id);


--
-- Name: ix_transgenes_fluors_transgene; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ix_transgenes_fluors_transgene ON public.transgenes_fluors USING btree (transgene_id);


--
-- Name: plasmid_dyes_unique_pair; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX plasmid_dyes_unique_pair ON public.plasmid_dyes USING btree (plasmid_id, dye_id);


--
-- Name: plasmid_fluors_unique_pair; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX plasmid_fluors_unique_pair ON public.plasmid_fluors USING btree (plasmid_id, fluor_id);


--
-- Name: plasmids_cassettes_cassette_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX plasmids_cassettes_cassette_idx ON public.plasmids_cassettes USING btree (cassette_id);


--
-- Name: plasmids_cassettes_plasmid_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX plasmids_cassettes_plasmid_idx ON public.plasmids_cassettes USING btree (plasmid_id);


--
-- Name: plasmids_resistance_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX plasmids_resistance_idx ON public.plasmids USING btree (resistance);


--
-- Name: plasmids_resistance_trgm_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX plasmids_resistance_trgm_idx ON public.plasmids USING gin (resistance public.gin_trgm_ops);


--
-- Name: rna_fluors_unique_pair; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX rna_fluors_unique_pair ON public.rna_fluors USING btree (rna_id, fluor_id);


--
-- Name: seedmap_dyes_seed; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX seedmap_dyes_seed ON public.seedmap_dyes USING btree (lower(COALESCE(seed_code, ''::text)), lower(COALESCE(seed_name, ''::text)));


--
-- Name: seedmap_fish_seed; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX seedmap_fish_seed ON public.seedmap_fish USING btree (lower(COALESCE(seed_code, ''::text)), lower(COALESCE(seed_name, ''::text)));


--
-- Name: seedmap_fluors_seed; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX seedmap_fluors_seed ON public.seedmap_fluors USING btree (lower(COALESCE(seed_code, ''::text)), lower(COALESCE(seed_name, ''::text)));


--
-- Name: seedmap_mounts_seed; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX seedmap_mounts_seed ON public.seedmap_mounts USING btree (lower(COALESCE(seed_code, ''::text)), lower(COALESCE(seed_name, ''::text)));


--
-- Name: seedmap_mutations_seed; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX seedmap_mutations_seed ON public.seedmap_mutations USING btree (lower(COALESCE(seed_code, ''::text)), lower(COALESCE(seed_name, ''::text)));


--
-- Name: seedmap_plasmids_seed; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX seedmap_plasmids_seed ON public.seedmap_plasmids USING btree (lower(COALESCE(seed_code, ''::text)), lower(COALESCE(seed_name, ''::text)));


--
-- Name: seedmap_rna_seed; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX seedmap_rna_seed ON public.seedmap_rna USING btree (lower(COALESCE(seed_code, ''::text)), lower(COALESCE(seed_name, ''::text)));


--
-- Name: seedmap_selectedphenotypes_seed; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX seedmap_selectedphenotypes_seed ON public.seedmap_selectedphenotypes USING btree (lower(COALESCE(seed_code, ''::text)), lower(COALESCE(seed_name, ''::text)));


--
-- Name: seedmap_strains_seed; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX seedmap_strains_seed ON public.seedmap_strains USING btree (lower(COALESCE(seed_code, ''::text)), lower(COALESCE(seed_name, ''::text)));


--
-- Name: seedmap_tanks_seed; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX seedmap_tanks_seed ON public.seedmap_tanks USING btree (lower(COALESCE(seed_code, ''::text)), lower(COALESCE(seed_name, ''::text)));


--
-- Name: seedmap_transgenes_seed; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX seedmap_transgenes_seed ON public.seedmap_transgenes USING btree (lower(COALESCE(seed_code, ''::text)), lower(COALESCE(seed_name, ''::text)));


--
-- Name: seedmap_treatments_seed; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX seedmap_treatments_seed ON public.seedmap_treatments USING btree (lower(COALESCE(seed_code, ''::text)), lower(COALESCE(seed_name, ''::text)));


--
-- Name: tanks_tank_code_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX tanks_tank_code_idx ON public.tanks USING btree (tank_code);


--
-- Name: transgene_fluors_unique_pair; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX transgene_fluors_unique_pair ON public.transgenes_fluors USING btree (transgene_id, fluor_id);


--
-- Name: ux_dyes_name_ci; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX ux_dyes_name_ci ON public.dyes USING btree (lower(name));


--
-- Name: ux_fish_fish_code; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX ux_fish_fish_code ON public.fish USING btree (fish_code);


--
-- Name: ux_fish_id_uuid; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX ux_fish_id_uuid ON public.fish USING btree (id_uuid);


--
-- Name: ux_fish_mutations_pair; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX ux_fish_mutations_pair ON public.fish_mutations USING btree (fish_id_uuid, mutation_id_uuid);


--
-- Name: ux_fish_name_ci; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX ux_fish_name_ci ON public.fish USING btree (lower(name));


--
-- Name: ux_fish_strains_pair; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX ux_fish_strains_pair ON public.fish_strains USING btree (fish_id_uuid, strain_id_uuid);


--
-- Name: ux_fish_transgenes_pair; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX ux_fish_transgenes_pair ON public.fish_transgenes USING btree (fish_id_uuid, transgene_id_uuid);


--
-- Name: ux_fish_transgenes_uuid_pair; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX ux_fish_transgenes_uuid_pair ON public.fish_transgenes USING btree (fish_id_uuid, transgene_id_uuid);


--
-- Name: ux_fluors_name_ci; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX ux_fluors_name_ci ON public.fluors USING btree (lower(name));


--
-- Name: ux_ftm_pair; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX ux_ftm_pair ON public.fish_tank_memberships USING btree (fish_id, tank_id);


--
-- Name: ux_plasmid_fluors_pair; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX ux_plasmid_fluors_pair ON public.plasmid_fluors USING btree (plasmid_id_uuid, fluor_id_uuid);


--
-- Name: ux_rna_fluors_pair; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX ux_rna_fluors_pair ON public.rna_fluors USING btree (rna_id_uuid, fluor_id_uuid);


--
-- Name: ux_tanks_code; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX ux_tanks_code ON public.tanks USING btree (code);


--
-- Name: ux_tanks_tank_code; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX ux_tanks_tank_code ON public.tanks USING btree (tank_code);


--
-- Name: ux_transgene_fluors_pair; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX ux_transgene_fluors_pair ON public.transgene_fluors USING btree (transgene_id_uuid, fluor_id_uuid);


--
-- Name: ux_transgenes_id_uuid; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX ux_transgenes_id_uuid ON public.transgenes USING btree (id_uuid);


--
-- Name: ix_realtime_subscription_entity; Type: INDEX; Schema: realtime; Owner: supabase_admin
--

CREATE INDEX ix_realtime_subscription_entity ON realtime.subscription USING btree (entity);


--
-- Name: subscription_subscription_id_entity_filters_key; Type: INDEX; Schema: realtime; Owner: supabase_admin
--

CREATE UNIQUE INDEX subscription_subscription_id_entity_filters_key ON realtime.subscription USING btree (subscription_id, entity, filters);


--
-- Name: bname; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE UNIQUE INDEX bname ON storage.buckets USING btree (name);


--
-- Name: bucketid_objname; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE UNIQUE INDEX bucketid_objname ON storage.objects USING btree (bucket_id, name);


--
-- Name: idx_multipart_uploads_list; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE INDEX idx_multipart_uploads_list ON storage.s3_multipart_uploads USING btree (bucket_id, key, created_at);


--
-- Name: idx_objects_bucket_id_name; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE INDEX idx_objects_bucket_id_name ON storage.objects USING btree (bucket_id, name COLLATE "C");


--
-- Name: name_prefix_search; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE INDEX name_prefix_search ON storage.objects USING btree (name text_pattern_ops);


--
-- Name: fish fish_set_code; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER fish_set_code BEFORE INSERT ON public.fish FOR EACH ROW EXECUTE FUNCTION public.set_code_if_null('F', 'public.fish_code_seq');


--
-- Name: fish_treatments set_updated_at_fish_treatments; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER set_updated_at_fish_treatments BEFORE UPDATE ON public.fish_treatments FOR EACH ROW EXECUTE FUNCTION public.set_updated_at();


--
-- Name: rna set_updated_at_rna; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER set_updated_at_rna BEFORE UPDATE ON public.rna FOR EACH ROW EXECUTE FUNCTION public.set_updated_at();


--
-- Name: tanks tanks_tank_code_immutable_trg; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER tanks_tank_code_immutable_trg BEFORE UPDATE ON public.tanks FOR EACH ROW EXECUTE FUNCTION public.tanks_tank_code_immutable();


--
-- Name: fish_tank_memberships trg_enforce_nursery_age; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER trg_enforce_nursery_age BEFORE INSERT OR UPDATE ON public.fish_tank_memberships FOR EACH ROW EXECUTE FUNCTION public.enforce_nursery_age();


--
-- Name: plasmids_cassettes trg_plasmids_cassettes_updated_at; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER trg_plasmids_cassettes_updated_at BEFORE UPDATE ON public.plasmids_cassettes FOR EACH ROW EXECUTE FUNCTION public.set_updated_at();


--
-- Name: tanks trg_prevent_delete_occupied_tank; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER trg_prevent_delete_occupied_tank BEFORE DELETE ON public.tanks FOR EACH ROW EXECUTE FUNCTION public.prevent_delete_occupied_tank();


--
-- Name: fish trg_set_fish_code_per_year; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER trg_set_fish_code_per_year BEFORE INSERT ON public.fish FOR EACH ROW WHEN ((new.fish_code IS NULL)) EXECUTE FUNCTION public.set_fish_code_per_year();


--
-- Name: tanks trg_tanks_set_code; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER trg_tanks_set_code BEFORE INSERT ON public.tanks FOR EACH ROW EXECUTE FUNCTION public.tanks_set_code();


--
-- Name: subscription tr_check_filters; Type: TRIGGER; Schema: realtime; Owner: supabase_admin
--

CREATE TRIGGER tr_check_filters BEFORE INSERT OR UPDATE ON realtime.subscription FOR EACH ROW EXECUTE FUNCTION realtime.subscription_check_filters();


--
-- Name: objects update_objects_updated_at; Type: TRIGGER; Schema: storage; Owner: supabase_storage_admin
--

CREATE TRIGGER update_objects_updated_at BEFORE UPDATE ON storage.objects FOR EACH ROW EXECUTE FUNCTION storage.update_updated_at_column();


--
-- Name: identities identities_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.identities
    ADD CONSTRAINT identities_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: mfa_amr_claims mfa_amr_claims_session_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_amr_claims
    ADD CONSTRAINT mfa_amr_claims_session_id_fkey FOREIGN KEY (session_id) REFERENCES auth.sessions(id) ON DELETE CASCADE;


--
-- Name: mfa_challenges mfa_challenges_auth_factor_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_challenges
    ADD CONSTRAINT mfa_challenges_auth_factor_id_fkey FOREIGN KEY (factor_id) REFERENCES auth.mfa_factors(id) ON DELETE CASCADE;


--
-- Name: mfa_factors mfa_factors_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_factors
    ADD CONSTRAINT mfa_factors_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: one_time_tokens one_time_tokens_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.one_time_tokens
    ADD CONSTRAINT one_time_tokens_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: refresh_tokens refresh_tokens_session_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.refresh_tokens
    ADD CONSTRAINT refresh_tokens_session_id_fkey FOREIGN KEY (session_id) REFERENCES auth.sessions(id) ON DELETE CASCADE;


--
-- Name: saml_providers saml_providers_sso_provider_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_providers
    ADD CONSTRAINT saml_providers_sso_provider_id_fkey FOREIGN KEY (sso_provider_id) REFERENCES auth.sso_providers(id) ON DELETE CASCADE;


--
-- Name: saml_relay_states saml_relay_states_flow_state_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_relay_states
    ADD CONSTRAINT saml_relay_states_flow_state_id_fkey FOREIGN KEY (flow_state_id) REFERENCES auth.flow_state(id) ON DELETE CASCADE;


--
-- Name: saml_relay_states saml_relay_states_sso_provider_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_relay_states
    ADD CONSTRAINT saml_relay_states_sso_provider_id_fkey FOREIGN KEY (sso_provider_id) REFERENCES auth.sso_providers(id) ON DELETE CASCADE;


--
-- Name: sessions sessions_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.sessions
    ADD CONSTRAINT sessions_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: sso_domains sso_domains_sso_provider_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.sso_domains
    ADD CONSTRAINT sso_domains_sso_provider_id_fkey FOREIGN KEY (sso_provider_id) REFERENCES auth.sso_providers(id) ON DELETE CASCADE;


--
-- Name: fish fish_father_fish_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fish
    ADD CONSTRAINT fish_father_fish_id_fkey FOREIGN KEY (father_fish_id_uuid) REFERENCES public.fish(id_uuid) ON DELETE SET NULL;


--
-- Name: fish fish_mother_fish_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fish
    ADD CONSTRAINT fish_mother_fish_id_fkey FOREIGN KEY (mother_fish_id_uuid) REFERENCES public.fish(id_uuid) ON DELETE SET NULL;


--
-- Name: fish_mutations fish_mutations_fish_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fish_mutations
    ADD CONSTRAINT fish_mutations_fish_id_fkey FOREIGN KEY (fish_id_uuid) REFERENCES public.fish(id_uuid) ON DELETE CASCADE;


--
-- Name: fish_mutations fish_mutations_mutation_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fish_mutations
    ADD CONSTRAINT fish_mutations_mutation_id_fkey FOREIGN KEY (mutation_id_uuid) REFERENCES public.mutations(id_uuid) ON DELETE CASCADE;


--
-- Name: fish_parents fish_parents_child_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fish_parents
    ADD CONSTRAINT fish_parents_child_id_fkey FOREIGN KEY (child_id_uuid) REFERENCES public.fish(id_uuid) ON DELETE CASCADE;


--
-- Name: fish_parents fish_parents_dad_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fish_parents
    ADD CONSTRAINT fish_parents_dad_id_fkey FOREIGN KEY (dad_id_uuid) REFERENCES public.fish(id_uuid) ON DELETE SET NULL;


--
-- Name: fish_parents fish_parents_mom_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fish_parents
    ADD CONSTRAINT fish_parents_mom_id_fkey FOREIGN KEY (mom_id_uuid) REFERENCES public.fish(id_uuid) ON DELETE SET NULL;


--
-- Name: fish_selectedphenotypes fish_selectedphenotypes_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fish_selectedphenotypes
    ADD CONSTRAINT fish_selectedphenotypes_created_by_fkey FOREIGN KEY (created_by) REFERENCES auth.users(id);


--
-- Name: fish_selectedphenotypes fish_selectedphenotypes_fish_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fish_selectedphenotypes
    ADD CONSTRAINT fish_selectedphenotypes_fish_id_fkey FOREIGN KEY (fish_id_uuid) REFERENCES public.fish(id_uuid) ON DELETE CASCADE;


--
-- Name: fish_selectedphenotypes fish_selectedphenotypes_selectedphenotype_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fish_selectedphenotypes
    ADD CONSTRAINT fish_selectedphenotypes_selectedphenotype_id_fkey FOREIGN KEY (selectedphenotype_id_uuid) REFERENCES public.selectedphenotypes(id_uuid) ON DELETE CASCADE;


--
-- Name: fish_strains fish_strains_fish_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fish_strains
    ADD CONSTRAINT fish_strains_fish_id_fkey FOREIGN KEY (fish_id_uuid) REFERENCES public.fish(id_uuid) ON DELETE CASCADE;


--
-- Name: fish_strains fish_strains_strain_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fish_strains
    ADD CONSTRAINT fish_strains_strain_id_fkey FOREIGN KEY (strain_id_uuid) REFERENCES public.strains(id_uuid) ON DELETE CASCADE;


--
-- Name: fish_tank_memberships fish_tank_memberships_fish_id_uuid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fish_tank_memberships
    ADD CONSTRAINT fish_tank_memberships_fish_id_uuid_fkey FOREIGN KEY (fish_id_uuid) REFERENCES public.fish(id_uuid) ON DELETE CASCADE;


--
-- Name: fish_tank_memberships fish_tank_memberships_tank_id_uuid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fish_tank_memberships
    ADD CONSTRAINT fish_tank_memberships_tank_id_uuid_fkey FOREIGN KEY (tank_id_uuid) REFERENCES public.tanks(id_uuid) ON DELETE CASCADE;


--
-- Name: fish_transgenes fish_transgenes_fish_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fish_transgenes
    ADD CONSTRAINT fish_transgenes_fish_id_fkey FOREIGN KEY (fish_id_uuid) REFERENCES public.fish(id_uuid) ON DELETE CASCADE;


--
-- Name: fish_transgenes fish_transgenes_transgene_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fish_transgenes
    ADD CONSTRAINT fish_transgenes_transgene_id_fkey FOREIGN KEY (transgene_id_uuid) REFERENCES public.transgenes(id_uuid) ON DELETE CASCADE;


--
-- Name: fish_treatments fish_treatments_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fish_treatments
    ADD CONSTRAINT fish_treatments_created_by_fkey FOREIGN KEY (created_by) REFERENCES auth.users(id) ON DELETE SET NULL;


--
-- Name: fish_treatments fish_treatments_dye_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fish_treatments
    ADD CONSTRAINT fish_treatments_dye_id_fkey FOREIGN KEY (dye_id_uuid) REFERENCES public.dyes(id_uuid) ON DELETE SET NULL;


--
-- Name: fish_treatments fish_treatments_fish_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fish_treatments
    ADD CONSTRAINT fish_treatments_fish_id_fkey FOREIGN KEY (fish_id_uuid) REFERENCES public.fish(id_uuid) ON DELETE CASCADE;


--
-- Name: fish_treatments fish_treatments_treatment_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fish_treatments
    ADD CONSTRAINT fish_treatments_treatment_id_fkey FOREIGN KEY (treatment_id) REFERENCES public.treatments(id) ON DELETE CASCADE;


--
-- Name: fish_mounts fk_fish; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fish_mounts
    ADD CONSTRAINT fk_fish FOREIGN KEY (fish_id_uuid) REFERENCES public.fish(id_uuid) ON DELETE CASCADE;


--
-- Name: fish_transgenes fk_fish_transgenes_fish_uuid; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fish_transgenes
    ADD CONSTRAINT fk_fish_transgenes_fish_uuid FOREIGN KEY (fish_id_uuid) REFERENCES public.fish(id_uuid) ON DELETE CASCADE;


--
-- Name: fish_transgenes fk_fish_transgenes_transgenes_uuid; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fish_transgenes
    ADD CONSTRAINT fk_fish_transgenes_transgenes_uuid FOREIGN KEY (transgene_id_uuid) REFERENCES public.transgenes(id_uuid) ON DELETE CASCADE;


--
-- Name: fish_mounts fk_mount; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fish_mounts
    ADD CONSTRAINT fk_mount FOREIGN KEY (mount_id_uuid) REFERENCES public.mounts(id_uuid) ON DELETE CASCADE;


--
-- Name: plasmid_dyes plasmid_dyes_dye_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plasmid_dyes
    ADD CONSTRAINT plasmid_dyes_dye_id_fkey FOREIGN KEY (dye_id_uuid) REFERENCES public.dyes(id_uuid) ON DELETE RESTRICT;


--
-- Name: plasmid_dyes plasmid_dyes_plasmid_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plasmid_dyes
    ADD CONSTRAINT plasmid_dyes_plasmid_id_fkey FOREIGN KEY (plasmid_id_uuid) REFERENCES public.plasmids(id_uuid) ON DELETE CASCADE;


--
-- Name: plasmid_fluors plasmid_fluors_fluor_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plasmid_fluors
    ADD CONSTRAINT plasmid_fluors_fluor_id_fkey FOREIGN KEY (fluor_id_uuid) REFERENCES public.fluors(id_uuid) ON DELETE RESTRICT;


--
-- Name: plasmid_fluors plasmid_fluors_plasmid_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plasmid_fluors
    ADD CONSTRAINT plasmid_fluors_plasmid_id_fkey FOREIGN KEY (plasmid_id_uuid) REFERENCES public.plasmids(id_uuid) ON DELETE CASCADE;


--
-- Name: plasmids_cassettes plasmids_cassettes_plasmid_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plasmids_cassettes
    ADD CONSTRAINT plasmids_cassettes_plasmid_fk FOREIGN KEY (plasmid_id_uuid) REFERENCES public.plasmids(id_uuid) ON DELETE CASCADE;


--
-- Name: profiles profiles_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.profiles
    ADD CONSTRAINT profiles_id_fkey FOREIGN KEY (id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: rna rna_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rna
    ADD CONSTRAINT rna_created_by_fkey FOREIGN KEY (created_by) REFERENCES auth.users(id) ON DELETE SET NULL;


--
-- Name: rna_fluors rna_fluors_fluor_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rna_fluors
    ADD CONSTRAINT rna_fluors_fluor_id_fkey FOREIGN KEY (fluor_id_uuid) REFERENCES public.fluors(id_uuid) ON DELETE RESTRICT;


--
-- Name: rna_fluors rna_fluors_rna_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rna_fluors
    ADD CONSTRAINT rna_fluors_rna_id_fkey FOREIGN KEY (rna_id_uuid) REFERENCES public.rna(id_uuid) ON DELETE CASCADE;


--
-- Name: selectedphenotypes selectedphenotypes_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.selectedphenotypes
    ADD CONSTRAINT selectedphenotypes_created_by_fkey FOREIGN KEY (created_by) REFERENCES auth.users(id);


--
-- Name: tanks tanks_tank_category_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tanks
    ADD CONSTRAINT tanks_tank_category_id_fkey FOREIGN KEY (tank_category_id) REFERENCES public.tank_categories(id);


--
-- Name: transgene_fluors transgene_fluors_fluor_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transgene_fluors
    ADD CONSTRAINT transgene_fluors_fluor_id_fkey FOREIGN KEY (fluor_id_uuid) REFERENCES public.fluors(id_uuid) ON DELETE CASCADE;


--
-- Name: transgene_fluors transgene_fluors_transgene_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transgene_fluors
    ADD CONSTRAINT transgene_fluors_transgene_id_fkey FOREIGN KEY (transgene_id_uuid) REFERENCES public.transgenes(id_uuid) ON DELETE CASCADE;


--
-- Name: transgenes_fluors transgenes_fluors_fluor_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transgenes_fluors
    ADD CONSTRAINT transgenes_fluors_fluor_id_fkey FOREIGN KEY (fluor_id_uuid) REFERENCES public.fluors(id_uuid) ON DELETE RESTRICT;


--
-- Name: transgenes_fluors transgenes_fluors_transgene_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transgenes_fluors
    ADD CONSTRAINT transgenes_fluors_transgene_id_fkey FOREIGN KEY (transgene_id_uuid) REFERENCES public.transgenes(id_uuid) ON DELETE CASCADE;


--
-- Name: transgenes transgenes_plasmid_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transgenes
    ADD CONSTRAINT transgenes_plasmid_id_fkey FOREIGN KEY (plasmid_id_uuid) REFERENCES public.plasmids(id_uuid) ON DELETE SET NULL;


--
-- Name: treatment_dyes_old treatment_dyes_dye_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.treatment_dyes_old
    ADD CONSTRAINT treatment_dyes_dye_id_fkey FOREIGN KEY (dye_id_uuid) REFERENCES public.dyes(id_uuid) ON DELETE RESTRICT;


--
-- Name: treatment_dyes_old treatment_dyes_treatment_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.treatment_dyes_old
    ADD CONSTRAINT treatment_dyes_treatment_id_fkey FOREIGN KEY (treatment_id) REFERENCES public.treatments(id) ON DELETE CASCADE;


--
-- Name: treatment_dyes treatment_dyes_unified_dye_id_uuid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.treatment_dyes
    ADD CONSTRAINT treatment_dyes_unified_dye_id_uuid_fkey FOREIGN KEY (dye_id_uuid) REFERENCES public.dyes(id_uuid) ON DELETE CASCADE;


--
-- Name: treatment_dyes treatment_dyes_unified_treatment_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.treatment_dyes
    ADD CONSTRAINT treatment_dyes_unified_treatment_id_fkey FOREIGN KEY (treatment_id) REFERENCES public.treatments(id) ON DELETE CASCADE;


--
-- Name: treatment_plasmids treatment_plasmids_plasmid_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.treatment_plasmids
    ADD CONSTRAINT treatment_plasmids_plasmid_id_fkey FOREIGN KEY (plasmid_id_uuid) REFERENCES public.plasmids(id_uuid) ON DELETE RESTRICT;


--
-- Name: treatment_plasmids treatment_plasmids_treatment_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.treatment_plasmids
    ADD CONSTRAINT treatment_plasmids_treatment_id_fkey FOREIGN KEY (treatment_id) REFERENCES public.treatments(id) ON DELETE CASCADE;


--
-- Name: treatment_rnas treatment_rnas_rna_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.treatment_rnas
    ADD CONSTRAINT treatment_rnas_rna_id_fkey FOREIGN KEY (rna_id_uuid) REFERENCES public.rna(id_uuid) ON DELETE RESTRICT;


--
-- Name: treatment_rnas treatment_rnas_treatment_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.treatment_rnas
    ADD CONSTRAINT treatment_rnas_treatment_id_fkey FOREIGN KEY (treatment_id) REFERENCES public.treatments(id) ON DELETE CASCADE;


--
-- Name: objects objects_bucketId_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.objects
    ADD CONSTRAINT "objects_bucketId_fkey" FOREIGN KEY (bucket_id) REFERENCES storage.buckets(id);


--
-- Name: s3_multipart_uploads s3_multipart_uploads_bucket_id_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.s3_multipart_uploads
    ADD CONSTRAINT s3_multipart_uploads_bucket_id_fkey FOREIGN KEY (bucket_id) REFERENCES storage.buckets(id);


--
-- Name: s3_multipart_uploads_parts s3_multipart_uploads_parts_bucket_id_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.s3_multipart_uploads_parts
    ADD CONSTRAINT s3_multipart_uploads_parts_bucket_id_fkey FOREIGN KEY (bucket_id) REFERENCES storage.buckets(id);


--
-- Name: s3_multipart_uploads_parts s3_multipart_uploads_parts_upload_id_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.s3_multipart_uploads_parts
    ADD CONSTRAINT s3_multipart_uploads_parts_upload_id_fkey FOREIGN KEY (upload_id) REFERENCES storage.s3_multipart_uploads(id) ON DELETE CASCADE;


--
-- Name: audit_log_entries; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.audit_log_entries ENABLE ROW LEVEL SECURITY;

--
-- Name: flow_state; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.flow_state ENABLE ROW LEVEL SECURITY;

--
-- Name: identities; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.identities ENABLE ROW LEVEL SECURITY;

--
-- Name: instances; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.instances ENABLE ROW LEVEL SECURITY;

--
-- Name: mfa_amr_claims; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.mfa_amr_claims ENABLE ROW LEVEL SECURITY;

--
-- Name: mfa_challenges; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.mfa_challenges ENABLE ROW LEVEL SECURITY;

--
-- Name: mfa_factors; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.mfa_factors ENABLE ROW LEVEL SECURITY;

--
-- Name: one_time_tokens; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.one_time_tokens ENABLE ROW LEVEL SECURITY;

--
-- Name: refresh_tokens; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.refresh_tokens ENABLE ROW LEVEL SECURITY;

--
-- Name: saml_providers; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.saml_providers ENABLE ROW LEVEL SECURITY;

--
-- Name: saml_relay_states; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.saml_relay_states ENABLE ROW LEVEL SECURITY;

--
-- Name: schema_migrations; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.schema_migrations ENABLE ROW LEVEL SECURITY;

--
-- Name: sessions; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.sessions ENABLE ROW LEVEL SECURITY;

--
-- Name: sso_domains; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.sso_domains ENABLE ROW LEVEL SECURITY;

--
-- Name: sso_providers; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.sso_providers ENABLE ROW LEVEL SECURITY;

--
-- Name: users; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.users ENABLE ROW LEVEL SECURITY;

--
-- Name: fish_mounts; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.fish_mounts ENABLE ROW LEVEL SECURITY;

--
-- Name: fish_mounts fish_mounts_owner_rw; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY fish_mounts_owner_rw ON public.fish_mounts TO authenticated USING ((created_by = auth.uid())) WITH CHECK ((created_by = auth.uid()));


--
-- Name: fish_tank_memberships; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.fish_tank_memberships ENABLE ROW LEVEL SECURITY;

--
-- Name: fish_treatments; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.fish_treatments ENABLE ROW LEVEL SECURITY;

--
-- Name: fish_treatments fish_treatments_modify_own; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY fish_treatments_modify_own ON public.fish_treatments TO authenticated USING (((auth.uid() = created_by) OR (created_by IS NULL))) WITH CHECK (((auth.uid() = created_by) OR (created_by IS NULL)));


--
-- Name: fish_treatments fish_treatments_select_all_auth; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY fish_treatments_select_all_auth ON public.fish_treatments FOR SELECT TO authenticated USING (true);


--
-- Name: fish_tank_memberships ftm_insert_anon_all; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY ftm_insert_anon_all ON public.fish_tank_memberships FOR INSERT TO anon WITH CHECK (true);


--
-- Name: fish_tank_memberships ftm_read_all; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY ftm_read_all ON public.fish_tank_memberships FOR SELECT TO authenticated USING (true);


--
-- Name: fish_tank_memberships ftm_update_anon_all; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY ftm_update_anon_all ON public.fish_tank_memberships FOR UPDATE TO anon USING (true) WITH CHECK (true);


--
-- Name: fish_tank_memberships ftm_update_authenticated; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY ftm_update_authenticated ON public.fish_tank_memberships FOR UPDATE TO authenticated USING (true) WITH CHECK (true);


--
-- Name: fish_tank_memberships ftm_write_authenticated; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY ftm_write_authenticated ON public.fish_tank_memberships FOR INSERT TO authenticated WITH CHECK (true);


--
-- Name: mounts; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.mounts ENABLE ROW LEVEL SECURITY;

--
-- Name: mounts mounts_owner_rw; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY mounts_owner_rw ON public.mounts TO authenticated USING ((created_by = auth.uid())) WITH CHECK ((created_by = auth.uid()));


--
-- Name: plasmids_cassettes; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.plasmids_cassettes ENABLE ROW LEVEL SECURITY;

--
-- Name: plasmids_cassettes plasmids_cassettes_select_all; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY plasmids_cassettes_select_all ON public.plasmids_cassettes FOR SELECT USING (true);


--
-- Name: plasmids_cassettes plasmids_cassettes_write_auth; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY plasmids_cassettes_write_auth ON public.plasmids_cassettes TO authenticated USING (true) WITH CHECK (true);


--
-- Name: profiles; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.profiles ENABLE ROW LEVEL SECURITY;

--
-- Name: profiles read own profile; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "read own profile" ON public.profiles FOR SELECT USING ((auth.uid() = id));


--
-- Name: rna; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.rna ENABLE ROW LEVEL SECURITY;

--
-- Name: rna rna_modify_own; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY rna_modify_own ON public.rna TO authenticated USING (((auth.uid() = created_by) OR (created_by IS NULL))) WITH CHECK (((auth.uid() = created_by) OR (created_by IS NULL)));


--
-- Name: rna rna_select_all_auth; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY rna_select_all_auth ON public.rna FOR SELECT TO authenticated USING (true);


--
-- Name: tanks; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.tanks ENABLE ROW LEVEL SECURITY;

--
-- Name: tanks tanks_insert_anon_all; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY tanks_insert_anon_all ON public.tanks FOR INSERT TO anon WITH CHECK (true);


--
-- Name: tanks tanks_insert_own; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY tanks_insert_own ON public.tanks FOR INSERT TO authenticated WITH CHECK ((created_by = auth.uid()));


--
-- Name: tanks tanks_read_all; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY tanks_read_all ON public.tanks FOR SELECT TO authenticated, anon USING (true);


--
-- Name: tanks tanks_update_own; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY tanks_update_own ON public.tanks FOR UPDATE TO authenticated USING ((created_by = auth.uid())) WITH CHECK ((created_by = auth.uid()));


--
-- Name: profiles update own profile; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "update own profile" ON public.profiles FOR UPDATE USING ((auth.uid() = id));


--
-- Name: messages; Type: ROW SECURITY; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER TABLE realtime.messages ENABLE ROW LEVEL SECURITY;

--
-- Name: buckets; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.buckets ENABLE ROW LEVEL SECURITY;

--
-- Name: migrations; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.migrations ENABLE ROW LEVEL SECURITY;

--
-- Name: objects; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.objects ENABLE ROW LEVEL SECURITY;

--
-- Name: s3_multipart_uploads; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.s3_multipart_uploads ENABLE ROW LEVEL SECURITY;

--
-- Name: s3_multipart_uploads_parts; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.s3_multipart_uploads_parts ENABLE ROW LEVEL SECURITY;

--
-- Name: supabase_realtime; Type: PUBLICATION; Schema: -; Owner: postgres
--

CREATE PUBLICATION supabase_realtime WITH (publish = 'insert, update, delete, truncate');


ALTER PUBLICATION supabase_realtime OWNER TO postgres;

--
-- Name: SCHEMA auth; Type: ACL; Schema: -; Owner: supabase_admin
--

GRANT USAGE ON SCHEMA auth TO anon;
GRANT USAGE ON SCHEMA auth TO authenticated;
GRANT USAGE ON SCHEMA auth TO service_role;
GRANT ALL ON SCHEMA auth TO supabase_auth_admin;
GRANT ALL ON SCHEMA auth TO dashboard_user;
GRANT USAGE ON SCHEMA auth TO postgres;


--
-- Name: SCHEMA extensions; Type: ACL; Schema: -; Owner: postgres
--

GRANT USAGE ON SCHEMA extensions TO anon;
GRANT USAGE ON SCHEMA extensions TO authenticated;
GRANT USAGE ON SCHEMA extensions TO service_role;
GRANT ALL ON SCHEMA extensions TO dashboard_user;


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE USAGE ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO anon;
GRANT ALL ON SCHEMA public TO authenticated;
GRANT USAGE ON SCHEMA public TO service_role;


--
-- Name: SCHEMA realtime; Type: ACL; Schema: -; Owner: supabase_admin
--

GRANT USAGE ON SCHEMA realtime TO postgres;
GRANT USAGE ON SCHEMA realtime TO anon;
GRANT USAGE ON SCHEMA realtime TO authenticated;
GRANT USAGE ON SCHEMA realtime TO service_role;
GRANT ALL ON SCHEMA realtime TO supabase_realtime_admin;


--
-- Name: SCHEMA storage; Type: ACL; Schema: -; Owner: supabase_admin
--

GRANT USAGE ON SCHEMA storage TO postgres WITH GRANT OPTION;
GRANT USAGE ON SCHEMA storage TO anon;
GRANT USAGE ON SCHEMA storage TO authenticated;
GRANT USAGE ON SCHEMA storage TO service_role;
GRANT ALL ON SCHEMA storage TO supabase_storage_admin;
GRANT ALL ON SCHEMA storage TO dashboard_user;


--
-- Name: SCHEMA vault; Type: ACL; Schema: -; Owner: supabase_admin
--

GRANT USAGE ON SCHEMA vault TO postgres WITH GRANT OPTION;
GRANT USAGE ON SCHEMA vault TO service_role;


--
-- Name: FUNCTION gbtreekey16_in(cstring); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.gbtreekey16_in(cstring) TO postgres;
GRANT ALL ON FUNCTION public.gbtreekey16_in(cstring) TO anon;
GRANT ALL ON FUNCTION public.gbtreekey16_in(cstring) TO authenticated;
GRANT ALL ON FUNCTION public.gbtreekey16_in(cstring) TO service_role;


--
-- Name: FUNCTION gbtreekey16_out(public.gbtreekey16); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.gbtreekey16_out(public.gbtreekey16) TO postgres;
GRANT ALL ON FUNCTION public.gbtreekey16_out(public.gbtreekey16) TO anon;
GRANT ALL ON FUNCTION public.gbtreekey16_out(public.gbtreekey16) TO authenticated;
GRANT ALL ON FUNCTION public.gbtreekey16_out(public.gbtreekey16) TO service_role;


--
-- Name: FUNCTION gbtreekey2_in(cstring); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.gbtreekey2_in(cstring) TO postgres;
GRANT ALL ON FUNCTION public.gbtreekey2_in(cstring) TO anon;
GRANT ALL ON FUNCTION public.gbtreekey2_in(cstring) TO authenticated;
GRANT ALL ON FUNCTION public.gbtreekey2_in(cstring) TO service_role;


--
-- Name: FUNCTION gbtreekey2_out(public.gbtreekey2); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.gbtreekey2_out(public.gbtreekey2) TO postgres;
GRANT ALL ON FUNCTION public.gbtreekey2_out(public.gbtreekey2) TO anon;
GRANT ALL ON FUNCTION public.gbtreekey2_out(public.gbtreekey2) TO authenticated;
GRANT ALL ON FUNCTION public.gbtreekey2_out(public.gbtreekey2) TO service_role;


--
-- Name: FUNCTION gbtreekey32_in(cstring); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.gbtreekey32_in(cstring) TO postgres;
GRANT ALL ON FUNCTION public.gbtreekey32_in(cstring) TO anon;
GRANT ALL ON FUNCTION public.gbtreekey32_in(cstring) TO authenticated;
GRANT ALL ON FUNCTION public.gbtreekey32_in(cstring) TO service_role;


--
-- Name: FUNCTION gbtreekey32_out(public.gbtreekey32); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.gbtreekey32_out(public.gbtreekey32) TO postgres;
GRANT ALL ON FUNCTION public.gbtreekey32_out(public.gbtreekey32) TO anon;
GRANT ALL ON FUNCTION public.gbtreekey32_out(public.gbtreekey32) TO authenticated;
GRANT ALL ON FUNCTION public.gbtreekey32_out(public.gbtreekey32) TO service_role;


--
-- Name: FUNCTION gbtreekey4_in(cstring); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.gbtreekey4_in(cstring) TO postgres;
GRANT ALL ON FUNCTION public.gbtreekey4_in(cstring) TO anon;
GRANT ALL ON FUNCTION public.gbtreekey4_in(cstring) TO authenticated;
GRANT ALL ON FUNCTION public.gbtreekey4_in(cstring) TO service_role;


--
-- Name: FUNCTION gbtreekey4_out(public.gbtreekey4); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.gbtreekey4_out(public.gbtreekey4) TO postgres;
GRANT ALL ON FUNCTION public.gbtreekey4_out(public.gbtreekey4) TO anon;
GRANT ALL ON FUNCTION public.gbtreekey4_out(public.gbtreekey4) TO authenticated;
GRANT ALL ON FUNCTION public.gbtreekey4_out(public.gbtreekey4) TO service_role;


--
-- Name: FUNCTION gbtreekey8_in(cstring); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.gbtreekey8_in(cstring) TO postgres;
GRANT ALL ON FUNCTION public.gbtreekey8_in(cstring) TO anon;
GRANT ALL ON FUNCTION public.gbtreekey8_in(cstring) TO authenticated;
GRANT ALL ON FUNCTION public.gbtreekey8_in(cstring) TO service_role;


--
-- Name: FUNCTION gbtreekey8_out(public.gbtreekey8); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.gbtreekey8_out(public.gbtreekey8) TO postgres;
GRANT ALL ON FUNCTION public.gbtreekey8_out(public.gbtreekey8) TO anon;
GRANT ALL ON FUNCTION public.gbtreekey8_out(public.gbtreekey8) TO authenticated;
GRANT ALL ON FUNCTION public.gbtreekey8_out(public.gbtreekey8) TO service_role;


--
-- Name: FUNCTION gbtreekey_var_in(cstring); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.gbtreekey_var_in(cstring) TO postgres;
GRANT ALL ON FUNCTION public.gbtreekey_var_in(cstring) TO anon;
GRANT ALL ON FUNCTION public.gbtreekey_var_in(cstring) TO authenticated;
GRANT ALL ON FUNCTION public.gbtreekey_var_in(cstring) TO service_role;


--
-- Name: FUNCTION gbtreekey_var_out(public.gbtreekey_var); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.gbtreekey_var_out(public.gbtreekey_var) TO postgres;
GRANT ALL ON FUNCTION public.gbtreekey_var_out(public.gbtreekey_var) TO anon;
GRANT ALL ON FUNCTION public.gbtreekey_var_out(public.gbtreekey_var) TO authenticated;
GRANT ALL ON FUNCTION public.gbtreekey_var_out(public.gbtreekey_var) TO service_role;


--
-- Name: FUNCTION gtrgm_in(cstring); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.gtrgm_in(cstring) TO postgres;
GRANT ALL ON FUNCTION public.gtrgm_in(cstring) TO anon;
GRANT ALL ON FUNCTION public.gtrgm_in(cstring) TO authenticated;
GRANT ALL ON FUNCTION public.gtrgm_in(cstring) TO service_role;


--
-- Name: FUNCTION gtrgm_out(public.gtrgm); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.gtrgm_out(public.gtrgm) TO postgres;
GRANT ALL ON FUNCTION public.gtrgm_out(public.gtrgm) TO anon;
GRANT ALL ON FUNCTION public.gtrgm_out(public.gtrgm) TO authenticated;
GRANT ALL ON FUNCTION public.gtrgm_out(public.gtrgm) TO service_role;


--
-- Name: FUNCTION email(); Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON FUNCTION auth.email() TO dashboard_user;


--
-- Name: FUNCTION jwt(); Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON FUNCTION auth.jwt() TO postgres;
GRANT ALL ON FUNCTION auth.jwt() TO dashboard_user;


--
-- Name: FUNCTION role(); Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON FUNCTION auth.role() TO dashboard_user;


--
-- Name: FUNCTION uid(); Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON FUNCTION auth.uid() TO dashboard_user;


--
-- Name: FUNCTION armor(bytea); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.armor(bytea) FROM postgres;
GRANT ALL ON FUNCTION extensions.armor(bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.armor(bytea) TO dashboard_user;


--
-- Name: FUNCTION armor(bytea, text[], text[]); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.armor(bytea, text[], text[]) FROM postgres;
GRANT ALL ON FUNCTION extensions.armor(bytea, text[], text[]) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.armor(bytea, text[], text[]) TO dashboard_user;


--
-- Name: FUNCTION crypt(text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.crypt(text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.crypt(text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.crypt(text, text) TO dashboard_user;


--
-- Name: FUNCTION dearmor(text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.dearmor(text) FROM postgres;
GRANT ALL ON FUNCTION extensions.dearmor(text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.dearmor(text) TO dashboard_user;


--
-- Name: FUNCTION decrypt(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.decrypt(bytea, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.decrypt(bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.decrypt(bytea, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION decrypt_iv(bytea, bytea, bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.decrypt_iv(bytea, bytea, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.decrypt_iv(bytea, bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.decrypt_iv(bytea, bytea, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION digest(bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.digest(bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.digest(bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.digest(bytea, text) TO dashboard_user;


--
-- Name: FUNCTION digest(text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.digest(text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.digest(text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.digest(text, text) TO dashboard_user;


--
-- Name: FUNCTION encrypt(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.encrypt(bytea, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.encrypt(bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.encrypt(bytea, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION encrypt_iv(bytea, bytea, bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.encrypt_iv(bytea, bytea, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.encrypt_iv(bytea, bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.encrypt_iv(bytea, bytea, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION gen_random_bytes(integer); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.gen_random_bytes(integer) FROM postgres;
GRANT ALL ON FUNCTION extensions.gen_random_bytes(integer) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.gen_random_bytes(integer) TO dashboard_user;


--
-- Name: FUNCTION gen_random_uuid(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.gen_random_uuid() FROM postgres;
GRANT ALL ON FUNCTION extensions.gen_random_uuid() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.gen_random_uuid() TO dashboard_user;


--
-- Name: FUNCTION gen_salt(text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.gen_salt(text) FROM postgres;
GRANT ALL ON FUNCTION extensions.gen_salt(text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.gen_salt(text) TO dashboard_user;


--
-- Name: FUNCTION gen_salt(text, integer); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.gen_salt(text, integer) FROM postgres;
GRANT ALL ON FUNCTION extensions.gen_salt(text, integer) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.gen_salt(text, integer) TO dashboard_user;


--
-- Name: FUNCTION grant_pg_cron_access(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

REVOKE ALL ON FUNCTION extensions.grant_pg_cron_access() FROM supabase_admin;
GRANT ALL ON FUNCTION extensions.grant_pg_cron_access() TO supabase_admin WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.grant_pg_cron_access() TO dashboard_user;


--
-- Name: FUNCTION grant_pg_graphql_access(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.grant_pg_graphql_access() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION grant_pg_net_access(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

REVOKE ALL ON FUNCTION extensions.grant_pg_net_access() FROM supabase_admin;
GRANT ALL ON FUNCTION extensions.grant_pg_net_access() TO supabase_admin WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.grant_pg_net_access() TO dashboard_user;


--
-- Name: FUNCTION hmac(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.hmac(bytea, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.hmac(bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.hmac(bytea, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION hmac(text, text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.hmac(text, text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.hmac(text, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.hmac(text, text, text) TO dashboard_user;


--
-- Name: FUNCTION pg_stat_statements(showtext boolean, OUT userid oid, OUT dbid oid, OUT toplevel boolean, OUT queryid bigint, OUT query text, OUT plans bigint, OUT total_plan_time double precision, OUT min_plan_time double precision, OUT max_plan_time double precision, OUT mean_plan_time double precision, OUT stddev_plan_time double precision, OUT calls bigint, OUT total_exec_time double precision, OUT min_exec_time double precision, OUT max_exec_time double precision, OUT mean_exec_time double precision, OUT stddev_exec_time double precision, OUT rows bigint, OUT shared_blks_hit bigint, OUT shared_blks_read bigint, OUT shared_blks_dirtied bigint, OUT shared_blks_written bigint, OUT local_blks_hit bigint, OUT local_blks_read bigint, OUT local_blks_dirtied bigint, OUT local_blks_written bigint, OUT temp_blks_read bigint, OUT temp_blks_written bigint, OUT shared_blk_read_time double precision, OUT shared_blk_write_time double precision, OUT local_blk_read_time double precision, OUT local_blk_write_time double precision, OUT temp_blk_read_time double precision, OUT temp_blk_write_time double precision, OUT wal_records bigint, OUT wal_fpi bigint, OUT wal_bytes numeric, OUT jit_functions bigint, OUT jit_generation_time double precision, OUT jit_inlining_count bigint, OUT jit_inlining_time double precision, OUT jit_optimization_count bigint, OUT jit_optimization_time double precision, OUT jit_emission_count bigint, OUT jit_emission_time double precision, OUT jit_deform_count bigint, OUT jit_deform_time double precision, OUT stats_since timestamp with time zone, OUT minmax_stats_since timestamp with time zone); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pg_stat_statements(showtext boolean, OUT userid oid, OUT dbid oid, OUT toplevel boolean, OUT queryid bigint, OUT query text, OUT plans bigint, OUT total_plan_time double precision, OUT min_plan_time double precision, OUT max_plan_time double precision, OUT mean_plan_time double precision, OUT stddev_plan_time double precision, OUT calls bigint, OUT total_exec_time double precision, OUT min_exec_time double precision, OUT max_exec_time double precision, OUT mean_exec_time double precision, OUT stddev_exec_time double precision, OUT rows bigint, OUT shared_blks_hit bigint, OUT shared_blks_read bigint, OUT shared_blks_dirtied bigint, OUT shared_blks_written bigint, OUT local_blks_hit bigint, OUT local_blks_read bigint, OUT local_blks_dirtied bigint, OUT local_blks_written bigint, OUT temp_blks_read bigint, OUT temp_blks_written bigint, OUT shared_blk_read_time double precision, OUT shared_blk_write_time double precision, OUT local_blk_read_time double precision, OUT local_blk_write_time double precision, OUT temp_blk_read_time double precision, OUT temp_blk_write_time double precision, OUT wal_records bigint, OUT wal_fpi bigint, OUT wal_bytes numeric, OUT jit_functions bigint, OUT jit_generation_time double precision, OUT jit_inlining_count bigint, OUT jit_inlining_time double precision, OUT jit_optimization_count bigint, OUT jit_optimization_time double precision, OUT jit_emission_count bigint, OUT jit_emission_time double precision, OUT jit_deform_count bigint, OUT jit_deform_time double precision, OUT stats_since timestamp with time zone, OUT minmax_stats_since timestamp with time zone) FROM postgres;
GRANT ALL ON FUNCTION extensions.pg_stat_statements(showtext boolean, OUT userid oid, OUT dbid oid, OUT toplevel boolean, OUT queryid bigint, OUT query text, OUT plans bigint, OUT total_plan_time double precision, OUT min_plan_time double precision, OUT max_plan_time double precision, OUT mean_plan_time double precision, OUT stddev_plan_time double precision, OUT calls bigint, OUT total_exec_time double precision, OUT min_exec_time double precision, OUT max_exec_time double precision, OUT mean_exec_time double precision, OUT stddev_exec_time double precision, OUT rows bigint, OUT shared_blks_hit bigint, OUT shared_blks_read bigint, OUT shared_blks_dirtied bigint, OUT shared_blks_written bigint, OUT local_blks_hit bigint, OUT local_blks_read bigint, OUT local_blks_dirtied bigint, OUT local_blks_written bigint, OUT temp_blks_read bigint, OUT temp_blks_written bigint, OUT shared_blk_read_time double precision, OUT shared_blk_write_time double precision, OUT local_blk_read_time double precision, OUT local_blk_write_time double precision, OUT temp_blk_read_time double precision, OUT temp_blk_write_time double precision, OUT wal_records bigint, OUT wal_fpi bigint, OUT wal_bytes numeric, OUT jit_functions bigint, OUT jit_generation_time double precision, OUT jit_inlining_count bigint, OUT jit_inlining_time double precision, OUT jit_optimization_count bigint, OUT jit_optimization_time double precision, OUT jit_emission_count bigint, OUT jit_emission_time double precision, OUT jit_deform_count bigint, OUT jit_deform_time double precision, OUT stats_since timestamp with time zone, OUT minmax_stats_since timestamp with time zone) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pg_stat_statements(showtext boolean, OUT userid oid, OUT dbid oid, OUT toplevel boolean, OUT queryid bigint, OUT query text, OUT plans bigint, OUT total_plan_time double precision, OUT min_plan_time double precision, OUT max_plan_time double precision, OUT mean_plan_time double precision, OUT stddev_plan_time double precision, OUT calls bigint, OUT total_exec_time double precision, OUT min_exec_time double precision, OUT max_exec_time double precision, OUT mean_exec_time double precision, OUT stddev_exec_time double precision, OUT rows bigint, OUT shared_blks_hit bigint, OUT shared_blks_read bigint, OUT shared_blks_dirtied bigint, OUT shared_blks_written bigint, OUT local_blks_hit bigint, OUT local_blks_read bigint, OUT local_blks_dirtied bigint, OUT local_blks_written bigint, OUT temp_blks_read bigint, OUT temp_blks_written bigint, OUT shared_blk_read_time double precision, OUT shared_blk_write_time double precision, OUT local_blk_read_time double precision, OUT local_blk_write_time double precision, OUT temp_blk_read_time double precision, OUT temp_blk_write_time double precision, OUT wal_records bigint, OUT wal_fpi bigint, OUT wal_bytes numeric, OUT jit_functions bigint, OUT jit_generation_time double precision, OUT jit_inlining_count bigint, OUT jit_inlining_time double precision, OUT jit_optimization_count bigint, OUT jit_optimization_time double precision, OUT jit_emission_count bigint, OUT jit_emission_time double precision, OUT jit_deform_count bigint, OUT jit_deform_time double precision, OUT stats_since timestamp with time zone, OUT minmax_stats_since timestamp with time zone) TO dashboard_user;


--
-- Name: FUNCTION pg_stat_statements_info(OUT dealloc bigint, OUT stats_reset timestamp with time zone); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pg_stat_statements_info(OUT dealloc bigint, OUT stats_reset timestamp with time zone) FROM postgres;
GRANT ALL ON FUNCTION extensions.pg_stat_statements_info(OUT dealloc bigint, OUT stats_reset timestamp with time zone) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pg_stat_statements_info(OUT dealloc bigint, OUT stats_reset timestamp with time zone) TO dashboard_user;


--
-- Name: FUNCTION pg_stat_statements_reset(userid oid, dbid oid, queryid bigint, minmax_only boolean); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pg_stat_statements_reset(userid oid, dbid oid, queryid bigint, minmax_only boolean) FROM postgres;
GRANT ALL ON FUNCTION extensions.pg_stat_statements_reset(userid oid, dbid oid, queryid bigint, minmax_only boolean) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pg_stat_statements_reset(userid oid, dbid oid, queryid bigint, minmax_only boolean) TO dashboard_user;


--
-- Name: FUNCTION pgp_armor_headers(text, OUT key text, OUT value text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_armor_headers(text, OUT key text, OUT value text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_armor_headers(text, OUT key text, OUT value text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_armor_headers(text, OUT key text, OUT value text) TO dashboard_user;


--
-- Name: FUNCTION pgp_key_id(bytea); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_key_id(bytea) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_key_id(bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_key_id(bytea) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_decrypt(bytea, bytea); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_decrypt(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_decrypt(bytea, bytea, text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_decrypt_bytea(bytea, bytea); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_decrypt_bytea(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_decrypt_bytea(bytea, bytea, text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_encrypt(text, bytea); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_encrypt(text, bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_encrypt_bytea(bytea, bytea); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_encrypt_bytea(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_sym_decrypt(bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_sym_decrypt(bytea, text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_sym_decrypt_bytea(bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_sym_decrypt_bytea(bytea, text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_sym_encrypt(text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_sym_encrypt(text, text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_sym_encrypt_bytea(bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_sym_encrypt_bytea(bytea, text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text, text) TO dashboard_user;


--
-- Name: FUNCTION pgrst_ddl_watch(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgrst_ddl_watch() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION pgrst_drop_watch(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgrst_drop_watch() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION set_graphql_placeholder(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.set_graphql_placeholder() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION uuid_generate_v1(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_generate_v1() FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_generate_v1() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_generate_v1() TO dashboard_user;


--
-- Name: FUNCTION uuid_generate_v1mc(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_generate_v1mc() FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_generate_v1mc() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_generate_v1mc() TO dashboard_user;


--
-- Name: FUNCTION uuid_generate_v3(namespace uuid, name text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_generate_v3(namespace uuid, name text) FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_generate_v3(namespace uuid, name text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_generate_v3(namespace uuid, name text) TO dashboard_user;


--
-- Name: FUNCTION uuid_generate_v4(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_generate_v4() FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_generate_v4() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_generate_v4() TO dashboard_user;


--
-- Name: FUNCTION uuid_generate_v5(namespace uuid, name text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_generate_v5(namespace uuid, name text) FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_generate_v5(namespace uuid, name text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_generate_v5(namespace uuid, name text) TO dashboard_user;


--
-- Name: FUNCTION uuid_nil(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_nil() FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_nil() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_nil() TO dashboard_user;


--
-- Name: FUNCTION uuid_ns_dns(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_ns_dns() FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_ns_dns() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_ns_dns() TO dashboard_user;


--
-- Name: FUNCTION uuid_ns_oid(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_ns_oid() FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_ns_oid() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_ns_oid() TO dashboard_user;


--
-- Name: FUNCTION uuid_ns_url(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_ns_url() FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_ns_url() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_ns_url() TO dashboard_user;


--
-- Name: FUNCTION uuid_ns_x500(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_ns_x500() FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_ns_x500() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_ns_x500() TO dashboard_user;


--
-- Name: FUNCTION graphql("operationName" text, query text, variables jsonb, extensions jsonb); Type: ACL; Schema: graphql_public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION graphql_public.graphql("operationName" text, query text, variables jsonb, extensions jsonb) TO postgres;
GRANT ALL ON FUNCTION graphql_public.graphql("operationName" text, query text, variables jsonb, extensions jsonb) TO anon;
GRANT ALL ON FUNCTION graphql_public.graphql("operationName" text, query text, variables jsonb, extensions jsonb) TO authenticated;
GRANT ALL ON FUNCTION graphql_public.graphql("operationName" text, query text, variables jsonb, extensions jsonb) TO service_role;


--
-- Name: FUNCTION get_auth(p_usename text); Type: ACL; Schema: pgbouncer; Owner: supabase_admin
--

REVOKE ALL ON FUNCTION pgbouncer.get_auth(p_usename text) FROM PUBLIC;
GRANT ALL ON FUNCTION pgbouncer.get_auth(p_usename text) TO pgbouncer;
GRANT ALL ON FUNCTION pgbouncer.get_auth(p_usename text) TO postgres;


--
-- Name: FUNCTION alloc_tank_code_for_site_yy(y_in integer, s_in public.site_enum); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.alloc_tank_code_for_site_yy(y_in integer, s_in public.site_enum) TO anon;
GRANT ALL ON FUNCTION public.alloc_tank_code_for_site_yy(y_in integer, s_in public.site_enum) TO authenticated;
GRANT ALL ON FUNCTION public.alloc_tank_code_for_site_yy(y_in integer, s_in public.site_enum) TO service_role;


--
-- Name: FUNCTION cash_dist(money, money); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.cash_dist(money, money) TO postgres;
GRANT ALL ON FUNCTION public.cash_dist(money, money) TO anon;
GRANT ALL ON FUNCTION public.cash_dist(money, money) TO authenticated;
GRANT ALL ON FUNCTION public.cash_dist(money, money) TO service_role;


--
-- Name: FUNCTION date_dist(date, date); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.date_dist(date, date) TO postgres;
GRANT ALL ON FUNCTION public.date_dist(date, date) TO anon;
GRANT ALL ON FUNCTION public.date_dist(date, date) TO authenticated;
GRANT ALL ON FUNCTION public.date_dist(date, date) TO service_role;


--
-- Name: FUNCTION enforce_nursery_age(); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.enforce_nursery_age() TO anon;
GRANT ALL ON FUNCTION public.enforce_nursery_age() TO authenticated;
GRANT ALL ON FUNCTION public.enforce_nursery_age() TO service_role;


--
-- Name: FUNCTION float4_dist(real, real); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.float4_dist(real, real) TO postgres;
GRANT ALL ON FUNCTION public.float4_dist(real, real) TO anon;
GRANT ALL ON FUNCTION public.float4_dist(real, real) TO authenticated;
GRANT ALL ON FUNCTION public.float4_dist(real, real) TO service_role;


--
-- Name: FUNCTION float8_dist(double precision, double precision); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.float8_dist(double precision, double precision) TO postgres;
GRANT ALL ON FUNCTION public.float8_dist(double precision, double precision) TO anon;
GRANT ALL ON FUNCTION public.float8_dist(double precision, double precision) TO authenticated;
GRANT ALL ON FUNCTION public.float8_dist(double precision, double precision) TO service_role;


--
-- Name: FUNCTION gbt_bit_compress(internal); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.gbt_bit_compress(internal) TO postgres;
GRANT ALL ON FUNCTION public.gbt_bit_compress(internal) TO anon;
GRANT ALL ON FUNCTION public.gbt_bit_compress(internal) TO authenticated;
GRANT ALL ON FUNCTION public.gbt_bit_compress(internal) TO service_role;


--
-- Name: FUNCTION gbt_bit_consistent(internal, bit, smallint, oid, internal); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.gbt_bit_consistent(internal, bit, smallint, oid, internal) TO postgres;
GRANT ALL ON FUNCTION public.gbt_bit_consistent(internal, bit, smallint, oid, internal) TO anon;
GRANT ALL ON FUNCTION public.gbt_bit_consistent(internal, bit, smallint, oid, internal) TO authenticated;
GRANT ALL ON FUNCTION public.gbt_bit_consistent(internal, bit, smallint, oid, internal) TO service_role;


--
-- Name: FUNCTION gbt_bit_penalty(internal, internal, internal); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.gbt_bit_penalty(internal, internal, internal) TO postgres;
GRANT ALL ON FUNCTION public.gbt_bit_penalty(internal, internal, internal) TO anon;
GRANT ALL ON FUNCTION public.gbt_bit_penalty(internal, internal, internal) TO authenticated;
GRANT ALL ON FUNCTION public.gbt_bit_penalty(internal, internal, internal) TO service_role;


--
-- Name: FUNCTION gbt_bit_picksplit(internal, internal); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.gbt_bit_picksplit(internal, internal) TO postgres;
GRANT ALL ON FUNCTION public.gbt_bit_picksplit(internal, internal) TO anon;
GRANT ALL ON FUNCTION public.gbt_bit_picksplit(internal, internal) TO authenticated;
GRANT ALL ON FUNCTION public.gbt_bit_picksplit(internal, internal) TO service_role;


--
-- Name: FUNCTION gbt_bit_same(public.gbtreekey_var, public.gbtreekey_var, internal); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.gbt_bit_same(public.gbtreekey_var, public.gbtreekey_var, internal) TO postgres;
GRANT ALL ON FUNCTION public.gbt_bit_same(public.gbtreekey_var, public.gbtreekey_var, internal) TO anon;
GRANT ALL ON FUNCTION public.gbt_bit_same(public.gbtreekey_var, public.gbtreekey_var, internal) TO authenticated;
GRANT ALL ON FUNCTION public.gbt_bit_same(public.gbtreekey_var, public.gbtreekey_var, internal) TO service_role;


--
-- Name: FUNCTION gbt_bit_union(internal, internal); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.gbt_bit_union(internal, internal) TO postgres;
GRANT ALL ON FUNCTION public.gbt_bit_union(internal, internal) TO anon;
GRANT ALL ON FUNCTION public.gbt_bit_union(internal, internal) TO authenticated;
GRANT ALL ON FUNCTION public.gbt_bit_union(internal, internal) TO service_role;


--
-- Name: FUNCTION gbt_bool_compress(internal); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.gbt_bool_compress(internal) TO postgres;
GRANT ALL ON FUNCTION public.gbt_bool_compress(internal) TO anon;
GRANT ALL ON FUNCTION public.gbt_bool_compress(internal) TO authenticated;
GRANT ALL ON FUNCTION public.gbt_bool_compress(internal) TO service_role;


--
-- Name: FUNCTION gbt_bool_consistent(internal, boolean, smallint, oid, internal); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.gbt_bool_consistent(internal, boolean, smallint, oid, internal) TO postgres;
GRANT ALL ON FUNCTION public.gbt_bool_consistent(internal, boolean, smallint, oid, internal) TO anon;
GRANT ALL ON FUNCTION public.gbt_bool_consistent(internal, boolean, smallint, oid, internal) TO authenticated;
GRANT ALL ON FUNCTION public.gbt_bool_consistent(internal, boolean, smallint, oid, internal) TO service_role;


--
-- Name: FUNCTION gbt_bool_fetch(internal); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.gbt_bool_fetch(internal) TO postgres;
GRANT ALL ON FUNCTION public.gbt_bool_fetch(internal) TO anon;
GRANT ALL ON FUNCTION public.gbt_bool_fetch(internal) TO authenticated;
GRANT ALL ON FUNCTION public.gbt_bool_fetch(internal) TO service_role;


--
-- Name: FUNCTION gbt_bool_penalty(internal, internal, internal); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.gbt_bool_penalty(internal, internal, internal) TO postgres;
GRANT ALL ON FUNCTION public.gbt_bool_penalty(internal, internal, internal) TO anon;
GRANT ALL ON FUNCTION public.gbt_bool_penalty(internal, internal, internal) TO authenticated;
GRANT ALL ON FUNCTION public.gbt_bool_penalty(internal, internal, internal) TO service_role;


--
-- Name: FUNCTION gbt_bool_picksplit(internal, internal); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.gbt_bool_picksplit(internal, internal) TO postgres;
GRANT ALL ON FUNCTION public.gbt_bool_picksplit(internal, internal) TO anon;
GRANT ALL ON FUNCTION public.gbt_bool_picksplit(internal, internal) TO authenticated;
GRANT ALL ON FUNCTION public.gbt_bool_picksplit(internal, internal) TO service_role;


--
-- Name: FUNCTION gbt_bool_same(public.gbtreekey2, public.gbtreekey2, internal); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.gbt_bool_same(public.gbtreekey2, public.gbtreekey2, internal) TO postgres;
GRANT ALL ON FUNCTION public.gbt_bool_same(public.gbtreekey2, public.gbtreekey2, internal) TO anon;
GRANT ALL ON FUNCTION public.gbt_bool_same(public.gbtreekey2, public.gbtreekey2, internal) TO authenticated;
GRANT ALL ON FUNCTION public.gbt_bool_same(public.gbtreekey2, public.gbtreekey2, internal) TO service_role;


--
-- Name: FUNCTION gbt_bool_union(internal, internal); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.gbt_bool_union(internal, internal) TO postgres;
GRANT ALL ON FUNCTION public.gbt_bool_union(internal, internal) TO anon;
GRANT ALL ON FUNCTION public.gbt_bool_union(internal, internal) TO authenticated;
GRANT ALL ON FUNCTION public.gbt_bool_union(internal, internal) TO service_role;


--
-- Name: FUNCTION gbt_bpchar_compress(internal); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.gbt_bpchar_compress(internal) TO postgres;
GRANT ALL ON FUNCTION public.gbt_bpchar_compress(internal) TO anon;
GRANT ALL ON FUNCTION public.gbt_bpchar_compress(internal) TO authenticated;
GRANT ALL ON FUNCTION public.gbt_bpchar_compress(internal) TO service_role;


--
-- Name: FUNCTION gbt_bpchar_consistent(internal, character, smallint, oid, internal); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.gbt_bpchar_consistent(internal, character, smallint, oid, internal) TO postgres;
GRANT ALL ON FUNCTION public.gbt_bpchar_consistent(internal, character, smallint, oid, internal) TO anon;
GRANT ALL ON FUNCTION public.gbt_bpchar_consistent(internal, character, smallint, oid, internal) TO authenticated;
GRANT ALL ON FUNCTION public.gbt_bpchar_consistent(internal, character, smallint, oid, internal) TO service_role;


--
-- Name: FUNCTION gbt_bytea_compress(internal); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.gbt_bytea_compress(internal) TO postgres;
GRANT ALL ON FUNCTION public.gbt_bytea_compress(internal) TO anon;
GRANT ALL ON FUNCTION public.gbt_bytea_compress(internal) TO authenticated;
GRANT ALL ON FUNCTION public.gbt_bytea_compress(internal) TO service_role;


--
-- Name: FUNCTION gbt_bytea_consistent(internal, bytea, smallint, oid, internal); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.gbt_bytea_consistent(internal, bytea, smallint, oid, internal) TO postgres;
GRANT ALL ON FUNCTION public.gbt_bytea_consistent(internal, bytea, smallint, oid, internal) TO anon;
GRANT ALL ON FUNCTION public.gbt_bytea_consistent(internal, bytea, smallint, oid, internal) TO authenticated;
GRANT ALL ON FUNCTION public.gbt_bytea_consistent(internal, bytea, smallint, oid, internal) TO service_role;


--
-- Name: FUNCTION gbt_bytea_penalty(internal, internal, internal); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.gbt_bytea_penalty(internal, internal, internal) TO postgres;
GRANT ALL ON FUNCTION public.gbt_bytea_penalty(internal, internal, internal) TO anon;
GRANT ALL ON FUNCTION public.gbt_bytea_penalty(internal, internal, internal) TO authenticated;
GRANT ALL ON FUNCTION public.gbt_bytea_penalty(internal, internal, internal) TO service_role;


--
-- Name: FUNCTION gbt_bytea_picksplit(internal, internal); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.gbt_bytea_picksplit(internal, internal) TO postgres;
GRANT ALL ON FUNCTION public.gbt_bytea_picksplit(internal, internal) TO anon;
GRANT ALL ON FUNCTION public.gbt_bytea_picksplit(internal, internal) TO authenticated;
GRANT ALL ON FUNCTION public.gbt_bytea_picksplit(internal, internal) TO service_role;


--
-- Name: FUNCTION gbt_bytea_same(public.gbtreekey_var, public.gbtreekey_var, internal); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.gbt_bytea_same(public.gbtreekey_var, public.gbtreekey_var, internal) TO postgres;
GRANT ALL ON FUNCTION public.gbt_bytea_same(public.gbtreekey_var, public.gbtreekey_var, internal) TO anon;
GRANT ALL ON FUNCTION public.gbt_bytea_same(public.gbtreekey_var, public.gbtreekey_var, internal) TO authenticated;
GRANT ALL ON FUNCTION public.gbt_bytea_same(public.gbtreekey_var, public.gbtreekey_var, internal) TO service_role;


--
-- Name: FUNCTION gbt_bytea_union(internal, internal); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.gbt_bytea_union(internal, internal) TO postgres;
GRANT ALL ON FUNCTION public.gbt_bytea_union(internal, internal) TO anon;
GRANT ALL ON FUNCTION public.gbt_bytea_union(internal, internal) TO authenticated;
GRANT ALL ON FUNCTION public.gbt_bytea_union(internal, internal) TO service_role;


--
-- Name: FUNCTION gbt_cash_compress(internal); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.gbt_cash_compress(internal) TO postgres;
GRANT ALL ON FUNCTION public.gbt_cash_compress(internal) TO anon;
GRANT ALL ON FUNCTION public.gbt_cash_compress(internal) TO authenticated;
GRANT ALL ON FUNCTION public.gbt_cash_compress(internal) TO service_role;


--
-- Name: FUNCTION gbt_cash_consistent(internal, money, smallint, oid, internal); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.gbt_cash_consistent(internal, money, smallint, oid, internal) TO postgres;
GRANT ALL ON FUNCTION public.gbt_cash_consistent(internal, money, smallint, oid, internal) TO anon;
GRANT ALL ON FUNCTION public.gbt_cash_consistent(internal, money, smallint, oid, internal) TO authenticated;
GRANT ALL ON FUNCTION public.gbt_cash_consistent(internal, money, smallint, oid, internal) TO service_role;


--
-- Name: FUNCTION gbt_cash_distance(internal, money, smallint, oid, internal); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.gbt_cash_distance(internal, money, smallint, oid, internal) TO postgres;
GRANT ALL ON FUNCTION public.gbt_cash_distance(internal, money, smallint, oid, internal) TO anon;
GRANT ALL ON FUNCTION public.gbt_cash_distance(internal, money, smallint, oid, internal) TO authenticated;
GRANT ALL ON FUNCTION public.gbt_cash_distance(internal, money, smallint, oid, internal) TO service_role;


--
-- Name: FUNCTION gbt_cash_fetch(internal); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.gbt_cash_fetch(internal) TO postgres;
GRANT ALL ON FUNCTION public.gbt_cash_fetch(internal) TO anon;
GRANT ALL ON FUNCTION public.gbt_cash_fetch(internal) TO authenticated;
GRANT ALL ON FUNCTION public.gbt_cash_fetch(internal) TO service_role;


--
-- Name: FUNCTION gbt_cash_penalty(internal, internal, internal); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.gbt_cash_penalty(internal, internal, internal) TO postgres;
GRANT ALL ON FUNCTION public.gbt_cash_penalty(internal, internal, internal) TO anon;
GRANT ALL ON FUNCTION public.gbt_cash_penalty(internal, internal, internal) TO authenticated;
GRANT ALL ON FUNCTION public.gbt_cash_penalty(internal, internal, internal) TO service_role;


--
-- Name: FUNCTION gbt_cash_picksplit(internal, internal); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.gbt_cash_picksplit(internal, internal) TO postgres;
GRANT ALL ON FUNCTION public.gbt_cash_picksplit(internal, internal) TO anon;
GRANT ALL ON FUNCTION public.gbt_cash_picksplit(internal, internal) TO authenticated;
GRANT ALL ON FUNCTION public.gbt_cash_picksplit(internal, internal) TO service_role;


--
-- Name: FUNCTION gbt_cash_same(public.gbtreekey16, public.gbtreekey16, internal); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.gbt_cash_same(public.gbtreekey16, public.gbtreekey16, internal) TO postgres;
GRANT ALL ON FUNCTION public.gbt_cash_same(public.gbtreekey16, public.gbtreekey16, internal) TO anon;
GRANT ALL ON FUNCTION public.gbt_cash_same(public.gbtreekey16, public.gbtreekey16, internal) TO authenticated;
GRANT ALL ON FUNCTION public.gbt_cash_same(public.gbtreekey16, public.gbtreekey16, internal) TO service_role;


--
-- Name: FUNCTION gbt_cash_union(internal, internal); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.gbt_cash_union(internal, internal) TO postgres;
GRANT ALL ON FUNCTION public.gbt_cash_union(internal, internal) TO anon;
GRANT ALL ON FUNCTION public.gbt_cash_union(internal, internal) TO authenticated;
GRANT ALL ON FUNCTION public.gbt_cash_union(internal, internal) TO service_role;


--
-- Name: FUNCTION gbt_date_compress(internal); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.gbt_date_compress(internal) TO postgres;
GRANT ALL ON FUNCTION public.gbt_date_compress(internal) TO anon;
GRANT ALL ON FUNCTION public.gbt_date_compress(internal) TO authenticated;
GRANT ALL ON FUNCTION public.gbt_date_compress(internal) TO service_role;


--
-- Name: FUNCTION gbt_date_consistent(internal, date, smallint, oid, internal); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.gbt_date_consistent(internal, date, smallint, oid, internal) TO postgres;
GRANT ALL ON FUNCTION public.gbt_date_consistent(internal, date, smallint, oid, internal) TO anon;
GRANT ALL ON FUNCTION public.gbt_date_consistent(internal, date, smallint, oid, internal) TO authenticated;
GRANT ALL ON FUNCTION public.gbt_date_consistent(internal, date, smallint, oid, internal) TO service_role;


--
-- Name: FUNCTION gbt_date_distance(internal, date, smallint, oid, internal); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.gbt_date_distance(internal, date, smallint, oid, internal) TO postgres;
GRANT ALL ON FUNCTION public.gbt_date_distance(internal, date, smallint, oid, internal) TO anon;
GRANT ALL ON FUNCTION public.gbt_date_distance(internal, date, smallint, oid, internal) TO authenticated;
GRANT ALL ON FUNCTION public.gbt_date_distance(internal, date, smallint, oid, internal) TO service_role;


--
-- Name: FUNCTION gbt_date_fetch(internal); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.gbt_date_fetch(internal) TO postgres;
GRANT ALL ON FUNCTION public.gbt_date_fetch(internal) TO anon;
GRANT ALL ON FUNCTION public.gbt_date_fetch(internal) TO authenticated;
GRANT ALL ON FUNCTION public.gbt_date_fetch(internal) TO service_role;


--
-- Name: FUNCTION gbt_date_penalty(internal, internal, internal); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.gbt_date_penalty(internal, internal, internal) TO postgres;
GRANT ALL ON FUNCTION public.gbt_date_penalty(internal, internal, internal) TO anon;
GRANT ALL ON FUNCTION public.gbt_date_penalty(internal, internal, internal) TO authenticated;
GRANT ALL ON FUNCTION public.gbt_date_penalty(internal, internal, internal) TO service_role;


--
-- Name: FUNCTION gbt_date_picksplit(internal, internal); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.gbt_date_picksplit(internal, internal) TO postgres;
GRANT ALL ON FUNCTION public.gbt_date_picksplit(internal, internal) TO anon;
GRANT ALL ON FUNCTION public.gbt_date_picksplit(internal, internal) TO authenticated;
GRANT ALL ON FUNCTION public.gbt_date_picksplit(internal, internal) TO service_role;


--
-- Name: FUNCTION gbt_date_same(public.gbtreekey8, public.gbtreekey8, internal); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.gbt_date_same(public.gbtreekey8, public.gbtreekey8, internal) TO postgres;
GRANT ALL ON FUNCTION public.gbt_date_same(public.gbtreekey8, public.gbtreekey8, internal) TO anon;
GRANT ALL ON FUNCTION public.gbt_date_same(public.gbtreekey8, public.gbtreekey8, internal) TO authenticated;
GRANT ALL ON FUNCTION public.gbt_date_same(public.gbtreekey8, public.gbtreekey8, internal) TO service_role;


--
-- Name: FUNCTION gbt_date_union(internal, internal); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.gbt_date_union(internal, internal) TO postgres;
GRANT ALL ON FUNCTION public.gbt_date_union(internal, internal) TO anon;
GRANT ALL ON FUNCTION public.gbt_date_union(internal, internal) TO authenticated;
GRANT ALL ON FUNCTION public.gbt_date_union(internal, internal) TO service_role;


--
-- Name: FUNCTION gbt_decompress(internal); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.gbt_decompress(internal) TO postgres;
GRANT ALL ON FUNCTION public.gbt_decompress(internal) TO anon;
GRANT ALL ON FUNCTION public.gbt_decompress(internal) TO authenticated;
GRANT ALL ON FUNCTION public.gbt_decompress(internal) TO service_role;


--
-- Name: FUNCTION gbt_enum_compress(internal); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.gbt_enum_compress(internal) TO postgres;
GRANT ALL ON FUNCTION public.gbt_enum_compress(internal) TO anon;
GRANT ALL ON FUNCTION public.gbt_enum_compress(internal) TO authenticated;
GRANT ALL ON FUNCTION public.gbt_enum_compress(internal) TO service_role;


--
-- Name: FUNCTION gbt_enum_consistent(internal, anyenum, smallint, oid, internal); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.gbt_enum_consistent(internal, anyenum, smallint, oid, internal) TO postgres;
GRANT ALL ON FUNCTION public.gbt_enum_consistent(internal, anyenum, smallint, oid, internal) TO anon;
GRANT ALL ON FUNCTION public.gbt_enum_consistent(internal, anyenum, smallint, oid, internal) TO authenticated;
GRANT ALL ON FUNCTION public.gbt_enum_consistent(internal, anyenum, smallint, oid, internal) TO service_role;


--
-- Name: FUNCTION gbt_enum_fetch(internal); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.gbt_enum_fetch(internal) TO postgres;
GRANT ALL ON FUNCTION public.gbt_enum_fetch(internal) TO anon;
GRANT ALL ON FUNCTION public.gbt_enum_fetch(internal) TO authenticated;
GRANT ALL ON FUNCTION public.gbt_enum_fetch(internal) TO service_role;


--
-- Name: FUNCTION gbt_enum_penalty(internal, internal, internal); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.gbt_enum_penalty(internal, internal, internal) TO postgres;
GRANT ALL ON FUNCTION public.gbt_enum_penalty(internal, internal, internal) TO anon;
GRANT ALL ON FUNCTION public.gbt_enum_penalty(internal, internal, internal) TO authenticated;
GRANT ALL ON FUNCTION public.gbt_enum_penalty(internal, internal, internal) TO service_role;


--
-- Name: FUNCTION gbt_enum_picksplit(internal, internal); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.gbt_enum_picksplit(internal, internal) TO postgres;
GRANT ALL ON FUNCTION public.gbt_enum_picksplit(internal, internal) TO anon;
GRANT ALL ON FUNCTION public.gbt_enum_picksplit(internal, internal) TO authenticated;
GRANT ALL ON FUNCTION public.gbt_enum_picksplit(internal, internal) TO service_role;


--
-- Name: FUNCTION gbt_enum_same(public.gbtreekey8, public.gbtreekey8, internal); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.gbt_enum_same(public.gbtreekey8, public.gbtreekey8, internal) TO postgres;
GRANT ALL ON FUNCTION public.gbt_enum_same(public.gbtreekey8, public.gbtreekey8, internal) TO anon;
GRANT ALL ON FUNCTION public.gbt_enum_same(public.gbtreekey8, public.gbtreekey8, internal) TO authenticated;
GRANT ALL ON FUNCTION public.gbt_enum_same(public.gbtreekey8, public.gbtreekey8, internal) TO service_role;


--
-- Name: FUNCTION gbt_enum_union(internal, internal); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.gbt_enum_union(internal, internal) TO postgres;
GRANT ALL ON FUNCTION public.gbt_enum_union(internal, internal) TO anon;
GRANT ALL ON FUNCTION public.gbt_enum_union(internal, internal) TO authenticated;
GRANT ALL ON FUNCTION public.gbt_enum_union(internal, internal) TO service_role;


--
-- Name: FUNCTION gbt_float4_compress(internal); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.gbt_float4_compress(internal) TO postgres;
GRANT ALL ON FUNCTION public.gbt_float4_compress(internal) TO anon;
GRANT ALL ON FUNCTION public.gbt_float4_compress(internal) TO authenticated;
GRANT ALL ON FUNCTION public.gbt_float4_compress(internal) TO service_role;


--
-- Name: FUNCTION gbt_float4_consistent(internal, real, smallint, oid, internal); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.gbt_float4_consistent(internal, real, smallint, oid, internal) TO postgres;
GRANT ALL ON FUNCTION public.gbt_float4_consistent(internal, real, smallint, oid, internal) TO anon;
GRANT ALL ON FUNCTION public.gbt_float4_consistent(internal, real, smallint, oid, internal) TO authenticated;
GRANT ALL ON FUNCTION public.gbt_float4_consistent(internal, real, smallint, oid, internal) TO service_role;


--
-- Name: FUNCTION gbt_float4_distance(internal, real, smallint, oid, internal); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.gbt_float4_distance(internal, real, smallint, oid, internal) TO postgres;
GRANT ALL ON FUNCTION public.gbt_float4_distance(internal, real, smallint, oid, internal) TO anon;
GRANT ALL ON FUNCTION public.gbt_float4_distance(internal, real, smallint, oid, internal) TO authenticated;
GRANT ALL ON FUNCTION public.gbt_float4_distance(internal, real, smallint, oid, internal) TO service_role;


--
-- Name: FUNCTION gbt_float4_fetch(internal); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.gbt_float4_fetch(internal) TO postgres;
GRANT ALL ON FUNCTION public.gbt_float4_fetch(internal) TO anon;
GRANT ALL ON FUNCTION public.gbt_float4_fetch(internal) TO authenticated;
GRANT ALL ON FUNCTION public.gbt_float4_fetch(internal) TO service_role;


--
-- Name: FUNCTION gbt_float4_penalty(internal, internal, internal); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.gbt_float4_penalty(internal, internal, internal) TO postgres;
GRANT ALL ON FUNCTION public.gbt_float4_penalty(internal, internal, internal) TO anon;
GRANT ALL ON FUNCTION public.gbt_float4_penalty(internal, internal, internal) TO authenticated;
GRANT ALL ON FUNCTION public.gbt_float4_penalty(internal, internal, internal) TO service_role;


--
-- Name: FUNCTION gbt_float4_picksplit(internal, internal); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.gbt_float4_picksplit(internal, internal) TO postgres;
GRANT ALL ON FUNCTION public.gbt_float4_picksplit(internal, internal) TO anon;
GRANT ALL ON FUNCTION public.gbt_float4_picksplit(internal, internal) TO authenticated;
GRANT ALL ON FUNCTION public.gbt_float4_picksplit(internal, internal) TO service_role;


--
-- Name: FUNCTION gbt_float4_same(public.gbtreekey8, public.gbtreekey8, internal); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.gbt_float4_same(public.gbtreekey8, public.gbtreekey8, internal) TO postgres;
GRANT ALL ON FUNCTION public.gbt_float4_same(public.gbtreekey8, public.gbtreekey8, internal) TO anon;
GRANT ALL ON FUNCTION public.gbt_float4_same(public.gbtreekey8, public.gbtreekey8, internal) TO authenticated;
GRANT ALL ON FUNCTION public.gbt_float4_same(public.gbtreekey8, public.gbtreekey8, internal) TO service_role;


--
-- Name: FUNCTION gbt_float4_union(internal, internal); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.gbt_float4_union(internal, internal) TO postgres;
GRANT ALL ON FUNCTION public.gbt_float4_union(internal, internal) TO anon;
GRANT ALL ON FUNCTION public.gbt_float4_union(internal, internal) TO authenticated;
GRANT ALL ON FUNCTION public.gbt_float4_union(internal, internal) TO service_role;


--
-- Name: FUNCTION gbt_float8_compress(internal); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.gbt_float8_compress(internal) TO postgres;
GRANT ALL ON FUNCTION public.gbt_float8_compress(internal) TO anon;
GRANT ALL ON FUNCTION public.gbt_float8_compress(internal) TO authenticated;
GRANT ALL ON FUNCTION public.gbt_float8_compress(internal) TO service_role;


--
-- Name: FUNCTION gbt_float8_consistent(internal, double precision, smallint, oid, internal); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.gbt_float8_consistent(internal, double precision, smallint, oid, internal) TO postgres;
GRANT ALL ON FUNCTION public.gbt_float8_consistent(internal, double precision, smallint, oid, internal) TO anon;
GRANT ALL ON FUNCTION public.gbt_float8_consistent(internal, double precision, smallint, oid, internal) TO authenticated;
GRANT ALL ON FUNCTION public.gbt_float8_consistent(internal, double precision, smallint, oid, internal) TO service_role;


--
-- Name: FUNCTION gbt_float8_distance(internal, double precision, smallint, oid, internal); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.gbt_float8_distance(internal, double precision, smallint, oid, internal) TO postgres;
GRANT ALL ON FUNCTION public.gbt_float8_distance(internal, double precision, smallint, oid, internal) TO anon;
GRANT ALL ON FUNCTION public.gbt_float8_distance(internal, double precision, smallint, oid, internal) TO authenticated;
GRANT ALL ON FUNCTION public.gbt_float8_distance(internal, double precision, smallint, oid, internal) TO service_role;


--
-- Name: FUNCTION gbt_float8_fetch(internal); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.gbt_float8_fetch(internal) TO postgres;
GRANT ALL ON FUNCTION public.gbt_float8_fetch(internal) TO anon;
GRANT ALL ON FUNCTION public.gbt_float8_fetch(internal) TO authenticated;
GRANT ALL ON FUNCTION public.gbt_float8_fetch(internal) TO service_role;


--
-- Name: FUNCTION gbt_float8_penalty(internal, internal, internal); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.gbt_float8_penalty(internal, internal, internal) TO postgres;
GRANT ALL ON FUNCTION public.gbt_float8_penalty(internal, internal, internal) TO anon;
GRANT ALL ON FUNCTION public.gbt_float8_penalty(internal, internal, internal) TO authenticated;
GRANT ALL ON FUNCTION public.gbt_float8_penalty(internal, internal, internal) TO service_role;


--
-- Name: FUNCTION gbt_float8_picksplit(internal, internal); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.gbt_float8_picksplit(internal, internal) TO postgres;
GRANT ALL ON FUNCTION public.gbt_float8_picksplit(internal, internal) TO anon;
GRANT ALL ON FUNCTION public.gbt_float8_picksplit(internal, internal) TO authenticated;
GRANT ALL ON FUNCTION public.gbt_float8_picksplit(internal, internal) TO service_role;


--
-- Name: FUNCTION gbt_float8_same(public.gbtreekey16, public.gbtreekey16, internal); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.gbt_float8_same(public.gbtreekey16, public.gbtreekey16, internal) TO postgres;
GRANT ALL ON FUNCTION public.gbt_float8_same(public.gbtreekey16, public.gbtreekey16, internal) TO anon;
GRANT ALL ON FUNCTION public.gbt_float8_same(public.gbtreekey16, public.gbtreekey16, internal) TO authenticated;
GRANT ALL ON FUNCTION public.gbt_float8_same(public.gbtreekey16, public.gbtreekey16, internal) TO service_role;


--
-- Name: FUNCTION gbt_float8_union(internal, internal); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.gbt_float8_union(internal, internal) TO postgres;
GRANT ALL ON FUNCTION public.gbt_float8_union(internal, internal) TO anon;
GRANT ALL ON FUNCTION public.gbt_float8_union(internal, internal) TO authenticated;
GRANT ALL ON FUNCTION public.gbt_float8_union(internal, internal) TO service_role;


--
-- Name: FUNCTION gbt_inet_compress(internal); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.gbt_inet_compress(internal) TO postgres;
GRANT ALL ON FUNCTION public.gbt_inet_compress(internal) TO anon;
GRANT ALL ON FUNCTION public.gbt_inet_compress(internal) TO authenticated;
GRANT ALL ON FUNCTION public.gbt_inet_compress(internal) TO service_role;


--
-- Name: FUNCTION gbt_inet_consistent(internal, inet, smallint, oid, internal); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.gbt_inet_consistent(internal, inet, smallint, oid, internal) TO postgres;
GRANT ALL ON FUNCTION public.gbt_inet_consistent(internal, inet, smallint, oid, internal) TO anon;
GRANT ALL ON FUNCTION public.gbt_inet_consistent(internal, inet, smallint, oid, internal) TO authenticated;
GRANT ALL ON FUNCTION public.gbt_inet_consistent(internal, inet, smallint, oid, internal) TO service_role;


--
-- Name: FUNCTION gbt_inet_penalty(internal, internal, internal); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.gbt_inet_penalty(internal, internal, internal) TO postgres;
GRANT ALL ON FUNCTION public.gbt_inet_penalty(internal, internal, internal) TO anon;
GRANT ALL ON FUNCTION public.gbt_inet_penalty(internal, internal, internal) TO authenticated;
GRANT ALL ON FUNCTION public.gbt_inet_penalty(internal, internal, internal) TO service_role;


--
-- Name: FUNCTION gbt_inet_picksplit(internal, internal); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.gbt_inet_picksplit(internal, internal) TO postgres;
GRANT ALL ON FUNCTION public.gbt_inet_picksplit(internal, internal) TO anon;
GRANT ALL ON FUNCTION public.gbt_inet_picksplit(internal, internal) TO authenticated;
GRANT ALL ON FUNCTION public.gbt_inet_picksplit(internal, internal) TO service_role;


--
-- Name: FUNCTION gbt_inet_same(public.gbtreekey16, public.gbtreekey16, internal); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.gbt_inet_same(public.gbtreekey16, public.gbtreekey16, internal) TO postgres;
GRANT ALL ON FUNCTION public.gbt_inet_same(public.gbtreekey16, public.gbtreekey16, internal) TO anon;
GRANT ALL ON FUNCTION public.gbt_inet_same(public.gbtreekey16, public.gbtreekey16, internal) TO authenticated;
GRANT ALL ON FUNCTION public.gbt_inet_same(public.gbtreekey16, public.gbtreekey16, internal) TO service_role;


--
-- Name: FUNCTION gbt_inet_union(internal, internal); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.gbt_inet_union(internal, internal) TO postgres;
GRANT ALL ON FUNCTION public.gbt_inet_union(internal, internal) TO anon;
GRANT ALL ON FUNCTION public.gbt_inet_union(internal, internal) TO authenticated;
GRANT ALL ON FUNCTION public.gbt_inet_union(internal, internal) TO service_role;


--
-- Name: FUNCTION gbt_int2_compress(internal); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.gbt_int2_compress(internal) TO postgres;
GRANT ALL ON FUNCTION public.gbt_int2_compress(internal) TO anon;
GRANT ALL ON FUNCTION public.gbt_int2_compress(internal) TO authenticated;
GRANT ALL ON FUNCTION public.gbt_int2_compress(internal) TO service_role;


--
-- Name: FUNCTION gbt_int2_consistent(internal, smallint, smallint, oid, internal); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.gbt_int2_consistent(internal, smallint, smallint, oid, internal) TO postgres;
GRANT ALL ON FUNCTION public.gbt_int2_consistent(internal, smallint, smallint, oid, internal) TO anon;
GRANT ALL ON FUNCTION public.gbt_int2_consistent(internal, smallint, smallint, oid, internal) TO authenticated;
GRANT ALL ON FUNCTION public.gbt_int2_consistent(internal, smallint, smallint, oid, internal) TO service_role;


--
-- Name: FUNCTION gbt_int2_distance(internal, smallint, smallint, oid, internal); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.gbt_int2_distance(internal, smallint, smallint, oid, internal) TO postgres;
GRANT ALL ON FUNCTION public.gbt_int2_distance(internal, smallint, smallint, oid, internal) TO anon;
GRANT ALL ON FUNCTION public.gbt_int2_distance(internal, smallint, smallint, oid, internal) TO authenticated;
GRANT ALL ON FUNCTION public.gbt_int2_distance(internal, smallint, smallint, oid, internal) TO service_role;


--
-- Name: FUNCTION gbt_int2_fetch(internal); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.gbt_int2_fetch(internal) TO postgres;
GRANT ALL ON FUNCTION public.gbt_int2_fetch(internal) TO anon;
GRANT ALL ON FUNCTION public.gbt_int2_fetch(internal) TO authenticated;
GRANT ALL ON FUNCTION public.gbt_int2_fetch(internal) TO service_role;


--
-- Name: FUNCTION gbt_int2_penalty(internal, internal, internal); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.gbt_int2_penalty(internal, internal, internal) TO postgres;
GRANT ALL ON FUNCTION public.gbt_int2_penalty(internal, internal, internal) TO anon;
GRANT ALL ON FUNCTION public.gbt_int2_penalty(internal, internal, internal) TO authenticated;
GRANT ALL ON FUNCTION public.gbt_int2_penalty(internal, internal, internal) TO service_role;


--
-- Name: FUNCTION gbt_int2_picksplit(internal, internal); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.gbt_int2_picksplit(internal, internal) TO postgres;
GRANT ALL ON FUNCTION public.gbt_int2_picksplit(internal, internal) TO anon;
GRANT ALL ON FUNCTION public.gbt_int2_picksplit(internal, internal) TO authenticated;
GRANT ALL ON FUNCTION public.gbt_int2_picksplit(internal, internal) TO service_role;


--
-- Name: FUNCTION gbt_int2_same(public.gbtreekey4, public.gbtreekey4, internal); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.gbt_int2_same(public.gbtreekey4, public.gbtreekey4, internal) TO postgres;
GRANT ALL ON FUNCTION public.gbt_int2_same(public.gbtreekey4, public.gbtreekey4, internal) TO anon;
GRANT ALL ON FUNCTION public.gbt_int2_same(public.gbtreekey4, public.gbtreekey4, internal) TO authenticated;
GRANT ALL ON FUNCTION public.gbt_int2_same(public.gbtreekey4, public.gbtreekey4, internal) TO service_role;


--
-- Name: FUNCTION gbt_int2_union(internal, internal); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.gbt_int2_union(internal, internal) TO postgres;
GRANT ALL ON FUNCTION public.gbt_int2_union(internal, internal) TO anon;
GRANT ALL ON FUNCTION public.gbt_int2_union(internal, internal) TO authenticated;
GRANT ALL ON FUNCTION public.gbt_int2_union(internal, internal) TO service_role;


--
-- Name: FUNCTION gbt_int4_compress(internal); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.gbt_int4_compress(internal) TO postgres;
GRANT ALL ON FUNCTION public.gbt_int4_compress(internal) TO anon;
GRANT ALL ON FUNCTION public.gbt_int4_compress(internal) TO authenticated;
GRANT ALL ON FUNCTION public.gbt_int4_compress(internal) TO service_role;


--
-- Name: FUNCTION gbt_int4_consistent(internal, integer, smallint, oid, internal); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.gbt_int4_consistent(internal, integer, smallint, oid, internal) TO postgres;
GRANT ALL ON FUNCTION public.gbt_int4_consistent(internal, integer, smallint, oid, internal) TO anon;
GRANT ALL ON FUNCTION public.gbt_int4_consistent(internal, integer, smallint, oid, internal) TO authenticated;
GRANT ALL ON FUNCTION public.gbt_int4_consistent(internal, integer, smallint, oid, internal) TO service_role;


--
-- Name: FUNCTION gbt_int4_distance(internal, integer, smallint, oid, internal); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.gbt_int4_distance(internal, integer, smallint, oid, internal) TO postgres;
GRANT ALL ON FUNCTION public.gbt_int4_distance(internal, integer, smallint, oid, internal) TO anon;
GRANT ALL ON FUNCTION public.gbt_int4_distance(internal, integer, smallint, oid, internal) TO authenticated;
GRANT ALL ON FUNCTION public.gbt_int4_distance(internal, integer, smallint, oid, internal) TO service_role;


--
-- Name: FUNCTION gbt_int4_fetch(internal); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.gbt_int4_fetch(internal) TO postgres;
GRANT ALL ON FUNCTION public.gbt_int4_fetch(internal) TO anon;
GRANT ALL ON FUNCTION public.gbt_int4_fetch(internal) TO authenticated;
GRANT ALL ON FUNCTION public.gbt_int4_fetch(internal) TO service_role;


--
-- Name: FUNCTION gbt_int4_penalty(internal, internal, internal); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.gbt_int4_penalty(internal, internal, internal) TO postgres;
GRANT ALL ON FUNCTION public.gbt_int4_penalty(internal, internal, internal) TO anon;
GRANT ALL ON FUNCTION public.gbt_int4_penalty(internal, internal, internal) TO authenticated;
GRANT ALL ON FUNCTION public.gbt_int4_penalty(internal, internal, internal) TO service_role;


--
-- Name: FUNCTION gbt_int4_picksplit(internal, internal); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.gbt_int4_picksplit(internal, internal) TO postgres;
GRANT ALL ON FUNCTION public.gbt_int4_picksplit(internal, internal) TO anon;
GRANT ALL ON FUNCTION public.gbt_int4_picksplit(internal, internal) TO authenticated;
GRANT ALL ON FUNCTION public.gbt_int4_picksplit(internal, internal) TO service_role;


--
-- Name: FUNCTION gbt_int4_same(public.gbtreekey8, public.gbtreekey8, internal); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.gbt_int4_same(public.gbtreekey8, public.gbtreekey8, internal) TO postgres;
GRANT ALL ON FUNCTION public.gbt_int4_same(public.gbtreekey8, public.gbtreekey8, internal) TO anon;
GRANT ALL ON FUNCTION public.gbt_int4_same(public.gbtreekey8, public.gbtreekey8, internal) TO authenticated;
GRANT ALL ON FUNCTION public.gbt_int4_same(public.gbtreekey8, public.gbtreekey8, internal) TO service_role;


--
-- Name: FUNCTION gbt_int4_union(internal, internal); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.gbt_int4_union(internal, internal) TO postgres;
GRANT ALL ON FUNCTION public.gbt_int4_union(internal, internal) TO anon;
GRANT ALL ON FUNCTION public.gbt_int4_union(internal, internal) TO authenticated;
GRANT ALL ON FUNCTION public.gbt_int4_union(internal, internal) TO service_role;


--
-- Name: FUNCTION gbt_int8_compress(internal); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.gbt_int8_compress(internal) TO postgres;
GRANT ALL ON FUNCTION public.gbt_int8_compress(internal) TO anon;
GRANT ALL ON FUNCTION public.gbt_int8_compress(internal) TO authenticated;
GRANT ALL ON FUNCTION public.gbt_int8_compress(internal) TO service_role;


--
-- Name: FUNCTION gbt_int8_consistent(internal, bigint, smallint, oid, internal); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.gbt_int8_consistent(internal, bigint, smallint, oid, internal) TO postgres;
GRANT ALL ON FUNCTION public.gbt_int8_consistent(internal, bigint, smallint, oid, internal) TO anon;
GRANT ALL ON FUNCTION public.gbt_int8_consistent(internal, bigint, smallint, oid, internal) TO authenticated;
GRANT ALL ON FUNCTION public.gbt_int8_consistent(internal, bigint, smallint, oid, internal) TO service_role;


--
-- Name: FUNCTION gbt_int8_distance(internal, bigint, smallint, oid, internal); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.gbt_int8_distance(internal, bigint, smallint, oid, internal) TO postgres;
GRANT ALL ON FUNCTION public.gbt_int8_distance(internal, bigint, smallint, oid, internal) TO anon;
GRANT ALL ON FUNCTION public.gbt_int8_distance(internal, bigint, smallint, oid, internal) TO authenticated;
GRANT ALL ON FUNCTION public.gbt_int8_distance(internal, bigint, smallint, oid, internal) TO service_role;


--
-- Name: FUNCTION gbt_int8_fetch(internal); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.gbt_int8_fetch(internal) TO postgres;
GRANT ALL ON FUNCTION public.gbt_int8_fetch(internal) TO anon;
GRANT ALL ON FUNCTION public.gbt_int8_fetch(internal) TO authenticated;
GRANT ALL ON FUNCTION public.gbt_int8_fetch(internal) TO service_role;


--
-- Name: FUNCTION gbt_int8_penalty(internal, internal, internal); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.gbt_int8_penalty(internal, internal, internal) TO postgres;
GRANT ALL ON FUNCTION public.gbt_int8_penalty(internal, internal, internal) TO anon;
GRANT ALL ON FUNCTION public.gbt_int8_penalty(internal, internal, internal) TO authenticated;
GRANT ALL ON FUNCTION public.gbt_int8_penalty(internal, internal, internal) TO service_role;


--
-- Name: FUNCTION gbt_int8_picksplit(internal, internal); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.gbt_int8_picksplit(internal, internal) TO postgres;
GRANT ALL ON FUNCTION public.gbt_int8_picksplit(internal, internal) TO anon;
GRANT ALL ON FUNCTION public.gbt_int8_picksplit(internal, internal) TO authenticated;
GRANT ALL ON FUNCTION public.gbt_int8_picksplit(internal, internal) TO service_role;


--
-- Name: FUNCTION gbt_int8_same(public.gbtreekey16, public.gbtreekey16, internal); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.gbt_int8_same(public.gbtreekey16, public.gbtreekey16, internal) TO postgres;
GRANT ALL ON FUNCTION public.gbt_int8_same(public.gbtreekey16, public.gbtreekey16, internal) TO anon;
GRANT ALL ON FUNCTION public.gbt_int8_same(public.gbtreekey16, public.gbtreekey16, internal) TO authenticated;
GRANT ALL ON FUNCTION public.gbt_int8_same(public.gbtreekey16, public.gbtreekey16, internal) TO service_role;


--
-- Name: FUNCTION gbt_int8_union(internal, internal); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.gbt_int8_union(internal, internal) TO postgres;
GRANT ALL ON FUNCTION public.gbt_int8_union(internal, internal) TO anon;
GRANT ALL ON FUNCTION public.gbt_int8_union(internal, internal) TO authenticated;
GRANT ALL ON FUNCTION public.gbt_int8_union(internal, internal) TO service_role;


--
-- Name: FUNCTION gbt_intv_compress(internal); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.gbt_intv_compress(internal) TO postgres;
GRANT ALL ON FUNCTION public.gbt_intv_compress(internal) TO anon;
GRANT ALL ON FUNCTION public.gbt_intv_compress(internal) TO authenticated;
GRANT ALL ON FUNCTION public.gbt_intv_compress(internal) TO service_role;


--
-- Name: FUNCTION gbt_intv_consistent(internal, interval, smallint, oid, internal); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.gbt_intv_consistent(internal, interval, smallint, oid, internal) TO postgres;
GRANT ALL ON FUNCTION public.gbt_intv_consistent(internal, interval, smallint, oid, internal) TO anon;
GRANT ALL ON FUNCTION public.gbt_intv_consistent(internal, interval, smallint, oid, internal) TO authenticated;
GRANT ALL ON FUNCTION public.gbt_intv_consistent(internal, interval, smallint, oid, internal) TO service_role;


--
-- Name: FUNCTION gbt_intv_decompress(internal); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.gbt_intv_decompress(internal) TO postgres;
GRANT ALL ON FUNCTION public.gbt_intv_decompress(internal) TO anon;
GRANT ALL ON FUNCTION public.gbt_intv_decompress(internal) TO authenticated;
GRANT ALL ON FUNCTION public.gbt_intv_decompress(internal) TO service_role;


--
-- Name: FUNCTION gbt_intv_distance(internal, interval, smallint, oid, internal); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.gbt_intv_distance(internal, interval, smallint, oid, internal) TO postgres;
GRANT ALL ON FUNCTION public.gbt_intv_distance(internal, interval, smallint, oid, internal) TO anon;
GRANT ALL ON FUNCTION public.gbt_intv_distance(internal, interval, smallint, oid, internal) TO authenticated;
GRANT ALL ON FUNCTION public.gbt_intv_distance(internal, interval, smallint, oid, internal) TO service_role;


--
-- Name: FUNCTION gbt_intv_fetch(internal); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.gbt_intv_fetch(internal) TO postgres;
GRANT ALL ON FUNCTION public.gbt_intv_fetch(internal) TO anon;
GRANT ALL ON FUNCTION public.gbt_intv_fetch(internal) TO authenticated;
GRANT ALL ON FUNCTION public.gbt_intv_fetch(internal) TO service_role;


--
-- Name: FUNCTION gbt_intv_penalty(internal, internal, internal); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.gbt_intv_penalty(internal, internal, internal) TO postgres;
GRANT ALL ON FUNCTION public.gbt_intv_penalty(internal, internal, internal) TO anon;
GRANT ALL ON FUNCTION public.gbt_intv_penalty(internal, internal, internal) TO authenticated;
GRANT ALL ON FUNCTION public.gbt_intv_penalty(internal, internal, internal) TO service_role;


--
-- Name: FUNCTION gbt_intv_picksplit(internal, internal); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.gbt_intv_picksplit(internal, internal) TO postgres;
GRANT ALL ON FUNCTION public.gbt_intv_picksplit(internal, internal) TO anon;
GRANT ALL ON FUNCTION public.gbt_intv_picksplit(internal, internal) TO authenticated;
GRANT ALL ON FUNCTION public.gbt_intv_picksplit(internal, internal) TO service_role;


--
-- Name: FUNCTION gbt_intv_same(public.gbtreekey32, public.gbtreekey32, internal); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.gbt_intv_same(public.gbtreekey32, public.gbtreekey32, internal) TO postgres;
GRANT ALL ON FUNCTION public.gbt_intv_same(public.gbtreekey32, public.gbtreekey32, internal) TO anon;
GRANT ALL ON FUNCTION public.gbt_intv_same(public.gbtreekey32, public.gbtreekey32, internal) TO authenticated;
GRANT ALL ON FUNCTION public.gbt_intv_same(public.gbtreekey32, public.gbtreekey32, internal) TO service_role;


--
-- Name: FUNCTION gbt_intv_union(internal, internal); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.gbt_intv_union(internal, internal) TO postgres;
GRANT ALL ON FUNCTION public.gbt_intv_union(internal, internal) TO anon;
GRANT ALL ON FUNCTION public.gbt_intv_union(internal, internal) TO authenticated;
GRANT ALL ON FUNCTION public.gbt_intv_union(internal, internal) TO service_role;


--
-- Name: FUNCTION gbt_macad8_compress(internal); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.gbt_macad8_compress(internal) TO postgres;
GRANT ALL ON FUNCTION public.gbt_macad8_compress(internal) TO anon;
GRANT ALL ON FUNCTION public.gbt_macad8_compress(internal) TO authenticated;
GRANT ALL ON FUNCTION public.gbt_macad8_compress(internal) TO service_role;


--
-- Name: FUNCTION gbt_macad8_consistent(internal, macaddr8, smallint, oid, internal); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.gbt_macad8_consistent(internal, macaddr8, smallint, oid, internal) TO postgres;
GRANT ALL ON FUNCTION public.gbt_macad8_consistent(internal, macaddr8, smallint, oid, internal) TO anon;
GRANT ALL ON FUNCTION public.gbt_macad8_consistent(internal, macaddr8, smallint, oid, internal) TO authenticated;
GRANT ALL ON FUNCTION public.gbt_macad8_consistent(internal, macaddr8, smallint, oid, internal) TO service_role;


--
-- Name: FUNCTION gbt_macad8_fetch(internal); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.gbt_macad8_fetch(internal) TO postgres;
GRANT ALL ON FUNCTION public.gbt_macad8_fetch(internal) TO anon;
GRANT ALL ON FUNCTION public.gbt_macad8_fetch(internal) TO authenticated;
GRANT ALL ON FUNCTION public.gbt_macad8_fetch(internal) TO service_role;


--
-- Name: FUNCTION gbt_macad8_penalty(internal, internal, internal); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.gbt_macad8_penalty(internal, internal, internal) TO postgres;
GRANT ALL ON FUNCTION public.gbt_macad8_penalty(internal, internal, internal) TO anon;
GRANT ALL ON FUNCTION public.gbt_macad8_penalty(internal, internal, internal) TO authenticated;
GRANT ALL ON FUNCTION public.gbt_macad8_penalty(internal, internal, internal) TO service_role;


--
-- Name: FUNCTION gbt_macad8_picksplit(internal, internal); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.gbt_macad8_picksplit(internal, internal) TO postgres;
GRANT ALL ON FUNCTION public.gbt_macad8_picksplit(internal, internal) TO anon;
GRANT ALL ON FUNCTION public.gbt_macad8_picksplit(internal, internal) TO authenticated;
GRANT ALL ON FUNCTION public.gbt_macad8_picksplit(internal, internal) TO service_role;


--
-- Name: FUNCTION gbt_macad8_same(public.gbtreekey16, public.gbtreekey16, internal); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.gbt_macad8_same(public.gbtreekey16, public.gbtreekey16, internal) TO postgres;
GRANT ALL ON FUNCTION public.gbt_macad8_same(public.gbtreekey16, public.gbtreekey16, internal) TO anon;
GRANT ALL ON FUNCTION public.gbt_macad8_same(public.gbtreekey16, public.gbtreekey16, internal) TO authenticated;
GRANT ALL ON FUNCTION public.gbt_macad8_same(public.gbtreekey16, public.gbtreekey16, internal) TO service_role;


--
-- Name: FUNCTION gbt_macad8_union(internal, internal); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.gbt_macad8_union(internal, internal) TO postgres;
GRANT ALL ON FUNCTION public.gbt_macad8_union(internal, internal) TO anon;
GRANT ALL ON FUNCTION public.gbt_macad8_union(internal, internal) TO authenticated;
GRANT ALL ON FUNCTION public.gbt_macad8_union(internal, internal) TO service_role;


--
-- Name: FUNCTION gbt_macad_compress(internal); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.gbt_macad_compress(internal) TO postgres;
GRANT ALL ON FUNCTION public.gbt_macad_compress(internal) TO anon;
GRANT ALL ON FUNCTION public.gbt_macad_compress(internal) TO authenticated;
GRANT ALL ON FUNCTION public.gbt_macad_compress(internal) TO service_role;


--
-- Name: FUNCTION gbt_macad_consistent(internal, macaddr, smallint, oid, internal); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.gbt_macad_consistent(internal, macaddr, smallint, oid, internal) TO postgres;
GRANT ALL ON FUNCTION public.gbt_macad_consistent(internal, macaddr, smallint, oid, internal) TO anon;
GRANT ALL ON FUNCTION public.gbt_macad_consistent(internal, macaddr, smallint, oid, internal) TO authenticated;
GRANT ALL ON FUNCTION public.gbt_macad_consistent(internal, macaddr, smallint, oid, internal) TO service_role;


--
-- Name: FUNCTION gbt_macad_fetch(internal); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.gbt_macad_fetch(internal) TO postgres;
GRANT ALL ON FUNCTION public.gbt_macad_fetch(internal) TO anon;
GRANT ALL ON FUNCTION public.gbt_macad_fetch(internal) TO authenticated;
GRANT ALL ON FUNCTION public.gbt_macad_fetch(internal) TO service_role;


--
-- Name: FUNCTION gbt_macad_penalty(internal, internal, internal); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.gbt_macad_penalty(internal, internal, internal) TO postgres;
GRANT ALL ON FUNCTION public.gbt_macad_penalty(internal, internal, internal) TO anon;
GRANT ALL ON FUNCTION public.gbt_macad_penalty(internal, internal, internal) TO authenticated;
GRANT ALL ON FUNCTION public.gbt_macad_penalty(internal, internal, internal) TO service_role;


--
-- Name: FUNCTION gbt_macad_picksplit(internal, internal); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.gbt_macad_picksplit(internal, internal) TO postgres;
GRANT ALL ON FUNCTION public.gbt_macad_picksplit(internal, internal) TO anon;
GRANT ALL ON FUNCTION public.gbt_macad_picksplit(internal, internal) TO authenticated;
GRANT ALL ON FUNCTION public.gbt_macad_picksplit(internal, internal) TO service_role;


--
-- Name: FUNCTION gbt_macad_same(public.gbtreekey16, public.gbtreekey16, internal); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.gbt_macad_same(public.gbtreekey16, public.gbtreekey16, internal) TO postgres;
GRANT ALL ON FUNCTION public.gbt_macad_same(public.gbtreekey16, public.gbtreekey16, internal) TO anon;
GRANT ALL ON FUNCTION public.gbt_macad_same(public.gbtreekey16, public.gbtreekey16, internal) TO authenticated;
GRANT ALL ON FUNCTION public.gbt_macad_same(public.gbtreekey16, public.gbtreekey16, internal) TO service_role;


--
-- Name: FUNCTION gbt_macad_union(internal, internal); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.gbt_macad_union(internal, internal) TO postgres;
GRANT ALL ON FUNCTION public.gbt_macad_union(internal, internal) TO anon;
GRANT ALL ON FUNCTION public.gbt_macad_union(internal, internal) TO authenticated;
GRANT ALL ON FUNCTION public.gbt_macad_union(internal, internal) TO service_role;


--
-- Name: FUNCTION gbt_numeric_compress(internal); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.gbt_numeric_compress(internal) TO postgres;
GRANT ALL ON FUNCTION public.gbt_numeric_compress(internal) TO anon;
GRANT ALL ON FUNCTION public.gbt_numeric_compress(internal) TO authenticated;
GRANT ALL ON FUNCTION public.gbt_numeric_compress(internal) TO service_role;


--
-- Name: FUNCTION gbt_numeric_consistent(internal, numeric, smallint, oid, internal); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.gbt_numeric_consistent(internal, numeric, smallint, oid, internal) TO postgres;
GRANT ALL ON FUNCTION public.gbt_numeric_consistent(internal, numeric, smallint, oid, internal) TO anon;
GRANT ALL ON FUNCTION public.gbt_numeric_consistent(internal, numeric, smallint, oid, internal) TO authenticated;
GRANT ALL ON FUNCTION public.gbt_numeric_consistent(internal, numeric, smallint, oid, internal) TO service_role;


--
-- Name: FUNCTION gbt_numeric_penalty(internal, internal, internal); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.gbt_numeric_penalty(internal, internal, internal) TO postgres;
GRANT ALL ON FUNCTION public.gbt_numeric_penalty(internal, internal, internal) TO anon;
GRANT ALL ON FUNCTION public.gbt_numeric_penalty(internal, internal, internal) TO authenticated;
GRANT ALL ON FUNCTION public.gbt_numeric_penalty(internal, internal, internal) TO service_role;


--
-- Name: FUNCTION gbt_numeric_picksplit(internal, internal); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.gbt_numeric_picksplit(internal, internal) TO postgres;
GRANT ALL ON FUNCTION public.gbt_numeric_picksplit(internal, internal) TO anon;
GRANT ALL ON FUNCTION public.gbt_numeric_picksplit(internal, internal) TO authenticated;
GRANT ALL ON FUNCTION public.gbt_numeric_picksplit(internal, internal) TO service_role;


--
-- Name: FUNCTION gbt_numeric_same(public.gbtreekey_var, public.gbtreekey_var, internal); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.gbt_numeric_same(public.gbtreekey_var, public.gbtreekey_var, internal) TO postgres;
GRANT ALL ON FUNCTION public.gbt_numeric_same(public.gbtreekey_var, public.gbtreekey_var, internal) TO anon;
GRANT ALL ON FUNCTION public.gbt_numeric_same(public.gbtreekey_var, public.gbtreekey_var, internal) TO authenticated;
GRANT ALL ON FUNCTION public.gbt_numeric_same(public.gbtreekey_var, public.gbtreekey_var, internal) TO service_role;


--
-- Name: FUNCTION gbt_numeric_union(internal, internal); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.gbt_numeric_union(internal, internal) TO postgres;
GRANT ALL ON FUNCTION public.gbt_numeric_union(internal, internal) TO anon;
GRANT ALL ON FUNCTION public.gbt_numeric_union(internal, internal) TO authenticated;
GRANT ALL ON FUNCTION public.gbt_numeric_union(internal, internal) TO service_role;


--
-- Name: FUNCTION gbt_oid_compress(internal); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.gbt_oid_compress(internal) TO postgres;
GRANT ALL ON FUNCTION public.gbt_oid_compress(internal) TO anon;
GRANT ALL ON FUNCTION public.gbt_oid_compress(internal) TO authenticated;
GRANT ALL ON FUNCTION public.gbt_oid_compress(internal) TO service_role;


--
-- Name: FUNCTION gbt_oid_consistent(internal, oid, smallint, oid, internal); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.gbt_oid_consistent(internal, oid, smallint, oid, internal) TO postgres;
GRANT ALL ON FUNCTION public.gbt_oid_consistent(internal, oid, smallint, oid, internal) TO anon;
GRANT ALL ON FUNCTION public.gbt_oid_consistent(internal, oid, smallint, oid, internal) TO authenticated;
GRANT ALL ON FUNCTION public.gbt_oid_consistent(internal, oid, smallint, oid, internal) TO service_role;


--
-- Name: FUNCTION gbt_oid_distance(internal, oid, smallint, oid, internal); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.gbt_oid_distance(internal, oid, smallint, oid, internal) TO postgres;
GRANT ALL ON FUNCTION public.gbt_oid_distance(internal, oid, smallint, oid, internal) TO anon;
GRANT ALL ON FUNCTION public.gbt_oid_distance(internal, oid, smallint, oid, internal) TO authenticated;
GRANT ALL ON FUNCTION public.gbt_oid_distance(internal, oid, smallint, oid, internal) TO service_role;


--
-- Name: FUNCTION gbt_oid_fetch(internal); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.gbt_oid_fetch(internal) TO postgres;
GRANT ALL ON FUNCTION public.gbt_oid_fetch(internal) TO anon;
GRANT ALL ON FUNCTION public.gbt_oid_fetch(internal) TO authenticated;
GRANT ALL ON FUNCTION public.gbt_oid_fetch(internal) TO service_role;


--
-- Name: FUNCTION gbt_oid_penalty(internal, internal, internal); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.gbt_oid_penalty(internal, internal, internal) TO postgres;
GRANT ALL ON FUNCTION public.gbt_oid_penalty(internal, internal, internal) TO anon;
GRANT ALL ON FUNCTION public.gbt_oid_penalty(internal, internal, internal) TO authenticated;
GRANT ALL ON FUNCTION public.gbt_oid_penalty(internal, internal, internal) TO service_role;


--
-- Name: FUNCTION gbt_oid_picksplit(internal, internal); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.gbt_oid_picksplit(internal, internal) TO postgres;
GRANT ALL ON FUNCTION public.gbt_oid_picksplit(internal, internal) TO anon;
GRANT ALL ON FUNCTION public.gbt_oid_picksplit(internal, internal) TO authenticated;
GRANT ALL ON FUNCTION public.gbt_oid_picksplit(internal, internal) TO service_role;


--
-- Name: FUNCTION gbt_oid_same(public.gbtreekey8, public.gbtreekey8, internal); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.gbt_oid_same(public.gbtreekey8, public.gbtreekey8, internal) TO postgres;
GRANT ALL ON FUNCTION public.gbt_oid_same(public.gbtreekey8, public.gbtreekey8, internal) TO anon;
GRANT ALL ON FUNCTION public.gbt_oid_same(public.gbtreekey8, public.gbtreekey8, internal) TO authenticated;
GRANT ALL ON FUNCTION public.gbt_oid_same(public.gbtreekey8, public.gbtreekey8, internal) TO service_role;


--
-- Name: FUNCTION gbt_oid_union(internal, internal); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.gbt_oid_union(internal, internal) TO postgres;
GRANT ALL ON FUNCTION public.gbt_oid_union(internal, internal) TO anon;
GRANT ALL ON FUNCTION public.gbt_oid_union(internal, internal) TO authenticated;
GRANT ALL ON FUNCTION public.gbt_oid_union(internal, internal) TO service_role;


--
-- Name: FUNCTION gbt_text_compress(internal); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.gbt_text_compress(internal) TO postgres;
GRANT ALL ON FUNCTION public.gbt_text_compress(internal) TO anon;
GRANT ALL ON FUNCTION public.gbt_text_compress(internal) TO authenticated;
GRANT ALL ON FUNCTION public.gbt_text_compress(internal) TO service_role;


--
-- Name: FUNCTION gbt_text_consistent(internal, text, smallint, oid, internal); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.gbt_text_consistent(internal, text, smallint, oid, internal) TO postgres;
GRANT ALL ON FUNCTION public.gbt_text_consistent(internal, text, smallint, oid, internal) TO anon;
GRANT ALL ON FUNCTION public.gbt_text_consistent(internal, text, smallint, oid, internal) TO authenticated;
GRANT ALL ON FUNCTION public.gbt_text_consistent(internal, text, smallint, oid, internal) TO service_role;


--
-- Name: FUNCTION gbt_text_penalty(internal, internal, internal); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.gbt_text_penalty(internal, internal, internal) TO postgres;
GRANT ALL ON FUNCTION public.gbt_text_penalty(internal, internal, internal) TO anon;
GRANT ALL ON FUNCTION public.gbt_text_penalty(internal, internal, internal) TO authenticated;
GRANT ALL ON FUNCTION public.gbt_text_penalty(internal, internal, internal) TO service_role;


--
-- Name: FUNCTION gbt_text_picksplit(internal, internal); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.gbt_text_picksplit(internal, internal) TO postgres;
GRANT ALL ON FUNCTION public.gbt_text_picksplit(internal, internal) TO anon;
GRANT ALL ON FUNCTION public.gbt_text_picksplit(internal, internal) TO authenticated;
GRANT ALL ON FUNCTION public.gbt_text_picksplit(internal, internal) TO service_role;


--
-- Name: FUNCTION gbt_text_same(public.gbtreekey_var, public.gbtreekey_var, internal); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.gbt_text_same(public.gbtreekey_var, public.gbtreekey_var, internal) TO postgres;
GRANT ALL ON FUNCTION public.gbt_text_same(public.gbtreekey_var, public.gbtreekey_var, internal) TO anon;
GRANT ALL ON FUNCTION public.gbt_text_same(public.gbtreekey_var, public.gbtreekey_var, internal) TO authenticated;
GRANT ALL ON FUNCTION public.gbt_text_same(public.gbtreekey_var, public.gbtreekey_var, internal) TO service_role;


--
-- Name: FUNCTION gbt_text_union(internal, internal); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.gbt_text_union(internal, internal) TO postgres;
GRANT ALL ON FUNCTION public.gbt_text_union(internal, internal) TO anon;
GRANT ALL ON FUNCTION public.gbt_text_union(internal, internal) TO authenticated;
GRANT ALL ON FUNCTION public.gbt_text_union(internal, internal) TO service_role;


--
-- Name: FUNCTION gbt_time_compress(internal); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.gbt_time_compress(internal) TO postgres;
GRANT ALL ON FUNCTION public.gbt_time_compress(internal) TO anon;
GRANT ALL ON FUNCTION public.gbt_time_compress(internal) TO authenticated;
GRANT ALL ON FUNCTION public.gbt_time_compress(internal) TO service_role;


--
-- Name: FUNCTION gbt_time_consistent(internal, time without time zone, smallint, oid, internal); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.gbt_time_consistent(internal, time without time zone, smallint, oid, internal) TO postgres;
GRANT ALL ON FUNCTION public.gbt_time_consistent(internal, time without time zone, smallint, oid, internal) TO anon;
GRANT ALL ON FUNCTION public.gbt_time_consistent(internal, time without time zone, smallint, oid, internal) TO authenticated;
GRANT ALL ON FUNCTION public.gbt_time_consistent(internal, time without time zone, smallint, oid, internal) TO service_role;


--
-- Name: FUNCTION gbt_time_distance(internal, time without time zone, smallint, oid, internal); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.gbt_time_distance(internal, time without time zone, smallint, oid, internal) TO postgres;
GRANT ALL ON FUNCTION public.gbt_time_distance(internal, time without time zone, smallint, oid, internal) TO anon;
GRANT ALL ON FUNCTION public.gbt_time_distance(internal, time without time zone, smallint, oid, internal) TO authenticated;
GRANT ALL ON FUNCTION public.gbt_time_distance(internal, time without time zone, smallint, oid, internal) TO service_role;


--
-- Name: FUNCTION gbt_time_fetch(internal); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.gbt_time_fetch(internal) TO postgres;
GRANT ALL ON FUNCTION public.gbt_time_fetch(internal) TO anon;
GRANT ALL ON FUNCTION public.gbt_time_fetch(internal) TO authenticated;
GRANT ALL ON FUNCTION public.gbt_time_fetch(internal) TO service_role;


--
-- Name: FUNCTION gbt_time_penalty(internal, internal, internal); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.gbt_time_penalty(internal, internal, internal) TO postgres;
GRANT ALL ON FUNCTION public.gbt_time_penalty(internal, internal, internal) TO anon;
GRANT ALL ON FUNCTION public.gbt_time_penalty(internal, internal, internal) TO authenticated;
GRANT ALL ON FUNCTION public.gbt_time_penalty(internal, internal, internal) TO service_role;


--
-- Name: FUNCTION gbt_time_picksplit(internal, internal); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.gbt_time_picksplit(internal, internal) TO postgres;
GRANT ALL ON FUNCTION public.gbt_time_picksplit(internal, internal) TO anon;
GRANT ALL ON FUNCTION public.gbt_time_picksplit(internal, internal) TO authenticated;
GRANT ALL ON FUNCTION public.gbt_time_picksplit(internal, internal) TO service_role;


--
-- Name: FUNCTION gbt_time_same(public.gbtreekey16, public.gbtreekey16, internal); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.gbt_time_same(public.gbtreekey16, public.gbtreekey16, internal) TO postgres;
GRANT ALL ON FUNCTION public.gbt_time_same(public.gbtreekey16, public.gbtreekey16, internal) TO anon;
GRANT ALL ON FUNCTION public.gbt_time_same(public.gbtreekey16, public.gbtreekey16, internal) TO authenticated;
GRANT ALL ON FUNCTION public.gbt_time_same(public.gbtreekey16, public.gbtreekey16, internal) TO service_role;


--
-- Name: FUNCTION gbt_time_union(internal, internal); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.gbt_time_union(internal, internal) TO postgres;
GRANT ALL ON FUNCTION public.gbt_time_union(internal, internal) TO anon;
GRANT ALL ON FUNCTION public.gbt_time_union(internal, internal) TO authenticated;
GRANT ALL ON FUNCTION public.gbt_time_union(internal, internal) TO service_role;


--
-- Name: FUNCTION gbt_timetz_compress(internal); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.gbt_timetz_compress(internal) TO postgres;
GRANT ALL ON FUNCTION public.gbt_timetz_compress(internal) TO anon;
GRANT ALL ON FUNCTION public.gbt_timetz_compress(internal) TO authenticated;
GRANT ALL ON FUNCTION public.gbt_timetz_compress(internal) TO service_role;


--
-- Name: FUNCTION gbt_timetz_consistent(internal, time with time zone, smallint, oid, internal); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.gbt_timetz_consistent(internal, time with time zone, smallint, oid, internal) TO postgres;
GRANT ALL ON FUNCTION public.gbt_timetz_consistent(internal, time with time zone, smallint, oid, internal) TO anon;
GRANT ALL ON FUNCTION public.gbt_timetz_consistent(internal, time with time zone, smallint, oid, internal) TO authenticated;
GRANT ALL ON FUNCTION public.gbt_timetz_consistent(internal, time with time zone, smallint, oid, internal) TO service_role;


--
-- Name: FUNCTION gbt_ts_compress(internal); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.gbt_ts_compress(internal) TO postgres;
GRANT ALL ON FUNCTION public.gbt_ts_compress(internal) TO anon;
GRANT ALL ON FUNCTION public.gbt_ts_compress(internal) TO authenticated;
GRANT ALL ON FUNCTION public.gbt_ts_compress(internal) TO service_role;


--
-- Name: FUNCTION gbt_ts_consistent(internal, timestamp without time zone, smallint, oid, internal); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.gbt_ts_consistent(internal, timestamp without time zone, smallint, oid, internal) TO postgres;
GRANT ALL ON FUNCTION public.gbt_ts_consistent(internal, timestamp without time zone, smallint, oid, internal) TO anon;
GRANT ALL ON FUNCTION public.gbt_ts_consistent(internal, timestamp without time zone, smallint, oid, internal) TO authenticated;
GRANT ALL ON FUNCTION public.gbt_ts_consistent(internal, timestamp without time zone, smallint, oid, internal) TO service_role;


--
-- Name: FUNCTION gbt_ts_distance(internal, timestamp without time zone, smallint, oid, internal); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.gbt_ts_distance(internal, timestamp without time zone, smallint, oid, internal) TO postgres;
GRANT ALL ON FUNCTION public.gbt_ts_distance(internal, timestamp without time zone, smallint, oid, internal) TO anon;
GRANT ALL ON FUNCTION public.gbt_ts_distance(internal, timestamp without time zone, smallint, oid, internal) TO authenticated;
GRANT ALL ON FUNCTION public.gbt_ts_distance(internal, timestamp without time zone, smallint, oid, internal) TO service_role;


--
-- Name: FUNCTION gbt_ts_fetch(internal); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.gbt_ts_fetch(internal) TO postgres;
GRANT ALL ON FUNCTION public.gbt_ts_fetch(internal) TO anon;
GRANT ALL ON FUNCTION public.gbt_ts_fetch(internal) TO authenticated;
GRANT ALL ON FUNCTION public.gbt_ts_fetch(internal) TO service_role;


--
-- Name: FUNCTION gbt_ts_penalty(internal, internal, internal); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.gbt_ts_penalty(internal, internal, internal) TO postgres;
GRANT ALL ON FUNCTION public.gbt_ts_penalty(internal, internal, internal) TO anon;
GRANT ALL ON FUNCTION public.gbt_ts_penalty(internal, internal, internal) TO authenticated;
GRANT ALL ON FUNCTION public.gbt_ts_penalty(internal, internal, internal) TO service_role;


--
-- Name: FUNCTION gbt_ts_picksplit(internal, internal); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.gbt_ts_picksplit(internal, internal) TO postgres;
GRANT ALL ON FUNCTION public.gbt_ts_picksplit(internal, internal) TO anon;
GRANT ALL ON FUNCTION public.gbt_ts_picksplit(internal, internal) TO authenticated;
GRANT ALL ON FUNCTION public.gbt_ts_picksplit(internal, internal) TO service_role;


--
-- Name: FUNCTION gbt_ts_same(public.gbtreekey16, public.gbtreekey16, internal); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.gbt_ts_same(public.gbtreekey16, public.gbtreekey16, internal) TO postgres;
GRANT ALL ON FUNCTION public.gbt_ts_same(public.gbtreekey16, public.gbtreekey16, internal) TO anon;
GRANT ALL ON FUNCTION public.gbt_ts_same(public.gbtreekey16, public.gbtreekey16, internal) TO authenticated;
GRANT ALL ON FUNCTION public.gbt_ts_same(public.gbtreekey16, public.gbtreekey16, internal) TO service_role;


--
-- Name: FUNCTION gbt_ts_union(internal, internal); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.gbt_ts_union(internal, internal) TO postgres;
GRANT ALL ON FUNCTION public.gbt_ts_union(internal, internal) TO anon;
GRANT ALL ON FUNCTION public.gbt_ts_union(internal, internal) TO authenticated;
GRANT ALL ON FUNCTION public.gbt_ts_union(internal, internal) TO service_role;


--
-- Name: FUNCTION gbt_tstz_compress(internal); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.gbt_tstz_compress(internal) TO postgres;
GRANT ALL ON FUNCTION public.gbt_tstz_compress(internal) TO anon;
GRANT ALL ON FUNCTION public.gbt_tstz_compress(internal) TO authenticated;
GRANT ALL ON FUNCTION public.gbt_tstz_compress(internal) TO service_role;


--
-- Name: FUNCTION gbt_tstz_consistent(internal, timestamp with time zone, smallint, oid, internal); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.gbt_tstz_consistent(internal, timestamp with time zone, smallint, oid, internal) TO postgres;
GRANT ALL ON FUNCTION public.gbt_tstz_consistent(internal, timestamp with time zone, smallint, oid, internal) TO anon;
GRANT ALL ON FUNCTION public.gbt_tstz_consistent(internal, timestamp with time zone, smallint, oid, internal) TO authenticated;
GRANT ALL ON FUNCTION public.gbt_tstz_consistent(internal, timestamp with time zone, smallint, oid, internal) TO service_role;


--
-- Name: FUNCTION gbt_tstz_distance(internal, timestamp with time zone, smallint, oid, internal); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.gbt_tstz_distance(internal, timestamp with time zone, smallint, oid, internal) TO postgres;
GRANT ALL ON FUNCTION public.gbt_tstz_distance(internal, timestamp with time zone, smallint, oid, internal) TO anon;
GRANT ALL ON FUNCTION public.gbt_tstz_distance(internal, timestamp with time zone, smallint, oid, internal) TO authenticated;
GRANT ALL ON FUNCTION public.gbt_tstz_distance(internal, timestamp with time zone, smallint, oid, internal) TO service_role;


--
-- Name: FUNCTION gbt_uuid_compress(internal); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.gbt_uuid_compress(internal) TO postgres;
GRANT ALL ON FUNCTION public.gbt_uuid_compress(internal) TO anon;
GRANT ALL ON FUNCTION public.gbt_uuid_compress(internal) TO authenticated;
GRANT ALL ON FUNCTION public.gbt_uuid_compress(internal) TO service_role;


--
-- Name: FUNCTION gbt_uuid_consistent(internal, uuid, smallint, oid, internal); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.gbt_uuid_consistent(internal, uuid, smallint, oid, internal) TO postgres;
GRANT ALL ON FUNCTION public.gbt_uuid_consistent(internal, uuid, smallint, oid, internal) TO anon;
GRANT ALL ON FUNCTION public.gbt_uuid_consistent(internal, uuid, smallint, oid, internal) TO authenticated;
GRANT ALL ON FUNCTION public.gbt_uuid_consistent(internal, uuid, smallint, oid, internal) TO service_role;


--
-- Name: FUNCTION gbt_uuid_fetch(internal); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.gbt_uuid_fetch(internal) TO postgres;
GRANT ALL ON FUNCTION public.gbt_uuid_fetch(internal) TO anon;
GRANT ALL ON FUNCTION public.gbt_uuid_fetch(internal) TO authenticated;
GRANT ALL ON FUNCTION public.gbt_uuid_fetch(internal) TO service_role;


--
-- Name: FUNCTION gbt_uuid_penalty(internal, internal, internal); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.gbt_uuid_penalty(internal, internal, internal) TO postgres;
GRANT ALL ON FUNCTION public.gbt_uuid_penalty(internal, internal, internal) TO anon;
GRANT ALL ON FUNCTION public.gbt_uuid_penalty(internal, internal, internal) TO authenticated;
GRANT ALL ON FUNCTION public.gbt_uuid_penalty(internal, internal, internal) TO service_role;


--
-- Name: FUNCTION gbt_uuid_picksplit(internal, internal); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.gbt_uuid_picksplit(internal, internal) TO postgres;
GRANT ALL ON FUNCTION public.gbt_uuid_picksplit(internal, internal) TO anon;
GRANT ALL ON FUNCTION public.gbt_uuid_picksplit(internal, internal) TO authenticated;
GRANT ALL ON FUNCTION public.gbt_uuid_picksplit(internal, internal) TO service_role;


--
-- Name: FUNCTION gbt_uuid_same(public.gbtreekey32, public.gbtreekey32, internal); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.gbt_uuid_same(public.gbtreekey32, public.gbtreekey32, internal) TO postgres;
GRANT ALL ON FUNCTION public.gbt_uuid_same(public.gbtreekey32, public.gbtreekey32, internal) TO anon;
GRANT ALL ON FUNCTION public.gbt_uuid_same(public.gbtreekey32, public.gbtreekey32, internal) TO authenticated;
GRANT ALL ON FUNCTION public.gbt_uuid_same(public.gbtreekey32, public.gbtreekey32, internal) TO service_role;


--
-- Name: FUNCTION gbt_uuid_union(internal, internal); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.gbt_uuid_union(internal, internal) TO postgres;
GRANT ALL ON FUNCTION public.gbt_uuid_union(internal, internal) TO anon;
GRANT ALL ON FUNCTION public.gbt_uuid_union(internal, internal) TO authenticated;
GRANT ALL ON FUNCTION public.gbt_uuid_union(internal, internal) TO service_role;


--
-- Name: FUNCTION gbt_var_decompress(internal); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.gbt_var_decompress(internal) TO postgres;
GRANT ALL ON FUNCTION public.gbt_var_decompress(internal) TO anon;
GRANT ALL ON FUNCTION public.gbt_var_decompress(internal) TO authenticated;
GRANT ALL ON FUNCTION public.gbt_var_decompress(internal) TO service_role;


--
-- Name: FUNCTION gbt_var_fetch(internal); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.gbt_var_fetch(internal) TO postgres;
GRANT ALL ON FUNCTION public.gbt_var_fetch(internal) TO anon;
GRANT ALL ON FUNCTION public.gbt_var_fetch(internal) TO authenticated;
GRANT ALL ON FUNCTION public.gbt_var_fetch(internal) TO service_role;


--
-- Name: FUNCTION gen_code(prefix text); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.gen_code(prefix text) TO anon;
GRANT ALL ON FUNCTION public.gen_code(prefix text) TO authenticated;
GRANT ALL ON FUNCTION public.gen_code(prefix text) TO service_role;


--
-- Name: FUNCTION gen_tank_code(p_site text, p_when timestamp with time zone); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.gen_tank_code(p_site text, p_when timestamp with time zone) TO anon;
GRANT ALL ON FUNCTION public.gen_tank_code(p_site text, p_when timestamp with time zone) TO authenticated;
GRANT ALL ON FUNCTION public.gen_tank_code(p_site text, p_when timestamp with time zone) TO service_role;


--
-- Name: FUNCTION gin_extract_query_trgm(text, internal, smallint, internal, internal, internal, internal); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.gin_extract_query_trgm(text, internal, smallint, internal, internal, internal, internal) TO postgres;
GRANT ALL ON FUNCTION public.gin_extract_query_trgm(text, internal, smallint, internal, internal, internal, internal) TO anon;
GRANT ALL ON FUNCTION public.gin_extract_query_trgm(text, internal, smallint, internal, internal, internal, internal) TO authenticated;
GRANT ALL ON FUNCTION public.gin_extract_query_trgm(text, internal, smallint, internal, internal, internal, internal) TO service_role;


--
-- Name: FUNCTION gin_extract_value_trgm(text, internal); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.gin_extract_value_trgm(text, internal) TO postgres;
GRANT ALL ON FUNCTION public.gin_extract_value_trgm(text, internal) TO anon;
GRANT ALL ON FUNCTION public.gin_extract_value_trgm(text, internal) TO authenticated;
GRANT ALL ON FUNCTION public.gin_extract_value_trgm(text, internal) TO service_role;


--
-- Name: FUNCTION gin_trgm_consistent(internal, smallint, text, integer, internal, internal, internal, internal); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.gin_trgm_consistent(internal, smallint, text, integer, internal, internal, internal, internal) TO postgres;
GRANT ALL ON FUNCTION public.gin_trgm_consistent(internal, smallint, text, integer, internal, internal, internal, internal) TO anon;
GRANT ALL ON FUNCTION public.gin_trgm_consistent(internal, smallint, text, integer, internal, internal, internal, internal) TO authenticated;
GRANT ALL ON FUNCTION public.gin_trgm_consistent(internal, smallint, text, integer, internal, internal, internal, internal) TO service_role;


--
-- Name: FUNCTION gin_trgm_triconsistent(internal, smallint, text, integer, internal, internal, internal); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.gin_trgm_triconsistent(internal, smallint, text, integer, internal, internal, internal) TO postgres;
GRANT ALL ON FUNCTION public.gin_trgm_triconsistent(internal, smallint, text, integer, internal, internal, internal) TO anon;
GRANT ALL ON FUNCTION public.gin_trgm_triconsistent(internal, smallint, text, integer, internal, internal, internal) TO authenticated;
GRANT ALL ON FUNCTION public.gin_trgm_triconsistent(internal, smallint, text, integer, internal, internal, internal) TO service_role;


--
-- Name: FUNCTION graduate_overage_nursery_fish(_target_tank_id bigint, _effective_at timestamp with time zone); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.graduate_overage_nursery_fish(_target_tank_id bigint, _effective_at timestamp with time zone) TO anon;
GRANT ALL ON FUNCTION public.graduate_overage_nursery_fish(_target_tank_id bigint, _effective_at timestamp with time zone) TO authenticated;
GRANT ALL ON FUNCTION public.graduate_overage_nursery_fish(_target_tank_id bigint, _effective_at timestamp with time zone) TO service_role;


--
-- Name: FUNCTION gtrgm_compress(internal); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.gtrgm_compress(internal) TO postgres;
GRANT ALL ON FUNCTION public.gtrgm_compress(internal) TO anon;
GRANT ALL ON FUNCTION public.gtrgm_compress(internal) TO authenticated;
GRANT ALL ON FUNCTION public.gtrgm_compress(internal) TO service_role;


--
-- Name: FUNCTION gtrgm_consistent(internal, text, smallint, oid, internal); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.gtrgm_consistent(internal, text, smallint, oid, internal) TO postgres;
GRANT ALL ON FUNCTION public.gtrgm_consistent(internal, text, smallint, oid, internal) TO anon;
GRANT ALL ON FUNCTION public.gtrgm_consistent(internal, text, smallint, oid, internal) TO authenticated;
GRANT ALL ON FUNCTION public.gtrgm_consistent(internal, text, smallint, oid, internal) TO service_role;


--
-- Name: FUNCTION gtrgm_decompress(internal); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.gtrgm_decompress(internal) TO postgres;
GRANT ALL ON FUNCTION public.gtrgm_decompress(internal) TO anon;
GRANT ALL ON FUNCTION public.gtrgm_decompress(internal) TO authenticated;
GRANT ALL ON FUNCTION public.gtrgm_decompress(internal) TO service_role;


--
-- Name: FUNCTION gtrgm_distance(internal, text, smallint, oid, internal); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.gtrgm_distance(internal, text, smallint, oid, internal) TO postgres;
GRANT ALL ON FUNCTION public.gtrgm_distance(internal, text, smallint, oid, internal) TO anon;
GRANT ALL ON FUNCTION public.gtrgm_distance(internal, text, smallint, oid, internal) TO authenticated;
GRANT ALL ON FUNCTION public.gtrgm_distance(internal, text, smallint, oid, internal) TO service_role;


--
-- Name: FUNCTION gtrgm_options(internal); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.gtrgm_options(internal) TO postgres;
GRANT ALL ON FUNCTION public.gtrgm_options(internal) TO anon;
GRANT ALL ON FUNCTION public.gtrgm_options(internal) TO authenticated;
GRANT ALL ON FUNCTION public.gtrgm_options(internal) TO service_role;


--
-- Name: FUNCTION gtrgm_penalty(internal, internal, internal); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.gtrgm_penalty(internal, internal, internal) TO postgres;
GRANT ALL ON FUNCTION public.gtrgm_penalty(internal, internal, internal) TO anon;
GRANT ALL ON FUNCTION public.gtrgm_penalty(internal, internal, internal) TO authenticated;
GRANT ALL ON FUNCTION public.gtrgm_penalty(internal, internal, internal) TO service_role;


--
-- Name: FUNCTION gtrgm_picksplit(internal, internal); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.gtrgm_picksplit(internal, internal) TO postgres;
GRANT ALL ON FUNCTION public.gtrgm_picksplit(internal, internal) TO anon;
GRANT ALL ON FUNCTION public.gtrgm_picksplit(internal, internal) TO authenticated;
GRANT ALL ON FUNCTION public.gtrgm_picksplit(internal, internal) TO service_role;


--
-- Name: FUNCTION gtrgm_same(public.gtrgm, public.gtrgm, internal); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.gtrgm_same(public.gtrgm, public.gtrgm, internal) TO postgres;
GRANT ALL ON FUNCTION public.gtrgm_same(public.gtrgm, public.gtrgm, internal) TO anon;
GRANT ALL ON FUNCTION public.gtrgm_same(public.gtrgm, public.gtrgm, internal) TO authenticated;
GRANT ALL ON FUNCTION public.gtrgm_same(public.gtrgm, public.gtrgm, internal) TO service_role;


--
-- Name: FUNCTION gtrgm_union(internal, internal); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.gtrgm_union(internal, internal) TO postgres;
GRANT ALL ON FUNCTION public.gtrgm_union(internal, internal) TO anon;
GRANT ALL ON FUNCTION public.gtrgm_union(internal, internal) TO authenticated;
GRANT ALL ON FUNCTION public.gtrgm_union(internal, internal) TO service_role;


--
-- Name: FUNCTION handle_new_user(); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.handle_new_user() TO anon;
GRANT ALL ON FUNCTION public.handle_new_user() TO authenticated;
GRANT ALL ON FUNCTION public.handle_new_user() TO service_role;


--
-- Name: FUNCTION int2_dist(smallint, smallint); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.int2_dist(smallint, smallint) TO postgres;
GRANT ALL ON FUNCTION public.int2_dist(smallint, smallint) TO anon;
GRANT ALL ON FUNCTION public.int2_dist(smallint, smallint) TO authenticated;
GRANT ALL ON FUNCTION public.int2_dist(smallint, smallint) TO service_role;


--
-- Name: FUNCTION int4_dist(integer, integer); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.int4_dist(integer, integer) TO postgres;
GRANT ALL ON FUNCTION public.int4_dist(integer, integer) TO anon;
GRANT ALL ON FUNCTION public.int4_dist(integer, integer) TO authenticated;
GRANT ALL ON FUNCTION public.int4_dist(integer, integer) TO service_role;


--
-- Name: FUNCTION int8_dist(bigint, bigint); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.int8_dist(bigint, bigint) TO postgres;
GRANT ALL ON FUNCTION public.int8_dist(bigint, bigint) TO anon;
GRANT ALL ON FUNCTION public.int8_dist(bigint, bigint) TO authenticated;
GRANT ALL ON FUNCTION public.int8_dist(bigint, bigint) TO service_role;


--
-- Name: FUNCTION interval_dist(interval, interval); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.interval_dist(interval, interval) TO postgres;
GRANT ALL ON FUNCTION public.interval_dist(interval, interval) TO anon;
GRANT ALL ON FUNCTION public.interval_dist(interval, interval) TO authenticated;
GRANT ALL ON FUNCTION public.interval_dist(interval, interval) TO service_role;


--
-- Name: FUNCTION move_fish(_fish_id bigint, _tank_id bigint, _moved_at timestamp with time zone); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.move_fish(_fish_id bigint, _tank_id bigint, _moved_at timestamp with time zone) TO anon;
GRANT ALL ON FUNCTION public.move_fish(_fish_id bigint, _tank_id bigint, _moved_at timestamp with time zone) TO authenticated;
GRANT ALL ON FUNCTION public.move_fish(_fish_id bigint, _tank_id bigint, _moved_at timestamp with time zone) TO service_role;


--
-- Name: FUNCTION oid_dist(oid, oid); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.oid_dist(oid, oid) TO postgres;
GRANT ALL ON FUNCTION public.oid_dist(oid, oid) TO anon;
GRANT ALL ON FUNCTION public.oid_dist(oid, oid) TO authenticated;
GRANT ALL ON FUNCTION public.oid_dist(oid, oid) TO service_role;


--
-- Name: FUNCTION parse_date_loose(txt text); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.parse_date_loose(txt text) TO anon;
GRANT ALL ON FUNCTION public.parse_date_loose(txt text) TO authenticated;
GRANT ALL ON FUNCTION public.parse_date_loose(txt text) TO service_role;


--
-- Name: FUNCTION prevent_delete_occupied_tank(); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.prevent_delete_occupied_tank() TO anon;
GRANT ALL ON FUNCTION public.prevent_delete_occupied_tank() TO authenticated;
GRANT ALL ON FUNCTION public.prevent_delete_occupied_tank() TO service_role;


--
-- Name: FUNCTION set_code_if_null(); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.set_code_if_null() TO anon;
GRANT ALL ON FUNCTION public.set_code_if_null() TO authenticated;
GRANT ALL ON FUNCTION public.set_code_if_null() TO service_role;


--
-- Name: FUNCTION set_created_by(); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.set_created_by() TO anon;
GRANT ALL ON FUNCTION public.set_created_by() TO authenticated;
GRANT ALL ON FUNCTION public.set_created_by() TO service_role;


--
-- Name: FUNCTION set_fish_code_per_year(); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.set_fish_code_per_year() TO anon;
GRANT ALL ON FUNCTION public.set_fish_code_per_year() TO authenticated;
GRANT ALL ON FUNCTION public.set_fish_code_per_year() TO service_role;


--
-- Name: FUNCTION set_limit(real); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.set_limit(real) TO postgres;
GRANT ALL ON FUNCTION public.set_limit(real) TO anon;
GRANT ALL ON FUNCTION public.set_limit(real) TO authenticated;
GRANT ALL ON FUNCTION public.set_limit(real) TO service_role;


--
-- Name: FUNCTION set_updated_at(); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.set_updated_at() TO anon;
GRANT ALL ON FUNCTION public.set_updated_at() TO authenticated;
GRANT ALL ON FUNCTION public.set_updated_at() TO service_role;


--
-- Name: FUNCTION show_limit(); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.show_limit() TO postgres;
GRANT ALL ON FUNCTION public.show_limit() TO anon;
GRANT ALL ON FUNCTION public.show_limit() TO authenticated;
GRANT ALL ON FUNCTION public.show_limit() TO service_role;


--
-- Name: FUNCTION show_trgm(text); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.show_trgm(text) TO postgres;
GRANT ALL ON FUNCTION public.show_trgm(text) TO anon;
GRANT ALL ON FUNCTION public.show_trgm(text) TO authenticated;
GRANT ALL ON FUNCTION public.show_trgm(text) TO service_role;


--
-- Name: FUNCTION similarity(text, text); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.similarity(text, text) TO postgres;
GRANT ALL ON FUNCTION public.similarity(text, text) TO anon;
GRANT ALL ON FUNCTION public.similarity(text, text) TO authenticated;
GRANT ALL ON FUNCTION public.similarity(text, text) TO service_role;


--
-- Name: FUNCTION similarity_dist(text, text); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.similarity_dist(text, text) TO postgres;
GRANT ALL ON FUNCTION public.similarity_dist(text, text) TO anon;
GRANT ALL ON FUNCTION public.similarity_dist(text, text) TO authenticated;
GRANT ALL ON FUNCTION public.similarity_dist(text, text) TO service_role;


--
-- Name: FUNCTION similarity_op(text, text); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.similarity_op(text, text) TO postgres;
GRANT ALL ON FUNCTION public.similarity_op(text, text) TO anon;
GRANT ALL ON FUNCTION public.similarity_op(text, text) TO authenticated;
GRANT ALL ON FUNCTION public.similarity_op(text, text) TO service_role;


--
-- Name: FUNCTION strict_word_similarity(text, text); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.strict_word_similarity(text, text) TO postgres;
GRANT ALL ON FUNCTION public.strict_word_similarity(text, text) TO anon;
GRANT ALL ON FUNCTION public.strict_word_similarity(text, text) TO authenticated;
GRANT ALL ON FUNCTION public.strict_word_similarity(text, text) TO service_role;


--
-- Name: FUNCTION strict_word_similarity_commutator_op(text, text); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.strict_word_similarity_commutator_op(text, text) TO postgres;
GRANT ALL ON FUNCTION public.strict_word_similarity_commutator_op(text, text) TO anon;
GRANT ALL ON FUNCTION public.strict_word_similarity_commutator_op(text, text) TO authenticated;
GRANT ALL ON FUNCTION public.strict_word_similarity_commutator_op(text, text) TO service_role;


--
-- Name: FUNCTION strict_word_similarity_dist_commutator_op(text, text); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.strict_word_similarity_dist_commutator_op(text, text) TO postgres;
GRANT ALL ON FUNCTION public.strict_word_similarity_dist_commutator_op(text, text) TO anon;
GRANT ALL ON FUNCTION public.strict_word_similarity_dist_commutator_op(text, text) TO authenticated;
GRANT ALL ON FUNCTION public.strict_word_similarity_dist_commutator_op(text, text) TO service_role;


--
-- Name: FUNCTION strict_word_similarity_dist_op(text, text); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.strict_word_similarity_dist_op(text, text) TO postgres;
GRANT ALL ON FUNCTION public.strict_word_similarity_dist_op(text, text) TO anon;
GRANT ALL ON FUNCTION public.strict_word_similarity_dist_op(text, text) TO authenticated;
GRANT ALL ON FUNCTION public.strict_word_similarity_dist_op(text, text) TO service_role;


--
-- Name: FUNCTION strict_word_similarity_op(text, text); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.strict_word_similarity_op(text, text) TO postgres;
GRANT ALL ON FUNCTION public.strict_word_similarity_op(text, text) TO anon;
GRANT ALL ON FUNCTION public.strict_word_similarity_op(text, text) TO authenticated;
GRANT ALL ON FUNCTION public.strict_word_similarity_op(text, text) TO service_role;


--
-- Name: FUNCTION tanks_set_code(); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.tanks_set_code() TO anon;
GRANT ALL ON FUNCTION public.tanks_set_code() TO authenticated;
GRANT ALL ON FUNCTION public.tanks_set_code() TO service_role;


--
-- Name: FUNCTION tanks_tank_code_immutable(); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.tanks_tank_code_immutable() TO anon;
GRANT ALL ON FUNCTION public.tanks_tank_code_immutable() TO authenticated;
GRANT ALL ON FUNCTION public.tanks_tank_code_immutable() TO service_role;


--
-- Name: FUNCTION time_dist(time without time zone, time without time zone); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.time_dist(time without time zone, time without time zone) TO postgres;
GRANT ALL ON FUNCTION public.time_dist(time without time zone, time without time zone) TO anon;
GRANT ALL ON FUNCTION public.time_dist(time without time zone, time without time zone) TO authenticated;
GRANT ALL ON FUNCTION public.time_dist(time without time zone, time without time zone) TO service_role;


--
-- Name: FUNCTION ts_dist(timestamp without time zone, timestamp without time zone); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.ts_dist(timestamp without time zone, timestamp without time zone) TO postgres;
GRANT ALL ON FUNCTION public.ts_dist(timestamp without time zone, timestamp without time zone) TO anon;
GRANT ALL ON FUNCTION public.ts_dist(timestamp without time zone, timestamp without time zone) TO authenticated;
GRANT ALL ON FUNCTION public.ts_dist(timestamp without time zone, timestamp without time zone) TO service_role;


--
-- Name: FUNCTION tstz_dist(timestamp with time zone, timestamp with time zone); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.tstz_dist(timestamp with time zone, timestamp with time zone) TO postgres;
GRANT ALL ON FUNCTION public.tstz_dist(timestamp with time zone, timestamp with time zone) TO anon;
GRANT ALL ON FUNCTION public.tstz_dist(timestamp with time zone, timestamp with time zone) TO authenticated;
GRANT ALL ON FUNCTION public.tstz_dist(timestamp with time zone, timestamp with time zone) TO service_role;


--
-- Name: FUNCTION word_similarity(text, text); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.word_similarity(text, text) TO postgres;
GRANT ALL ON FUNCTION public.word_similarity(text, text) TO anon;
GRANT ALL ON FUNCTION public.word_similarity(text, text) TO authenticated;
GRANT ALL ON FUNCTION public.word_similarity(text, text) TO service_role;


--
-- Name: FUNCTION word_similarity_commutator_op(text, text); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.word_similarity_commutator_op(text, text) TO postgres;
GRANT ALL ON FUNCTION public.word_similarity_commutator_op(text, text) TO anon;
GRANT ALL ON FUNCTION public.word_similarity_commutator_op(text, text) TO authenticated;
GRANT ALL ON FUNCTION public.word_similarity_commutator_op(text, text) TO service_role;


--
-- Name: FUNCTION word_similarity_dist_commutator_op(text, text); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.word_similarity_dist_commutator_op(text, text) TO postgres;
GRANT ALL ON FUNCTION public.word_similarity_dist_commutator_op(text, text) TO anon;
GRANT ALL ON FUNCTION public.word_similarity_dist_commutator_op(text, text) TO authenticated;
GRANT ALL ON FUNCTION public.word_similarity_dist_commutator_op(text, text) TO service_role;


--
-- Name: FUNCTION word_similarity_dist_op(text, text); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.word_similarity_dist_op(text, text) TO postgres;
GRANT ALL ON FUNCTION public.word_similarity_dist_op(text, text) TO anon;
GRANT ALL ON FUNCTION public.word_similarity_dist_op(text, text) TO authenticated;
GRANT ALL ON FUNCTION public.word_similarity_dist_op(text, text) TO service_role;


--
-- Name: FUNCTION word_similarity_op(text, text); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.word_similarity_op(text, text) TO postgres;
GRANT ALL ON FUNCTION public.word_similarity_op(text, text) TO anon;
GRANT ALL ON FUNCTION public.word_similarity_op(text, text) TO authenticated;
GRANT ALL ON FUNCTION public.word_similarity_op(text, text) TO service_role;


--
-- Name: FUNCTION apply_rls(wal jsonb, max_record_bytes integer); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO postgres;
GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO anon;
GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO authenticated;
GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO service_role;
GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO supabase_realtime_admin;


--
-- Name: FUNCTION broadcast_changes(topic_name text, event_name text, operation text, table_name text, table_schema text, new record, old record, level text); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.broadcast_changes(topic_name text, event_name text, operation text, table_name text, table_schema text, new record, old record, level text) TO postgres;
GRANT ALL ON FUNCTION realtime.broadcast_changes(topic_name text, event_name text, operation text, table_name text, table_schema text, new record, old record, level text) TO dashboard_user;


--
-- Name: FUNCTION build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO postgres;
GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO anon;
GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO authenticated;
GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO service_role;
GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO supabase_realtime_admin;


--
-- Name: FUNCTION "cast"(val text, type_ regtype); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO postgres;
GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO dashboard_user;
GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO anon;
GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO authenticated;
GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO service_role;
GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO supabase_realtime_admin;


--
-- Name: FUNCTION check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO postgres;
GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO anon;
GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO authenticated;
GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO service_role;
GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO supabase_realtime_admin;


--
-- Name: FUNCTION is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO postgres;
GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO anon;
GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO authenticated;
GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO service_role;
GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO supabase_realtime_admin;


--
-- Name: FUNCTION list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) TO postgres;
GRANT ALL ON FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) TO anon;
GRANT ALL ON FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) TO authenticated;
GRANT ALL ON FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) TO service_role;
GRANT ALL ON FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) TO supabase_realtime_admin;


--
-- Name: FUNCTION quote_wal2json(entity regclass); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO postgres;
GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO anon;
GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO authenticated;
GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO service_role;
GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO supabase_realtime_admin;


--
-- Name: FUNCTION send(payload jsonb, event text, topic text, private boolean); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.send(payload jsonb, event text, topic text, private boolean) TO postgres;
GRANT ALL ON FUNCTION realtime.send(payload jsonb, event text, topic text, private boolean) TO dashboard_user;


--
-- Name: FUNCTION subscription_check_filters(); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO postgres;
GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO dashboard_user;
GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO anon;
GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO authenticated;
GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO service_role;
GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO supabase_realtime_admin;


--
-- Name: FUNCTION to_regrole(role_name text); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO postgres;
GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO anon;
GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO authenticated;
GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO service_role;
GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO supabase_realtime_admin;


--
-- Name: FUNCTION topic(); Type: ACL; Schema: realtime; Owner: supabase_realtime_admin
--

GRANT ALL ON FUNCTION realtime.topic() TO postgres;
GRANT ALL ON FUNCTION realtime.topic() TO dashboard_user;


--
-- Name: FUNCTION _crypto_aead_det_decrypt(message bytea, additional bytea, key_id bigint, context bytea, nonce bytea); Type: ACL; Schema: vault; Owner: supabase_admin
--

GRANT ALL ON FUNCTION vault._crypto_aead_det_decrypt(message bytea, additional bytea, key_id bigint, context bytea, nonce bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION vault._crypto_aead_det_decrypt(message bytea, additional bytea, key_id bigint, context bytea, nonce bytea) TO service_role;


--
-- Name: FUNCTION create_secret(new_secret text, new_name text, new_description text, new_key_id uuid); Type: ACL; Schema: vault; Owner: supabase_admin
--

GRANT ALL ON FUNCTION vault.create_secret(new_secret text, new_name text, new_description text, new_key_id uuid) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION vault.create_secret(new_secret text, new_name text, new_description text, new_key_id uuid) TO service_role;


--
-- Name: FUNCTION update_secret(secret_id uuid, new_secret text, new_name text, new_description text, new_key_id uuid); Type: ACL; Schema: vault; Owner: supabase_admin
--

GRANT ALL ON FUNCTION vault.update_secret(secret_id uuid, new_secret text, new_name text, new_description text, new_key_id uuid) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION vault.update_secret(secret_id uuid, new_secret text, new_name text, new_description text, new_key_id uuid) TO service_role;


--
-- Name: TABLE audit_log_entries; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.audit_log_entries TO dashboard_user;
GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.audit_log_entries TO postgres;
GRANT SELECT ON TABLE auth.audit_log_entries TO postgres WITH GRANT OPTION;


--
-- Name: TABLE flow_state; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.flow_state TO postgres;
GRANT SELECT ON TABLE auth.flow_state TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.flow_state TO dashboard_user;


--
-- Name: TABLE identities; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.identities TO postgres;
GRANT SELECT ON TABLE auth.identities TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.identities TO dashboard_user;


--
-- Name: TABLE instances; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.instances TO dashboard_user;
GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.instances TO postgres;
GRANT SELECT ON TABLE auth.instances TO postgres WITH GRANT OPTION;


--
-- Name: TABLE mfa_amr_claims; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.mfa_amr_claims TO postgres;
GRANT SELECT ON TABLE auth.mfa_amr_claims TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.mfa_amr_claims TO dashboard_user;


--
-- Name: TABLE mfa_challenges; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.mfa_challenges TO postgres;
GRANT SELECT ON TABLE auth.mfa_challenges TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.mfa_challenges TO dashboard_user;


--
-- Name: TABLE mfa_factors; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.mfa_factors TO postgres;
GRANT SELECT ON TABLE auth.mfa_factors TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.mfa_factors TO dashboard_user;


--
-- Name: TABLE oauth_clients; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.oauth_clients TO postgres;
GRANT ALL ON TABLE auth.oauth_clients TO dashboard_user;


--
-- Name: TABLE one_time_tokens; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.one_time_tokens TO postgres;
GRANT SELECT ON TABLE auth.one_time_tokens TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.one_time_tokens TO dashboard_user;


--
-- Name: TABLE refresh_tokens; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.refresh_tokens TO dashboard_user;
GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.refresh_tokens TO postgres;
GRANT SELECT ON TABLE auth.refresh_tokens TO postgres WITH GRANT OPTION;


--
-- Name: SEQUENCE refresh_tokens_id_seq; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON SEQUENCE auth.refresh_tokens_id_seq TO dashboard_user;
GRANT ALL ON SEQUENCE auth.refresh_tokens_id_seq TO postgres;


--
-- Name: TABLE saml_providers; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.saml_providers TO postgres;
GRANT SELECT ON TABLE auth.saml_providers TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.saml_providers TO dashboard_user;


--
-- Name: TABLE saml_relay_states; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.saml_relay_states TO postgres;
GRANT SELECT ON TABLE auth.saml_relay_states TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.saml_relay_states TO dashboard_user;


--
-- Name: TABLE schema_migrations; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT SELECT ON TABLE auth.schema_migrations TO postgres WITH GRANT OPTION;


--
-- Name: TABLE sessions; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.sessions TO postgres;
GRANT SELECT ON TABLE auth.sessions TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.sessions TO dashboard_user;


--
-- Name: TABLE sso_domains; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.sso_domains TO postgres;
GRANT SELECT ON TABLE auth.sso_domains TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.sso_domains TO dashboard_user;


--
-- Name: TABLE sso_providers; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.sso_providers TO postgres;
GRANT SELECT ON TABLE auth.sso_providers TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.sso_providers TO dashboard_user;


--
-- Name: TABLE users; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.users TO dashboard_user;
GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.users TO postgres;
GRANT SELECT ON TABLE auth.users TO postgres WITH GRANT OPTION;


--
-- Name: TABLE pg_stat_statements; Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON TABLE extensions.pg_stat_statements FROM postgres;
GRANT ALL ON TABLE extensions.pg_stat_statements TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE extensions.pg_stat_statements TO dashboard_user;


--
-- Name: TABLE pg_stat_statements_info; Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON TABLE extensions.pg_stat_statements_info FROM postgres;
GRANT ALL ON TABLE extensions.pg_stat_statements_info TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE extensions.pg_stat_statements_info TO dashboard_user;


--
-- Name: TABLE dyes; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.dyes TO anon;
GRANT ALL ON TABLE public.dyes TO authenticated;
GRANT ALL ON TABLE public.dyes TO service_role;


--
-- Name: SEQUENCE dyes_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.dyes_id_seq TO anon;
GRANT ALL ON SEQUENCE public.dyes_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.dyes_id_seq TO service_role;


--
-- Name: TABLE fish; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.fish TO anon;
GRANT ALL ON TABLE public.fish TO authenticated;
GRANT ALL ON TABLE public.fish TO service_role;


--
-- Name: SEQUENCE fish_code_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.fish_code_seq TO anon;
GRANT ALL ON SEQUENCE public.fish_code_seq TO authenticated;
GRANT ALL ON SEQUENCE public.fish_code_seq TO service_role;


--
-- Name: TABLE fish_tank_memberships; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.fish_tank_memberships TO anon;
GRANT ALL ON TABLE public.fish_tank_memberships TO authenticated;
GRANT ALL ON TABLE public.fish_tank_memberships TO service_role;


--
-- Name: TABLE fish_current_tank; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.fish_current_tank TO anon;
GRANT ALL ON TABLE public.fish_current_tank TO authenticated;
GRANT ALL ON TABLE public.fish_current_tank TO service_role;


--
-- Name: SEQUENCE fish_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.fish_id_seq TO anon;
GRANT ALL ON SEQUENCE public.fish_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.fish_id_seq TO service_role;


--
-- Name: TABLE fish_mounts; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.fish_mounts TO anon;
GRANT ALL ON TABLE public.fish_mounts TO authenticated;
GRANT ALL ON TABLE public.fish_mounts TO service_role;


--
-- Name: TABLE fish_mutations; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.fish_mutations TO anon;
GRANT ALL ON TABLE public.fish_mutations TO authenticated;
GRANT ALL ON TABLE public.fish_mutations TO service_role;


--
-- Name: TABLE fish_parents; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.fish_parents TO anon;
GRANT ALL ON TABLE public.fish_parents TO authenticated;
GRANT ALL ON TABLE public.fish_parents TO service_role;


--
-- Name: TABLE fish_selectedphenotypes; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.fish_selectedphenotypes TO anon;
GRANT ALL ON TABLE public.fish_selectedphenotypes TO authenticated;
GRANT ALL ON TABLE public.fish_selectedphenotypes TO service_role;


--
-- Name: TABLE fish_strains; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.fish_strains TO anon;
GRANT ALL ON TABLE public.fish_strains TO authenticated;
GRANT ALL ON TABLE public.fish_strains TO service_role;


--
-- Name: TABLE tanks; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.tanks TO anon;
GRANT ALL ON TABLE public.tanks TO authenticated;
GRANT ALL ON TABLE public.tanks TO service_role;


--
-- Name: TABLE fish_tank_history; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.fish_tank_history TO anon;
GRANT ALL ON TABLE public.fish_tank_history TO authenticated;
GRANT ALL ON TABLE public.fish_tank_history TO service_role;


--
-- Name: SEQUENCE fish_tank_memberships_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.fish_tank_memberships_id_seq TO anon;
GRANT ALL ON SEQUENCE public.fish_tank_memberships_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.fish_tank_memberships_id_seq TO service_role;


--
-- Name: TABLE fish_transgenes; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.fish_transgenes TO anon;
GRANT ALL ON TABLE public.fish_transgenes TO authenticated;
GRANT ALL ON TABLE public.fish_transgenes TO service_role;


--
-- Name: TABLE fish_transgenes_unresolved_audit; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.fish_transgenes_unresolved_audit TO anon;
GRANT ALL ON TABLE public.fish_transgenes_unresolved_audit TO authenticated;
GRANT ALL ON TABLE public.fish_transgenes_unresolved_audit TO service_role;


--
-- Name: TABLE fish_treatments; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.fish_treatments TO anon;
GRANT ALL ON TABLE public.fish_treatments TO authenticated;
GRANT ALL ON TABLE public.fish_treatments TO service_role;


--
-- Name: SEQUENCE fish_treatments_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.fish_treatments_id_seq TO anon;
GRANT ALL ON SEQUENCE public.fish_treatments_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.fish_treatments_id_seq TO service_role;


--
-- Name: TABLE fish_year_counters; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.fish_year_counters TO anon;
GRANT ALL ON TABLE public.fish_year_counters TO authenticated;
GRANT ALL ON TABLE public.fish_year_counters TO service_role;


--
-- Name: TABLE fluors; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.fluors TO anon;
GRANT ALL ON TABLE public.fluors TO authenticated;
GRANT ALL ON TABLE public.fluors TO service_role;


--
-- Name: SEQUENCE fluors_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.fluors_id_seq TO anon;
GRANT ALL ON SEQUENCE public.fluors_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.fluors_id_seq TO service_role;


--
-- Name: TABLE mounts; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.mounts TO anon;
GRANT ALL ON TABLE public.mounts TO authenticated;
GRANT ALL ON TABLE public.mounts TO service_role;


--
-- Name: TABLE mutations; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.mutations TO anon;
GRANT ALL ON TABLE public.mutations TO authenticated;
GRANT ALL ON TABLE public.mutations TO service_role;


--
-- Name: SEQUENCE mutations_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.mutations_id_seq TO anon;
GRANT ALL ON SEQUENCE public.mutations_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.mutations_id_seq TO service_role;


--
-- Name: TABLE tank_categories; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.tank_categories TO anon;
GRANT ALL ON TABLE public.tank_categories TO authenticated;
GRANT ALL ON TABLE public.tank_categories TO service_role;


--
-- Name: TABLE nursery_current; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.nursery_current TO anon;
GRANT ALL ON TABLE public.nursery_current TO authenticated;
GRANT ALL ON TABLE public.nursery_current TO service_role;


--
-- Name: TABLE nursery_graduation_queue; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.nursery_graduation_queue TO anon;
GRANT ALL ON TABLE public.nursery_graduation_queue TO authenticated;
GRANT ALL ON TABLE public.nursery_graduation_queue TO service_role;


--
-- Name: TABLE plasmid_dyes; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.plasmid_dyes TO anon;
GRANT ALL ON TABLE public.plasmid_dyes TO authenticated;
GRANT ALL ON TABLE public.plasmid_dyes TO service_role;


--
-- Name: TABLE plasmid_fluors; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.plasmid_fluors TO anon;
GRANT ALL ON TABLE public.plasmid_fluors TO authenticated;
GRANT ALL ON TABLE public.plasmid_fluors TO service_role;


--
-- Name: TABLE plasmids; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.plasmids TO anon;
GRANT ALL ON TABLE public.plasmids TO authenticated;
GRANT ALL ON TABLE public.plasmids TO service_role;


--
-- Name: TABLE plasmids_cassettes; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.plasmids_cassettes TO anon;
GRANT ALL ON TABLE public.plasmids_cassettes TO authenticated;
GRANT ALL ON TABLE public.plasmids_cassettes TO service_role;


--
-- Name: SEQUENCE plasmids_cassettes_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.plasmids_cassettes_id_seq TO anon;
GRANT ALL ON SEQUENCE public.plasmids_cassettes_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.plasmids_cassettes_id_seq TO service_role;


--
-- Name: SEQUENCE plasmids_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.plasmids_id_seq TO anon;
GRANT ALL ON SEQUENCE public.plasmids_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.plasmids_id_seq TO service_role;


--
-- Name: TABLE profiles; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.profiles TO anon;
GRANT ALL ON TABLE public.profiles TO authenticated;
GRANT ALL ON TABLE public.profiles TO service_role;


--
-- Name: TABLE rna; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.rna TO anon;
GRANT ALL ON TABLE public.rna TO authenticated;
GRANT ALL ON TABLE public.rna TO service_role;


--
-- Name: TABLE rna_fluors; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.rna_fluors TO anon;
GRANT ALL ON TABLE public.rna_fluors TO authenticated;
GRANT ALL ON TABLE public.rna_fluors TO service_role;


--
-- Name: TABLE seedmap_dyes; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.seedmap_dyes TO anon;
GRANT ALL ON TABLE public.seedmap_dyes TO authenticated;
GRANT ALL ON TABLE public.seedmap_dyes TO service_role;


--
-- Name: TABLE seedmap_fish; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.seedmap_fish TO anon;
GRANT ALL ON TABLE public.seedmap_fish TO authenticated;
GRANT ALL ON TABLE public.seedmap_fish TO service_role;


--
-- Name: TABLE seedmap_fluors; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.seedmap_fluors TO anon;
GRANT ALL ON TABLE public.seedmap_fluors TO authenticated;
GRANT ALL ON TABLE public.seedmap_fluors TO service_role;


--
-- Name: TABLE seedmap_mounts; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.seedmap_mounts TO anon;
GRANT ALL ON TABLE public.seedmap_mounts TO authenticated;
GRANT ALL ON TABLE public.seedmap_mounts TO service_role;


--
-- Name: TABLE seedmap_mutations; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.seedmap_mutations TO anon;
GRANT ALL ON TABLE public.seedmap_mutations TO authenticated;
GRANT ALL ON TABLE public.seedmap_mutations TO service_role;


--
-- Name: TABLE seedmap_plasmids; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.seedmap_plasmids TO anon;
GRANT ALL ON TABLE public.seedmap_plasmids TO authenticated;
GRANT ALL ON TABLE public.seedmap_plasmids TO service_role;


--
-- Name: TABLE seedmap_rna; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.seedmap_rna TO anon;
GRANT ALL ON TABLE public.seedmap_rna TO authenticated;
GRANT ALL ON TABLE public.seedmap_rna TO service_role;


--
-- Name: TABLE seedmap_selectedphenotypes; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.seedmap_selectedphenotypes TO anon;
GRANT ALL ON TABLE public.seedmap_selectedphenotypes TO authenticated;
GRANT ALL ON TABLE public.seedmap_selectedphenotypes TO service_role;


--
-- Name: TABLE seedmap_strains; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.seedmap_strains TO anon;
GRANT ALL ON TABLE public.seedmap_strains TO authenticated;
GRANT ALL ON TABLE public.seedmap_strains TO service_role;


--
-- Name: TABLE seedmap_tanks; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.seedmap_tanks TO anon;
GRANT ALL ON TABLE public.seedmap_tanks TO authenticated;
GRANT ALL ON TABLE public.seedmap_tanks TO service_role;


--
-- Name: TABLE seedmap_transgenes; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.seedmap_transgenes TO anon;
GRANT ALL ON TABLE public.seedmap_transgenes TO authenticated;
GRANT ALL ON TABLE public.seedmap_transgenes TO service_role;


--
-- Name: TABLE seedmap_treatments; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.seedmap_treatments TO anon;
GRANT ALL ON TABLE public.seedmap_treatments TO authenticated;
GRANT ALL ON TABLE public.seedmap_treatments TO service_role;


--
-- Name: TABLE selectedphenotypes; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.selectedphenotypes TO anon;
GRANT ALL ON TABLE public.selectedphenotypes TO authenticated;
GRANT ALL ON TABLE public.selectedphenotypes TO service_role;


--
-- Name: SEQUENCE selectedphenotypes_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.selectedphenotypes_id_seq TO anon;
GRANT ALL ON SEQUENCE public.selectedphenotypes_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.selectedphenotypes_id_seq TO service_role;


--
-- Name: TABLE staging_dyes; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.staging_dyes TO anon;
GRANT ALL ON TABLE public.staging_dyes TO authenticated;
GRANT ALL ON TABLE public.staging_dyes TO service_role;


--
-- Name: TABLE staging_fish; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.staging_fish TO anon;
GRANT ALL ON TABLE public.staging_fish TO authenticated;
GRANT ALL ON TABLE public.staging_fish TO service_role;


--
-- Name: TABLE staging_fish_parents; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.staging_fish_parents TO anon;
GRANT ALL ON TABLE public.staging_fish_parents TO authenticated;
GRANT ALL ON TABLE public.staging_fish_parents TO service_role;


--
-- Name: TABLE staging_fish_tank_history; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.staging_fish_tank_history TO anon;
GRANT ALL ON TABLE public.staging_fish_tank_history TO authenticated;
GRANT ALL ON TABLE public.staging_fish_tank_history TO service_role;


--
-- Name: TABLE staging_fish_transgenes; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.staging_fish_transgenes TO anon;
GRANT ALL ON TABLE public.staging_fish_transgenes TO authenticated;
GRANT ALL ON TABLE public.staging_fish_transgenes TO service_role;


--
-- Name: TABLE staging_fluors; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.staging_fluors TO anon;
GRANT ALL ON TABLE public.staging_fluors TO authenticated;
GRANT ALL ON TABLE public.staging_fluors TO service_role;


--
-- Name: TABLE staging_mounts; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.staging_mounts TO anon;
GRANT ALL ON TABLE public.staging_mounts TO authenticated;
GRANT ALL ON TABLE public.staging_mounts TO service_role;


--
-- Name: TABLE staging_mutations; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.staging_mutations TO anon;
GRANT ALL ON TABLE public.staging_mutations TO authenticated;
GRANT ALL ON TABLE public.staging_mutations TO service_role;


--
-- Name: TABLE staging_plasmid_fluors; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.staging_plasmid_fluors TO anon;
GRANT ALL ON TABLE public.staging_plasmid_fluors TO authenticated;
GRANT ALL ON TABLE public.staging_plasmid_fluors TO service_role;


--
-- Name: TABLE staging_plasmids; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.staging_plasmids TO anon;
GRANT ALL ON TABLE public.staging_plasmids TO authenticated;
GRANT ALL ON TABLE public.staging_plasmids TO service_role;


--
-- Name: TABLE staging_rna; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.staging_rna TO anon;
GRANT ALL ON TABLE public.staging_rna TO authenticated;
GRANT ALL ON TABLE public.staging_rna TO service_role;


--
-- Name: TABLE staging_rna_fluors; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.staging_rna_fluors TO anon;
GRANT ALL ON TABLE public.staging_rna_fluors TO authenticated;
GRANT ALL ON TABLE public.staging_rna_fluors TO service_role;


--
-- Name: TABLE staging_selectedphenotypes; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.staging_selectedphenotypes TO anon;
GRANT ALL ON TABLE public.staging_selectedphenotypes TO authenticated;
GRANT ALL ON TABLE public.staging_selectedphenotypes TO service_role;


--
-- Name: TABLE staging_strains; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.staging_strains TO anon;
GRANT ALL ON TABLE public.staging_strains TO authenticated;
GRANT ALL ON TABLE public.staging_strains TO service_role;


--
-- Name: TABLE staging_tanks; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.staging_tanks TO anon;
GRANT ALL ON TABLE public.staging_tanks TO authenticated;
GRANT ALL ON TABLE public.staging_tanks TO service_role;


--
-- Name: TABLE staging_tanks_optional; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.staging_tanks_optional TO anon;
GRANT ALL ON TABLE public.staging_tanks_optional TO authenticated;
GRANT ALL ON TABLE public.staging_tanks_optional TO service_role;


--
-- Name: TABLE staging_transgene_fluors; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.staging_transgene_fluors TO anon;
GRANT ALL ON TABLE public.staging_transgene_fluors TO authenticated;
GRANT ALL ON TABLE public.staging_transgene_fluors TO service_role;


--
-- Name: TABLE staging_transgenes; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.staging_transgenes TO anon;
GRANT ALL ON TABLE public.staging_transgenes TO authenticated;
GRANT ALL ON TABLE public.staging_transgenes TO service_role;


--
-- Name: TABLE staging_treatment_dyes; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.staging_treatment_dyes TO anon;
GRANT ALL ON TABLE public.staging_treatment_dyes TO authenticated;
GRANT ALL ON TABLE public.staging_treatment_dyes TO service_role;


--
-- Name: TABLE staging_treatment_plasmids; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.staging_treatment_plasmids TO anon;
GRANT ALL ON TABLE public.staging_treatment_plasmids TO authenticated;
GRANT ALL ON TABLE public.staging_treatment_plasmids TO service_role;


--
-- Name: TABLE staging_treatment_rnas; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.staging_treatment_rnas TO anon;
GRANT ALL ON TABLE public.staging_treatment_rnas TO authenticated;
GRANT ALL ON TABLE public.staging_treatment_rnas TO service_role;


--
-- Name: TABLE staging_treatments; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.staging_treatments TO anon;
GRANT ALL ON TABLE public.staging_treatments TO authenticated;
GRANT ALL ON TABLE public.staging_treatments TO service_role;


--
-- Name: TABLE strains; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.strains TO anon;
GRANT ALL ON TABLE public.strains TO authenticated;
GRANT ALL ON TABLE public.strains TO service_role;


--
-- Name: SEQUENCE strains_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.strains_id_seq TO anon;
GRANT ALL ON SEQUENCE public.strains_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.strains_id_seq TO service_role;


--
-- Name: SEQUENCE tank_categories_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.tank_categories_id_seq TO anon;
GRANT ALL ON SEQUENCE public.tank_categories_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.tank_categories_id_seq TO service_role;


--
-- Name: TABLE tank_code_counters_site_yy; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.tank_code_counters_site_yy TO anon;
GRANT ALL ON TABLE public.tank_code_counters_site_yy TO authenticated;
GRANT ALL ON TABLE public.tank_code_counters_site_yy TO service_role;


--
-- Name: TABLE tank_current_fish; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.tank_current_fish TO anon;
GRANT ALL ON TABLE public.tank_current_fish TO authenticated;
GRANT ALL ON TABLE public.tank_current_fish TO service_role;


--
-- Name: TABLE tank_occupancy_current; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.tank_occupancy_current TO anon;
GRANT ALL ON TABLE public.tank_occupancy_current TO authenticated;
GRANT ALL ON TABLE public.tank_occupancy_current TO service_role;


--
-- Name: TABLE tank_year_counters; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.tank_year_counters TO anon;
GRANT ALL ON TABLE public.tank_year_counters TO authenticated;
GRANT ALL ON TABLE public.tank_year_counters TO service_role;


--
-- Name: SEQUENCE tanks_code_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.tanks_code_seq TO anon;
GRANT ALL ON SEQUENCE public.tanks_code_seq TO authenticated;
GRANT ALL ON SEQUENCE public.tanks_code_seq TO service_role;


--
-- Name: SEQUENCE tanks_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.tanks_id_seq TO anon;
GRANT ALL ON SEQUENCE public.tanks_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.tanks_id_seq TO service_role;


--
-- Name: TABLE transgene_fluors; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.transgene_fluors TO anon;
GRANT ALL ON TABLE public.transgene_fluors TO authenticated;
GRANT ALL ON TABLE public.transgene_fluors TO service_role;


--
-- Name: SEQUENCE transgene_fluors_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.transgene_fluors_id_seq TO anon;
GRANT ALL ON SEQUENCE public.transgene_fluors_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.transgene_fluors_id_seq TO service_role;


--
-- Name: TABLE transgenes; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.transgenes TO anon;
GRANT ALL ON TABLE public.transgenes TO authenticated;
GRANT ALL ON TABLE public.transgenes TO service_role;


--
-- Name: TABLE transgenes_fluors; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.transgenes_fluors TO anon;
GRANT ALL ON TABLE public.transgenes_fluors TO authenticated;
GRANT ALL ON TABLE public.transgenes_fluors TO service_role;


--
-- Name: SEQUENCE transgenes_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.transgenes_id_seq TO anon;
GRANT ALL ON SEQUENCE public.transgenes_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.transgenes_id_seq TO service_role;


--
-- Name: TABLE treatment_dyes_old; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.treatment_dyes_old TO anon;
GRANT ALL ON TABLE public.treatment_dyes_old TO authenticated;
GRANT ALL ON TABLE public.treatment_dyes_old TO service_role;


--
-- Name: TABLE treatment_plasmids; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.treatment_plasmids TO anon;
GRANT ALL ON TABLE public.treatment_plasmids TO authenticated;
GRANT ALL ON TABLE public.treatment_plasmids TO service_role;


--
-- Name: TABLE treatment_rnas; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.treatment_rnas TO anon;
GRANT ALL ON TABLE public.treatment_rnas TO authenticated;
GRANT ALL ON TABLE public.treatment_rnas TO service_role;


--
-- Name: TABLE treatments; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.treatments TO anon;
GRANT ALL ON TABLE public.treatments TO authenticated;
GRANT ALL ON TABLE public.treatments TO service_role;


--
-- Name: TABLE treatment_components_v; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.treatment_components_v TO anon;
GRANT ALL ON TABLE public.treatment_components_v TO authenticated;
GRANT ALL ON TABLE public.treatment_components_v TO service_role;


--
-- Name: TABLE treatment_dyes; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.treatment_dyes TO anon;
GRANT ALL ON TABLE public.treatment_dyes TO authenticated;
GRANT ALL ON TABLE public.treatment_dyes TO service_role;


--
-- Name: TABLE treatments_dyes; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.treatments_dyes TO anon;
GRANT ALL ON TABLE public.treatments_dyes TO authenticated;
GRANT ALL ON TABLE public.treatments_dyes TO service_role;


--
-- Name: TABLE messages; Type: ACL; Schema: realtime; Owner: supabase_realtime_admin
--

GRANT ALL ON TABLE realtime.messages TO postgres;
GRANT ALL ON TABLE realtime.messages TO dashboard_user;
GRANT SELECT,INSERT,UPDATE ON TABLE realtime.messages TO anon;
GRANT SELECT,INSERT,UPDATE ON TABLE realtime.messages TO authenticated;
GRANT SELECT,INSERT,UPDATE ON TABLE realtime.messages TO service_role;


--
-- Name: TABLE schema_migrations; Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON TABLE realtime.schema_migrations TO postgres;
GRANT ALL ON TABLE realtime.schema_migrations TO dashboard_user;
GRANT SELECT ON TABLE realtime.schema_migrations TO anon;
GRANT SELECT ON TABLE realtime.schema_migrations TO authenticated;
GRANT SELECT ON TABLE realtime.schema_migrations TO service_role;
GRANT ALL ON TABLE realtime.schema_migrations TO supabase_realtime_admin;


--
-- Name: TABLE subscription; Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON TABLE realtime.subscription TO postgres;
GRANT ALL ON TABLE realtime.subscription TO dashboard_user;
GRANT SELECT ON TABLE realtime.subscription TO anon;
GRANT SELECT ON TABLE realtime.subscription TO authenticated;
GRANT SELECT ON TABLE realtime.subscription TO service_role;
GRANT ALL ON TABLE realtime.subscription TO supabase_realtime_admin;


--
-- Name: SEQUENCE subscription_id_seq; Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON SEQUENCE realtime.subscription_id_seq TO postgres;
GRANT ALL ON SEQUENCE realtime.subscription_id_seq TO dashboard_user;
GRANT USAGE ON SEQUENCE realtime.subscription_id_seq TO anon;
GRANT USAGE ON SEQUENCE realtime.subscription_id_seq TO authenticated;
GRANT USAGE ON SEQUENCE realtime.subscription_id_seq TO service_role;
GRANT ALL ON SEQUENCE realtime.subscription_id_seq TO supabase_realtime_admin;


--
-- Name: TABLE buckets; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT ALL ON TABLE storage.buckets TO anon;
GRANT ALL ON TABLE storage.buckets TO authenticated;
GRANT ALL ON TABLE storage.buckets TO service_role;
GRANT ALL ON TABLE storage.buckets TO postgres WITH GRANT OPTION;


--
-- Name: TABLE objects; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT ALL ON TABLE storage.objects TO anon;
GRANT ALL ON TABLE storage.objects TO authenticated;
GRANT ALL ON TABLE storage.objects TO service_role;
GRANT ALL ON TABLE storage.objects TO postgres WITH GRANT OPTION;


--
-- Name: TABLE s3_multipart_uploads; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT ALL ON TABLE storage.s3_multipart_uploads TO service_role;
GRANT SELECT ON TABLE storage.s3_multipart_uploads TO authenticated;
GRANT SELECT ON TABLE storage.s3_multipart_uploads TO anon;


--
-- Name: TABLE s3_multipart_uploads_parts; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT ALL ON TABLE storage.s3_multipart_uploads_parts TO service_role;
GRANT SELECT ON TABLE storage.s3_multipart_uploads_parts TO authenticated;
GRANT SELECT ON TABLE storage.s3_multipart_uploads_parts TO anon;


--
-- Name: TABLE secrets; Type: ACL; Schema: vault; Owner: supabase_admin
--

GRANT SELECT,REFERENCES,DELETE,TRUNCATE ON TABLE vault.secrets TO postgres WITH GRANT OPTION;
GRANT SELECT,DELETE ON TABLE vault.secrets TO service_role;


--
-- Name: TABLE decrypted_secrets; Type: ACL; Schema: vault; Owner: supabase_admin
--

GRANT SELECT,REFERENCES,DELETE,TRUNCATE ON TABLE vault.decrypted_secrets TO postgres WITH GRANT OPTION;
GRANT SELECT,DELETE ON TABLE vault.decrypted_secrets TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: auth; Owner: supabase_auth_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON SEQUENCES TO dashboard_user;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: auth; Owner: supabase_auth_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON FUNCTIONS TO dashboard_user;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: auth; Owner: supabase_auth_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON TABLES TO dashboard_user;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: extensions; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA extensions GRANT ALL ON SEQUENCES TO postgres WITH GRANT OPTION;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: extensions; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA extensions GRANT ALL ON FUNCTIONS TO postgres WITH GRANT OPTION;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: extensions; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA extensions GRANT ALL ON TABLES TO postgres WITH GRANT OPTION;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: graphql; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON SEQUENCES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON SEQUENCES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON SEQUENCES TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: graphql; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON FUNCTIONS TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON FUNCTIONS TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON FUNCTIONS TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: graphql; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON TABLES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON TABLES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON TABLES TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: graphql_public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON SEQUENCES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON SEQUENCES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON SEQUENCES TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: graphql_public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON FUNCTIONS TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON FUNCTIONS TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON FUNCTIONS TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: graphql_public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON TABLES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON TABLES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON TABLES TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: public; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON SEQUENCES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON SEQUENCES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON SEQUENCES TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON SEQUENCES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON SEQUENCES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON SEQUENCES TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: public; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON FUNCTIONS TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON FUNCTIONS TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON FUNCTIONS TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON FUNCTIONS TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON FUNCTIONS TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON FUNCTIONS TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: public; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON TABLES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON TABLES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON TABLES TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON TABLES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON TABLES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON TABLES TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: realtime; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON SEQUENCES TO dashboard_user;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: realtime; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON FUNCTIONS TO dashboard_user;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: realtime; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON TABLES TO dashboard_user;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: storage; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON SEQUENCES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON SEQUENCES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON SEQUENCES TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: storage; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON FUNCTIONS TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON FUNCTIONS TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON FUNCTIONS TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: storage; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON TABLES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON TABLES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON TABLES TO service_role;


--
-- Name: issue_graphql_placeholder; Type: EVENT TRIGGER; Schema: -; Owner: supabase_admin
--

CREATE EVENT TRIGGER issue_graphql_placeholder ON sql_drop
         WHEN TAG IN ('DROP EXTENSION')
   EXECUTE FUNCTION extensions.set_graphql_placeholder();


ALTER EVENT TRIGGER issue_graphql_placeholder OWNER TO supabase_admin;

--
-- Name: issue_pg_cron_access; Type: EVENT TRIGGER; Schema: -; Owner: supabase_admin
--

CREATE EVENT TRIGGER issue_pg_cron_access ON ddl_command_end
         WHEN TAG IN ('CREATE EXTENSION')
   EXECUTE FUNCTION extensions.grant_pg_cron_access();


ALTER EVENT TRIGGER issue_pg_cron_access OWNER TO supabase_admin;

--
-- Name: issue_pg_graphql_access; Type: EVENT TRIGGER; Schema: -; Owner: supabase_admin
--

CREATE EVENT TRIGGER issue_pg_graphql_access ON ddl_command_end
         WHEN TAG IN ('CREATE FUNCTION')
   EXECUTE FUNCTION extensions.grant_pg_graphql_access();


ALTER EVENT TRIGGER issue_pg_graphql_access OWNER TO supabase_admin;

--
-- Name: issue_pg_net_access; Type: EVENT TRIGGER; Schema: -; Owner: supabase_admin
--

CREATE EVENT TRIGGER issue_pg_net_access ON ddl_command_end
         WHEN TAG IN ('CREATE EXTENSION')
   EXECUTE FUNCTION extensions.grant_pg_net_access();


ALTER EVENT TRIGGER issue_pg_net_access OWNER TO supabase_admin;

--
-- Name: pgrst_ddl_watch; Type: EVENT TRIGGER; Schema: -; Owner: supabase_admin
--

CREATE EVENT TRIGGER pgrst_ddl_watch ON ddl_command_end
   EXECUTE FUNCTION extensions.pgrst_ddl_watch();


ALTER EVENT TRIGGER pgrst_ddl_watch OWNER TO supabase_admin;

--
-- Name: pgrst_drop_watch; Type: EVENT TRIGGER; Schema: -; Owner: supabase_admin
--

CREATE EVENT TRIGGER pgrst_drop_watch ON sql_drop
   EXECUTE FUNCTION extensions.pgrst_drop_watch();


ALTER EVENT TRIGGER pgrst_drop_watch OWNER TO supabase_admin;

--
-- PostgreSQL database dump complete
--

\unrestrict XI8eM9N75BO6UGMhEDED5vkkBA1V6OkU8CaVHewekeyciY1r3mXzHPJZH7ju6Jv

