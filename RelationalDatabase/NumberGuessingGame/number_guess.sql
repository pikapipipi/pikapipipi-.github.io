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

DROP DATABASE numberguess;
--
-- Name: numberguess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE numberguess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE numberguess OWNER TO freecodecamp;

\connect numberguess

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
    answer integer NOT NULL,
    attempt integer NOT NULL,
    user_id integer NOT NULL
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
    username character varying(22)
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

INSERT INTO public.games VALUES (1, 2, 2, 1);
INSERT INTO public.games VALUES (2, 25, 15, 1);
INSERT INTO public.games VALUES (3, 32, 25, 2);
INSERT INTO public.games VALUES (4, 48, 5, 3);
INSERT INTO public.games VALUES (5, 32, 2, 2);
INSERT INTO public.games VALUES (6, 508, 9, 6);
INSERT INTO public.games VALUES (7, 715, 11, 1);
INSERT INTO public.games VALUES (8, 626, 626, 7);
INSERT INTO public.games VALUES (9, 850, 850, 7);
INSERT INTO public.games VALUES (10, 563, 563, 8);
INSERT INTO public.games VALUES (11, 397, 397, 8);
INSERT INTO public.games VALUES (12, 682, 684, 7);
INSERT INTO public.games VALUES (13, 395, 395, 7);
INSERT INTO public.games VALUES (14, 56, 56, 7);
INSERT INTO public.games VALUES (15, 129, 129, 9);
INSERT INTO public.games VALUES (16, 403, 403, 9);
INSERT INTO public.games VALUES (17, 52, 52, 10);
INSERT INTO public.games VALUES (18, 459, 459, 10);
INSERT INTO public.games VALUES (19, 328, 330, 9);
INSERT INTO public.games VALUES (20, 254, 254, 9);
INSERT INTO public.games VALUES (21, 902, 902, 9);
INSERT INTO public.games VALUES (22, 538, 538, 11);
INSERT INTO public.games VALUES (23, 681, 681, 11);
INSERT INTO public.games VALUES (24, 510, 510, 12);
INSERT INTO public.games VALUES (25, 547, 547, 12);
INSERT INTO public.games VALUES (26, 655, 657, 11);
INSERT INTO public.games VALUES (27, 671, 671, 11);
INSERT INTO public.games VALUES (28, 534, 534, 11);
INSERT INTO public.games VALUES (29, 612, 612, 13);
INSERT INTO public.games VALUES (30, 154, 154, 13);
INSERT INTO public.games VALUES (31, 240, 240, 14);
INSERT INTO public.games VALUES (32, 306, 306, 14);
INSERT INTO public.games VALUES (33, 218, 220, 13);
INSERT INTO public.games VALUES (34, 215, 215, 13);
INSERT INTO public.games VALUES (35, 329, 329, 13);
INSERT INTO public.games VALUES (36, 862, 862, 15);
INSERT INTO public.games VALUES (37, 280, 280, 15);
INSERT INTO public.games VALUES (38, 565, 565, 16);
INSERT INTO public.games VALUES (39, 460, 460, 16);
INSERT INTO public.games VALUES (40, 717, 719, 15);
INSERT INTO public.games VALUES (41, 237, 237, 15);
INSERT INTO public.games VALUES (42, 584, 584, 15);
INSERT INTO public.games VALUES (43, 592, 592, 17);
INSERT INTO public.games VALUES (44, 550, 550, 17);
INSERT INTO public.games VALUES (45, 68, 68, 18);
INSERT INTO public.games VALUES (46, 789, 789, 18);
INSERT INTO public.games VALUES (47, 351, 353, 17);
INSERT INTO public.games VALUES (48, 206, 206, 17);
INSERT INTO public.games VALUES (49, 793, 793, 17);
INSERT INTO public.games VALUES (50, 610, 611, 19);
INSERT INTO public.games VALUES (51, 356, 357, 19);
INSERT INTO public.games VALUES (52, 704, 705, 20);
INSERT INTO public.games VALUES (53, 89, 90, 20);
INSERT INTO public.games VALUES (54, 922, 925, 19);
INSERT INTO public.games VALUES (55, 207, 209, 19);
INSERT INTO public.games VALUES (56, 947, 948, 19);
INSERT INTO public.games VALUES (57, 406, 406, 22);
INSERT INTO public.games VALUES (58, 487, 487, 22);
INSERT INTO public.games VALUES (59, 609, 609, 23);
INSERT INTO public.games VALUES (60, 222, 222, 23);
INSERT INTO public.games VALUES (61, 371, 373, 22);
INSERT INTO public.games VALUES (62, 69, 69, 22);
INSERT INTO public.games VALUES (63, 85, 85, 22);
INSERT INTO public.games VALUES (64, 408, 409, 24);
INSERT INTO public.games VALUES (65, 652, 653, 24);
INSERT INTO public.games VALUES (66, 228, 229, 25);
INSERT INTO public.games VALUES (67, 613, 614, 25);
INSERT INTO public.games VALUES (68, 524, 527, 24);
INSERT INTO public.games VALUES (69, 933, 935, 24);
INSERT INTO public.games VALUES (70, 834, 835, 24);
INSERT INTO public.games VALUES (71, 136, 137, 26);
INSERT INTO public.games VALUES (72, 34, 35, 26);
INSERT INTO public.games VALUES (73, 287, 288, 27);
INSERT INTO public.games VALUES (74, 749, 750, 27);
INSERT INTO public.games VALUES (75, 227, 230, 26);
INSERT INTO public.games VALUES (76, 223, 225, 26);
INSERT INTO public.games VALUES (77, 833, 834, 26);
INSERT INTO public.games VALUES (78, 205, 206, 28);
INSERT INTO public.games VALUES (79, 912, 913, 28);
INSERT INTO public.games VALUES (80, 402, 403, 29);
INSERT INTO public.games VALUES (81, 974, 975, 29);
INSERT INTO public.games VALUES (82, 295, 298, 28);
INSERT INTO public.games VALUES (83, 239, 241, 28);
INSERT INTO public.games VALUES (84, 332, 333, 28);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (1, 'Ashley');
INSERT INTO public.users VALUES (2, 'Bella');
INSERT INTO public.users VALUES (3, 'Christine');
INSERT INTO public.users VALUES (4, 'Dawson');
INSERT INTO public.users VALUES (5, 'Elvis');
INSERT INTO public.users VALUES (6, 'Fred');
INSERT INTO public.users VALUES (7, 'user_1711989642996');
INSERT INTO public.users VALUES (8, 'user_1711989642995');
INSERT INTO public.users VALUES (9, 'user_1711989656092');
INSERT INTO public.users VALUES (10, 'user_1711989656091');
INSERT INTO public.users VALUES (11, 'user_1711989668085');
INSERT INTO public.users VALUES (12, 'user_1711989668084');
INSERT INTO public.users VALUES (13, 'user_1711989673746');
INSERT INTO public.users VALUES (14, 'user_1711989673745');
INSERT INTO public.users VALUES (15, 'user_1711989677441');
INSERT INTO public.users VALUES (16, 'user_1711989677440');
INSERT INTO public.users VALUES (17, 'user_1711989688207');
INSERT INTO public.users VALUES (18, 'user_1711989688206');
INSERT INTO public.users VALUES (19, 'user_1711989705050');
INSERT INTO public.users VALUES (20, 'user_1711989705049');
INSERT INTO public.users VALUES (21, 'Evlis');
INSERT INTO public.users VALUES (22, 'user_1711989786838');
INSERT INTO public.users VALUES (23, 'user_1711989786837');
INSERT INTO public.users VALUES (24, 'user_1711989793835');
INSERT INTO public.users VALUES (25, 'user_1711989793834');
INSERT INTO public.users VALUES (26, 'user_1711990149813');
INSERT INTO public.users VALUES (27, 'user_1711990149812');
INSERT INTO public.users VALUES (28, 'user_1711990332154');
INSERT INTO public.users VALUES (29, 'user_1711990332153');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 84, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 29, true);


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

