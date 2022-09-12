--
-- PostgreSQL database dump
--

-- Dumped from database version 14.4 (Ubuntu 14.4-1.pgdg20.04+1)
-- Dumped by pg_dump version 14.5 (Ubuntu 14.5-0ubuntu0.22.04.1)

-- Started on 2022-09-12 17:47:55 -03

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

DROP DATABASE d2sn80m46ickq;
--
-- TOC entry 4367 (class 1262 OID 26152805)
-- Name: d2sn80m46ickq; Type: DATABASE; Schema: -; Owner: hdpupxhwvrjzbg
--

CREATE DATABASE d2sn80m46ickq WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'en_US.UTF-8';


ALTER DATABASE d2sn80m46ickq OWNER TO hdpupxhwvrjzbg;

\connect d2sn80m46ickq

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
-- TOC entry 4369 (class 0 OID 0)
-- Name: d2sn80m46ickq; Type: DATABASE PROPERTIES; Schema: -; Owner: hdpupxhwvrjzbg
--

ALTER DATABASE d2sn80m46ickq SET search_path TO '$user', 'public', 'heroku_ext';


\connect d2sn80m46ickq

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
-- TOC entry 6 (class 2615 OID 26152806)
-- Name: heroku_ext; Type: SCHEMA; Schema: -; Owner: u8q98eik4pd35o
--

CREATE SCHEMA heroku_ext;


ALTER SCHEMA heroku_ext OWNER TO u8q98eik4pd35o;

--
-- TOC entry 833 (class 1247 OID 26912505)
-- Name: cardType; Type: TYPE; Schema: public; Owner: hdpupxhwvrjzbg
--

CREATE TYPE public."cardType" AS ENUM (
    'credit',
    'debit',
    'both'
);


ALTER TYPE public."cardType" OWNER TO hdpupxhwvrjzbg;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 210 (class 1259 OID 26912511)
-- Name: _prisma_migrations; Type: TABLE; Schema: public; Owner: hdpupxhwvrjzbg
--

CREATE TABLE public._prisma_migrations (
    id character varying(36) NOT NULL,
    checksum character varying(64) NOT NULL,
    finished_at timestamp with time zone,
    migration_name character varying(255) NOT NULL,
    logs text,
    rolled_back_at timestamp with time zone,
    started_at timestamp with time zone DEFAULT now() NOT NULL,
    applied_steps_count integer DEFAULT 0 NOT NULL
);


ALTER TABLE public._prisma_migrations OWNER TO hdpupxhwvrjzbg;

--
-- TOC entry 211 (class 1259 OID 26912518)
-- Name: cards; Type: TABLE; Schema: public; Owner: hdpupxhwvrjzbg
--

CREATE TABLE public.cards (
    id integer NOT NULL,
    "createdAt" timestamp(6) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    title text NOT NULL,
    number text NOT NULL,
    "cardholderName" text NOT NULL,
    "securityCode" text NOT NULL,
    "expirationDate" text NOT NULL,
    password text NOT NULL,
    "isVirtual" boolean NOT NULL,
    type public."cardType" NOT NULL,
    "userId" integer NOT NULL
);


ALTER TABLE public.cards OWNER TO hdpupxhwvrjzbg;

--
-- TOC entry 212 (class 1259 OID 26912524)
-- Name: cards_id_seq; Type: SEQUENCE; Schema: public; Owner: hdpupxhwvrjzbg
--

CREATE SEQUENCE public.cards_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cards_id_seq OWNER TO hdpupxhwvrjzbg;

--
-- TOC entry 4372 (class 0 OID 0)
-- Dependencies: 212
-- Name: cards_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hdpupxhwvrjzbg
--

ALTER SEQUENCE public.cards_id_seq OWNED BY public.cards.id;


--
-- TOC entry 213 (class 1259 OID 26912525)
-- Name: credentials; Type: TABLE; Schema: public; Owner: hdpupxhwvrjzbg
--

