-- from the terminal run:
-- psql < outer_space.sql

DROP DATABASE IF EXISTS outer_space;

CREATE DATABASE outer_space;

\c outer_space

CREATE TABLE planets
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  orbital_period_in_years FLOAT NOT NULL,
  orbits_around TEXT NOT NULL,
  galaxy TEXT NOT NULL,
);

CREATE TABLE moons (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  planet TEXT
);

INSERT INTO planets
  (name, orbital_period_in_years, orbits_around, galaxy)
VALUES
  ('Earth', 1.00, 'The Sun', 'Milky Way'),
  ('Mars', 1.88, 'The Sun', 'Milky Way'),
  ('Venus', 0.62, 'The Sun', 'Milky Way'),
  ('Neptune', 164.8, 'The Sun', 'Milky Way'),
  ('Proxima Centauri b', 0.03, 'Proxima Centauri', 'Milky Way'),
  ('Gliese 876 b', 0.23, 'Gliese 876', 'Milky Way');


INSERT INTO moons 
  (name, planet)
  VALUES ('The Moon', 'Earth'),
  ('Phobos', 'Mars'),
  ('Deimos', 'Mars'),
  ('Naiad', 'Neptune'),
  ('Thalassa', 'Neptune'), ('Despina', 'Neptune'), ('Galatea', 'Neptune'), ('Larissa', 'Neptune'), ('S/2004 N 1', 'Neptune'),('Proteus', 'Neptune'), ('Triton', 'Neptune'), ('Nereid', 'Neptune'), ('Halimede', 'Neptune'), ('Sao', 'Neptune'), ('Laomedeia', 'Neptune'), ('Psamathe', 'Neptune'), ('Neso', 'Neptune');

