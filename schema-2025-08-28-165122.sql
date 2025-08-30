

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;


CREATE SCHEMA IF NOT EXISTS "public";


ALTER SCHEMA "public" OWNER TO "postgres";


CREATE TYPE "public"."fish_treatment_types" AS ENUM (
    'dye',
    'heat_shock',
    'drug',
    'chemical_switch',
    'injection_rna',
    'injection_plasmid'
);


ALTER TYPE "public"."fish_treatment_types" OWNER TO "postgres";

SET default_tablespace = '';

SET default_table_access_method = "heap";


CREATE TABLE IF NOT EXISTS "public"."fish" (
    "id" bigint NOT NULL,
    "name" "text" NOT NULL,
    "date_birth" "date",
    "notes" "text",
    "mother_fish_id" bigint,
    "father_fish_id" bigint,
    "line_building_stage" "text",
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    CONSTRAINT "fish_name_btrim" CHECK (("name" = "btrim"("name")))
);


ALTER TABLE "public"."fish" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."fish_mutations" (
    "fish_id" bigint NOT NULL,
    "mutation_id" bigint NOT NULL,
    "zygosity" "text",
    "notes" "text",
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL
);


ALTER TABLE "public"."fish_mutations" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."fish_strains" (
    "fish_id" bigint NOT NULL,
    "strain_id" bigint NOT NULL,
    "role" "text",
    "notes" "text",
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL
);


ALTER TABLE "public"."fish_strains" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."fish_transgenes" (
    "fish_id" bigint NOT NULL,
    "transgene_id" bigint NOT NULL,
    "is_integrated" boolean,
    "notes" "text",
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL
);


ALTER TABLE "public"."fish_transgenes" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."mutations" (
    "id" bigint NOT NULL,
    "name" "text" NOT NULL,
    "gene" "text",
    "zygosity" "text",
    "notes" "text",
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL
);


ALTER TABLE "public"."mutations" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."strains" (
    "id" bigint NOT NULL,
    "name" "text" NOT NULL,
    "notes" "text",
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL
);


ALTER TABLE "public"."strains" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."transgenes" (
    "id" bigint NOT NULL,
    "name" "text" NOT NULL,
    "plasmid_id" bigint,
    "notes" "text",
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL
);


ALTER TABLE "public"."transgenes" OWNER TO "postgres";


CREATE OR REPLACE VIEW "public"."fish_feature_summary" AS
 SELECT "f"."id" AS "fish_id",
    "f"."name",
    "string_agg"(DISTINCT "tg"."name", ' | '::"text") FILTER (WHERE ("tg"."id" IS NOT NULL)) AS "transgenes",
    "string_agg"(DISTINCT "m"."name", ' | '::"text") FILTER (WHERE ("m"."id" IS NOT NULL)) AS "mutations",
    "string_agg"(DISTINCT "s"."name", ' | '::"text") FILTER (WHERE ("s"."id" IS NOT NULL)) AS "strains"
   FROM (((((("public"."fish" "f"
     LEFT JOIN "public"."fish_transgenes" "ft" ON (("ft"."fish_id" = "f"."id")))
     LEFT JOIN "public"."transgenes" "tg" ON (("tg"."id" = "ft"."transgene_id")))
     LEFT JOIN "public"."fish_mutations" "fm" ON (("fm"."fish_id" = "f"."id")))
     LEFT JOIN "public"."mutations" "m" ON (("m"."id" = "fm"."mutation_id")))
     LEFT JOIN "public"."fish_strains" "fs" ON (("fs"."fish_id" = "f"."id")))
     LEFT JOIN "public"."strains" "s" ON (("s"."id" = "fs"."strain_id")))
  GROUP BY "f"."id", "f"."name";


ALTER VIEW "public"."fish_feature_summary" OWNER TO "postgres";


CREATE SEQUENCE IF NOT EXISTS "public"."fish_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE "public"."fish_id_seq" OWNER TO "postgres";


ALTER SEQUENCE "public"."fish_id_seq" OWNED BY "public"."fish"."id";



CREATE TABLE IF NOT EXISTS "public"."fish_treatments" (
    "fish_id" bigint NOT NULL,
    "treatment_id" bigint NOT NULL,
    "notes" "text",
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL
);


ALTER TABLE "public"."fish_treatments" OWNER TO "postgres";


CREATE SEQUENCE IF NOT EXISTS "public"."mutations_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE "public"."mutations_id_seq" OWNER TO "postgres";


ALTER SEQUENCE "public"."mutations_id_seq" OWNED BY "public"."mutations"."id";



CREATE TABLE IF NOT EXISTS "public"."plasmids" (
    "id" bigint NOT NULL,
    "name" "text" NOT NULL,
    "description" "text",
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL
);


