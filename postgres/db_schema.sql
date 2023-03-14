--
-- PostgreSQL database dump
--

-- Dumped from database version 15.1 (Debian 15.1-1.pgdg110+1)
-- Dumped by pg_dump version 15.1 (Debian 15.1-1.pgdg110+1)

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: staging; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.staging (
    id integer NOT NULL,
    bucket character varying NOT NULL,
    object character varying NOT NULL,
    metadata json,
    malware boolean
);


ALTER TABLE public.staging OWNER TO postgres;

--
-- Name: staging_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.staging_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.staging_id_seq OWNER TO postgres;

--
-- Name: staging_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.staging_id_seq OWNED BY public.staging.id;


--
-- Name: storage; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.storage (
    id integer NOT NULL,
    hash character varying NOT NULL,
    bucket character varying NOT NULL,
    object character varying NOT NULL
);


ALTER TABLE public.storage OWNER TO postgres;

--
-- Name: TABLE storage; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.storage IS 'table containing information about the location for every data object in datalake';


--
-- Name: COLUMN storage.hash; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.storage.hash IS 'sha256 of a particular S3 object. Should be the value of dcm_identifier object property';


--
-- Name: storage_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.storage_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.storage_id_seq OWNER TO postgres;

--
-- Name: storage_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.storage_id_seq OWNED BY public.storage.id;


--
-- Name: triples; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.triples (
    id integer NOT NULL,
    subject character varying NOT NULL,
    predicate character varying NOT NULL,
    object character varying
);


ALTER TABLE public.triples OWNER TO postgres;

--
-- Name: TABLE triples; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.triples IS 'table representing the triples dictated by RDF file format';


--
-- Name: triples_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.triples_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.triples_id_seq OWNER TO postgres;

--
-- Name: triples_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.triples_id_seq OWNED BY public.triples.id;


--
-- Name: staging id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.staging ALTER COLUMN id SET DEFAULT nextval('public.staging_id_seq'::regclass);


--
-- Name: storage id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.storage ALTER COLUMN id SET DEFAULT nextval('public.storage_id_seq'::regclass);


--
-- Name: triples id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.triples ALTER COLUMN id SET DEFAULT nextval('public.triples_id_seq'::regclass);


--
-- Data for Name: staging; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.staging (id, bucket, object, metadata, malware) FROM stdin;
\.


--
-- Data for Name: storage; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.storage (id, hash, bucket, object) FROM stdin;
\.


--
-- Data for Name: triples; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.triples (id, subject, predicate, object) FROM stdin;
\.


--
-- Name: staging_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.staging_id_seq', 2, true);


--
-- Name: storage_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.storage_id_seq', 2, true);


--
-- Name: triples_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.triples_id_seq', 1, true);


--
-- Name: staging staging_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.staging
    ADD CONSTRAINT staging_pkey PRIMARY KEY (id);


--
-- Name: storage storage_hash_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.storage
    ADD CONSTRAINT storage_hash_key UNIQUE (hash);


--
-- Name: storage storage_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.storage
    ADD CONSTRAINT storage_id_key UNIQUE (id);


--
-- Name: storage storage_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.storage
    ADD CONSTRAINT storage_pk PRIMARY KEY (id);


--
-- Name: triples triples_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.triples
    ADD CONSTRAINT triples_id_key UNIQUE (id);


--
-- Name: triples triples_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.triples
    ADD CONSTRAINT triples_pk PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

