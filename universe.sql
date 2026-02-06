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
-- Name: blackhole; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.blackhole (
    blackhole_id integer NOT NULL,
    name character varying(30) NOT NULL,
    distance_from_earth_miles numeric(30,0),
    description text
);


ALTER TABLE public.blackhole OWNER TO freecodecamp;

--
-- Name: blackhole_blackhole_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.blackhole_blackhole_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.blackhole_blackhole_id_seq OWNER TO freecodecamp;

--
-- Name: blackhole_blackhole_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.blackhole_blackhole_id_seq OWNED BY public.blackhole.blackhole_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    type character varying(60),
    distance_from_earth_miles character varying(60),
    significance text,
    feature text
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
    name character varying(60) NOT NULL,
    diameter_miles character varying(60),
    orbital_period_days numeric(5,2),
    distance_from_planet_miles character varying(60),
    discovery_year character varying(15),
    key_features text,
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
    number_of_moons integer,
    distance_from_earth_miles character varying(60),
    galaxy character varying(30),
    habitable boolean,
    category character varying(30),
    temp_degrees_c numeric(5,2),
    rings boolean,
    sun_orbital_period character varying(30),
    number_of_rings integer,
    key_features text,
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
    galaxy character varying(30),
    distance_from_earth_miles character varying(60),
    constellation character varying(30),
    key_features text,
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
-- Name: blackhole blackhole_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.blackhole ALTER COLUMN blackhole_id SET DEFAULT nextval('public.blackhole_blackhole_id_seq'::regclass);


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
-- Data for Name: blackhole; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.blackhole VALUES (1, 'Sagittarius A*', 150000000000000, 'Sagittarius A* is the supermassive black hole at the center of our Milky Way galaxy located in the constellation Sagittarius');
INSERT INTO public.blackhole VALUES (2, 'Cygnus X-1', 42000000000000, 'Cygnus X-1 is one of the strongest X-ray sources in the sky and the first astronomical object widely accepted as a black hole.');
INSERT INTO public.blackhole VALUES (3, 'GW150914', 7800000000000000000000, 'GW150914 was the first direct observation of gravitational waves, produced by the merger of two stellar-mass black holes.');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Andromeda Galaxy(M31)', 'Spiral Galaxy', '14700000000000000000', 'Closets large galaxy to Milky Way', 'Brightest galaxy visible to naked eye from earth');
INSERT INTO public.galaxy VALUES (2, 'Milky Way Galaxy', 'Barred Spiral Galaxy', 'We are inside it', 'Our home galaxy contains 100-400 billion stars', '~100000 light years in diameter');
INSERT INTO public.galaxy VALUES (3, 'Whirlpool Galaxy(M51)', 'Grand Design Spiral', '135240000000000000000', 'Perfect Spiral Structure interacting with companion galaxy', 'First spiral nebula identified 1845');
INSERT INTO public.galaxy VALUES (4, 'Sombrero Galaxy', 'Unclasified(spiral/elliptical hybrid)', '170520000000000000000', 'Distinctive dust lane resemling a sombrero hat', 'Contains over 2000 globular clusters');
INSERT INTO public.galaxy VALUES (5, 'Triangulum Galaxy(M33)', 'Spiral Galaxy', '15876000000000000000', 'Third largest member of local group', 'Can be seen with naked eye under perfect conditions');
INSERT INTO public.galaxy VALUES (6, 'Large Magellanic Cloud', 'Irregular Dwarf Galaxy', '958440000000000000', 'Milky Ways largest satellite galaxy', 'Home to Tarantula nebula largest star-forming region in local group');
INSERT INTO public.galaxy VALUES (7, 'Small Magellanic Cloud', 'Irregular Dwarf Galaxy', '1176000000000000000', 'Second largest satellite galaxy of Milky Way', 'Prominent in southern Hemisphere sky');
INSERT INTO public.galaxy VALUES (8, 'Centaurus A(NGC 5128)', 'Elliptical galaxy with dust lane', '76440000000000000000', 'Nearest active galactic nucleus radio galaxy', 'Result of galaxy merger');
INSERT INTO public.galaxy VALUES (9, 'PPinwheel Galaxy(M101)', 'Face-on spiral galaxy', '123480000000000000000', 'Nearly perfect face-on orientation', '170000 light-years diameter(70% larger than Milky Way)');
INSERT INTO public.galaxy VALUES (10, 'Black Eye Galaxy(M64)', 'Spiral Galaxy', '99960000000000000000', 'Prominent dark dust lane obscuring bright nucleus', 'Evidence of past galaxy merger');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Ganymede', '3,273', 7.15, '665,100', '1610', 'Largest moon in solar system, magnetic field, subsurface ocean', 6);
INSERT INTO public.moon VALUES (2, 'Titan', '3,200', 15.95, '759,200', '1655', 'Thick atmosphere, liquid methane lakes, organic chemistry', 7);
INSERT INTO public.moon VALUES (3, 'Calisto', '2,992', 16.69, '1,169,400', '1610', 'Heavily cratered, possible subsurface ocean', 7);
INSERT INTO public.moon VALUES (4, 'Io', '2,262', 1.77, '262,000', '1610', 'Most volcanically active body in solar syatem, sulfur surface', 6);
INSERT INTO public.moon VALUES (5, 'Moon(Luna)', '2,159.26', 27.32, '238,855.40', 'Prehistoric', 'Only moon with human visits, large relative to its planet', 3);
INSERT INTO public.moon VALUES (6, 'Europa', '1,938.88', 3.55, '~416,959.42', '1610', 'Smooth icy surface, global subsurface ocean, high potential for life', 6);
INSERT INTO public.moon VALUES (7, 'Triton', '~1,681.15', 5.88, '~220,161.35', '1846', 'Retrograde orbit, nitrogen geysers, captured Kuiper Belt object', 9);
INSERT INTO public.moon VALUES (8, 'Titania', '~978.28', 8.71, '~270,420.42', '1787', 'Largest Uranian moon, canyons and fault lines', 8);
INSERT INTO public.moon VALUES (9, 'Rhea', '~948.08', 4.52, '~326,928.91', '1672', 'Heavily cratered, thin atmosphere of oxygen and carbon dioxide', 7);
INSERT INTO public.moon VALUES (10, 'Oberon', '~945.23', 13.46, '~362,262.72', '1787', 'Ancient cratered surface, possible subsurface ocean', 8);
INSERT INTO public.moon VALUES (11, 'Lapetus', '~912.44', 79.33, '~2,210,877.50', '1671', 'Two-tone coloring, equatorial ridge, "yin-yang" appearance', 7);
INSERT INTO public.moon VALUES (12, 'Charon', '~752.07', 6.39, '~12,162.85', '1978', 'Largest relative to its planet (Pluto), tidal locking creates a "double planet" system', 10);
INSERT INTO public.moon VALUES (13, 'Ariel', '~718.87', 2.52, '~118,530.60', '1851', 'Youngest surface of Uranian moons, network of valleys', 8);
INSERT INTO public.moon VALUES (14, 'Dione', '~697.42', 2.74, '~234,305.45', '1684', 'Ice cliffs, possible subsurface ocean', 7);
INSERT INTO public.moon VALUES (15, 'Tethys', '~661.18', 1.89, '~182,812.46', '1684', 'large crater(Odysseus), icy surface', 7);
INSERT INTO public.moon VALUES (16, 'Enceladus', '~312.70', 1.37, '~147,775.44', '1789', 'Ice geysers, global subsurface ocean, potential for life', 7);
INSERT INTO public.moon VALUES (17, 'Miranda', '~292.95', 1.41, '~80,397.53', '1948', 'Dramatic cliffs, chaotic terrain', 8);
INSERT INTO public.moon VALUES (18, 'Proteus', '~260.55', 1.12, '~73,083.85', '1989', 'Irregular shape, very dark surface', 9);
INSERT INTO public.moon VALUES (19, 'Mimas', '~245.80', 0.94, '~115,167.99', '1789', '"Death Star" moon, large Crater Herschel', 7);
INSERT INTO public.moon VALUES (20, 'Hyperion', '~167.57', 21.28, '~919,428.25', '1848', 'Sponge-like appearance, chaotic rotation', 7);
INSERT INTO public.moon VALUES (21, 'Phoebe', '~132.18', 550.31, '~8,042,761.22', '1899', 'Retrograde orbit, captured object', 7);
INSERT INTO public.moon VALUES (22, 'Amalthea', '~103.67', 0.50, '~112,596.65', '1892', 'Irregular shape, reddish color', 6);
INSERT INTO public.moon VALUES (23, 'Janus', '111.10', 0.69, '~94,012.83', '1966', 'Co-orbital with moon Epimetheus', 7);
INSERT INTO public.moon VALUES (24, 'Metis', '~26.71', 0.29, '~79,535.53', '1979', 'Orbits within Jupiters main ring', 6);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 0, '48,000,000 to 138,000,000', 'Milky Way', false, 'Terrestrial Planet', 167.00, false, '88 Earth Days', 0, 'Heavely cratered-No atmosphere-extreme temp swings', 11);
INSERT INTO public.planet VALUES (2, 'Venus', 0, '24,000,000 to 162,000,000', 'Milky Way', false, 'Terrestrial Planet', 464.00, false, '225 Earth Days', 0, 'Hottest planet-thick toxic atmosphers-runaway greenhouse effect', 11);
INSERT INTO public.planet VALUES (3, 'Earth', 1, '0', 'Milky Way', true, 'Terrestrial Planet', 15.00, false, '365.25 days', 0, 'Only known planet with life-liquid surface water', 11);
INSERT INTO public.planet VALUES (4, 'Mars', 2, '34,000,000 to 250,000,000', 'Milky Way', false, 'Terrestrial Planet', -65.00, false, '687 earth days', 0, 'The Red planet-thin atmosphere-evidence of past water', 11);
INSERT INTO public.planet VALUES (5, 'Ceres', 0, '132,000,000 to 363,000,000', 'Milky Way', false, 'Dwarf Planet', -110.00, false, '4.6 earth days', 0, 'Largest object in the asteroid belt-may have subsurface water', 11);
INSERT INTO public.planet VALUES (6, 'Jupiter', 95, '365,000,000 to 601,000,000', 'Milky Way', false, 'Gas Giant', -110.00, true, '11.9 earth years', 4, 'Largest planet-Great Red spot-strong magnetic field', 11);
INSERT INTO public.planet VALUES (7, 'Saturn', 146, '746,000,000 to 1,050,000,000', 'Milky Way', false, 'Gas Giant', -140.00, true, '29.5 earth years', 7, 'Famous ring system-least dense planet-(could float in water)', 11);
INSERT INTO public.planet VALUES (8, 'Uranus', 28, '1,600,000,000 to 1,960,000,000', 'Milky Way', false, 'Ice Giant', -195.00, true, '84 earth years', 13, 'Orbits on its side((98 degree tilt)blue-green from methane', 11);
INSERT INTO public.planet VALUES (9, 'Neptune', 16, '2,680,000,000 to 2,900,000,000', 'Milky Way', false, 'Ice Giant', -200.00, true, '165 earth years', 5, 'Windiest planet-discovered mathematically', 11);
INSERT INTO public.planet VALUES (10, 'Pluto', 5, '2,660,000,000 to 4,670,000,000', 'Milky Way', false, 'Dwarf Planet', -225.00, false, '248 earth years', 0, 'Icy rocky body in the Kuiper Belt-heart shaped glacier(sputnik Planitia)', 11);
INSERT INTO public.planet VALUES (11, 'Haumea', 2, '3,440,000,000 to 5,140,000,000', 'Milky Way', false, 'Dwarf Planet', -241.00, false, '285 earth years', 0, 'Rugby ball shaped due to fast rotation', 11);
INSERT INTO public.planet VALUES (12, 'Eris', 1, '5,700,000,000 to 9,830,000,000', 'Milky Way', false, 'Dwarf Planet', -243.00, false, '557 earth years', 0, 'Most massive Dwarf Planet sparked the Pluto debate', 11);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sirius', 'Milky Way', '50,000,000,000,000', 'Canis Major', 'Brightest star in night sky, binary system', 2);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 'Milky Way', '24,000,000,000,000', 'Centaurus', 'Closest star to the sun, red dwarf', 2);
INSERT INTO public.star VALUES (3, 'Alpha Centauri A', 'Milky Way', '25,000,000,000,000', 'Centaurus', 'Sun-like star, part of a triple system', 2);
INSERT INTO public.star VALUES (4, 'Betelgeuse', 'Milky Way', '150,000,000,000,000', 'Orion', 'Red supergiant, may go supernova soon', 2);
INSERT INTO public.star VALUES (5, 'Vega', 'Milky Way', '150,000,000,000,000', 'Lyra', 'Bright blue star, reference for magnitude', 2);
INSERT INTO public.star VALUES (6, 'Polaris', 'Milky Way', '300,000,000,000,000', 'Ursa Minor', 'North star, Cepheid variable', 2);
INSERT INTO public.star VALUES (7, 'Antares', 'Milky Way', '450,000,000,000,000', 'Scorpius', 'Red supergiant, heart of Scorpion', 2);
INSERT INTO public.star VALUES (8, 'S Doradus', 'Large Magellanic Cloud', '960,000,000,000,000', 'Dorado', 'Luminous blue variable, very massive', 6);
INSERT INTO public.star VALUES (9, 'HD 5980', 'Small Magellanic Cloud', '1,200,000,000,000,000', 'Tacana', 'Extremely luminous binary system', 7);
INSERT INTO public.star VALUES (10, 'AE Andromedae', 'Andromeda Galaxy', '14,700,000,000,000,000', 'Andromeda', 'Luminous blue variable in M1', 1);
INSERT INTO public.star VALUES (11, 'Sun', 'Milky Way', '92,960,000', 'N/A', 'G-type main-sequence star, center of Solar System, provides energy for life on Earth, 4.6 billion years old, surface temp: 5,500°C, core temp: 15 million°C', 2);


--
-- Name: blackhole_blackhole_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.blackhole_blackhole_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 10, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 46, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 11, true);


--
-- Name: blackhole blackhole_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.blackhole
    ADD CONSTRAINT blackhole_pkey PRIMARY KEY (blackhole_id);


--
-- Name: blackhole constraint_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.blackhole
    ADD CONSTRAINT constraint_name UNIQUE (name);


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
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: moon name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT name UNIQUE (name);


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
-- Name: moon fk_moon_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_moon_planet FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet fk_planet_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_planet_star FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star fk_star_galaxy_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_star_galaxy_id FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