ALTER TABLE "public"."plasmids" OWNER TO "postgres";


CREATE SEQUENCE IF NOT EXISTS "public"."plasmids_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE "public"."plasmids_id_seq" OWNER TO "postgres";


ALTER SEQUENCE "public"."plasmids_id_seq" OWNED BY "public"."plasmids"."id";



CREATE SEQUENCE IF NOT EXISTS "public"."strains_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE "public"."strains_id_seq" OWNER TO "postgres";


ALTER SEQUENCE "public"."strains_id_seq" OWNED BY "public"."strains"."id";



CREATE TABLE IF NOT EXISTS "public"."tanks" (
    "id" bigint NOT NULL,
    "name" "text" NOT NULL,
    "fish_id" bigint NOT NULL,
    "location" "text",
    "notes" "text",
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    CONSTRAINT "tanks_fish_id_check" CHECK (("fish_id" IS NOT NULL))
);


ALTER TABLE "public"."tanks" OWNER TO "postgres";


CREATE SEQUENCE IF NOT EXISTS "public"."tanks_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE "public"."tanks_id_seq" OWNER TO "postgres";


ALTER SEQUENCE "public"."tanks_id_seq" OWNED BY "public"."tanks"."id";



CREATE SEQUENCE IF NOT EXISTS "public"."transgenes_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE "public"."transgenes_id_seq" OWNER TO "postgres";


ALTER SEQUENCE "public"."transgenes_id_seq" OWNED BY "public"."transgenes"."id";



CREATE TABLE IF NOT EXISTS "public"."treatments" (
    "id" bigint NOT NULL,
    "treatment_type" "public"."fish_treatment_types" NOT NULL,
    "treatment_name" "text" NOT NULL,
    "notes" "text",
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL
);


ALTER TABLE "public"."treatments" OWNER TO "postgres";


CREATE SEQUENCE IF NOT EXISTS "public"."treatments_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE "public"."treatments_id_seq" OWNER TO "postgres";


ALTER SEQUENCE "public"."treatments_id_seq" OWNED BY "public"."treatments"."id";



ALTER TABLE ONLY "public"."fish" ALTER COLUMN "id" SET DEFAULT "nextval"('"public"."fish_id_seq"'::"regclass");



ALTER TABLE ONLY "public"."mutations" ALTER COLUMN "id" SET DEFAULT "nextval"('"public"."mutations_id_seq"'::"regclass");



ALTER TABLE ONLY "public"."plasmids" ALTER COLUMN "id" SET DEFAULT "nextval"('"public"."plasmids_id_seq"'::"regclass");



ALTER TABLE ONLY "public"."strains" ALTER COLUMN "id" SET DEFAULT "nextval"('"public"."strains_id_seq"'::"regclass");



ALTER TABLE ONLY "public"."tanks" ALTER COLUMN "id" SET DEFAULT "nextval"('"public"."tanks_id_seq"'::"regclass");



ALTER TABLE ONLY "public"."transgenes" ALTER COLUMN "id" SET DEFAULT "nextval"('"public"."transgenes_id_seq"'::"regclass");



ALTER TABLE ONLY "public"."treatments" ALTER COLUMN "id" SET DEFAULT "nextval"('"public"."treatments_id_seq"'::"regclass");



ALTER TABLE ONLY "public"."fish_mutations"
    ADD CONSTRAINT "fish_mutations_pkey" PRIMARY KEY ("fish_id", "mutation_id");



ALTER TABLE ONLY "public"."fish"
    ADD CONSTRAINT "fish_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."fish_strains"
    ADD CONSTRAINT "fish_strains_pkey" PRIMARY KEY ("fish_id", "strain_id");



ALTER TABLE ONLY "public"."fish_transgenes"
    ADD CONSTRAINT "fish_transgenes_pkey" PRIMARY KEY ("fish_id", "transgene_id");



ALTER TABLE ONLY "public"."fish_treatments"
    ADD CONSTRAINT "fish_treatments_pkey" PRIMARY KEY ("fish_id", "treatment_id");



ALTER TABLE ONLY "public"."mutations"
    ADD CONSTRAINT "mutations_name_key" UNIQUE ("name");



ALTER TABLE ONLY "public"."mutations"
    ADD CONSTRAINT "mutations_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."plasmids"
    ADD CONSTRAINT "plasmids_name_key" UNIQUE ("name");



ALTER TABLE ONLY "public"."plasmids"
    ADD CONSTRAINT "plasmids_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."strains"
    ADD CONSTRAINT "strains_name_key" UNIQUE ("name");



