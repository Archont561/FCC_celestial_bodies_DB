-- Create the database named "universe"
CREATE DATABASE universe;

-- Connect to the "universe" database
\c universe

-- Create the "description" table
CREATE TABLE description (
    description_id SERIAL PRIMARY KEY,
    name VARCHAR(30) UNIQUE NOT NULL,
    description TEXT NOT NULL
);

-- Create the "galaxy" table
CREATE TABLE galaxy (
    galaxy_id SERIAL PRIMARY KEY,
    name VARCHAR(100) UNIQUE NOT NULL,
    age_in_millions_of_years INT NOT NULL,
    star_count INT NOT NULL,
    has_life BOOLEAN NOT NULL,
    description_id INT,
    FOREIGN KEY (description_id) REFERENCES description(description_id)
);

-- Create the "star" table
CREATE TABLE star (
    star_id SERIAL PRIMARY KEY,
    name VARCHAR(100) UNIQUE NOT NULL,
    star_type VARCHAR(30),
    temperature NUMERIC,
    distance_from_earth NUMERIC(14, 3),
    has_planets BOOLEAN,
    galaxy_id INT NOT NULL,
    description_id INT,
    FOREIGN KEY (galaxy_id) REFERENCES galaxy(galaxy_id),
    FOREIGN KEY (description_id) REFERENCES description(description_id)
);

-- Create the "planet" table
CREATE TABLE planet (
    planet_id SERIAL PRIMARY KEY,
    name VARCHAR(100) UNIQUE NOT NULL,
    planet_type VARCHAR(30),
    diameter NUMERIC(10, 2) NOT NULL,
    has_moons BOOLEAN,
    star_id INT NOT NULL,
    description_id INT,
    FOREIGN KEY (star_id) REFERENCES star(star_id),
    FOREIGN KEY (description_id) REFERENCES description(description_id)
);

-- Create the "moon" table
CREATE TABLE moon (
    moon_id SERIAL PRIMARY KEY,
    name VARCHAR(100) UNIQUE NOT NULL,
    is_spherical BOOLEAN NOT NULL,
    distance_from_planet NUMERIC(14, 3),
    planet_id INT NOT NULL,
    description_id INT UNIQUE,
    FOREIGN KEY (planet_id) REFERENCES planet(planet_id),
    FOREIGN KEY (description_id) REFERENCES description(description_id)
);

