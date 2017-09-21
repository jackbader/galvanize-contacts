--
-- PostgreSQL database cluster dump
--

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Roles
--

CREATE ROLE galvanize_admin;
ALTER ROLE galvanize_admin WITH SUPERUSER INHERIT NOCREATEROLE NOCREATEDB LOGIN NOREPLICATION NOBYPASSRLS PASSWORD 'md5833e0e0498d058c604274e91012b4d65';
CREATE ROLE jack;
ALTER ROLE jack WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS;






--
-- Database creation
--

CREATE DATABASE galvanize_contacts WITH TEMPLATE = template0 OWNER = jack;
REVOKE CONNECT,TEMPORARY ON DATABASE galvanize_contacts FROM PUBLIC;
CREATE DATABASE irisfun WITH TEMPLATE = template0 OWNER = jack;
CREATE DATABASE jack WITH TEMPLATE = template0 OWNER = jack;
CREATE DATABASE resume_builder WITH TEMPLATE = template0 OWNER = jack;
REVOKE CONNECT,TEMPORARY ON DATABASE template1 FROM PUBLIC;
GRANT CONNECT ON DATABASE template1 TO PUBLIC;


\connect galvanize_contacts

SET default_transaction_read_only = off;

--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.5
-- Dumped by pg_dump version 9.6.5

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: contact; Type: TABLE; Schema: public; Owner: jack
--

CREATE TABLE contact (
    id integer NOT NULL,
    type character varying,
    value character varying,
    user_id integer
);


ALTER TABLE contact OWNER TO jack;

--
-- Name: contact_id_seq; Type: SEQUENCE; Schema: public; Owner: jack
--

CREATE SEQUENCE contact_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE contact_id_seq OWNER TO jack;

--
-- Name: contact_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jack
--

ALTER SEQUENCE contact_id_seq OWNED BY contact.id;


--
-- Name: user; Type: TABLE; Schema: public; Owner: jack
--

CREATE TABLE "user" (
    id integer NOT NULL,
    first_name character varying,
    last_name character varying,
    date_of_birth date,
    biography character varying
);


ALTER TABLE "user" OWNER TO jack;

--
-- Name: user_id_seq; Type: SEQUENCE; Schema: public; Owner: jack
--

CREATE SEQUENCE user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE user_id_seq OWNER TO jack;

--
-- Name: user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jack
--

ALTER SEQUENCE user_id_seq OWNED BY "user".id;


--
-- Name: contact id; Type: DEFAULT; Schema: public; Owner: jack
--

ALTER TABLE ONLY contact ALTER COLUMN id SET DEFAULT nextval('contact_id_seq'::regclass);


--
-- Name: user id; Type: DEFAULT; Schema: public; Owner: jack
--

ALTER TABLE ONLY "user" ALTER COLUMN id SET DEFAULT nextval('user_id_seq'::regclass);


--
-- Name: contact contact_pkey; Type: CONSTRAINT; Schema: public; Owner: jack
--

ALTER TABLE ONLY contact
    ADD CONSTRAINT contact_pkey PRIMARY KEY (id);


--
-- Name: user user_pkey; Type: CONSTRAINT; Schema: public; Owner: jack
--

ALTER TABLE ONLY "user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);


--
-- Name: contact contact_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: jack
--

