USE albums_db;
SHOW TABLES;
SELECT * FROM albums WHERE artist = 'Pink Floyd';
SELECT release_date AS year FROM albums WHERE name LIKE '%Pepper%';
SELECT * FROM albums WHERE name LIKE '%Pepper%';
--  Sgt Pepper was released in 1967
SELECT * FROM albums WHERE name LIKE '%Nevermind%';
--  genre for NeverMind is "grunge, alternative rock"
SELECT * FROM albums WHERE release_date BETWEEN '1990/01/01' AND '1999/12/31';
-- The Bodyguard, Jagged Little Pill, Come on Over, Falling into You, Lets Talk about Love, Dangerous, The Immaculate Collection, Titanic, Metallica, Supernatural
SELECT * FROM albums WHERE sales < 20;
SELECT * FROM albums WHERE genre = 'Rock';
SELECT * FROM albums WHERE genre LIKE '%Rock%';
--- Hard rock, Progressive rock, Folk rock, etc.... have to use LIKE because of capitlization and inclusion in other string
