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
-- Name: comet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.comet (
    comet_id integer NOT NULL,
    name character varying(100) NOT NULL,
    star_id integer NOT NULL,
    mass numeric(20,3),
    radius_km integer,
    has_tail boolean DEFAULT true,
    orbit_period_days numeric(10,2),
    description text
);


ALTER TABLE public.comet OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.comet_comet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comet_comet_id_seq OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.comet_comet_id_seq OWNED BY public.comet.comet_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    type character varying(50),
    age_million_years integer,
    number_of_stars bigint,
    description text
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
    planet_id integer,
    orbit_days integer,
    radius_km integer,
    is_habitable boolean,
    is_tidally_locked boolean,
    description text
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
    star_id integer,
    diameter_km integer,
    mass numeric(10,2),
    has_life boolean,
    has_rings boolean,
    description text
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
    galaxy_id integer,
    mass numeric(12,3),
    radius_km integer,
    is_alive boolean,
    is_supernova boolean
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
-- Name: comet comet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet ALTER COLUMN comet_id SET DEFAULT nextval('public.comet_comet_id_seq'::regclass);


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
-- Data for Name: comet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.comet VALUES (1, 'Halley', 1, 220000000000000.000, 11, true, 27500.00, 'Famous comet visible from Earth every 75–76 years');
INSERT INTO public.comet VALUES (2, 'Encke', 1, 15000000000000.000, 4, true, 1203.00, 'Short-period comet in the Solar System');
INSERT INTO public.comet VALUES (3, 'Hale-Bopp', 1, 320000000000000.000, 30, true, 25300.00, 'Bright comet observed in 1997');
INSERT INTO public.comet VALUES (4, 'Hyakutake', 2, 20000000000000.000, 10, true, 17000.00, 'Comet with long tail observed in 1996');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral', 13600, 250000000000, 'Our home galaxy');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', 10000, 1000000000000, 'Nearest large galaxy');
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Spiral', 12000, 40000000000, 'Small spiral galaxy');
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 'Spiral', 15000, 100000000000, 'Galaxy with prominent spiral arms');
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 'Elliptical', 13000, 80000000000, 'Galaxy with a bright nucleus');
INSERT INTO public.galaxy VALUES (6, 'Pinwheel', 'Spiral', 13000, 100000000000, 'Face-on spiral galaxy');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 3, 27, 1737, false, true, 'Earth''s moon');
INSERT INTO public.moon VALUES (2, 'Phobos', 4, 0, 11, false, true, 'Moon of Mars');
INSERT INTO public.moon VALUES (3, 'Deimos', 4, 1, 6, false, true, 'Moon of Mars');
INSERT INTO public.moon VALUES (4, 'Europa', 10, 4, 1560, false, true, 'Moon of Triangulum Planet A');
INSERT INTO public.moon VALUES (5, 'Ganymede', 10, 7, 2634, false, true, 'Largest moon of Triangulum Planet A');
INSERT INTO public.moon VALUES (6, 'Callisto', 10, 17, 2410, false, true, 'Moon of Triangulum Planet A');
INSERT INTO public.moon VALUES (7, 'Io', 11, 2, 1821, false, true, 'Moon of Triangulum Planet B');
INSERT INTO public.moon VALUES (8, 'Titan', 11, 16, 2575, false, true, 'Moon of Triangulum Planet B');
INSERT INTO public.moon VALUES (9, 'Rhea', 11, 5, 764, false, true, 'Moon of Triangulum Planet B');
INSERT INTO public.moon VALUES (10, 'Oberon', 12, 14, 761, false, true, 'Moon of Triangulum Planet C');
INSERT INTO public.moon VALUES (11, 'Titania', 12, 9, 788, false, true, 'Moon of Triangulum Planet C');
INSERT INTO public.moon VALUES (12, 'Umbriel', 12, 4, 584, false, true, 'Moon of Triangulum Planet C');
INSERT INTO public.moon VALUES (13, 'Miranda', 12, 1, 235, false, true, 'Moon of Triangulum Planet C');
INSERT INTO public.moon VALUES (14, 'Ariel', 12, 3, 578, false, true, 'Moon of Triangulum Planet C');
INSERT INTO public.moon VALUES (15, 'Dione', 8, 3, 561, false, true, 'Moon of Andromeda Planet 2');
INSERT INTO public.moon VALUES (16, 'Tethys', 8, 2, 531, false, true, 'Moon of Andromeda Planet 2');
INSERT INTO public.moon VALUES (17, 'Enceladus', 7, 1, 252, false, true, 'Moon of Andromeda Planet 1');
INSERT INTO public.moon VALUES (18, 'Mimas', 7, 1, 198, false, true, 'Moon of Andromeda Planet 1');
INSERT INTO public.moon VALUES (19, 'Hyperion', 9, 3, 135, false, true, 'Moon of Andromeda Planet 3');
INSERT INTO public.moon VALUES (20, 'Iapetus', 9, 7, 735, false, true, 'Moon of Andromeda Planet 3');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 1, 4879, 0.06, false, false, 'Closest planet to the Sun');
INSERT INTO public.planet VALUES (2, 'Venus', 1, 12104, 0.82, false, false, 'Second planet from the Sun');
INSERT INTO public.planet VALUES (3, 'Earth', 1, 12742, 1.00, true, false, 'Our home planet');
INSERT INTO public.planet VALUES (4, 'Mars', 1, 6779, 0.11, false, false, 'Red planet');
INSERT INTO public.planet VALUES (5, 'Proxima b', 2, 11400, 1.20, false, false, 'Exoplanet of Alpha Centauri A');
INSERT INTO public.planet VALUES (6, 'Alpha Centauri Bb', 2, 12300, 1.50, false, true, 'Exoplanet with rings');
INSERT INTO public.planet VALUES (7, 'Andromeda Planet 1', 3, 14000, 2.00, false, false, 'Planet in Andromeda Star 1');
INSERT INTO public.planet VALUES (8, 'Andromeda Planet 2', 3, 16000, 2.50, false, true, 'Second planet of Andromeda Star 1');
INSERT INTO public.planet VALUES (9, 'Andromeda Planet 3', 4, 13000, 1.80, false, false, 'Planet in Andromeda Star 2');
INSERT INTO public.planet VALUES (10, 'Triangulum Planet A', 5, 11000, 1.30, false, false, 'Planet in Triangulum Star A');
INSERT INTO public.planet VALUES (11, 'Triangulum Planet B', 6, 10000, 0.90, false, false, 'Planet in Triangulum Star B');
INSERT INTO public.planet VALUES (12, 'Triangulum Planet C', 6, 9000, 0.70, false, false, 'Second planet in Triangulum Star B');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 1.000, 696340, true, false);
INSERT INTO public.star VALUES (2, 'Alpha Centauri A', 1, 1.100, 834840, true, false);
INSERT INTO public.star VALUES (3, 'Andromeda Star 1', 2, 2.000, 1200000, true, false);
INSERT INTO public.star VALUES (4, 'Andromeda Star 2', 2, 1.500, 900000, true, false);
INSERT INTO public.star VALUES (5, 'Triangulum Star A', 3, 1.300, 800000, true, false);
INSERT INTO public.star VALUES (6, 'Triangulum Star B', 3, 0.800, 500000, true, false);


--
-- Name: comet_comet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.comet_comet_id_seq', 4, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: comet comet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_name_key UNIQUE (name);


--
-- Name: comet comet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_pkey PRIMARY KEY (comet_id);


--
-- Name: galaxy galaxy_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_planet; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_planet UNIQUE (name, planet_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_star; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_star UNIQUE (name, star_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_galaxy; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_galaxy UNIQUE (name, galaxy_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: comet comet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: moon noom_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT noom_planet FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

