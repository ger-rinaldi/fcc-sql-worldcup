--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE worldcup;
--
-- Name: worldcup; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE worldcup WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE worldcup OWNER TO freecodecamp;

\connect worldcup

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
    year integer NOT NULL,
    round character varying(15) NOT NULL,
    winner_id integer NOT NULL,
    opponent_id integer NOT NULL,
    winner_goals integer NOT NULL,
    opponent_goals integer NOT NULL
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
-- Name: teams; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.teams (
    team_id integer NOT NULL,
    name character varying(20) NOT NULL
);


ALTER TABLE public.teams OWNER TO freecodecamp;

--
-- Name: teams_team_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.teams_team_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.teams_team_id_seq OWNER TO freecodecamp;

--
-- Name: teams_team_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.teams_team_id_seq OWNED BY public.teams.team_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: teams team_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams ALTER COLUMN team_id SET DEFAULT nextval('public.teams_team_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (208, 2018, 'Final', 422, 419, 4, 2);
INSERT INTO public.games VALUES (209, 2018, 'Third Place', 414, 421, 2, 0);
INSERT INTO public.games VALUES (210, 2018, 'Semi-Final', 419, 421, 2, 1);
INSERT INTO public.games VALUES (211, 2018, 'Semi-Final', 422, 414, 1, 0);
INSERT INTO public.games VALUES (212, 2018, 'Quarter-Final', 419, 430, 3, 2);
INSERT INTO public.games VALUES (213, 2018, 'Quarter-Final', 421, 432, 2, 0);
INSERT INTO public.games VALUES (214, 2018, 'Quarter-Final', 414, 415, 2, 1);
INSERT INTO public.games VALUES (215, 2018, 'Quarter-Final', 422, 435, 2, 0);
INSERT INTO public.games VALUES (216, 2018, 'Eighth-Final', 421, 417, 2, 1);
INSERT INTO public.games VALUES (217, 2018, 'Eighth-Final', 432, 433, 1, 0);
INSERT INTO public.games VALUES (218, 2018, 'Eighth-Final', 414, 425, 3, 2);
INSERT INTO public.games VALUES (219, 2018, 'Eighth-Final', 415, 426, 2, 0);
INSERT INTO public.games VALUES (220, 2018, 'Eighth-Final', 419, 420, 2, 1);
INSERT INTO public.games VALUES (221, 2018, 'Eighth-Final', 430, 431, 2, 1);
INSERT INTO public.games VALUES (222, 2018, 'Eighth-Final', 435, 429, 2, 1);
INSERT INTO public.games VALUES (223, 2018, 'Eighth-Final', 422, 413, 4, 3);
INSERT INTO public.games VALUES (224, 2014, 'Final', 423, 413, 1, 0);
INSERT INTO public.games VALUES (225, 2014, 'Third Place', 427, 415, 3, 0);
INSERT INTO public.games VALUES (226, 2014, 'Semi-Final', 413, 427, 1, 0);
INSERT INTO public.games VALUES (227, 2014, 'Semi-Final', 423, 415, 7, 1);
INSERT INTO public.games VALUES (228, 2014, 'Quarter-Final', 427, 418, 1, 0);
INSERT INTO public.games VALUES (229, 2014, 'Quarter-Final', 413, 414, 1, 0);
INSERT INTO public.games VALUES (230, 2014, 'Quarter-Final', 415, 417, 2, 1);
INSERT INTO public.games VALUES (231, 2014, 'Quarter-Final', 423, 422, 1, 0);
INSERT INTO public.games VALUES (232, 2014, 'Eighth-Final', 415, 416, 2, 1);
INSERT INTO public.games VALUES (233, 2014, 'Eighth-Final', 417, 435, 2, 0);
INSERT INTO public.games VALUES (234, 2014, 'Eighth-Final', 422, 428, 2, 0);
INSERT INTO public.games VALUES (235, 2014, 'Eighth-Final', 423, 412, 2, 1);
INSERT INTO public.games VALUES (236, 2014, 'Eighth-Final', 427, 426, 2, 1);
INSERT INTO public.games VALUES (237, 2014, 'Eighth-Final', 418, 424, 2, 1);
INSERT INTO public.games VALUES (238, 2014, 'Eighth-Final', 413, 433, 1, 0);
INSERT INTO public.games VALUES (239, 2014, 'Eighth-Final', 414, 434, 2, 1);


--
-- Data for Name: teams; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.teams VALUES (412, 'Algeria');
INSERT INTO public.teams VALUES (413, 'Argentina');
INSERT INTO public.teams VALUES (414, 'Belgium');
INSERT INTO public.teams VALUES (415, 'Brazil');
INSERT INTO public.teams VALUES (416, 'Chile');
INSERT INTO public.teams VALUES (417, 'Colombia');
INSERT INTO public.teams VALUES (418, 'Costa Rica');
INSERT INTO public.teams VALUES (419, 'Croatia');
INSERT INTO public.teams VALUES (420, 'Denmark');
INSERT INTO public.teams VALUES (421, 'England');
INSERT INTO public.teams VALUES (422, 'France');
INSERT INTO public.teams VALUES (423, 'Germany');
INSERT INTO public.teams VALUES (424, 'Greece');
INSERT INTO public.teams VALUES (425, 'Japan');
INSERT INTO public.teams VALUES (426, 'Mexico');
INSERT INTO public.teams VALUES (427, 'Netherlands');
INSERT INTO public.teams VALUES (428, 'Nigeria');
INSERT INTO public.teams VALUES (429, 'Portugal');
INSERT INTO public.teams VALUES (430, 'Russia');
INSERT INTO public.teams VALUES (431, 'Spain');
INSERT INTO public.teams VALUES (432, 'Sweden');
INSERT INTO public.teams VALUES (433, 'Switzerland');
INSERT INTO public.teams VALUES (434, 'United States');
INSERT INTO public.teams VALUES (435, 'Uruguay');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 239, true);


--
-- Name: teams_team_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.teams_team_id_seq', 435, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: teams teams_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_name_key UNIQUE (name);


--
-- Name: teams teams_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_pkey PRIMARY KEY (team_id);


--
-- Name: games games_opponent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_opponent_id_fkey FOREIGN KEY (opponent_id) REFERENCES public.teams(team_id);


--
-- Name: games games_winner_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_winner_id_fkey FOREIGN KEY (winner_id) REFERENCES public.teams(team_id);


--
-- PostgreSQL database dump complete
--