-- Insert data into the "description" table
INSERT INTO description (name, description) VALUES
    ('The Milky Way', 'The Milky Way is the galaxy where our solar system resides.'),
    ('Andromeda', 'Andromeda is the closest spiral galaxy to the Milky Way.'),
    ('Triangulum', 'Triangulum is a small spiral galaxy that is part of the Local Group.'),
    ('Centaurus A', 'Centaurus A is a massive elliptical galaxy in the Centaurus constellation.'),
    ('The Whirlpool Galaxy', 'The Whirlpool Galaxy is a grand-design spiral galaxy located in the constellation Canes Venatici.'),
    ('The Pinwheel Galaxy', 'The Pinwheel Galaxy, also known as Messier 101, is a face-on spiral galaxy in the constellation Ursa Major.'),
    ('The Sun', 'The Sun is the star at the center of the Solar System.'),
    ('Alpha Centauri A', 'Alpha Centauri A is the primary component of the Alpha Centauri binary star system.'),
    ('Proxima Centauri', 'Proxima Centauri is a small, low-mass star located in the constellation of Centaurus.'),
    ('Sirius', 'Sirius, also known as the Dog Star, is the brightest star in the night sky.'),
    ('Betelgeuse', 'Betelgeuse is a red supergiant star in the constellation of Orion.'),
    ('Vega', 'Vega is the brightest star in the constellation of Lyra.'),
    ('Mercury', 'Mercury is the smallest planet in the Solar System and the closest to the Sun.'),
    ('Venus', 'Venus is the second planet from the Sun and the hottest planet in the Solar System.'),
    ('Earth', 'Earth is the third planet from the Sun and the only astronomical object known to harbor life.'),
    ('Mars', 'Mars is the fourth planet from the Sun and the second-smallest planet in the Solar System, after Mercury.'),
    ('Jupiter', 'Jupiter is the largest planet in the Solar System and the fifth planet from the Sun.'),
    ('Saturn', 'Saturn is the sixth planet from the Sun and the second-largest in the Solar System, after Jupiter.'),
    ('Uranus', 'Uranus is the seventh planet from the Sun.'),
    ('Neptune', 'Neptune is the eighth and farthest-known Solar planet from the Sun.'),
    ('Alpha Centauri Bb', 'Alpha Centauri Bb is an exoplanet orbiting the star Alpha Centauri B.'),
    ('Proxima Centauri b', 'Proxima Centauri b is an exoplanet orbiting the star Proxima Centauri.'),
    ('Sirius Bb', 'Sirius Bb is an exoplanet orbiting the star Sirius B.'),
    ('Betelgeuse b', 'Betelgeuse b is an exoplanet orbiting the star Betelgeuse.'),
    ('The Moon', 'The Moon is Earth''s only natural satellite.'),
    ('Phobos', 'Phobos is the larger and closer of the two natural satellites of Mars.'),
    ('Deimos', 'Deimos is the smaller and outermost of the two natural satellites of Mars.'),
    ('Io', 'Io is the innermost of the four Galilean moons of Jupiter and, with a diameter of 3,643.2 kilometers (2,263.4 mi), the fourth-largest moon in the Solar System.'),
    ('Europa', 'Europa is the smallest of the four Galilean moons orbiting Jupiter and the sixth-closest to the planet of all the 79 known moons of Jupiter.'),
    ('Ganymede', 'Ganymede is the largest and most massive moon of Jupiter and in the Solar System.'),
    ('Callisto', 'Callisto is the second-largest moon of Jupiter, after Ganymede.'),
    ('Titan', 'Titan is the largest moon of Saturn and the second-largest natural satellite in the Solar System.'),
    ('Enceladus', 'Enceladus is the sixth-largest moon of Saturn.'),
    ('Triton', 'Triton is the largest natural satellite of the planet Neptune.'),
    ('Charon', 'Charon, also known as (134340) Pluto I, is the largest of the five known natural satellites of the dwarf planet Pluto.'),
    ('Proxima Centauri b Moon 1', 'Proxima Centauri b Moon 1 orbits the exoplanet Proxima Centauri b. It is a small rocky satellite with a diameter of approximately 5000 kilometers.'),
    ('Proxima Centauri b Moon 2', 'Proxima Centauri b Moon 2 is another satellite of the exoplanet Proxima Centauri b. It has a diameter of around 7000 kilometers and likely exhibits synchronous rotation.'),
    ('Sirius Bb Moon 1', 'Sirius Bb Moon 1 orbits the white dwarf Sirius Bb. Despite the intense radiation, it maintains its orbit and provides insights into stellar evolution.'),
    ('Sirius Bb Moon 2', 'Sirius Bb Moon 2 is another moon of the white dwarf Sirius Bb. Its surface may be irradiated due to its proximity to its parent star.'),
    ('Betelgeuse b Moon 1', 'Betelgeuse b Moon 1 orbits the exoplanet Betelgeuse b. It is a rocky satellite with a diameter of approximately 80000 kilometers.'),
    ('Betelgeuse b Moon 2', 'Betelgeuse b Moon 2 is another moon of the exoplanet Betelgeuse b. It has a diameter of around 100000 kilometers and exhibits synchronous rotation.'),
    ('Betelgeuse b Moon 3', 'Betelgeuse b Moon 3 orbits the exoplanet Betelgeuse b. Its surface might be scarred by impact craters, reflecting its dynamic history.'),
    ('Betelgeuse b Moon 4', 'Betelgeuse b Moon 4 is another moon of the exoplanet Betelgeuse b. It may have geological features shaped by tidal interactions with its parent planet.'),
    ('Betelgeuse b Moon 5', 'Betelgeuse b Moon 5 orbits the exoplanet Betelgeuse b. Its surface likely exhibits a variety of terrain types, influenced by its parent planet''s gravity and radiation environment.')
