--
-- PostgreSQL database dump
--

\restrict XtvU9xz9AJDy3nvBA2tb2HVaNALzbgZb97FHfmbYjauQdppE1df4kzeW5BehwZx

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
-- Data for Name: tanks; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tanks (id, name, location, description, created_at, created_by, tank_category_id, max_age_days_override, volume_l, rack, code, id_uuid, type, notes, site_code, tank_code) FROM stdin;
9	my favorite tank	\N	\N	2025-09-13 19:53:36.314366+00	d51b73e3-2c57-427c-9f9b-9c4c067f921f	\N	\N	\N	\N	TK000003	b4b6e60b-c2a7-492f-a3aa-72eebad82bf1	\N	\N	ADULT	ADULT-tank-25-0003
12	my favorite tank 2	\N	\N	2025-09-13 22:25:05.09844+00	d51b73e3-2c57-427c-9f9b-9c4c067f921f	\N	\N	\N	\N	TK000006	69b83983-2ff1-422a-ad19-6942b0332e60	\N	\N	ADULT	ADULT-tank-25-0004
13	tst tank	\N	\N	2025-09-13 22:48:29.533905+00	d51b73e3-2c57-427c-9f9b-9c4c067f921f	\N	\N	\N	\N	TK000007	b491659b-e6d0-4951-9c32-6053a0df0763	\N	\N	ADULT	ADULT-tank-25-0005
14	my tank	\N	\N	2025-09-13 23:14:09.361438+00	d51b73e3-2c57-427c-9f9b-9c4c067f921f	\N	\N	\N	\N	TK000008	bc72e9fa-c6b8-493f-9996-a4869ecf7853	\N	\N	ADULT	ADULT-tank-25-0006
5	Nursery A	\N	\N	2025-09-12 16:53:30.846248+00	00000000-0000-0000-0000-000000000000	1	\N	\N	\N	ADULT-tank-25-0001	b2feb31c-79eb-44d8-9558-df12ae786c5b	\N	\N	ADULT	ADULT-tank-25-0001
6	Growout 1	\N	\N	2025-09-12 16:53:30.846248+00	00000000-0000-0000-0000-000000000000	6	\N	\N	\N	ADULT-tank-25-0002	5863ecc3-2a29-4940-b111-6e1bf55315fd	\N	\N	ADULT	ADULT-tank-25-0002
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
\.


--
-- Data for Name: tank_code_counters_site_yy; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tank_code_counters_site_yy (yy, site_code, last_num) FROM stdin;
25	ADULT	6
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
-- Data for Name: treatment_dyes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.treatment_dyes (treatment_id, dye_id_uuid, conc_um, notes, created_at, created_by) FROM stdin;
0e6dcd15-5ae5-4fb3-be4b-07afd7014db4	baf10673-4565-47e2-ac79-a3542ee4f8aa	\N	\N	2025-09-13 17:13:20.742189+00	\N
b8c81454-3a46-45a3-ad7c-652499ba722f	d42cdbd0-f12e-4e1f-937c-2fb7f963c67f	\N	\N	2025-09-13 23:13:49.173061+00	\N
b8c81454-3a46-45a3-ad7c-652499ba722f	baf10673-4565-47e2-ac79-a3542ee4f8aa	\N	\N	2025-09-13 23:13:49.173061+00	\N
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
-- Name: fish_tank_memberships_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.fish_tank_memberships_id_seq', 9, true);


--
-- Name: tanks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tanks_id_seq', 15, true);


--
-- PostgreSQL database dump complete
--

\unrestrict XtvU9xz9AJDy3nvBA2tb2HVaNALzbgZb97FHfmbYjauQdppE1df4kzeW5BehwZx

