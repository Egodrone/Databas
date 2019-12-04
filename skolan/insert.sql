--
-- Insert values into table larare.
-- By Egodrone for course databas.
-- 2019-01-25
-- 

DELETE FROM larare;

--
-- Add teacher staff 
--
INSERT INTO larare VALUES ('sna', 'DIPT', 'Severus', 'Snape', 'M', 40000, '1951-05-01', 1);
INSERT INTO larare VALUES ('dum', 'ADM', 'Albus', 'Dumbledore', 'M', 80000, '1941-04-01', 1);
INSERT INTO larare VALUES ('min', 'DIDD', 'Minerva', 'McGonagall', 'K', 40000, '1955-05-05', 1);

INSERT INTO larare VALUES
    ('hag', 'ADM', 'Hagrid', 'Rubeus', 'M', 25000, '1956-05-06', 1),
    ('fil', 'ADM', 'Argus', 'Filch', 'M', 25000, '1946-04-06', 1),
    ('hoc', 'DIDD', 'Madam', 'Hooch', 'K', 35000, '1948-04-08', 1)
;

INSERT INTO larare
    (akronym, avdelning, fornamn, efternamn, kon, fodd)
VALUES
    ('gyl', 'DIPT', 'Gyllenroy', 'Lockman', 'M', '1952-05-02'),
    ('ala', 'DIPT', 'Alastor', 'Moody', 'M', '1943-04-03')
;

SELECT akronym, avdelning, fornamn, efternamn, kon, lon, fodd FROM larare;

--
-- Update a column value
--

UPDATE larare
    SET
        lon = 30000
    WHERE
        lon IS NULL
;

SELECT akronym, avdelning, fornamn, efternamn, kon, lon, fodd, kompetens FROM larare;
SELECT SUM(lon) AS 'Lönesumma', SUM(kompetens) AS Kompetens FROM larare;
SELECT akronym, avdelning, fornamn, kon, lon, kompetens
FROM larare
ORDER BY lon DESC;

--
-- Make copy of table
--
DROP TABLE IF EXISTS larare_pre;
CREATE TABLE larare_pre LIKE larare;
INSERT INTO larare_pre SELECT * FROM larare;

-- Check the content of the tables, for sanity checking
SELECT SUM(lon) AS 'Lönesumma', SUM(kompetens) AS Kompetens FROM larare;
SELECT SUM(lon) AS 'Lönesumma', SUM(kompetens) AS Kompetens FROM larare_pre;

-- Kopiera tabell
-- 1) Visa de lärare som inte har fått en löneökning om minst 3%.

SELECT * FROM larare;
