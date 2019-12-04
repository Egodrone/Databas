--
-- Insert into kurs 
--
DELETE FROM kurs;

LOAD DATA LOCAL INFILE '/home/SERVERNAME/dbwebb-kurser/databas/me/skolan/kurs.csv'
INTO TABLE kurs
CHARSET utf8
FIELDS
    TERMINATED BY ','
    ENCLOSED BY '"'
LINES
    TERMINATED BY '\n'
IGNORE 1 LINES
;

SELECT * FROM kurs;

DELETE FROM kurstillfalle;

LOAD DATA LOCAL INFILE '/home/SERVERNAME/dbwebb-kurser/databas/me/skolan/kurstillfalle.csv'
-- resten av uttrycket
INTO TABLE kurstillfalle
CHARSET utf8
FIELDS
    TERMINATED BY ','
    ENCLOSED BY '"'
LINES
    TERMINATED BY '\n'
IGNORE 1 LINES
(kurskod, kursansvarig, lasperiod)
;

SELECT * FROM kurstillfalle;
