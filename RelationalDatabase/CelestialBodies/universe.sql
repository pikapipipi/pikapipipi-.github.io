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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: deities; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.deities (
    deities_id integer NOT NULL,
    name character varying(30) NOT NULL,
    religion text,
    knownas text,
    planet_id integer,
    moon_id integer
);


ALTER TABLE public.deities OWNER TO freecodecamp;

--
-- Name: deities_deities_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.deities_deities_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.deities_deities_id_seq OWNER TO freecodecamp;

--
-- Name: deities_deities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.deities_deities_id_seq OWNED BY public.deities.deities_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    constellation text,
    distance_in_kly integer,
    stars_in_billion integer,
    apparentmagnitude_in_m numeric(4,2),
    visiblewithnakeeye boolean
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    colour text,
    distance_in_lm integer,
    apparentmagnitude_in_m numeric(4,2),
    visiblewithnakeeye boolean,
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    colour text,
    distance_in_lm integer,
    apparentmagnitude_in_m numeric(4,2),
    visiblewithnakeeye boolean,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    constellation text,
    distance_in_ly integer,
    apparentmagnitude_in_m numeric(4,2),
    visiblewithnakeeye boolean,
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: deities deities_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.deities ALTER COLUMN deities_id SET DEFAULT nextval('public.deities_deities_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: deities; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.deities VALUES (1, 'Mercury', 'Roman', 'Messenger of the gods', 1, NULL);
INSERT INTO public.deities VALUES (2, 'Venus', 'Roman', 'Goddess of love, beauty, and pleasure', 2, NULL);
INSERT INTO public.deities VALUES (3, 'Aphrodite', 'Greek', 'Goddess of love, beauty, pleasure, and procreation', 2, NULL);
INSERT INTO public.deities VALUES (4, 'Mars', 'Roman', 'God of war', 4, NULL);
INSERT INTO public.deities VALUES (5, 'Ares', 'Greek', 'God of war', 4, NULL);
INSERT INTO public.deities VALUES (6, 'Jupiter', 'Roman', 'King of the gods, god of sky and thunder', 5, NULL);
INSERT INTO public.deities VALUES (7, 'Zeus', 'Greek', 'King of the gods, god of sky and thunder', 5, NULL);
INSERT INTO public.deities VALUES (8, 'Saturn', 'Roman', 'God of agriculture, time, and harvest', 6, NULL);
INSERT INTO public.deities VALUES (9, 'Cronus', 'Greek', 'Titan god of time, harvest, and the sky', 6, NULL);
INSERT INTO public.deities VALUES (10, 'Uranus', 'Greek', 'Primordial god of the sky', 7, NULL);
INSERT INTO public.deities VALUES (11, 'Caelus', 'Roman', 'God of the sky', 7, NULL);
INSERT INTO public.deities VALUES (12, 'Neptune', 'Roman', 'God of the sea and freshwater', 8, NULL);
INSERT INTO public.deities VALUES (13, 'Poseidon', 'Greek', 'God of the sea, earthquakes, and horses', 8, NULL);
INSERT INTO public.deities VALUES (14, 'Moon', 'Roman', 'Moon goddess', 3, 1);
INSERT INTO public.deities VALUES (15, 'Phobos & Deimos', 'Greek', 'Sons of Ares (god of war)', 4, 2);
INSERT INTO public.deities VALUES (16, 'Io', 'Greek', 'Daughter of Inachus (river god)', 5, 4);
INSERT INTO public.deities VALUES (17, 'Europa', 'Greek', 'Daughter of Agenor (king of Tyre)', 5, 5);
INSERT INTO public.deities VALUES (18, 'Ganymede', 'Greek', 'Son of Tros (king of Troy)', 5, 6);
INSERT INTO public.deities VALUES (19, 'Callisto', 'Greek', 'Daughter of Lycaon (king of Arcadia)', 5, 7);
INSERT INTO public.deities VALUES (20, 'Titan', 'Greek', 'Primordial race of powerful beings', 6, 10);
INSERT INTO public.deities VALUES (21, 'Rhea', 'Greek', 'Titan goddess, wife of Cronus (Titan god of time)', 6, 11);
INSERT INTO public.deities VALUES (22, 'Iapetus', 'Greek', 'Titan god, son of Uranus (primordial god of the sky)', 6, 12);
INSERT INTO public.deities VALUES (23, 'Dione', 'Greek', 'Titan goddess, daughter of Uranus and Gaia (primordial goddess of Earth)', 6, 13);
INSERT INTO public.deities VALUES (24, 'Titania', 'Greek', 'Queen of the fairies', 7, 14);
INSERT INTO public.deities VALUES (25, 'Oberon', 'Mischievous spirit', 'King of the fairies', 7, 15);
INSERT INTO public.deities VALUES (26, 'Umbriel', 'Mischievous spirit', 'A mischievous spirit', 7, 16);
INSERT INTO public.deities VALUES (27, 'Ariel', 'Mischievous spirit', 'A benevolent spirit', 7, 17);
INSERT INTO public.deities VALUES (28, 'Triton', 'Greek', 'Son of Poseidon (god of the sea)', 8, 18);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Sagittarius', 1, 400, -5.10, true);
INSERT INTO public.galaxy VALUES (2, 'Large Magellanic Cloud', 'Dorado/Mensa', 160, 550, 0.90, true);
INSERT INTO public.galaxy VALUES (3, 'Andromeda Galaxy', 'Andromeda', 200, 1000, 2.70, true);
INSERT INTO public.galaxy VALUES (4, 'Triangulum Galaxy', 'Triangulum', 3, 40, 5.70, true);
INSERT INTO public.galaxy VALUES (5, 'Centaurus A', 'Centaurus', 14, 1000, 6.84, true);
INSERT INTO public.galaxy VALUES (6, 'Bodes Galaxy', 'Ursa Major', 12, 250, 6.94, true);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 'Grey', 2, -12.60, true, 3);
INSERT INTO public.moon VALUES (2, 'Phobos', 'Black', 1, 11.30, false, 4);
INSERT INTO public.moon VALUES (3, 'Deimos', 'Grey', 4, 12.90, false, 4);
INSERT INTO public.moon VALUES (4, 'Io', 'Orange White', 2, -5.00, false, 5);
INSERT INTO public.moon VALUES (5, 'Europa', 'Yellow White', 3, -5.70, false, 5);
INSERT INTO public.moon VALUES (6, 'Ganymede', 'Grey White', 7, -4.50, false, 5);
INSERT INTO public.moon VALUES (7, 'Callisto', 'Grey Brown', 17, -5.90, false, 5);
INSERT INTO public.moon VALUES (8, 'Himalia', 'Grey Brown', 242, -7.10, false, 5);
INSERT INTO public.moon VALUES (9, 'Elara', 'Grey Brown', 315, -7.30, false, 5);
INSERT INTO public.moon VALUES (10, 'Titan', 'Orange Brown', 24, -7.90, false, 6);
INSERT INTO public.moon VALUES (11, 'Rhea', 'Grey Brown', 9, -7.60, false, 6);
INSERT INTO public.moon VALUES (12, 'Iapetus', 'Black White', 79, -7.00, false, 6);
INSERT INTO public.moon VALUES (13, 'Dione', 'Grey White', 37, -7.70, false, 6);
INSERT INTO public.moon VALUES (14, 'Titania', 'Grey Brown', 43, -7.70, false, 7);
INSERT INTO public.moon VALUES (15, 'Oberon', 'Reddish Brown', 53, -7.70, false, 7);
INSERT INTO public.moon VALUES (16, 'Umbriel', 'Grey Black', 42, -7.20, false, 7);
INSERT INTO public.moon VALUES (17, 'Ariel', 'White Grey', 40, -7.40, false, 7);
INSERT INTO public.moon VALUES (18, 'Triton', 'Grey Reddish Brown', 355, -7.80, false, 8);
INSERT INTO public.moon VALUES (19, 'Proteus', 'Black Grey', 118, -7.10, false, 8);
INSERT INTO public.moon VALUES (20, 'Nereid', 'Grey Blue', 550, -6.50, false, 8);
INSERT INTO public.moon VALUES (21, 'Larissa', 'Grey White', 74, -7.20, false, 8);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 'Grey', 3, 2.20, true, 1);
INSERT INTO public.planet VALUES (2, 'Venus', 'Golden Brown', 6, -4.60, true, 1);
INSERT INTO public.planet VALUES (3, 'Earth', 'blue', 8, NULL, true, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 'red', 13, -2.30, true, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 'Brown Red', 43, -2.70, true, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 'Grey Yellow', 1, -0.40, true, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 'Cyan', 3, 5.70, true, 1);
INSERT INTO public.planet VALUES (8, 'Neptune', 'Blue', 4, 7.90, false, 1);
INSERT INTO public.planet VALUES (9, 'HD 33579 b', NULL, 164, 11.20, false, 2);
INSERT INTO public.planet VALUES (10, 'HD 33579 c', NULL, 164, 12.50, false, 2);
INSERT INTO public.planet VALUES (11, 'B324 b', 'Orange Brown', 1290, 8.60, false, 4);
INSERT INTO public.planet VALUES (12, 'Kepler-186f', NULL, 512, 16.20, false, 1);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', NULL, 0, -27.00, true, 1);
INSERT INTO public.star VALUES (2, 'HD 33579', 'Dorado', 163000, 9.22, false, 2);
INSERT INTO public.star VALUES (3, 'DMM2009', NULL, 2500000, 15.60, false, 3);
INSERT INTO public.star VALUES (4, 'B324', 'Triangulum', 3200000, 14.86, false, 4);
INSERT INTO public.star VALUES (5, 'Rigel', 'Orion', 863, 6.67, true, 5);
INSERT INTO public.star VALUES (6, 'Sirius', 'Canis Major', 9, 11.18, true, 1);


--
-- Name: deities_deities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.deities_deities_id_seq', 28, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 21, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: deities constraint_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.deities
    ADD CONSTRAINT constraint_name UNIQUE (name);


--
-- Name: deities deities_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.deities
    ADD CONSTRAINT deities_pkey PRIMARY KEY (deities_id);


--
-- Name: galaxy galaxy_galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: deities deities_moon_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.deities
    ADD CONSTRAINT deities_moon_id_fkey FOREIGN KEY (moon_id) REFERENCES public.moon(moon_id);


--
-- Name: deities deities_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.deities
    ADD CONSTRAINT deities_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

