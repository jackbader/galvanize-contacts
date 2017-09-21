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
-- PostgreSQL database cluster dump complete
--

