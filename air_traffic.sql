-- from the terminal run:
-- psql < air_traffic.sql

DROP DATABASE IF EXISTS air_traffic;

CREATE DATABASE air_traffic;

\c air_traffic

CREATE TABLE tickets
(
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL,
  seat TEXT NOT NULL,
  departure TIMESTAMP NOT NULL,
  arrival TIMESTAMP NOT NULL,
  airline TEXT NOT NULL,
  --from_city TEXT NOT NULL,
 -- from_country TEXT NOT NULL,
  --to_city TEXT NOT NULL,
 -- to_country TEXT NOT NULL
);

CREATE TABLE from_cities (
  id SERIAL PRIMARY KEY,
  name TEXT,
  from_country TEXT,
  ticket_id INTEGER REFERENCES tickets.id
);

CREATE TABLE to_cities (
  id SERIAL PRIMARY KEY,
  name TEXT,
  to_country TEXT,
  ticket_id INTEGER REFERENCES tickets
);

INSERT INTO tickets
  (first_name, last_name, seat, departure, arrival, airline)
VALUES
  ('Jennifer', 'Finch', '33B', '2018-04-08 09:00:00', '2018-04-08 12:00:00', 'United'),
  ('Thadeus', 'Gathercoal', '8A', '2018-12-19 12:45:00', '2018-12-19 16:15:00', 'British Airways'),
  ('Sonja', 'Pauley', '12F', '2018-01-02 07:00:00', '2018-01-02 08:03:00', 'Delta'),
  ('Jennifer', 'Finch', '20A', '2018-04-15 16:50:00', '2018-04-15 21:00:00', 'Delta'),
  ('Waneta', 'Skeleton', '23D', '2018-08-01 18:30:00', '2018-08-01 21:50:00', 'TUI Fly Belgium'),
  ('Thadeus', 'Gathercoal', '18C', '2018-10-31 01:15:00', '2018-10-31 12:55:00', 'Air China'),
  ('Berkie', 'Wycliff', '9E', '2019-02-06 06:00:00', '2019-02-06 07:47:00', 'United'),
  ('Alvin', 'Leathes', '1A', '2018-12-22 14:42:00', '2018-12-22 15:56:00', 'American Airlines'),
  ('Berkie', 'Wycliff', '32B', '2019-02-06 16:28:00', '2019-02-06 19:18:00', 'American Airlines'),
  ('Cory', 'Squibbes', '10D', '2019-01-20 19:30:00', '2019-01-20 22:45:00', 'Avianca Brasil');

  INSERT INTO from_cities (name, from_country)
  VALUES ('Washington DC', 'United States'), ('Tokyo', 'Japan'), ('Los Angeles', 'United States'), ('Seattle', 'United States'), ('Paris', 'France'), ('Dubai', 'UAE'), ('New York', 'United States'), ('Cedar Rapids', 'United States'), ('Charlotte', 'United States'), ('Sao Paulo', 'Brazil');

  INSERT INTO to_cities (name, to_country)
  VALUES ('Las Vegas', 'United States'), ('Seattle', 'United States'), ('London', 'United Kingdom'), ('Mexico City', 'Mexico'), ('Casablanca', 'Morocco'), ('Beijing', 'China'), ('New Orleans', 'United States'), ('Chicago', 'United States'), ('Charlotte', 'United States'), ('Santigo', 'Chile');



