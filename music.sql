-- from the terminal run:
-- psql < music.sql

DROP DATABASE IF EXISTS music;

CREATE DATABASE music;

\c music

CREATE TABLE songs
(
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL,
  duration_in_seconds INTEGER NOT NULL,
  release_date DATE NOT NULL,
  artist_id INTEGER NOT NULL,
  album TEXT NOT NULL,
  producers TEXT[] NOT NULL
);

CREATE TABLE artists
(
id SERIAL PRIMARY KEY,
name TEXT NOT NULL, 
songs TEXT NOT NULL
);

INSERT INTO songs
  (title, duration_in_seconds, release_date, artist_id, album, producers)
VALUES
  ('MMMBop', 238, '04-15-1997', 1 'Middle of Nowhere', '{"Dust Brothers", "Stephen Lironi"}'),
  ('Bohemian Rhapsody', 355, '10-31-1975', 2 'A Night at the Opera', '{"Roy Thomas Baker"}'),
  ('One Sweet Day', 282, '11-14-1995', '{3, 4}', 'Daydream', '{"Walter Afanasieff"}'),
  ('Shallow', 216, '09-27-2018', '{5,6}', 'A Star Is Born', '{"Benjamin Rice"}'),
  ('How You Remind Me', 223, '08-21-2001', 7, 'Silver Side Up', '{"Rick Parashar"}'),
  ('New York State of Mind', 276, '10-20-2009', '{8, 9}', 'The Blueprint 3', '{"Al Shux"}'),
  ('Dark Horse', 215, '12-17-2013', '{10, 11}', 'Prism', '{"Max Martin", "Cirkut"}'),
  ('Moves Like Jagger', 201, '06-21-2011', '{12,13}', 'Hands All Over', '{"Shellback", "Benny Blanco"}'),
  ('Complicated', 244, '05-14-2002', 14, 'Let Go', '{"The Matrix"}'),
  ('Say My Name', 240, '11-07-1999', 15, 'The Writing''s on the Wall', '{"Darkchild"}');

 INSERT INTO artists (name, songs)
 VALUES ('Hanson', 'MMMBop'), ('Queen', 'Bohemian Rhapsody'), ('Mariah Carey', 'One Sweet Day'), ('Boyz II Men', 'One Sweet Day'), ('Lady Gaga', 'Shallow'), ('Bradley Cooper', 'Shallow'), ('Nickelback', 'How You Remind Me'),
 ('Jay Z', 'New York State of Mind'),
 ('Katy Perry', 'Dark Horse'),
 ('Juicy J', 'Dark Horse'),
 ('Maroon 5', 'Moves Like Jagger'),
 ('Christina Aguilera', 'Moves Like Jagger'),
 ('Avril Lavigne', 'Complicated '),
 ('Destiny''s Child', 'Say My Name');