CREATE TABLE public.credentials (
    id integer NOT NULL,
    "createdAt" timestamp(6) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    url text NOT NULL,
    username text NOT NULL,
    password text NOT NULL,
    title text NOT NULL,
    "userId" integer NOT NULL
);


ALTER TABLE public.credentials OWNER TO hdpupxhwvrjzbg;

--
-- TOC entry 214 (class 1259 OID 26912531)
-- Name: credentials_id_seq; Type: SEQUENCE; Schema: public; Owner: hdpupxhwvrjzbg
--

CREATE SEQUENCE public.credentials_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.credentials_id_seq OWNER TO hdpupxhwvrjzbg;

--
-- TOC entry 4373 (class 0 OID 0)
-- Dependencies: 214
-- Name: credentials_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hdpupxhwvrjzbg
--

ALTER SEQUENCE public.credentials_id_seq OWNED BY public.credentials.id;


--
-- TOC entry 215 (class 1259 OID 26912532)
-- Name: notes; Type: TABLE; Schema: public; Owner: hdpupxhwvrjzbg
--

CREATE TABLE public.notes (
    id integer NOT NULL,
    "createdAt" timestamp(6) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    title text NOT NULL,
    description text NOT NULL,
    "userId" integer NOT NULL
);


ALTER TABLE public.notes OWNER TO hdpupxhwvrjzbg;

--
-- TOC entry 216 (class 1259 OID 26912538)
-- Name: notes_id_seq; Type: SEQUENCE; Schema: public; Owner: hdpupxhwvrjzbg
--

CREATE SEQUENCE public.notes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.notes_id_seq OWNER TO hdpupxhwvrjzbg;

--
-- TOC entry 4374 (class 0 OID 0)
-- Dependencies: 216
-- Name: notes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hdpupxhwvrjzbg
--

ALTER SEQUENCE public.notes_id_seq OWNED BY public.notes.id;


--
-- TOC entry 217 (class 1259 OID 26912539)
-- Name: users; Type: TABLE; Schema: public; Owner: hdpupxhwvrjzbg
--

CREATE TABLE public.users (
    id integer NOT NULL,
    "createdAt" timestamp(6) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    email text NOT NULL,
    password text NOT NULL
);


ALTER TABLE public.users OWNER TO hdpupxhwvrjzbg;

--
-- TOC entry 218 (class 1259 OID 26912545)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: hdpupxhwvrjzbg
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO hdpupxhwvrjzbg;

--
-- TOC entry 4375 (class 0 OID 0)
-- Dependencies: 218
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hdpupxhwvrjzbg
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- TOC entry 219 (class 1259 OID 26912546)
-- Name: wifis; Type: TABLE; Schema: public; Owner: hdpupxhwvrjzbg
--

CREATE TABLE public.wifis (
    id integer NOT NULL,
    "createdAt" timestamp(6) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    title text NOT NULL,
    "networkName" text NOT NULL,
    password text NOT NULL,
    "userId" integer NOT NULL
);


ALTER TABLE public.wifis OWNER TO hdpupxhwvrjzbg;

--
-- TOC entry 220 (class 1259 OID 26912552)
-- Name: wifis_id_seq; Type: SEQUENCE; Schema: public; Owner: hdpupxhwvrjzbg
--

CREATE SEQUENCE public.wifis_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wifis_id_seq OWNER TO hdpupxhwvrjzbg;

--
-- TOC entry 4376 (class 0 OID 0)
-- Dependencies: 220
-- Name: wifis_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hdpupxhwvrjzbg
--

ALTER SEQUENCE public.wifis_id_seq OWNED BY public.wifis.id;


--
-- TOC entry 4182 (class 2604 OID 26912553)
-- Name: cards id; Type: DEFAULT; Schema: public; Owner: hdpupxhwvrjzbg
--

ALTER TABLE ONLY public.cards ALTER COLUMN id SET DEFAULT nextval('public.cards_id_seq'::regclass);


--
-- TOC entry 4184 (class 2604 OID 26912554)
-- Name: credentials id; Type: DEFAULT; Schema: public; Owner: hdpupxhwvrjzbg
--

