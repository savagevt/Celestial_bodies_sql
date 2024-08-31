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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    name character varying(255) NOT NULL,
    description text,
    has_life boolean,
    age_in_millions_of_years integer,
    size_in_lightyears integer,
    galaxy_id integer NOT NULL
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
    name character varying(255) NOT NULL,
    moon_id integer NOT NULL,
    planet text,
    visited boolean,
    is_round boolean,
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
-- Name: moon_type; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon_type (
    moon_type_id integer NOT NULL,
    name character varying(20) NOT NULL,
    class integer,
    ok numeric
);


ALTER TABLE public.moon_type OWNER TO freecodecamp;

--
-- Name: moon_type_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_type_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_type_type_id_seq OWNER TO freecodecamp;

--
-- Name: moon_type_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_type_type_id_seq OWNED BY public.moon_type.moon_type_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    name character varying(255) NOT NULL,
    planet_id integer NOT NULL,
    star text,
    galaxy text,
    has_life boolean,
    rank_from_sun integer,
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
    name character varying(255) NOT NULL,
    description text,
    age_in_millions_of_years integer,
    star_id integer NOT NULL,
    galaxy text,
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
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: moon_type moon_type_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon_type ALTER COLUMN moon_type_id SET DEFAULT nextval('public.moon_type_type_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES ('Milky Way', 'Our home galaxy, where everything that matters is!', true, 13056, 1500, 1);
INSERT INTO public.galaxy VALUES ('Andromeda', 'Coming Soon to a galaxy near us!', false, 11259, 1138, 2);
INSERT INTO public.galaxy VALUES ('M83', 'Good band, better galaxy', false, 13772, 45688, 3);
INSERT INTO public.galaxy VALUES ('Joes Place', 'Not great', true, 9, 102, 4);
INSERT INTO public.galaxy VALUES ('Galaxy 7', 'This is the 7th Galaxy', false, 1366, 1359, 5);
INSERT INTO public.galaxy VALUES ('M30303', 'Far, Far Away', false, 13833, 9833, 6);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES ('Phobos', 21, 'Mars', true, true, 4);
INSERT INTO public.moon VALUES ('Deimos', 22, 'Mars', true, true, 4);
INSERT INTO public.moon VALUES ('The Moon', 1, 'Earth', true, true, 3);
INSERT INTO public.moon VALUES ('Io', 23, 'Jupiter', false, true, 5);
INSERT INTO public.moon VALUES ('Europa', 24, 'Jupiter', true, false, 5);
INSERT INTO public.moon VALUES ('Ganymede', 25, 'Jupiter', false, true, 5);
INSERT INTO public.moon VALUES ('Callisto', 26, 'Jupiter', false, true, 5);
INSERT INTO public.moon VALUES ('Amalthea', 27, 'Jupiter', false, true, 5);
INSERT INTO public.moon VALUES ('Himalia', 28, 'Jupiter', false, true, 5);
INSERT INTO public.moon VALUES ('Mimas', 29, 'Saturn', false, true, 6);
INSERT INTO public.moon VALUES ('Enceladus', 30, 'Saturn', true, true, 6);
INSERT INTO public.moon VALUES ('Tethys', 31, 'Saturn', false, true, 6);
INSERT INTO public.moon VALUES ('Dione', 32, 'Saturn', false, true, 6);
INSERT INTO public.moon VALUES ('Rhea', 33, 'Saturn', false, true, 6);
INSERT INTO public.moon VALUES ('Titan', 34, 'Saturn', true, true, 6);
INSERT INTO public.moon VALUES ('Ariel', 35, 'Uranus', false, true, 7);
INSERT INTO public.moon VALUES ('Umbriel', 36, 'Uranus', false, true, 7);
INSERT INTO public.moon VALUES ('Titania', 37, 'Uranus', false, true, 7);
INSERT INTO public.moon VALUES ('Oberon', 38, 'Uranus', false, true, 7);
INSERT INTO public.moon VALUES ('Triton', 39, 'Neptune', true, true, 8);


--
-- Data for Name: moon_type; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon_type VALUES (1, 'Big', 1, NULL);
INSERT INTO public.moon_type VALUES (2, 'Medium', 2, NULL);
INSERT INTO public.moon_type VALUES (3, 'Small', 3, NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES ('Mercury', 1, 'Sun', 'Milky Way', false, 1, 1);
INSERT INTO public.planet VALUES ('Venus', 2, 'Sun', 'Milky Way', false, 2, 1);
INSERT INTO public.planet VALUES ('Earth', 3, 'Sun', 'Milky Way', true, 3, 1);
INSERT INTO public.planet VALUES ('Jupiter', 5, 'Sun', 'Milky Way', false, 5, 1);
INSERT INTO public.planet VALUES ('Saturn', 6, 'Sun', 'Milky Way', false, 6, 1);
INSERT INTO public.planet VALUES ('Uranus', 7, 'Sun', 'Milky Way', false, 7, 1);
INSERT INTO public.planet VALUES ('Neptune', 8, 'Sun', 'Milky Way', false, 8, 1);
INSERT INTO public.planet VALUES ('Mars', 4, 'Sun', 'Milky Way', false, 4, 1);
INSERT INTO public.planet VALUES ('Pluto', 9, 'Sun', 'Milky Way', false, 9, 1);
INSERT INTO public.planet VALUES ('Omicron Persei 8', 10, 'Betelguese', 'Milky Way', false, 456, 3);
INSERT INTO public.planet VALUES ('Jehosephat', 11, 'Alpha Centauri Rho', 'M83', false, 703, 4);
INSERT INTO public.planet VALUES ('Planet B', 12, 'Vega', 'Milky Way', false, 10, 2);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES ('Sun', 'Our big oppressive solar god!', 8796, 1, 'Milky Way', 1);
INSERT INTO public.star VALUES ('Vega', 'Behemoth!', 10056, 2, 'Milky Way', 1);
INSERT INTO public.star VALUES ('Betelguese', '3rd times a charm', 9856, 3, 'Milky Way', 1);
INSERT INTO public.star VALUES ('Alpha Centauri Rho', 'Unknown', 7896, 4, 'M83', 3);
INSERT INTO public.star VALUES ('Gemini 1890', 'Unknown', 11658, 5, 'M83', 3);
INSERT INTO public.star VALUES ('Jeebus 9', 'Unknown', 11559, 6, 'Andromeda', 2);
INSERT INTO public.star VALUES ('Marianus 144', 'Unknown', 8979, 7, 'Andromeda', 2);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 39, true);


--
-- Name: moon_type_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_type_type_id_seq', 3, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: moon_type moon_type_class_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon_type
    ADD CONSTRAINT moon_type_class_key UNIQUE (class);


--
-- Name: moon_type moon_type_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon_type
    ADD CONSTRAINT moon_type_pkey PRIMARY KEY (moon_type_id);


--
-- Name: moon name_uni; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT name_uni UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: galaxy unique_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_id UNIQUE (name);


--
-- Name: star unique_id2; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT unique_id2 UNIQUE (name);


--
-- Name: planet unique_id3; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT unique_id3 UNIQUE (name);


--
-- Name: star galaxy_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT galaxy_id FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon planet_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT planet_id FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet star_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT star_id FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