ALTER TABLE ONLY contact
    ADD CONSTRAINT contact_user_id_fkey FOREIGN KEY (user_id) REFERENCES "user"(id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

\connect irisfun

SET default_transaction_read_only = off;

--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.5
-- Dumped by pg_dump version 9.6.5

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: iris; Type: TABLE; Schema: public; Owner: jack
--

CREATE TABLE iris (
    id integer NOT NULL,
    sepal_length numeric,
    sepal_width numeric,
    petal_length numeric,
    petal_width numeric,
    species character varying
);


ALTER TABLE iris OWNER TO jack;

--
-- Name: iris_id_seq; Type: SEQUENCE; Schema: public; Owner: jack
--

CREATE SEQUENCE iris_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE iris_id_seq OWNER TO jack;

--
-- Name: iris_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jack
--

ALTER SEQUENCE iris_id_seq OWNED BY iris.id;


--
-- Name: iris id; Type: DEFAULT; Schema: public; Owner: jack
--

ALTER TABLE ONLY iris ALTER COLUMN id SET DEFAULT nextval('iris_id_seq'::regclass);


--
-- Name: iris iris_pkey; Type: CONSTRAINT; Schema: public; Owner: jack
--

ALTER TABLE ONLY iris
    ADD CONSTRAINT iris_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

\connect jack

SET default_transaction_read_only = off;

--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.5
-- Dumped by pg_dump version 9.6.5

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: cohorts; Type: TABLE; Schema: public; Owner: jack
--

CREATE TABLE cohorts (
    id integer NOT NULL,
    name character varying
);


ALTER TABLE cohorts OWNER TO jack;

--
-- Name: cohorts_id_seq; Type: SEQUENCE; Schema: public; Owner: jack
--

CREATE SEQUENCE cohorts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cohorts_id_seq OWNER TO jack;

--
-- Name: cohorts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jack
--

ALTER SEQUENCE cohorts_id_seq OWNED BY cohorts.id;


--
-- Name: cohorts id; Type: DEFAULT; Schema: public; Owner: jack
--

ALTER TABLE ONLY cohorts ALTER COLUMN id SET DEFAULT nextval('cohorts_id_seq'::regclass);


--
-- Name: cohorts cohorts_pkey; Type: CONSTRAINT; Schema: public; Owner: jack
--

ALTER TABLE ONLY cohorts
    ADD CONSTRAINT cohorts_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

\connect postgres

SET default_transaction_read_only = off;

--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.5
-- Dumped by pg_dump version 9.6.5

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: postgres; Type: COMMENT; Schema: -; Owner: jack
--

COMMENT ON DATABASE postgres IS 'default administrative connection database';


--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- PostgreSQL database dump complete
--

\connect resume_builder

SET default_transaction_read_only = off;

--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.5
-- Dumped by pg_dump version 9.6.5

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: employments; Type: TABLE; Schema: public; Owner: jack
--

CREATE TABLE employments (
    id integer NOT NULL,
    user_id integer,
    title character varying(50),
    organization character varying(50),
    description character varying(100),
    start_year integer,
    end_year integer,
    created_at timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE employments OWNER TO jack;

--
-- Name: employments_id_seq; Type: SEQUENCE; Schema: public; Owner: jack
--

CREATE SEQUENCE employments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE employments_id_seq OWNER TO jack;

--
-- Name: employments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jack
--

ALTER SEQUENCE employments_id_seq OWNED BY employments.id;


--
-- Name: employments_resumes; Type: TABLE; Schema: public; Owner: jack
--

CREATE TABLE employments_resumes (
    id integer NOT NULL,
    resume_id integer,
    employment_id integer
);


ALTER TABLE employments_resumes OWNER TO jack;

--
-- Name: employments_resumes_id_seq; Type: SEQUENCE; Schema: public; Owner: jack
--

CREATE SEQUENCE employments_resumes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE employments_resumes_id_seq OWNER TO jack;

--
-- Name: employments_resumes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jack
--

ALTER SEQUENCE employments_resumes_id_seq OWNED BY employments_resumes.id;


--
-- Name: resumes; Type: TABLE; Schema: public; Owner: jack
--

CREATE TABLE resumes (
    id integer NOT NULL,
    name character varying(50),
    user_id integer,
    created_at timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE resumes OWNER TO jack;

--
-- Name: resumes_id_seq; Type: SEQUENCE; Schema: public; Owner: jack
--

CREATE SEQUENCE resumes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE resumes_id_seq OWNER TO jack;

--
-- Name: resumes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jack
--

ALTER SEQUENCE resumes_id_seq OWNED BY resumes.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: jack
--

CREATE TABLE users (
    id integer NOT NULL,
    first_name character varying(50),
    last_name character varying(50),
    email character varying(50),
    created_at timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE users OWNER TO jack;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: jack
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE users_id_seq OWNER TO jack;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jack
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: employments id; Type: DEFAULT; Schema: public; Owner: jack
--

ALTER TABLE ONLY employments ALTER COLUMN id SET DEFAULT nextval('employments_id_seq'::regclass);


--
-- Name: employments_resumes id; Type: DEFAULT; Schema: public; Owner: jack
--

ALTER TABLE ONLY employments_resumes ALTER COLUMN id SET DEFAULT nextval('employments_resumes_id_seq'::regclass);


--
-- Name: resumes id; Type: DEFAULT; Schema: public; Owner: jack
--

ALTER TABLE ONLY resumes ALTER COLUMN id SET DEFAULT nextval('resumes_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: jack
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Name: employments employments_pkey; Type: CONSTRAINT; Schema: public; Owner: jack
--

ALTER TABLE ONLY employments
    ADD CONSTRAINT employments_pkey PRIMARY KEY (id);


--
-- Name: employments_resumes employments_resumes_pkey; Type: CONSTRAINT; Schema: public; Owner: jack
--

ALTER TABLE ONLY employments_resumes
    ADD CONSTRAINT employments_resumes_pkey PRIMARY KEY (id);


--
-- Name: resumes resumes_pkey; Type: CONSTRAINT; Schema: public; Owner: jack
--

ALTER TABLE ONLY resumes
    ADD CONSTRAINT resumes_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: jack
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: employments_resumes employments_resumes_employment_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: jack
--

ALTER TABLE ONLY employments_resumes
    ADD CONSTRAINT employments_resumes_employment_id_fkey FOREIGN KEY (employment_id) REFERENCES employments(id);


--
-- Name: employments_resumes employments_resumes_resume_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: jack
--

ALTER TABLE ONLY employments_resumes
    ADD CONSTRAINT employments_resumes_resume_id_fkey FOREIGN KEY (resume_id) REFERENCES resumes(id);


--
-- PostgreSQL database dump complete
--

\connect template1

SET default_transaction_read_only = off;

--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.5
-- Dumped by pg_dump version 9.6.5

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: template1; Type: COMMENT; Schema: -; Owner: jack
--

COMMENT ON DATABASE template1 IS 'default template for new databases';


--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database cluster dump complete
--