ALTER TABLE ONLY public.credentials ALTER COLUMN id SET DEFAULT nextval('public.credentials_id_seq'::regclass);


--
-- TOC entry 4186 (class 2604 OID 26912555)
-- Name: notes id; Type: DEFAULT; Schema: public; Owner: hdpupxhwvrjzbg
--

ALTER TABLE ONLY public.notes ALTER COLUMN id SET DEFAULT nextval('public.notes_id_seq'::regclass);


--
-- TOC entry 4188 (class 2604 OID 26912556)
-- Name: users id; Type: DEFAULT; Schema: public; Owner: hdpupxhwvrjzbg
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- TOC entry 4190 (class 2604 OID 26912557)
-- Name: wifis id; Type: DEFAULT; Schema: public; Owner: hdpupxhwvrjzbg
--

ALTER TABLE ONLY public.wifis ALTER COLUMN id SET DEFAULT nextval('public.wifis_id_seq'::regclass);


--
-- TOC entry 4351 (class 0 OID 26912511)
-- Dependencies: 210
-- Data for Name: _prisma_migrations; Type: TABLE DATA; Schema: public; Owner: hdpupxhwvrjzbg
--

INSERT INTO public._prisma_migrations (id, checksum, finished_at, migration_name, logs, rolled_back_at, started_at, applied_steps_count) VALUES ('834a5b9d-aae8-44c8-b004-6b84b8619761', '545deedee70f7cdb61a11595bba6839e53c1ab75d07bef95a83cb5c51f5b95f5', '2022-09-10 21:38:18.487436+00', '20220910181942_first_tables', NULL, NULL, '2022-09-10 21:38:17.499163+00', 1);
INSERT INTO public._prisma_migrations (id, checksum, finished_at, migration_name, logs, rolled_back_at, started_at, applied_steps_count) VALUES ('cb1604a9-7b8e-4c7d-a265-485ba900b568', '5f8e091832a722f2f1165fa287f915de9fa8e5d58758ffdfafce6eac22da6952', '2022-09-10 21:38:20.105464+00', '20220910192219_alter_table_passwords_to_credentials', NULL, NULL, '2022-09-10 21:38:19.081291+00', 1);
INSERT INTO public._prisma_migrations (id, checksum, finished_at, migration_name, logs, rolled_back_at, started_at, applied_steps_count) VALUES ('f1f32802-a2ba-41d5-b0b9-f9e1fc7dc360', 'c0f54d057e8336e44c0247af8ad82462a9030feda6f8ce9da1dfe88c0a9d9c18', '2022-09-10 21:38:42.818257+00', '20220910213837_fix', NULL, NULL, '2022-09-10 21:38:40.668133+00', 1);
INSERT INTO public._prisma_migrations (id, checksum, finished_at, migration_name, logs, rolled_back_at, started_at, applied_steps_count) VALUES ('6d2e9dff-a5d3-4b45-8b3e-41de872319c4', 'b83bbd4f3e1a7ca76b8bae4c3aaab40389654c122a171fa50a24cdb01b24cc14', '2022-09-11 23:32:07.091087+00', '20220911233202_model_notes_creation', NULL, NULL, '2022-09-11 23:32:06.067247+00', 1);
INSERT INTO public._prisma_migrations (id, checksum, finished_at, migration_name, logs, rolled_back_at, started_at, applied_steps_count) VALUES ('6a4c8318-1d51-4977-aea2-3d06e1f29e60', '7deee306bcff450ea18bea603f31c15010f909e04ba7e1544fb3c7863dc29bd0', '2022-09-12 15:37:10.445453+00', '20220912153704_model_cards_and_enum_card_types_creation', NULL, NULL, '2022-09-12 15:37:08.301453+00', 1);
INSERT INTO public._prisma_migrations (id, checksum, finished_at, migration_name, logs, rolled_back_at, started_at, applied_steps_count) VALUES ('ce69252c-c8a1-40a8-a986-a2e4582a6687', '725350943be3e95ef530d9c3e073d71bb2bb09c6b438bb1a5ba18d8375ce5b9b', '2022-09-12 17:29:07.210642+00', '20220912172902_model_wifis_creation', NULL, NULL, '2022-09-12 17:29:06.187064+00', 1);


