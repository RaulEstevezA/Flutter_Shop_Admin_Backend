--
-- PostgreSQL database dump
--

-- Dumped from database version 15.2 (Debian 15.2-1.pgdg110+1)
-- Dumped by pg_dump version 15.2 (Debian 15.2-1.pgdg110+1)

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

--
-- Name: uuid-ossp; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA public;


--
-- Name: EXTENSION "uuid-ossp"; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: product_images; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_images (
    id integer NOT NULL,
    url text NOT NULL,
    "productId" uuid
);


ALTER TABLE public.product_images OWNER TO postgres;

--
-- Name: product_images_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.product_images_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_images_id_seq OWNER TO postgres;

--
-- Name: product_images_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.product_images_id_seq OWNED BY public.product_images.id;


--
-- Name: products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.products (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    title text NOT NULL,
    price double precision DEFAULT '0'::double precision NOT NULL,
    description text,
    slug text NOT NULL,
    stock integer DEFAULT 0 NOT NULL,
    sizes text[] NOT NULL,
    gender text NOT NULL,
    tags text[] DEFAULT '{}'::text[] NOT NULL,
    "userId" uuid
);


ALTER TABLE public.products OWNER TO postgres;

--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    email text NOT NULL,
    password text NOT NULL,
    "fullName" text NOT NULL,
    "isActive" boolean DEFAULT true NOT NULL,
    roles text[] DEFAULT '{user}'::text[] NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: product_images id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_images ALTER COLUMN id SET DEFAULT nextval('public.product_images_id_seq'::regclass);