ALTER TABLE ONLY "public"."strains"
    ADD CONSTRAINT "strains_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."tanks"
    ADD CONSTRAINT "tanks_name_key" UNIQUE ("name");



ALTER TABLE ONLY "public"."tanks"
    ADD CONSTRAINT "tanks_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."transgenes"
    ADD CONSTRAINT "transgenes_name_key" UNIQUE ("name");



ALTER TABLE ONLY "public"."transgenes"
    ADD CONSTRAINT "transgenes_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."treatments"
    ADD CONSTRAINT "treatments_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."treatments"
    ADD CONSTRAINT "treatments_treatment_type_treatment_name_key" UNIQUE ("treatment_type", "treatment_name");



CREATE INDEX "idx_fish_father" ON "public"."fish" USING "btree" ("father_fish_id");



CREATE INDEX "idx_fish_mother" ON "public"."fish" USING "btree" ("mother_fish_id");



CREATE INDEX "idx_fish_mutations__fish" ON "public"."fish_mutations" USING "btree" ("fish_id");



CREATE INDEX "idx_fish_mutations__mut" ON "public"."fish_mutations" USING "btree" ("mutation_id");



CREATE INDEX "idx_fish_strains__fish" ON "public"."fish_strains" USING "btree" ("fish_id");



CREATE INDEX "idx_fish_strains__strain" ON "public"."fish_strains" USING "btree" ("strain_id");



CREATE INDEX "idx_fish_transgenes__fish" ON "public"."fish_transgenes" USING "btree" ("fish_id");



CREATE INDEX "idx_fish_transgenes__tg" ON "public"."fish_transgenes" USING "btree" ("transgene_id");



CREATE INDEX "idx_fish_treatments__fish" ON "public"."fish_treatments" USING "btree" ("fish_id");



CREATE INDEX "idx_fish_treatments__trt" ON "public"."fish_treatments" USING "btree" ("treatment_id");



CREATE INDEX "idx_tanks_fish" ON "public"."tanks" USING "btree" ("fish_id");



CREATE UNIQUE INDEX "ux_fish_name_ci" ON "public"."fish" USING "btree" ("lower"("name"));



ALTER TABLE ONLY "public"."fish"
    ADD CONSTRAINT "fish_father_fish_id_fkey" FOREIGN KEY ("father_fish_id") REFERENCES "public"."fish"("id") ON DELETE SET NULL;



ALTER TABLE ONLY "public"."fish"
    ADD CONSTRAINT "fish_mother_fish_id_fkey" FOREIGN KEY ("mother_fish_id") REFERENCES "public"."fish"("id") ON DELETE SET NULL;



ALTER TABLE ONLY "public"."fish_mutations"
    ADD CONSTRAINT "fish_mutations_fish_id_fkey" FOREIGN KEY ("fish_id") REFERENCES "public"."fish"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."fish_mutations"
    ADD CONSTRAINT "fish_mutations_mutation_id_fkey" FOREIGN KEY ("mutation_id") REFERENCES "public"."mutations"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."fish_strains"
    ADD CONSTRAINT "fish_strains_fish_id_fkey" FOREIGN KEY ("fish_id") REFERENCES "public"."fish"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."fish_strains"
    ADD CONSTRAINT "fish_strains_strain_id_fkey" FOREIGN KEY ("strain_id") REFERENCES "public"."strains"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."fish_transgenes"
    ADD CONSTRAINT "fish_transgenes_fish_id_fkey" FOREIGN KEY ("fish_id") REFERENCES "public"."fish"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."fish_transgenes"
    ADD CONSTRAINT "fish_transgenes_transgene_id_fkey" FOREIGN KEY ("transgene_id") REFERENCES "public"."transgenes"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."fish_treatments"
    ADD CONSTRAINT "fish_treatments_fish_id_fkey" FOREIGN KEY ("fish_id") REFERENCES "public"."fish"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."fish_treatments"
    ADD CONSTRAINT "fish_treatments_treatment_id_fkey" FOREIGN KEY ("treatment_id") REFERENCES "public"."treatments"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."tanks"
    ADD CONSTRAINT "tanks_fish_id_fkey" FOREIGN KEY ("fish_id") REFERENCES "public"."fish"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."transgenes"
    ADD CONSTRAINT "transgenes_plasmid_id_fkey" FOREIGN KEY ("plasmid_id") REFERENCES "public"."plasmids"("id") ON DELETE SET NULL;



REVOKE USAGE ON SCHEMA "public" FROM PUBLIC;
GRANT ALL ON SCHEMA "public" TO "authenticated";
GRANT ALL ON SCHEMA "public" TO "anon";
GRANT USAGE ON SCHEMA "public" TO "service_role";