--
-- TOC entry 4352 (class 0 OID 26912518)
-- Dependencies: 211
-- Data for Name: cards; Type: TABLE DATA; Schema: public; Owner: hdpupxhwvrjzbg
--

INSERT INTO public.cards (id, "createdAt", title, number, "cardholderName", "securityCode", "expirationDate", password, "isVirtual", type, "userId") VALUES (3, '2022-09-12 19:30:38.502', 'cartao1', '4930798111448417', 'Stella', '529df87b6558e7771ba06264f732fdc9371b782e07e812a58d00d3812a92dc8164c3d6a6ac93c60dc691fe7c33abd77310abbe28a99e515c4600494b5e01a2c9d5a0d2cb93ad8adc17a9de32f19f87e61ce1c355d3c8d0754af29636db094e068c9f49', '12/29', 'f569339429893cfe077cdc56e9a86fd447727f6745b27886c76df62e2a1ed5ac0bc747d9c48707de459e0c55c443bd7467e96dea8a4d52440d9a142c1f1aad8fbb0a1c42b44712b3f6bee6e6354ddb5ee0e0518456ef635db59008c79610c4d23bbd95', false, 'both', 4);
INSERT INTO public.cards (id, "createdAt", title, number, "cardholderName", "securityCode", "expirationDate", password, "isVirtual", type, "userId") VALUES (4, '2022-09-12 19:30:44.86', 'cartao2', '4930798111448417', 'Stella', '64f66b492bf9ed3746c5204b117b64600404297464e4d5b70b887259ea0916f3bb8a1251f7adf78dc46db17b45bdaedc7aa12ab31ca5401d681fa51ef54a0150679cccabdf6355a59cf9534f74a1297874a4a2170671dd45d98a7a0cb8b84e5abd6905', '12/29', 'c1c3f35401c2fc99bceb4c4ed2167856805fcbff1b6d7bc6b36c1d8d857e87949322c73cea602fdc30ea0fe2eebeb12ef7cc16bdaa5623ef585e942a7fcf0c2f3bda20f260e13136f13e759a231e6be5086232011fb3e6c0c5391243fe9025e4a4ec36', false, 'both', 4);
INSERT INTO public.cards (id, "createdAt", title, number, "cardholderName", "securityCode", "expirationDate", password, "isVirtual", type, "userId") VALUES (5, '2022-09-12 19:30:49.898', 'cartao3', '4930798111448417', 'Stella', '889291abdedbf2c010b80b167043cb8562a688a2adc89342a84572a328d8a400bca543725654c9c9bcbc01a15c59b0e3140ae8e8aa496175f29cb9cbd93e27cb6d90900455a1101aacd9536f5a75db9068e167cec6345eb3f94268042120f3f22851d6', '12/29', 'a6b4dcb7bc4058e045fefd3a56b562e182530c2a3f960926c476a0fc311f73900e8688ba3a48a3c5e1f26ce3effaf7df1073c70ae91c6b9f333f8bee36029e5298a641840823b49cdf996715aa53f96567e00858529cf65eb264c06730e057de193a56', false, 'both', 4);


--
-- TOC entry 4354 (class 0 OID 26912525)
-- Dependencies: 213
-- Data for Name: credentials; Type: TABLE DATA; Schema: public; Owner: hdpupxhwvrjzbg
--

