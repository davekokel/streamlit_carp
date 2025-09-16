--
-- PostgreSQL database dump
--

\restrict a6lSqMT5wHIz6XwdR3sQc91Ba4vxk2jdHdT7fjhgMSKsM1YVlNdUNRfYxsRgwvV

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

\unrestrict a6lSqMT5wHIz6XwdR3sQc91Ba4vxk2jdHdT7fjhgMSKsM1YVlNdUNRfYxsRgwvV