GRANT ALL ON TABLE "public"."fish" TO "service_role";
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE "public"."fish" TO "authenticated";
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE "public"."fish" TO "anon";



GRANT ALL ON TABLE "public"."fish_mutations" TO "service_role";
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE "public"."fish_mutations" TO "authenticated";
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE "public"."fish_mutations" TO "anon";



GRANT ALL ON TABLE "public"."fish_strains" TO "service_role";
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE "public"."fish_strains" TO "authenticated";
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE "public"."fish_strains" TO "anon";



GRANT ALL ON TABLE "public"."fish_transgenes" TO "service_role";
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE "public"."fish_transgenes" TO "authenticated";
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE "public"."fish_transgenes" TO "anon";



GRANT ALL ON TABLE "public"."mutations" TO "service_role";
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE "public"."mutations" TO "authenticated";
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE "public"."mutations" TO "anon";



GRANT ALL ON TABLE "public"."strains" TO "service_role";
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE "public"."strains" TO "authenticated";
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE "public"."strains" TO "anon";



GRANT ALL ON TABLE "public"."transgenes" TO "service_role";
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE "public"."transgenes" TO "authenticated";
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE "public"."transgenes" TO "anon";



GRANT ALL ON TABLE "public"."fish_feature_summary" TO "service_role";
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE "public"."fish_feature_summary" TO "authenticated";
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE "public"."fish_feature_summary" TO "anon";



GRANT ALL ON SEQUENCE "public"."fish_id_seq" TO "service_role";
GRANT SELECT,USAGE ON SEQUENCE "public"."fish_id_seq" TO "authenticated";
GRANT SELECT,USAGE ON SEQUENCE "public"."fish_id_seq" TO "anon";



GRANT ALL ON TABLE "public"."fish_treatments" TO "service_role";
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE "public"."fish_treatments" TO "authenticated";
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE "public"."fish_treatments" TO "anon";



GRANT ALL ON SEQUENCE "public"."mutations_id_seq" TO "service_role";
GRANT SELECT,USAGE ON SEQUENCE "public"."mutations_id_seq" TO "authenticated";
GRANT SELECT,USAGE ON SEQUENCE "public"."mutations_id_seq" TO "anon";



GRANT ALL ON TABLE "public"."plasmids" TO "service_role";
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE "public"."plasmids" TO "authenticated";
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE "public"."plasmids" TO "anon";



GRANT ALL ON SEQUENCE "public"."plasmids_id_seq" TO "service_role";
GRANT SELECT,USAGE ON SEQUENCE "public"."plasmids_id_seq" TO "authenticated";
GRANT SELECT,USAGE ON SEQUENCE "public"."plasmids_id_seq" TO "anon";



GRANT ALL ON SEQUENCE "public"."strains_id_seq" TO "service_role";
GRANT SELECT,USAGE ON SEQUENCE "public"."strains_id_seq" TO "authenticated";
GRANT SELECT,USAGE ON SEQUENCE "public"."strains_id_seq" TO "anon";



GRANT ALL ON TABLE "public"."tanks" TO "service_role";
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE "public"."tanks" TO "authenticated";
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE "public"."tanks" TO "anon";



GRANT ALL ON SEQUENCE "public"."tanks_id_seq" TO "service_role";
GRANT SELECT,USAGE ON SEQUENCE "public"."tanks_id_seq" TO "authenticated";
GRANT SELECT,USAGE ON SEQUENCE "public"."tanks_id_seq" TO "anon";



GRANT ALL ON SEQUENCE "public"."transgenes_id_seq" TO "service_role";
GRANT SELECT,USAGE ON SEQUENCE "public"."transgenes_id_seq" TO "authenticated";
GRANT SELECT,USAGE ON SEQUENCE "public"."transgenes_id_seq" TO "anon";



GRANT ALL ON TABLE "public"."treatments" TO "service_role";
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE "public"."treatments" TO "authenticated";
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE "public"."treatments" TO "anon";



GRANT ALL ON SEQUENCE "public"."treatments_id_seq" TO "service_role";
GRANT SELECT,USAGE ON SEQUENCE "public"."treatments_id_seq" TO "authenticated";
GRANT SELECT,USAGE ON SEQUENCE "public"."treatments_id_seq" TO "anon";



ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT SELECT,USAGE ON SEQUENCES TO "anon";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT SELECT,USAGE ON SEQUENCES TO "authenticated";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON SEQUENCES TO "service_role";



ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON FUNCTIONS TO "service_role";



ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT SELECT,INSERT,DELETE,UPDATE ON TABLES TO "anon";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT SELECT,INSERT,DELETE,UPDATE ON TABLES TO "authenticated";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON TABLES TO "service_role";



RESET ALL;