INSERT INTO public.credentials (id, "createdAt", url, username, password, title, "userId") VALUES (1, '2022-09-11 23:16:43.339', 'https://www.instagram.com/', 'tetela', 'a70e39aa701da85afac67fa9a5749feafc2c2db8cbc1b9dcf4681bf7d16de7422cde27aa19fdbe32065ead564b646b1f7bf54d4779542a273a0e4d4de0327b003c67333aa2b697f8cbf4d460d9c53291e1c6ee214bd15bc074262a57b8daa6cb0f9343a5096158fcd62f98ac8a74b509', 'instagram', 2);
INSERT INTO public.credentials (id, "createdAt", url, username, password, title, "userId") VALUES (2, '2022-09-11 23:22:14.14', 'https://www.xxxxxx.com/', 'tetela', '1ddad2fe4143c3b103b6af350850d5067434106c3cf693cdaeb65f49fd8255097487c24e3eb4a5e326dd492b6551c4bbd59dd75837c4d096b8d57f0b05f4efce2028117aef88fe40a6acb88db53a9014b2d214779cbab4f4f5bc281a7d9e7600135d555f295c53d7e668e28318158b9d', 'xxx', 2);
INSERT INTO public.credentials (id, "createdAt", url, username, password, title, "userId") VALUES (4, '2022-09-11 23:22:33.393', 'https://www.xxxxxx.com/', 'tetela', 'cec1a478f4571a86c17f0c55c36b07d74680251ffcfcb2697595747a715321ef7dcb02c8bf3d1596f0623eb69cfba559d306153651ea7dc3ba9acc99ab926ab5ab543159e4c4cebb68240d65a3a256c25888d67f8cc7bf848dc3673434f7e8b17870eb6a82cef99954b301e601240be5', '2', 2);
INSERT INTO public.credentials (id, "createdAt", url, username, password, title, "userId") VALUES (5, '2022-09-12 19:39:48.541', 'https://www.xxxxxx.com/', 'tetela', 'd0d8346a8c01318145a8cfa8212084a81f0922af105e7579fffa108492dfe2a47734e4f2e6c96d601c8b41f2b25934fae95b741fff1515b498367b1d08d3ae6c6ff1c8676e65c760a3211f4e1b2757654186eaa573de41c21e75e4d58d27782fa48f4ce885ace338c945bf40c907e9f8', 'xxx', 4);
INSERT INTO public.credentials (id, "createdAt", url, username, password, title, "userId") VALUES (7, '2022-09-12 19:42:21.867', 'https://www.xxxxxx.com/', 'tetela', 'c633da10ffcf989556f59457877856411f3d7e25cfacb783635b506d385047daf1dbca90c4f218d8a4e920ee385fafc61c6baf62c495685f50470a0e2680c2ab6924bb029418a7364e20026d4f21565e60927defa6a8a1ddf11f9a47a68564d7bdebadf14b0240e6f44298c8cefd9041', 'xxxxx', 4);


--
-- TOC entry 4356 (class 0 OID 26912532)
-- Dependencies: 215
-- Data for Name: notes; Type: TABLE DATA; Schema: public; Owner: hdpupxhwvrjzbg
--

INSERT INTO public.notes (id, "createdAt", title, description, "userId") VALUES (1, '2022-09-12 19:47:06.812', 'note1', 'notinha', 4);
INSERT INTO public.notes (id, "createdAt", title, description, "userId") VALUES (3, '2022-09-12 19:47:19.358', 'note3', 'notinha', 4);


--
-- TOC entry 4358 (class 0 OID 26912539)
-- Dependencies: 217
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: hdpupxhwvrjzbg
--

INSERT INTO public.users (id, "createdAt", email, password) VALUES (1, '2022-09-10 21:40:42.342', 'ana@gmail.com', '$2b$10$ORh8TX6JciDepQYi1S03KeJy0y63iDHWboWne//LtcDqJ.v6hd1JG');
INSERT INTO public.users (id, "createdAt", email, password) VALUES (2, '2022-09-10 21:42:03.261', 'ana@ana.com', '$2b$10$LzJU2bJjk6.g.qY.5u1J4.dISuhlAFeGgX/5pH39DCDFN5u6CaUKW');
INSERT INTO public.users (id, "createdAt", email, password) VALUES (3, '2022-09-11 23:38:10.351', 'ana1@gmail.com', '$2b$10$OD7aEdt8zK6DScVzNZIsIOTgckc2Y/dnguxaZPV7pzadpMtFji/Ky');
INSERT INTO public.users (id, "createdAt", email, password) VALUES (4, '2022-09-11 23:40:07.862', 'anap@gmail.com', '$2b$10$zjEYix91Tji/mS61ItDi3OD2lYzqZT86xa0AA/LMJeWjG3p6K4PDy');
INSERT INTO public.users (id, "createdAt", email, password) VALUES (5, '2022-09-12 15:05:37.314', 'guinho@gmail.com', '$2b$10$6nqyoJMVcHccuXEsHryO6Oa2fPDfZ7WmjL6GmprUKleD/ky/FG3Me');