--
-- Data for Name: product_images; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_images (id, url, "productId") FROM stdin;
112	1740176-00-A_0_2000.jpg	41bf0d98-46fd-4a9e-9aac-80e8b78bd5c0
113	1740176-00-A_1.jpg	41bf0d98-46fd-4a9e-9aac-80e8b78bd5c0
114	1740250-00-A_0_2000.jpg	6597f4db-518c-4dde-a989-bf479700aa24
115	1740250-00-A_1.jpg	6597f4db-518c-4dde-a989-bf479700aa24
116	1740280-00-A_0_2000.jpg	80bccd8e-5af3-4d5e-91e9-e4d1d5c8e7c7
117	1740280-00-A_1.jpg	80bccd8e-5af3-4d5e-91e9-e4d1d5c8e7c7
118	7654393-00-A_2_2000.jpg	dfb8f445-c168-43e6-9cb2-e30a78b9db4a
119	7654393-00-A_3.jpg	dfb8f445-c168-43e6-9cb2-e30a78b9db4a
120	1700280-00-A_0_2000.jpg	18f6786a-8e20-4ea2-a64b-2f2e388c1b45
121	1700280-00-A_1.jpg	18f6786a-8e20-4ea2-a64b-2f2e388c1b45
122	8764734-00-A_0_2000.jpg	9871e737-c421-483b-8d78-ce56d786482d
123	8764734-00-A_1.jpg	9871e737-c421-483b-8d78-ce56d786482d
124	1703767-00-A_0_2000.jpg	5084f47e-238b-4f36-ba68-db434ead2567
125	1703767-00-A_1.jpg	5084f47e-238b-4f36-ba68-db434ead2567
126	7652426-00-A_0_2000.jpg	a85d05bb-ade7-465f-96c1-57c12bb3a9f3
127	7652426-00-A_1.jpg	a85d05bb-ade7-465f-96c1-57c12bb3a9f3
136	1633802-00-A_0_2000.jpg	6fe9e12a-1cd3-4e71-8444-cf41e3b65d29
137	1633802-00-A_2.jpg	6fe9e12a-1cd3-4e71-8444-cf41e3b65d29
138	7654399-00-A_0_2000.jpg	84149962-f1cf-48d0-842e-e64def1df137
139	7654399-00-A_1.jpg	84149962-f1cf-48d0-842e-e64def1df137
140	7652410-00-A_0.jpg	d29995e9-cdba-4cce-8d80-f73a67a74695
141	7652410-00-A_1_2000.jpg	d29995e9-cdba-4cce-8d80-f73a67a74695
142	8764600-00-A_0_2000.jpg	da072d4d-a3b5-4942-97ad-2c562d3d7af5
143	8764600-00-A_2.jpg	da072d4d-a3b5-4942-97ad-2c562d3d7af5
154	1740140-00-A_0_2000.jpg	fd8c350d-0eb5-4930-ac6f-ea2bb7c0c980
155	1740140-00-A_1.jpg	fd8c350d-0eb5-4930-ac6f-ea2bb7c0c980
156	1740145-00-A_2_2000.jpg	808c9eea-1b3e-4095-9afa-f4472e1d2751
157	1740145-00-A_1.jpg	808c9eea-1b3e-4095-9afa-f4472e1d2751
158	8529107-00-A_0_2000.jpg	f863bfcc-9bc4-46c2-a66f-1726c509c884
159	8529107-00-A_1.jpg	f863bfcc-9bc4-46c2-a66f-1726c509c884
160	7654420-00-A_0_2000.jpg	d1f62286-c74a-4b53-878f-812e6ddf540e
161	7654420-00-A_1_2000.jpg	d1f62286-c74a-4b53-878f-812e6ddf540e
162	1740245-00-A_0_2000.jpg	b98f48d9-bf4a-4542-85d8-29d1a9026447
163	1740245-00-A_1.jpg	b98f48d9-bf4a-4542-85d8-29d1a9026447
174	1740290-00-A_0_2000.jpg	9798121e-537e-47ef-9e79-4cb1f1bb9aee
175	1740290-00-A_1.jpg	9798121e-537e-47ef-9e79-4cb1f1bb9aee
176	1741441-00-A_0_2000.jpg	bc2dae76-d191-4c23-b35a-4d915946efb8
177	1741441-00-A_1.jpg	bc2dae76-d191-4c23-b35a-4d915946efb8
178	8765090-00-A_0_2000.jpg	35bd06cd-b8bd-453f-9bdc-c1eb7a31c7d7
179	8765090-00-A_1.jpg	35bd06cd-b8bd-453f-9bdc-c1eb7a31c7d7
180	8765100-00-A_0_2000.jpg	d62d6812-64df-4cc5-816b-db9afb05b542
181	8765100-00-A_1.jpg	d62d6812-64df-4cc5-816b-db9afb05b542
188	5645680-00-A_0_2000.jpg	6566692d-0e2d-4192-8e30-b205de0d2ce0
189	5645680-00-A_3.jpg	6566692d-0e2d-4192-8e30-b205de0d2ce0
192	8765115-00-A_0_2000.jpg	5759ec14-1519-4955-ae8f-b6bb39212920
193	8765115-00-A_1.jpg	5759ec14-1519-4955-ae8f-b6bb39212920
194	8529312-00-A_0_2000.jpg	e03dd848-724f-4284-8a6f-dc4619310036
195	8529312-00-A_1.jpg	e03dd848-724f-4284-8a6f-dc4619310036
196	8529342-00-A_0_2000.jpg	77438516-6b5d-4f90-bb0e-88a56495a951
197	8529342-00-A_1.jpg	77438516-6b5d-4f90-bb0e-88a56495a951
202	8529354-00-A_0_2000.jpg	db41c50c-3dc5-41a4-a479-5827d46fbccf
203	8529354-00-A_1.jpg	db41c50c-3dc5-41a4-a479-5827d46fbccf
208	8529387-00-A_0_2000.jpg	0d138fa7-7dc5-4f2f-870e-547b9428dd01
209	8529387-00-A_1.jpg	0d138fa7-7dc5-4f2f-870e-547b9428dd01
212	1742702-00-A_0_2000.jpg	c68e6675-5dd7-4f6e-b481-6f3c805bdadd
213	1742702-00-A_1.jpg	c68e6675-5dd7-4f6e-b481-6f3c805bdadd
214	1506211-00-A_0_2000.jpg	24e7ea31-4daa-4e9d-b046-d7c1ca1744c5
215	1506211-00-A_1_2000.jpg	24e7ea31-4daa-4e9d-b046-d7c1ca1744c5
128	8528839-00-A_0_2000.jpg	3a0afd72-0c71-4755-9da8-610334e5e9ec
129	8528839-00-A_2.jpg	3a0afd72-0c71-4755-9da8-610334e5e9ec
130	1741416-00-A_0_2000.jpg	8e3c9699-9e37-4eb6-b57d-b631ce7baac0
131	1741416-00-A_1.jpg	8e3c9699-9e37-4eb6-b57d-b631ce7baac0
146	8764813-00-A_0_2000.jpg	c2544dbc-27cc-46a6-ada4-9ba1d12caeb5
147	8764813-00-A_1.jpg	c2544dbc-27cc-46a6-ada4-9ba1d12caeb5
148	8529198-00-A_0_2000.jpg	74dd13ae-708c-4e10-a0a9-4268e23b7793
149	8529198-00-A_1.jpg	74dd13ae-708c-4e10-a0a9-4268e23b7793
166	1740417-00-A_0_2000.jpg	9ca85c23-29ba-4ca6-ae81-96bdcc29edcf
167	1740417-00-A_1.jpg	9ca85c23-29ba-4ca6-ae81-96bdcc29edcf
168	1740535-00-A_0_2000.jpg	57bd5634-d9c8-4e74-a145-1abe10908768
169	1740535-00-A_1.jpg	57bd5634-d9c8-4e74-a145-1abe10908768
182	8765120-00-A_0_2000.jpg	4fbfaefe-054f-4c95-af71-ed141a86d318
183	8765120-00-A_1.jpg	4fbfaefe-054f-4c95-af71-ed141a86d318
190	1740270-00-A_0_2000.jpg	5a34b696-c55e-4dfe-b970-ff8d9ef901f0
191	1740270-00-A_1.jpg	5a34b696-c55e-4dfe-b970-ff8d9ef901f0
200	7652465-00-A_0_2000.jpg	11b5d8a4-722e-48b3-a956-9af6ff8c2b1c
201	7652465-00-A_1.jpg	11b5d8a4-722e-48b3-a956-9af6ff8c2b1c
210	1473834-00-A_2_2000.jpg	658a386a-4d0b-48f8-9901-a7f125ec1c2e
211	1473829-00-A_2_2000.jpg	658a386a-4d0b-48f8-9901-a7f125ec1c2e
132	1549268-00-A_0_2000.jpg	bd20e84e-000c-4fda-97f3-c48edfc7fc8f
133	1549268-00-A_2.jpg	bd20e84e-000c-4fda-97f3-c48edfc7fc8f
150	1740051-00-A_0_2000.jpg	bc654bd7-97b4-4027-9483-ec32a0f85cde
151	1740051-00-A_1.jpg	bc654bd7-97b4-4027-9483-ec32a0f85cde
170	1740226-00-A_0_2000.jpg	3a2062cf-4b1d-4512-9f36-7d0562e999f1
171	1740226-00-A_1.jpg	3a2062cf-4b1d-4512-9f36-7d0562e999f1
184	1549275-00-A_0_2000.jpg	2ea52863-f768-4653-a134-652b001a77e4
185	1549275-00-A_1.jpg	2ea52863-f768-4653-a134-652b001a77e4
204	100042307_0_2000.jpg	59128e7a-0483-4564-a786-daaa97ae55ce
205	100042307_alt_2000.jpg	59128e7a-0483-4564-a786-daaa97ae55ce
134	9877034-00-A_0_2000.jpg	ffa0f43e-76a4-40bf-9484-6397eea7e1ce
135	9877034-00-A_2.jpg	ffa0f43e-76a4-40bf-9484-6397eea7e1ce
144	1740507-00-A_0_2000.jpg	96a87329-3b21-493b-bc59-8a54a39336cd
145	1740507-00-A_1.jpg	96a87329-3b21-493b-bc59-8a54a39336cd
152	1741111-00-A_0_2000.jpg	2b191361-ef49-4524-bea4-acf783010aad
153	1741111-00-A_1.jpg	2b191361-ef49-4524-bea4-acf783010aad
164	1657932-00-A_0_2000.jpg	7949fc89-c84f-4799-944e-76478eb6a3bd
165	1657932-00-A_1.jpg	7949fc89-c84f-4799-944e-76478eb6a3bd
172	1740260-00-A_0_2000.jpg	03da27d7-87fd-4ed4-882c-bde8c1ab5220
173	1740260-00-A_1.jpg	03da27d7-87fd-4ed4-882c-bde8c1ab5220
186	9877040-00-A_0_2000.jpg	5ea1ece6-8722-43ed-8188-9b6c42fbe426
187	9877040-00-A_1.jpg	5ea1ece6-8722-43ed-8188-9b6c42fbe426
198	1742694-00-A_1_2000.jpg	5eb3ff4f-deab-4228-95f0-f76a2a0e5f25
199	1742694-00-A_3.jpg	5eb3ff4f-deab-4228-95f0-f76a2a0e5f25
206	1473809-00-A_1_2000.jpg	c7e47726-bc49-4a12-910a-fefb419ec7f1
207	1473809-00-A_alt.jpg	c7e47726-bc49-4a12-910a-fefb419ec7f1
\.


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.products (id, title, price, description, slug, stock, sizes, gender, tags, "userId") FROM stdin;
41bf0d98-46fd-4a9e-9aac-80e8b78bd5c0	Men’s Chill Crew Neck Sweatshirt	75	Introducing the Tesla Chill Collection. The Men’s Chill Crew Neck Sweatshirt has a premium, heavyweight exterior and soft fleece interior for comfort in any season. The sweatshirt features a subtle thermoplastic polyurethane T logo on the chest and a Tesla wordmark below the back collar. Made from 60% cotton and 40% recycled polyester.	mens_chill_crew_neck_sweatshirt	7	{XS,S,M,L,XL,XXL}	men	{sweatshirt}	e5463438-0caf-49cb-aaa7-dc3250f9a2f3
6597f4db-518c-4dde-a989-bf479700aa24	Men's Raven Lightweight Zip Up Bomber Jacket	130	Introducing the Tesla Raven Collection. The Men's Raven Lightweight Zip Up Bomber has a premium, modern silhouette made from a sustainable bamboo cotton blend for versatility in any season. The hoodie features subtle thermoplastic polyurethane Tesla logos on the left chest and below the back collar, a concealed chest pocket with custom matte zipper pulls and a french terry interior. Made from 70% bamboo and 30% cotton.	men_raven_lightweight_zip_up_bomber_jacket	10	{S,M,L,XL,XXL}	men	{shirt}	e5463438-0caf-49cb-aaa7-dc3250f9a2f3
80bccd8e-5af3-4d5e-91e9-e4d1d5c8e7c7	Men's Turbine Long Sleeve Tee	45	Introducing the Tesla Turbine Collection. Designed for style, comfort and everyday lifestyle, the Men's Turbine Long Sleeve Tee features a subtle, water-based T logo on the left chest and our Tesla wordmark below the back collar. The lightweight material is double-dyed, creating a soft, casual style for ideal wear in any season. Made from 50% cotton and 50% polyester.	men_turbine_long_sleeve_tee	50	{XS,S,M,L}	men	{shirt}	e5463438-0caf-49cb-aaa7-dc3250f9a2f3
dfb8f445-c168-43e6-9cb2-e30a78b9db4a	Men's Cybertruck Owl Tee	35	Designed for comfort, the Cybertruck Owl Tee is made from 100% cotton and features our signature Cybertruck icon on the back.	men_cybertruck_owl_tee	0	{M,L,XL,XXL}	men	{shirt}	e5463438-0caf-49cb-aaa7-dc3250f9a2f3
18f6786a-8e20-4ea2-a64b-2f2e388c1b45	Men's Let the Sun Shine Tee	35	Inspired by the world’s most unlimited resource, the Let the Sun Shine Tee highlights our fully integrated home solar and storage system. Designed for fit, comfort and style, the tee features a sunset graphic along with our Tesla wordmark on the front and our signature T logo printed above 'Solar Roof' on the back. Made from 100% Peruvian cotton.	men_let_the_sun_shine_tee	17	{XS,S,XL,XXL}	men	{shirt}	e5463438-0caf-49cb-aaa7-dc3250f9a2f3
9871e737-c421-483b-8d78-ce56d786482d	Men's 3D Large Wordmark Tee	35	Designed for fit, comfort and style, the Men's 3D Large Wordmark Tee is made from 100% Peruvian cotton with a 3D silicone-printed Tesla wordmark printed across the chest.	men_3d_large_wordmark_tee	12	{XS,S,M}	men	{shirt}	e5463438-0caf-49cb-aaa7-dc3250f9a2f3
5084f47e-238b-4f36-ba68-db434ead2567	Men's Solar Roof Tee	35	Inspired by our fully integrated home solar and storage system, the Tesla Solar Roof Tee advocates for clean, sustainable energy wherever you go. Designed for fit, comfort and style, the tee features an aerial view of our seamless Solar Roof design on the front with our signature T logo above 'Solar Roof' on the back. Made from 100% Peruvian cotton.	men_solar_roof_tee	15	{S,M,L,XL}	men	{shirt}	e5463438-0caf-49cb-aaa7-dc3250f9a2f3
a85d05bb-ade7-465f-96c1-57c12bb3a9f3	Men's 3D T Logo Tee	35	Designed for fit, comfort and style, the Tesla T Logo Tee is made from 100% Peruvian cotton and features a silicone-printed T Logo on the left chest.	men_3d_t_logo_tee	5	{XS,S}	men	{shirt}	e5463438-0caf-49cb-aaa7-dc3250f9a2f3
8e3c9699-9e37-4eb6-b57d-b631ce7baac0	Men's Turbine Short Sleeve Tee	40	Introducing the Tesla Turbine Collection. Designed for style, comfort and everyday lifestyle, the Men's Turbine Short Sleeve Tee features a subtle, water-based Tesla wordmark across the chest and our T logo below the back collar. The lightweight material is double-dyed, creating a soft, casual style for ideal wear in any season. Made from 50% cotton and 50% polyester.	men_turbine_short_sleeve_tee	50	{M,L,XL,XXL}	men	{shirt}	e5463438-0caf-49cb-aaa7-dc3250f9a2f3
3a0afd72-0c71-4755-9da8-610334e5e9ec	Men’s 3D Small Wordmark Tee	35	Designed for comfort and style in any size, the Tesla Small Wordmark Tee is made from 100% Peruvian cotton and features a 3D silicone-printed wordmark on the left chest.	men_3d_small_wordmark_tee	2	{XS,S,M}	men	{shirt}	e5463438-0caf-49cb-aaa7-dc3250f9a2f3
96a87329-3b21-493b-bc59-8a54a39336cd	Men's Quilted Shirt Jacket	200	The Men's Quilted Shirt Jacket features a uniquely fit, quilted design for warmth and mobility in cold weather seasons. With an overall street-smart aesthetic, the jacket features subtle silicone injected Tesla logos below the back collar and on the right sleeve, as well as custom matte metal zipper pulls. Made from 87% nylon and 13% polyurethane.	men_quilted_shirt_jacket	5	{XS,S,M,XL,XXL}	men	{jacket}	e5463438-0caf-49cb-aaa7-dc3250f9a2f3
bd20e84e-000c-4fda-97f3-c48edfc7fc8f	Men's Plaid Mode Tee	35	Designed to celebrate Tesla's incredible performance mode, the Plaid Mode Tee features great fit, comfort and style. Made from 100% cotton, it's the next best thing to riding shotgun at the Nürburgring.	men_plaid_mode_tee	82	{XS,S,M,L,XL,XXL}	men	{shirt}	e5463438-0caf-49cb-aaa7-dc3250f9a2f3
ffa0f43e-76a4-40bf-9484-6397eea7e1ce	Men's Powerwall Tee	35	Inspired by our popular home battery, the Tesla Powerwall Tee is made from 100% cotton and features the phrase 'Pure Energy' under our signature logo in the back. Designed for fit, comfort and style, the exclusive tee promotes sustainable energy in any environment.	men_powerwall_tee	24	{XL,XXL}	men	{shirt}	e5463438-0caf-49cb-aaa7-dc3250f9a2f3
6fe9e12a-1cd3-4e71-8444-cf41e3b65d29	Men's Battery Day Tee	30	Inspired by Tesla Battery Day and featuring the unveiled tabless battery cell, Battery Day Tee celebrates the future of energy storage and cell manufacturing. Designed for fit, comfort and style, Battery Day Tee is made from 100% cotton with a stylized cell printed across the chest. Made in Peru.	men_battery_day_tee	5	{XS,S,XXL}	men	{shirt}	e5463438-0caf-49cb-aaa7-dc3250f9a2f3
84149962-f1cf-48d0-842e-e64def1df137	Men’s Cybertruck Bulletproof Tee	30	Designed for exceptional comfort and inspired by the Cybertruck unveil event, the Cybertruck Bulletproof Tee is made from 100% cotton and features our signature Cybertruck icon on the back.	men_cybertruck_bulletproof_tee	150	{M,L}	men	{shirt}	e5463438-0caf-49cb-aaa7-dc3250f9a2f3
d29995e9-cdba-4cce-8d80-f73a67a74695	Men's Haha Yes Tee	35	Inspired by the Model Y order confirmation graphic, the limited edition Haha Yes Tee is designed for comfort and style. Made from 100% Peruvian cotton and featuring the Tesla wordmark across the chest, the exclusive tee will commemorate your order for years to come.	men_haha_yes_tee	10	{XS,S,M,L,XL,XXL}	men	{shirt}	e5463438-0caf-49cb-aaa7-dc3250f9a2f3
da072d4d-a3b5-4942-97ad-2c562d3d7af5	Men's S3XY Tee	35	Designed for fit, comfort and style, the limited edition S3XY Tee is made from 100% cotton with a 3D silicone-printed “S3XY” logo across the chest. Made in Peru. Available in black.	men_s3xy_tee	34	{XS,S,M,L}	men	{shirt}	e5463438-0caf-49cb-aaa7-dc3250f9a2f3
d1f62286-c74a-4b53-878f-812e6ddf540e	Cybertruck Graffiti Hoodie	60	As with the iconic Tesla logo, the Cybertruck Graffiti Hoodie is a classic in the making. Unisex style featuring soft fleece and an adjustable, jersey-lined hood for comfortable coverage.	cybertruck_graffiti_hoodie	13	{XS,S,M,L,XL,XXL}	unisex	{hoodie}	e5463438-0caf-49cb-aaa7-dc3250f9a2f3
d62d6812-64df-4cc5-816b-db9afb05b542	Women's T Logo Long Sleeve Scoop Neck Tee	40	Designed for style and comfort, the ultrasoft Women's T Logo Long Sleeve Scoop Neck Tee features a tonal 3D silicone-printed T logo on the left chest. Made of 50% Peruvian cotton and 50% Peruvian viscose.	women_t_logo_long_sleeve_scoop_neck_tee	16	{XS,S,L,XL,XXL}	women	{shirt}	e5463438-0caf-49cb-aaa7-dc3250f9a2f3
db41c50c-3dc5-41a4-a479-5827d46fbccf	Kids Racing Stripe Tee	30	The refreshed Kids Racing Stripe Tee is made from 100% Peruvian cotton, featuring a newly enhanced racing stripe with a brushed Tesla wordmark that's perfect for any speed racer.	kids_racing_stripe_tee	10	{XS,S,M}	kid	{shirt}	e5463438-0caf-49cb-aaa7-dc3250f9a2f3
c2544dbc-27cc-46a6-ada4-9ba1d12caeb5	Men's 3D Wordmark Long Sleeve Tee	40	Designed for fit, comfort and style, the Men's 3D Wordmark Long Sleeve Tee is made from 100% cotton and features an understated wordmark logo on the left chest.	men_3d_wordmark_long_sleeve_tee	15	{XL,XXL}	men	{shirt}	e5463438-0caf-49cb-aaa7-dc3250f9a2f3
9ca85c23-29ba-4ca6-ae81-96bdcc29edcf	Thermal Cuffed Beanie	35	The Relaxed T Logo Hat is a classic silhouette combined with modern details, featuring a 3D T logo and a custom metal buckle closure. The ultrasoft design is flexible and abrasion resistant, while the inner sweatband includes quilted padding for extra comfort and moisture wicking. The visor is fully made from recycled plastic bottles. 100% Cotton.	thermal_cuffed_beanie	13	{XS,S,M,L,XL,XXL}	unisex	{hats}	e5463438-0caf-49cb-aaa7-dc3250f9a2f3
4fbfaefe-054f-4c95-af71-ed141a86d318	Women's Small Wordmark Short Sleeve V-Neck Tee	35	Designed for style and comfort, the Women's Small Wordmark Short Sleeve V-Neck Tee features a tonal 3D silicone-printed wordmark on the left chest. Made of 100% Peruvian cotton.	women_small_wordmark_short_sleeve_v-neck_tee	18	{XS,S,M,L,XL,XXL}	women	{shirt}	e5463438-0caf-49cb-aaa7-dc3250f9a2f3
11b5d8a4-722e-48b3-a956-9af6ff8c2b1c	Kids 3D T Logo Tee	30	Designed for fit, comfort and style, the Tesla T Logo Tee is made from 100% Peruvian cotton and features a silicone-printed T Logo on the left chest.	kids_3d_t_logo_tee	10	{XS,S,M}	kid	{shirt}	e5463438-0caf-49cb-aaa7-dc3250f9a2f3
74dd13ae-708c-4e10-a0a9-4268e23b7793	Men's 3D T Logo Long Sleeve Tee	40	Designed for fit, comfort and style, the Men's 3D T Logo Long Sleeve Tee is made from 100% cotton and features an understated T logo on the left chest.	men_3d_t_logo_long_sleeve_tee	12	{XS,XXL}	men	{shirt}	e5463438-0caf-49cb-aaa7-dc3250f9a2f3
57bd5634-d9c8-4e74-a145-1abe10908768	Women's Cropped Puffer Jacket	225	The Women's Cropped Puffer Jacket features a uniquely cropped silhouette for the perfect, modern style while on the go during the cozy season ahead. The puffer features subtle silicone injected Tesla logos below the back collar and on the right sleeve, custom matte metal zipper pulls and a soft, fleece lined collar. Made from 87% nylon and 13% polyurethane.	women_cropped_puffer_jacket	85	{XS,S,M}	women	{hoodie}	e5463438-0caf-49cb-aaa7-dc3250f9a2f3
5a34b696-c55e-4dfe-b970-ff8d9ef901f0	Women's Raven Joggers	100	Introducing the Tesla Raven Collection. The Women's Raven Joggers have a premium, relaxed silhouette made from a sustainable bamboo cotton blend. The joggers feature a subtle thermoplastic polyurethane Tesla wordmark and T logo and a french terry interior for a cozy look and feel in every season. Pair them with your Raven Slouchy Crew Sweatshirt, Raven Lightweight Zip Up Jacket or other favorite on the go fit. Made from 70% bamboo and 30% cotton.	women_raven_joggers	162	{XS,S,M,L,XL,XXL}	women	{shirt}	e5463438-0caf-49cb-aaa7-dc3250f9a2f3
658a386a-4d0b-48f8-9901-a7f125ec1c2e	Zero Emissions (Almost) Onesie	30	Show your commitment to sustainable energy with this cheeky onesie for your young one. Note: Does not prevent emissions. 100% Cotton. Made in Peru.	zero_emissions_(almost)_onesie	10	{XS,S}	kid	{shirt}	e5463438-0caf-49cb-aaa7-dc3250f9a2f3
bc654bd7-97b4-4027-9483-ec32a0f85cde	Chill Pullover Hoodie	130	Introducing the Tesla Chill Collection. The Chill Pullover Hoodie has a premium, heavyweight exterior and soft fleece interior for comfort in any season. The unisex hoodie features subtle thermoplastic polyurethane Tesla logos across the chest and on the sleeve, a double layer single seam hood and pockets with custom matte zipper pulls. Made from 60% cotton and 40% recycled polyester.	chill_pullover_hoodie	10	{XS,S,M,L,XL,XXL}	unisex	{hoodie}	e5463438-0caf-49cb-aaa7-dc3250f9a2f3
3a2062cf-4b1d-4512-9f36-7d0562e999f1	Women's Chill Half Zip Cropped Hoodie	130	Introducing the Tesla Chill Collection. The Women's Chill Half Zip Cropped Hoodie has a premium, soft fleece exterior and cropped silhouette for comfort in everyday lifestyle. The hoodie features an elastic hem that gathers at the waist, subtle thermoplastic polyurethane Tesla logos along the hood and on the sleeve, a double layer single seam hood and a custom ring zipper pull. Made from 60% cotton and 40% recycled polyester.	women_chill_half_zip_cropped_hoodie	10	{XS,S,M,XXL}	women	{hoodie}	e5463438-0caf-49cb-aaa7-dc3250f9a2f3
2ea52863-f768-4653-a134-652b001a77e4	Women's Plaid Mode Tee	35	Designed to celebrate Tesla's incredible performance mode, the Plaid Mode Tee features great fit, comfort and style. Made from 100% cotton, it's the next best thing to riding shotgun at the Nürburgring.	women_plaid_mode_tee	16	{S,M}	women	{shirt}	e5463438-0caf-49cb-aaa7-dc3250f9a2f3
59128e7a-0483-4564-a786-daaa97ae55ce	Kids Checkered Tee	30	The checkered tee is made from long grain, GMO free Peruvian cotton. Peru is the only country in the world where cotton is picked by hand on a large scale. The 4,500-year-old tradition prevents damage to the fiber during the picking process and removes the need to use chemicals to open the cotton plants before harvest. This environmentally friendly process results in cotton that is soft, strong, and lustrous – and the tee will get even softer with every wash.	kids_checkered_tee	10	{XS,S,M}	kid	{shirt}	e5463438-0caf-49cb-aaa7-dc3250f9a2f3
2b191361-ef49-4524-bea4-acf783010aad	Men's Chill Full Zip Hoodie	85	Introducing the Tesla Chill Collection. The Men's Chill Full Zip Hoodie has a premium, heavyweight exterior and soft fleece interior for comfort in any season. The hoodie features subtle thermoplastic polyurethane Tesla logos on the left chest and sleeve, a double layer single seam hood and pockets with custom matte zipper pulls. Made from 60% cotton and 40% recycled polyester.	men_chill_full_zip_hoodie	100	{XS,L,XL,XXL}	men	{shirt}	e5463438-0caf-49cb-aaa7-dc3250f9a2f3
03da27d7-87fd-4ed4-882c-bde8c1ab5220	Women's Raven Slouchy Crew Sweatshirt	110	Introducing the Tesla Raven Collection. The Women's Raven Slouchy Crew Sweatshirt has a premium, relaxed silhouette made from a sustainable bamboo cotton blend. The slouchy crew features a subtle thermoplastic polyurethane Tesla wordmark on the left sleeve and a french terry interior for a cozy look and feel in every season. Pair it with your Raven Joggers or favorite on the go fit. Made from 70% bamboo and 30% cotton.	women_raven_slouchy_crew_sweatshirt	9	{XS,S,M,L,XL,XXL}	women	{hoodie}	e5463438-0caf-49cb-aaa7-dc3250f9a2f3
5ea1ece6-8722-43ed-8188-9b6c42fbe426	Women’s Powerwall Tee	130	Inspired by our popular home battery, the Tesla Powerwall Tee is made from 100% cotton and features the phrase 'Pure Energy' under our signature logo in the back. Designed for fit, comfort and style, the exclusive tee promotes sustainable energy in any	women_powerwall_tee	10	{XS,S,M,L,XL,XXL}	women	{shirt}	e5463438-0caf-49cb-aaa7-dc3250f9a2f3
c7e47726-bc49-4a12-910a-fefb419ec7f1	Made on Earth by Humans Onesie	25	For the future space traveler with discerning taste, a soft, cotton onesie with snap closure bottom. Clear labeling provided in case of contact with a new spacefaring civilization. 100% Cotton. Made in Peru	made_on_earth_by_humans_onesie	16	{XS,S}	kid	{shirt}	e5463438-0caf-49cb-aaa7-dc3250f9a2f3
fd8c350d-0eb5-4930-ac6f-ea2bb7c0c980	Men's Chill Quarter Zip Pullover - Gray	85	Introducing the Tesla Chill Collection. The Men’s Chill Quarter Zip Pullover has a premium, heavyweight exterior and soft fleece interior for comfort in any season. The pullover features subtle thermoplastic polyurethane Tesla logos on the left chest and below the back collar, as well as a custom matte zipper pull. Made from 60% cotton and 40% recycled polyester.	men_chill_quarter_zip_pullover_-_gray	7	{XS,S,M}	men	{shirt}	e5463438-0caf-49cb-aaa7-dc3250f9a2f3
9798121e-537e-47ef-9e79-4cb1f1bb9aee	Women's Turbine Cropped Long Sleeve Tee	45	Introducing the Tesla Turbine Collection. Designed for style, comfort and everyday lifestyle, the Women's Turbine Cropped Long Sleeve Tee features a subtle, water-based Tesla wordmark across the chest and our T logo below the back collar. The lightweight material is double-dyed, creating a soft, casual style with a cropped silhouette. Made from 50% cotton and 50%	women_turbine_cropped_long_sleeve_tee	10	{XS,S,M,L,XL,XXL}	women	{shirt}	e5463438-0caf-49cb-aaa7-dc3250f9a2f3
6566692d-0e2d-4192-8e30-b205de0d2ce0	Women's Corp Jacket	90	Fully customized and uniquely styled, the Women's Corp Jacket features a silicone-printed 'T' logo on the left chest and prominent Tesla wordmark across the back.	women_corp_jacket	3	{M,L,XL,XXL}	women	{shirt}	e5463438-0caf-49cb-aaa7-dc3250f9a2f3
0d138fa7-7dc5-4f2f-870e-547b9428dd01	Scribble T Logo Onesie	30	The Kids Scribble T Logo Onesie is made from 100% Peruvian cotton and features a Tesla T sketched logo for every little artist to wear.	scribble_t_logo_onesie	0	{XS,S}	kid	{shirt}	e5463438-0caf-49cb-aaa7-dc3250f9a2f3
808c9eea-1b3e-4095-9afa-f4472e1d2751	Men's Chill Quarter Zip Pullover - White	85	Introducing the Tesla Chill Collection. The Men’s Chill Quarter Zip Pullover has a premium, heavyweight exterior and soft fleece interior for comfort in any season. The pullover features subtle thermoplastic polyurethane Tesla logos on the left chest and below the back collar, as well as a custom matte zipper pull. Made from 60% cotton and 40% recycled polyester.	men_chill_quarter_zip_pullover_-_white	15	{XS,S,M,L}	men	{shirt}	e5463438-0caf-49cb-aaa7-dc3250f9a2f3
bc2dae76-d191-4c23-b35a-4d915946efb8	Women's Turbine Cropped Short Sleeve Tee	40	ntroducing the Tesla Turbine Collection. Designed for style, comfort and everyday lifestyle, the Women's Turbine Cropped Short Sleeve Tee features a subtle, water-based Tesla wordmark across the chest and our T logo below the back collar. The lightweight material is double-dyed, creating a soft, casual style with a cropped silhouette. Made from 50% cotton and 50% polyester.	women_turbine_cropped_short_sleeve_tee	0	{XS,S}	women	{shirt}	e5463438-0caf-49cb-aaa7-dc3250f9a2f3
77438516-6b5d-4f90-bb0e-88a56495a951	Kids Cybertruck Tee	25	The Kids Cybertruck Tee features the iconic Cybertruck graffiti wordmark and is made from 100% Peruvian cotton for maximum comfort.	kids_cybertruck_tee	10	{XS,S,M}	kid	{shirt}	e5463438-0caf-49cb-aaa7-dc3250f9a2f3
f863bfcc-9bc4-46c2-a66f-1726c509c884	3D Large Wordmark Pullover Hoodie	70	The Unisex 3D Large Wordmark Pullover Hoodie features soft fleece and an adjustable, jersey-lined hood for comfort and coverage. Designed in a unisex style, the pullover hoodie includes a tone-on-tone 3D silicone-printed wordmark across the chest.	3d_large_wordmark_pullover_hoodie	15	{XS,S,XL,XXL}	unisex	{hoodie}	e5463438-0caf-49cb-aaa7-dc3250f9a2f3
35bd06cd-b8bd-453f-9bdc-c1eb7a31c7d7	Women's T Logo Short Sleeve Scoop Neck Tee	35	Designed for style and comfort, the ultrasoft Women's T Logo Short Sleeve Scoop Neck Tee features a tonal 3D silicone-printed T logo on the left chest. Made of 50% Peruvian cotton and 50% Peruvian viscose.	women_t_logo_short_sleeve_scoop_neck_tee	30	{XS,S,M,L,XL,XXL}	women	{shirt}	e5463438-0caf-49cb-aaa7-dc3250f9a2f3
e03dd848-724f-4284-8a6f-dc4619310036	Kids Scribble T Logo Tee	25	The Kids Scribble T Logo Tee is made from 100% Peruvian cotton and features a Tesla T sketched logo for every young artist to wear.	kids_scribble_t_logo_tee	0	{XS,S,M}	kid	{shirt}	e5463438-0caf-49cb-aaa7-dc3250f9a2f3
24e7ea31-4daa-4e9d-b046-d7c1ca1744c5	Kids Corp Jacket	30	Cruise the playground in style with the Kids Corp Jacket. Modeled after the original Tesla Corp Jacket, the Kids Corp Jacket features the same understated style and high-quality materials but at a pint-sized scale.	kids_corp_jacket	10	{XS,S,M}	kid	{shirt}	e5463438-0caf-49cb-aaa7-dc3250f9a2f3
b98f48d9-bf4a-4542-85d8-29d1a9026447	Men's Raven Lightweight Hoodie	115	Introducing the Tesla Raven Collection. The Men's Raven Lightweight Hoodie has a premium, relaxed silhouette made from a sustainable bamboo cotton blend. The hoodie features subtle thermoplastic polyurethane Tesla logos across the chest and on the sleeve with a french terry interior for versatility in any season. Made from 70% bamboo and 30% cotton.	men_raven_lightweight_hoodie	10	{XS,S,M,L,XL,XXL}	men	{hoodie}	e5463438-0caf-49cb-aaa7-dc3250f9a2f3
5759ec14-1519-4955-ae8f-b6bb39212920	Women's Large Wordmark Short Sleeve Crew Neck Tee	35	Designed for style and comfort, the Women's Large Wordmark Short Sleeve Crew Neck Tee features a tonal 3D silicone-printed wordmark across the chest. Made of 100% Peruvian pima cotton.	women_large_wordmark_short_sleeve_crew_neck_tee	5	{XL,XXL}	women	{shirt}	e5463438-0caf-49cb-aaa7-dc3250f9a2f3
c68e6675-5dd7-4f6e-b481-6f3c805bdadd	Kids Cyberquad Bomber Jacket	65	Wear your Kids Cyberquad Bomber Jacket during your adventures on Cyberquad for Kids. The bomber jacket features a graffiti-style illustration of our Cyberquad silhouette and wordmark. With three zippered pockets and our signature T logo and Tesla wordmark printed along the sleeves, Kids Cyberquad Bomber Jacket is perfect for wherever the trail takes you. Made from 60% cotton and 40% polyester.	kids_cyberquad_bomber_jacket	10	{XS,S,M}	kid	{shirt}	e5463438-0caf-49cb-aaa7-dc3250f9a2f3
7949fc89-c84f-4799-944e-76478eb6a3bd	Relaxed T Logo Hat	30	The Relaxed T Logo Hat is a classic silhouette combined with modern details, featuring a 3D T logo and a custom metal buckle closure. The ultrasoft design is flexible and abrasion resistant, while the inner sweatband includes quilted padding for extra comfort and moisture wicking. The visor is fully made from recycled plastic bottles. 100% Cotton.	relaxed_t_logo_hat	11	{XS,S,M,L,XL,XXL}	unisex	{hats}	e5463438-0caf-49cb-aaa7-dc3250f9a2f3
5eb3ff4f-deab-4228-95f0-f76a2a0e5f25	Kids Cybertruck Long Sleeve Tee	30	Designed for fit, comfort and style, the Kids Cybertruck Graffiti Long Sleeve Tee features a water-based Cybertruck graffiti wordmark across the chest, a Tesla wordmark down the left arm and our signature T logo on the back collar. Made from 50% cotton and 50% polyester.	kids_cybertruck_long_sleeve_tee	10	{XS,S,M}	kid	{shirt}	e5463438-0caf-49cb-aaa7-dc3250f9a2f3
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, email, password, "fullName", "isActive", roles) FROM stdin;
e5463438-0caf-49cb-aaa7-dc3250f9a2f3	test1@google.com	$2a$10$iUrtvOhXjU.qE0pYixkq2ODNn2FoNEGAOQk3/8z8UEwwHfa0cJSiu	Juan Carlos	t	{admin}
3b4c95a3-6ea1-4d07-8566-5dbb600e74c0	test2@google.com	$2a$10$AsoabNx.bDHzbNVezlhApOzhaXzba9i8yRj8NGS3OU62htc.Rib4W	María Solano	t	{user,super}
\.