;


-- Insert data into the "galaxy" table
INSERT INTO galaxy (name, age_in_millions_of_years, star_count, has_life, description_id) VALUES
    ('Milky Way', 13000, 1000, TRUE, 1),
    ('Andromeda', 10000, 500, FALSE, 2),
    ('Triangulum', 4000, 200, FALSE, 3),
    ('Centaurus A', 12000, 400, TRUE, 4),
    ('Whirlpool Galaxy', 14000, 300, FALSE, 5),
    ('Pinwheel Galaxy', 11000, 250, FALSE, 6);

-- Insert data into the "star" table
INSERT INTO star (name, star_type, temperature, distance_from_earth, has_planets, galaxy_id, description_id) VALUES
    ('Sun', 'G-type main-sequence star', 5778, 0, TRUE, 1, 7),
    ('Alpha Centauri A', 'Main-sequence star', 5790, 4.37, TRUE, 2, 8),
    ('Proxima Centauri', 'Red dwarf', 3042, 4.24, FALSE, 2, 9),
    ('Sirius', 'A-type main-sequence star', 9940, 8.6, TRUE, 1, 10),
    ('Betelgeuse', 'Red supergiant', 3500, 643, TRUE, 1, 11),
    ('Vega', 'A-type main-sequence star', 9602, 25.04, TRUE, 1, 12);

-- Insert data into the "planet" table
INSERT INTO planet (name, planet_type, diameter, has_moons, star_id, description_id) VALUES
    ('Mercury', 'Terrestrial planet', 4879, FALSE, 1, 13),
    ('Venus', 'Terrestrial planet', 12104, FALSE, 1, 14),
    ('Earth', 'Terrestrial planet', 12742, TRUE, 1, 15),
    ('Mars', 'Terrestrial planet', 6792, TRUE, 1, 16),
    ('Jupiter', 'Gas giant', 139822, TRUE, 1, 17),
    ('Saturn', 'Gas giant', 116464, TRUE, 1, 18),
    ('Uranus', 'Ice giant', 50724, TRUE, 1, 19),
    ('Neptune', 'Ice giant', 49244, TRUE, 1, 20),
    ('Alpha Centauri Bb', 'Terrestrial planet', 11800, FALSE, 2, 21),
    ('Proxima Centauri b', 'Terrestrial planet', 12103, FALSE, 3, 22),
    ('Sirius Bb', 'Terrestrial planet', 9300, FALSE, 4, 23),
    ('Betelgeuse b', 'Gas giant', 167764, TRUE, 5, 24);

-- Insert data into the "moon" table
INSERT INTO moon (name, is_spherical, distance_from_planet, planet_id, description_id) VALUES
    ('Moon', TRUE, 384400, 3, 25),
    ('Phobos', TRUE, 9378, 4, 26),
    ('Deimos', TRUE, 23463, 4, 27),
    ('Io', TRUE, 421700, 5, 28),
    ('Europa', TRUE, 671034, 5, 29),
    ('Ganymede', TRUE, 1070400, 5, 30),
    ('Callisto', TRUE, 1882700, 5, 31),
    ('Titan', TRUE, 1221870, 6, 32),
    ('Enceladus', TRUE, 238037, 6, 33),
    ('Triton', TRUE, 354800, 8, 34),
    ('Charon', TRUE, 19591, 9, 35),
    ('Proxima Centauri b Moon 1', TRUE, 5000, 10, 36),
    ('Proxima Centauri b Moon 2', TRUE, 7000, 10, 37),
    ('Sirius Bb Moon 1', TRUE, 4000, 11, 38),
    ('Sirius Bb Moon 2', TRUE, 6000, 11, 39),
    ('Betelgeuse b Moon 1', TRUE, 80000, 12, 40),
    ('Betelgeuse b Moon 2', TRUE, 100000, 12, 41),
    ('Betelgeuse b Moon 3', TRUE, 120000, 12, 42),
    ('Betelgeuse b Moon 4', TRUE, 140000, 12, 43),
    ('Betelgeuse b Moon 5', TRUE, 160000, 12, 44)
;
