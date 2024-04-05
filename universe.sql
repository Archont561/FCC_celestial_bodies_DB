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
-- Name: description; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.description (
    description_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text NOT NULL
);


ALTER TABLE public.description OWNER TO freecodecamp;

--
-- Name: description_description_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.description_description_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.description_description_id_seq OWNER TO freecodecamp;

--
-- Name: description_description_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.description_description_id_seq OWNED BY public.description.description_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(100) NOT NULL,
    age_in_millions_of_years integer NOT NULL,
    star_count integer NOT NULL,
    has_life boolean NOT NULL,
    description_id integer
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
    name character varying(100) NOT NULL,
    is_spherical boolean NOT NULL,
    distance_from_planet numeric(14,3),
    planet_id integer NOT NULL,
    description_id integer
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
    name character varying(100) NOT NULL,
    planet_type character varying(30),
    diameter numeric(10,2) NOT NULL,
    has_moons boolean,
    star_id integer NOT NULL,
    description_id integer
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
    name character varying(100) NOT NULL,
    star_type character varying(30),
    temperature numeric,
    distance_from_earth numeric(14,3),
    has_planets boolean,
    galaxy_id integer NOT NULL,
    description_id integer
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
-- Name: description description_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.description ALTER COLUMN description_id SET DEFAULT nextval('public.description_description_id_seq'::regclass);


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
-- Data for Name: description; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.description VALUES (1, 'The Milky Way', 'The Milky Way is the galaxy where our solar system resides.');
INSERT INTO public.description VALUES (2, 'Andromeda', 'Andromeda is the closest spiral galaxy to the Milky Way.');
INSERT INTO public.description VALUES (3, 'Triangulum', 'Triangulum is a small spiral galaxy that is part of the Local Group.');
INSERT INTO public.description VALUES (4, 'Centaurus A', 'Centaurus A is a massive elliptical galaxy in the Centaurus constellation.');
INSERT INTO public.description VALUES (5, 'The Whirlpool Galaxy', 'The Whirlpool Galaxy is a grand-design spiral galaxy located in the constellation Canes Venatici.');
INSERT INTO public.description VALUES (6, 'The Pinwheel Galaxy', 'The Pinwheel Galaxy, also known as Messier 101, is a face-on spiral galaxy in the constellation Ursa Major.');
INSERT INTO public.description VALUES (7, 'The Sun', 'The Sun is the star at the center of the Solar System.');
INSERT INTO public.description VALUES (8, 'Alpha Centauri A', 'Alpha Centauri A is the primary component of the Alpha Centauri binary star system.');
INSERT INTO public.description VALUES (9, 'Proxima Centauri', 'Proxima Centauri is a small, low-mass star located in the constellation of Centaurus.');
INSERT INTO public.description VALUES (10, 'Sirius', 'Sirius, also known as the Dog Star, is the brightest star in the night sky.');
INSERT INTO public.description VALUES (11, 'Betelgeuse', 'Betelgeuse is a red supergiant star in the constellation of Orion.');
INSERT INTO public.description VALUES (12, 'Vega', 'Vega is the brightest star in the constellation of Lyra.');
INSERT INTO public.description VALUES (13, 'Mercury', 'Mercury is the smallest planet in the Solar System and the closest to the Sun.');
INSERT INTO public.description VALUES (14, 'Venus', 'Venus is the second planet from the Sun and the hottest planet in the Solar System.');
INSERT INTO public.description VALUES (15, 'Earth', 'Earth is the third planet from the Sun and the only astronomical object known to harbor life.');
INSERT INTO public.description VALUES (16, 'Mars', 'Mars is the fourth planet from the Sun and the second-smallest planet in the Solar System, after Mercury.');
INSERT INTO public.description VALUES (17, 'Jupiter', 'Jupiter is the largest planet in the Solar System and the fifth planet from the Sun.');
INSERT INTO public.description VALUES (18, 'Saturn', 'Saturn is the sixth planet from the Sun and the second-largest in the Solar System, after Jupiter.');
INSERT INTO public.description VALUES (19, 'Uranus', 'Uranus is the seventh planet from the Sun.');
INSERT INTO public.description VALUES (20, 'Neptune', 'Neptune is the eighth and farthest-known Solar planet from the Sun.');
INSERT INTO public.description VALUES (21, 'Alpha Centauri Bb', 'Alpha Centauri Bb is an exoplanet orbiting the star Alpha Centauri B.');
INSERT INTO public.description VALUES (22, 'Proxima Centauri b', 'Proxima Centauri b is an exoplanet orbiting the star Proxima Centauri.');
INSERT INTO public.description VALUES (23, 'Sirius Bb', 'Sirius Bb is an exoplanet orbiting the star Sirius B.');
INSERT INTO public.description VALUES (24, 'Betelgeuse b', 'Betelgeuse b is an exoplanet orbiting the star Betelgeuse.');
INSERT INTO public.description VALUES (25, 'The Moon', 'The Moon is Earth''s only natural satellite.');
INSERT INTO public.description VALUES (26, 'Phobos', 'Phobos is the larger and closer of the two natural satellites of Mars.');
INSERT INTO public.description VALUES (27, 'Deimos', 'Deimos is the smaller and outermost of the two natural satellites of Mars.');
INSERT INTO public.description VALUES (28, 'Io', 'Io is the innermost of the four Galilean moons of Jupiter and, with a diameter of 3,643.2 kilometers (2,263.4 mi), the fourth-largest moon in the Solar System.');
INSERT INTO public.description VALUES (29, 'Europa', 'Europa is the smallest of the four Galilean moons orbiting Jupiter and the sixth-closest to the planet of all the 79 known moons of Jupiter.');
INSERT INTO public.description VALUES (30, 'Ganymede', 'Ganymede is the largest and most massive moon of Jupiter and in the Solar System.');
INSERT INTO public.description VALUES (31, 'Callisto', 'Callisto is the second-largest moon of Jupiter, after Ganymede.');
INSERT INTO public.description VALUES (32, 'Titan', 'Titan is the largest moon of Saturn and the second-largest natural satellite in the Solar System.');
INSERT INTO public.description VALUES (33, 'Enceladus', 'Enceladus is the sixth-largest moon of Saturn.');
INSERT INTO public.description VALUES (34, 'Triton', 'Triton is the largest natural satellite of the planet Neptune.');
INSERT INTO public.description VALUES (35, 'Charon', 'Charon, also known as (134340) Pluto I, is the largest of the five known natural satellites of the dwarf planet Pluto.');
INSERT INTO public.description VALUES (36, 'Proxima Centauri b Moon 1', 'Proxima Centauri b Moon 1 orbits the exoplanet Proxima Centauri b. It is a small rocky satellite with a diameter of approximately 5000 kilometers.');
INSERT INTO public.description VALUES (37, 'Proxima Centauri b Moon 2', 'Proxima Centauri b Moon 2 is another satellite of the exoplanet Proxima Centauri b. It has a diameter of around 7000 kilometers and likely exhibits synchronous rotation.');
INSERT INTO public.description VALUES (38, 'Sirius Bb Moon 1', 'Sirius Bb Moon 1 orbits the white dwarf Sirius Bb. Despite the intense radiation, it maintains its orbit and provides insights into stellar evolution.');
INSERT INTO public.description VALUES (39, 'Sirius Bb Moon 2', 'Sirius Bb Moon 2 is another moon of the white dwarf Sirius Bb. Its surface may be irradiated due to its proximity to its parent star.');
INSERT INTO public.description VALUES (40, 'Betelgeuse b Moon 1', 'Betelgeuse b Moon 1 orbits the exoplanet Betelgeuse b. It is a rocky satellite with a diameter of approximately 80000 kilometers.');
INSERT INTO public.description VALUES (41, 'Betelgeuse b Moon 2', 'Betelgeuse b Moon 2 is another moon of the exoplanet Betelgeuse b. It has a diameter of around 100000 kilometers and exhibits synchronous rotation.');
INSERT INTO public.description VALUES (42, 'Betelgeuse b Moon 3', 'Betelgeuse b Moon 3 orbits the exoplanet Betelgeuse b. Its surface might be scarred by impact craters, reflecting its dynamic history.');
INSERT INTO public.description VALUES (43, 'Betelgeuse b Moon 4', 'Betelgeuse b Moon 4 is another moon of the exoplanet Betelgeuse b. It may have geological features shaped by tidal interactions with its parent planet.');
INSERT INTO public.description VALUES (44, 'Betelgeuse b Moon 5', 'Betelgeuse b Moon 5 orbits the exoplanet Betelgeuse b. Its surface likely exhibits a variety of terrain types, influenced by its parent planet''s gravity and radiation environment.');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 13000, 1000, true, 1);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 10000, 500, false, 2);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 4000, 200, false, 3);
INSERT INTO public.galaxy VALUES (4, 'Centaurus A', 12000, 400, true, 4);
INSERT INTO public.galaxy VALUES (5, 'Whirlpool Galaxy', 14000, 300, false, 5);
INSERT INTO public.galaxy VALUES (6, 'Pinwheel Galaxy', 11000, 250, false, 6);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', true, 384400.000, 3, 25);
INSERT INTO public.moon VALUES (2, 'Phobos', true, 9378.000, 4, 26);
INSERT INTO public.moon VALUES (3, 'Deimos', true, 23463.000, 4, 27);
INSERT INTO public.moon VALUES (4, 'Io', true, 421700.000, 5, 28);
INSERT INTO public.moon VALUES (5, 'Europa', true, 671034.000, 5, 29);
INSERT INTO public.moon VALUES (6, 'Ganymede', true, 1070400.000, 5, 30);
INSERT INTO public.moon VALUES (7, 'Callisto', true, 1882700.000, 5, 31);
INSERT INTO public.moon VALUES (8, 'Titan', true, 1221870.000, 6, 32);
INSERT INTO public.moon VALUES (9, 'Enceladus', true, 238037.000, 6, 33);
INSERT INTO public.moon VALUES (10, 'Triton', true, 354800.000, 8, 34);
INSERT INTO public.moon VALUES (11, 'Charon', true, 19591.000, 9, 35);
INSERT INTO public.moon VALUES (12, 'Proxima Centauri b Moon 1', true, 5000.000, 10, 36);
INSERT INTO public.moon VALUES (13, 'Proxima Centauri b Moon 2', true, 7000.000, 10, 37);
INSERT INTO public.moon VALUES (14, 'Sirius Bb Moon 1', true, 4000.000, 11, 38);
INSERT INTO public.moon VALUES (15, 'Sirius Bb Moon 2', true, 6000.000, 11, 39);
INSERT INTO public.moon VALUES (16, 'Betelgeuse b Moon 1', true, 80000.000, 12, 40);
INSERT INTO public.moon VALUES (17, 'Betelgeuse b Moon 2', true, 100000.000, 12, 41);
INSERT INTO public.moon VALUES (18, 'Betelgeuse b Moon 3', true, 120000.000, 12, 42);
INSERT INTO public.moon VALUES (19, 'Betelgeuse b Moon 4', true, 140000.000, 12, 43);
INSERT INTO public.moon VALUES (20, 'Betelgeuse b Moon 5', true, 160000.000, 12, 44);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 'Terrestrial planet', 4879.00, false, 1, 13);
INSERT INTO public.planet VALUES (2, 'Venus', 'Terrestrial planet', 12104.00, false, 1, 14);
INSERT INTO public.planet VALUES (3, 'Earth', 'Terrestrial planet', 12742.00, true, 1, 15);
INSERT INTO public.planet VALUES (4, 'Mars', 'Terrestrial planet', 6792.00, true, 1, 16);
INSERT INTO public.planet VALUES (5, 'Jupiter', 'Gas giant', 139822.00, true, 1, 17);
INSERT INTO public.planet VALUES (6, 'Saturn', 'Gas giant', 116464.00, true, 1, 18);
INSERT INTO public.planet VALUES (7, 'Uranus', 'Ice giant', 50724.00, true, 1, 19);
INSERT INTO public.planet VALUES (8, 'Neptune', 'Ice giant', 49244.00, true, 1, 20);
INSERT INTO public.planet VALUES (9, 'Alpha Centauri Bb', 'Terrestrial planet', 11800.00, false, 2, 21);
INSERT INTO public.planet VALUES (10, 'Proxima Centauri b', 'Terrestrial planet', 12103.00, false, 3, 22);
INSERT INTO public.planet VALUES (11, 'Sirius Bb', 'Terrestrial planet', 9300.00, false, 4, 23);
INSERT INTO public.planet VALUES (12, 'Betelgeuse b', 'Gas giant', 167764.00, true, 5, 24);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'G-type main-sequence star', 5778, 0.000, true, 1, 7);
INSERT INTO public.star VALUES (2, 'Alpha Centauri A', 'Main-sequence star', 5790, 4.370, true, 2, 8);
INSERT INTO public.star VALUES (3, 'Proxima Centauri', 'Red dwarf', 3042, 4.240, false, 2, 9);
INSERT INTO public.star VALUES (4, 'Sirius', 'A-type main-sequence star', 9940, 8.600, true, 1, 10);
INSERT INTO public.star VALUES (5, 'Betelgeuse', 'Red supergiant', 3500, 643.000, true, 1, 11);
INSERT INTO public.star VALUES (6, 'Vega', 'A-type main-sequence star', 9602, 25.040, true, 1, 12);


--
-- Name: description_description_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.description_description_id_seq', 44, true);


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
-- Name: description description_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.description
    ADD CONSTRAINT description_name_key UNIQUE (name);


--
-- Name: description description_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.description
    ADD CONSTRAINT description_pkey PRIMARY KEY (description_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_description_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_description_id_key UNIQUE (description_id);


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
-- Name: galaxy galaxy_description_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_description_id_fkey FOREIGN KEY (description_id) REFERENCES public.description(description_id);


--
-- Name: moon moon_description_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_description_id_fkey FOREIGN KEY (description_id) REFERENCES public.description(description_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_description_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_description_id_fkey FOREIGN KEY (description_id) REFERENCES public.description(description_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_description_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_description_id_fkey FOREIGN KEY (description_id) REFERENCES public.description(description_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--
