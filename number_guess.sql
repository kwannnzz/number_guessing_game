--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    username character varying(22) NOT NULL,
    games_played integer DEFAULT 0,
    best_game integer DEFAULT ((10)::double precision ^ (6)::double precision)
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES ('user_1720452522251', 2, 312);
INSERT INTO public.users VALUES ('user_1720452854941', 2, 298);
INSERT INTO public.users VALUES ('user_1720452522252', 5, 6);
INSERT INTO public.users VALUES ('user_1720452854942', 5, 40);
INSERT INTO public.users VALUES ('user_1720452593348', 2, 241);
INSERT INTO public.users VALUES ('user_1720452593349', 5, 541);
INSERT INTO public.users VALUES ('user_1720452649154', 2, 534);
INSERT INTO public.users VALUES ('user_1720452649155', 5, 156);
INSERT INTO public.users VALUES ('user_1720452664053', 2, 15);
INSERT INTO public.users VALUES ('user_1720452664054', 5, 201);
INSERT INTO public.users VALUES ('kwan', 1, 15);
INSERT INTO public.users VALUES ('user_1720452790934', 2, 469);
INSERT INTO public.users VALUES ('user_1720452790935', 5, 8);
INSERT INTO public.users VALUES ('user_1720452816894', 2, 311);
INSERT INTO public.users VALUES ('user_1720452816895', 5, 157);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (username);


--
-- PostgreSQL database dump complete
--