--
-- Name: product_images_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_images_id_seq', 215, true);


--
-- Name: products PK_0806c755e0aca124e67c0cf6d7d; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT "PK_0806c755e0aca124e67c0cf6d7d" PRIMARY KEY (id);


--
-- Name: product_images PK_1974264ea7265989af8392f63a1; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_images
    ADD CONSTRAINT "PK_1974264ea7265989af8392f63a1" PRIMARY KEY (id);


--
-- Name: users PK_a3ffb1c0c8416b9fc6f907b7433; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT "PK_a3ffb1c0c8416b9fc6f907b7433" PRIMARY KEY (id);


--
-- Name: products UQ_464f927ae360106b783ed0b4106; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT "UQ_464f927ae360106b783ed0b4106" UNIQUE (slug);


--
-- Name: users UQ_97672ac88f789774dd47f7c8be3; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT "UQ_97672ac88f789774dd47f7c8be3" UNIQUE (email);


--
-- Name: products UQ_c30f00a871de74c8e8c213acc4a; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT "UQ_c30f00a871de74c8e8c213acc4a" UNIQUE (title);


--
-- Name: products FK_99d90c2a483d79f3b627fb1d5e9; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT "FK_99d90c2a483d79f3b627fb1d5e9" FOREIGN KEY ("userId") REFERENCES public.users(id);


--
-- Name: product_images FK_b367708bf720c8dd62fc6833161; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_images
    ADD CONSTRAINT "FK_b367708bf720c8dd62fc6833161" FOREIGN KEY ("productId") REFERENCES public.products(id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