--
-- TOC entry 4360 (class 0 OID 26912546)
-- Dependencies: 219
-- Data for Name: wifis; Type: TABLE DATA; Schema: public; Owner: hdpupxhwvrjzbg
--

INSERT INTO public.wifis (id, "createdAt", title, "networkName", password, "userId") VALUES (1, '2022-09-12 19:54:18.292', 'wifi1', 'casa', '301be49e4ffe67fe6f79c9b5e9b080212c7921d4c5536c8f209746b8c033d4e35e771a6e82fed8a56c2d2ed500b627dc996d5aeeb455c4aff978afad44b9795c4d1fe88180dacaaab2282b77038dd44fc1d4e20c2e5a5bc44a204160baa056b8fbbf5a0e', 4);
INSERT INTO public.wifis (id, "createdAt", title, "networkName", password, "userId") VALUES (2, '2022-09-12 19:55:30.073', 'wifi2', 'casa', '8bd149f29981677cb1310981afce68d98a5bc01054eacc342e1cf0bdaeb7469356117b65d4591701f716d3c2b897fea11977917dc246b117fcf5448863afb20d86eb6f5e426bf6156fb8d9212d0a4cc1d1f023b0283a2d594eb999f2c1e23aadbb1d6873', 4);


--
-- TOC entry 4377 (class 0 OID 0)
-- Dependencies: 212
-- Name: cards_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hdpupxhwvrjzbg
--

SELECT pg_catalog.setval('public.cards_id_seq', 5, true);


--
-- TOC entry 4378 (class 0 OID 0)
-- Dependencies: 214
-- Name: credentials_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hdpupxhwvrjzbg
--

SELECT pg_catalog.setval('public.credentials_id_seq', 7, true);


--
-- TOC entry 4379 (class 0 OID 0)
-- Dependencies: 216
-- Name: notes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hdpupxhwvrjzbg
--

SELECT pg_catalog.setval('public.notes_id_seq', 3, true);


--
-- TOC entry 4380 (class 0 OID 0)
-- Dependencies: 218
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hdpupxhwvrjzbg
--

SELECT pg_catalog.setval('public.users_id_seq', 5, true);


--
-- TOC entry 4381 (class 0 OID 0)
-- Dependencies: 220
-- Name: wifis_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hdpupxhwvrjzbg
--

SELECT pg_catalog.setval('public.wifis_id_seq', 3, true);


--
-- TOC entry 4192 (class 2606 OID 26912560)
-- Name: _prisma_migrations _prisma_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: hdpupxhwvrjzbg
--

ALTER TABLE ONLY public._prisma_migrations
    ADD CONSTRAINT _prisma_migrations_pkey PRIMARY KEY (id);


--
-- TOC entry 4194 (class 2606 OID 26912562)
-- Name: cards cards_pkey; Type: CONSTRAINT; Schema: public; Owner: hdpupxhwvrjzbg
--

ALTER TABLE ONLY public.cards
    ADD CONSTRAINT cards_pkey PRIMARY KEY (id);


--
-- TOC entry 4197 (class 2606 OID 26912564)
-- Name: credentials credentials_pkey; Type: CONSTRAINT; Schema: public; Owner: hdpupxhwvrjzbg
--

ALTER TABLE ONLY public.credentials
    ADD CONSTRAINT credentials_pkey PRIMARY KEY (id);


