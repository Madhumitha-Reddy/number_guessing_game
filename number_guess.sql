--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    user_id integer NOT NULL,
    guesses integer NOT NULL
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(22) NOT NULL
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (1, 1, 10);
INSERT INTO public.games VALUES (2, 2, 7);
INSERT INTO public.games VALUES (7, 8, 1);
INSERT INTO public.games VALUES (8, 9, 869);
INSERT INTO public.games VALUES (9, 9, 586);
INSERT INTO public.games VALUES (10, 11, 743);
INSERT INTO public.games VALUES (11, 12, 42);
INSERT INTO public.games VALUES (12, 13, 811);
INSERT INTO public.games VALUES (13, 13, 150);
INSERT INTO public.games VALUES (14, 14, 681);
INSERT INTO public.games VALUES (15, 14, 368);
INSERT INTO public.games VALUES (16, 13, 704);
INSERT INTO public.games VALUES (17, 13, 888);
INSERT INTO public.games VALUES (18, 13, 583);
INSERT INTO public.games VALUES (19, 15, 894);
INSERT INTO public.games VALUES (20, 15, 107);
INSERT INTO public.games VALUES (21, 16, 675);
INSERT INTO public.games VALUES (22, 16, 933);
INSERT INTO public.games VALUES (23, 15, 300);
INSERT INTO public.games VALUES (24, 15, 85);
INSERT INTO public.games VALUES (25, 15, 166);
INSERT INTO public.games VALUES (26, 17, 148);
INSERT INTO public.games VALUES (27, 17, 857);
INSERT INTO public.games VALUES (28, 18, 320);
INSERT INTO public.games VALUES (29, 18, 767);
INSERT INTO public.games VALUES (30, 17, 433);
INSERT INTO public.games VALUES (31, 17, 716);
INSERT INTO public.games VALUES (32, 17, 135);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (1, 'Madhumitha');
INSERT INTO public.users VALUES (2, 'madhumitha');
INSERT INTO public.users VALUES (6, '');
INSERT INTO public.users VALUES (7, 'probe_existing');
INSERT INTO public.users VALUES (8, 'probe_1792665912');
INSERT INTO public.users VALUES (9, 'matrix_returning');
INSERT INTO public.users VALUES (10, 'auth_probe');
INSERT INTO public.users VALUES (11, 'matrix_new_1792665981');
INSERT INTO public.users VALUES (12, 'invalid_1792665991');
INSERT INTO public.users VALUES (13, 'user_1792666003800');
INSERT INTO public.users VALUES (14, 'user_1792666003799');
INSERT INTO public.users VALUES (15, 'user_1792666047108');
INSERT INTO public.users VALUES (16, 'user_1792666047107');
INSERT INTO public.users VALUES (17, 'user_1792666100729');
INSERT INTO public.users VALUES (18, 'user_1792666100728');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 32, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 18, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- Name: games games_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--