--
-- TOC entry 4200 (class 2606 OID 26912566)
-- Name: notes notes_pkey; Type: CONSTRAINT; Schema: public; Owner: hdpupxhwvrjzbg
--

ALTER TABLE ONLY public.notes
    ADD CONSTRAINT notes_pkey PRIMARY KEY (id);


--
-- TOC entry 4204 (class 2606 OID 26912568)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: hdpupxhwvrjzbg
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 4206 (class 2606 OID 26912570)
-- Name: wifis wifis_pkey; Type: CONSTRAINT; Schema: public; Owner: hdpupxhwvrjzbg
--

ALTER TABLE ONLY public.wifis
    ADD CONSTRAINT wifis_pkey PRIMARY KEY (id);


--
-- TOC entry 4195 (class 1259 OID 26912571)
-- Name: cards_title_userId_key; Type: INDEX; Schema: public; Owner: hdpupxhwvrjzbg
--

CREATE UNIQUE INDEX "cards_title_userId_key" ON public.cards USING btree (title, "userId");


--
-- TOC entry 4198 (class 1259 OID 26912572)
-- Name: credentials_title_userId_key; Type: INDEX; Schema: public; Owner: hdpupxhwvrjzbg
--

CREATE UNIQUE INDEX "credentials_title_userId_key" ON public.credentials USING btree (title, "userId");


--
-- TOC entry 4201 (class 1259 OID 26912573)
-- Name: notes_title_userId_key; Type: INDEX; Schema: public; Owner: hdpupxhwvrjzbg
--

CREATE UNIQUE INDEX "notes_title_userId_key" ON public.notes USING btree (title, "userId");


--
-- TOC entry 4202 (class 1259 OID 26912574)
-- Name: users_email_key; Type: INDEX; Schema: public; Owner: hdpupxhwvrjzbg
--

CREATE UNIQUE INDEX users_email_key ON public.users USING btree (email);


--
-- TOC entry 4207 (class 1259 OID 26912575)
-- Name: wifis_title_userId_key; Type: INDEX; Schema: public; Owner: hdpupxhwvrjzbg
--

CREATE UNIQUE INDEX "wifis_title_userId_key" ON public.wifis USING btree (title, "userId");


--
-- TOC entry 4208 (class 2606 OID 26912576)
-- Name: cards cards_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hdpupxhwvrjzbg
--

ALTER TABLE ONLY public.cards
    ADD CONSTRAINT "cards_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 4209 (class 2606 OID 26912581)
-- Name: credentials credentials_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hdpupxhwvrjzbg
--

ALTER TABLE ONLY public.credentials
    ADD CONSTRAINT "credentials_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 4210 (class 2606 OID 26912586)
-- Name: notes notes_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hdpupxhwvrjzbg
--

ALTER TABLE ONLY public.notes
    ADD CONSTRAINT "notes_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 4211 (class 2606 OID 26912591)
-- Name: wifis wifis_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hdpupxhwvrjzbg
--

ALTER TABLE ONLY public.wifis
    ADD CONSTRAINT "wifis_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 4368 (class 0 OID 0)
-- Dependencies: 4367
-- Name: DATABASE d2sn80m46ickq; Type: ACL; Schema: -; Owner: hdpupxhwvrjzbg
--

REVOKE CONNECT,TEMPORARY ON DATABASE d2sn80m46ickq FROM PUBLIC;


--
-- TOC entry 4370 (class 0 OID 0)
-- Dependencies: 6
-- Name: SCHEMA heroku_ext; Type: ACL; Schema: -; Owner: u8q98eik4pd35o
--

GRANT USAGE ON SCHEMA heroku_ext TO hdpupxhwvrjzbg;


--
-- TOC entry 4371 (class 0 OID 0)
-- Dependencies: 854
-- Name: LANGUAGE plpgsql; Type: ACL; Schema: -; Owner: postgres
--

GRANT ALL ON LANGUAGE plpgsql TO hdpupxhwvrjzbg;


-- Completed on 2022-09-12 17:48:16 -03

--
-- PostgreSQL database dump complete
--

