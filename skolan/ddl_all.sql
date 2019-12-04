SET NAMES 'utf8';
DROP TABLE IF EXISTS kurstillfalle;
DROP TABLE IF EXISTS kurs;

--
-- Create table: larare
--
DROP TABLE IF EXISTS larare;
CREATE TABLE larare
(
-- resten av CREATE statementet. rm k, alter k
    akronym CHAR(3),
    avdelning CHAR(4),
    fornamn VARCHAR(20),
    efternamn VARCHAR(20),
    kon CHAR(1),
    lon INT,
    fodd DATE,
    -- kompetens INT DEFAULT 1 NOT NULL,
    PRIMARY KEY (akronym)
);

ALTER TABLE larare ADD COLUMN kompetens INT DEFAULT 1 NOT NULL;

CREATE TABLE kurs
(
    kod CHAR(6) PRIMARY KEY NOT NULL,
    namn VARCHAR(40),
    poang FLOAT,
    niva CHAR(3)
);

CREATE TABLE kurstillfalle
(
    -- id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    id INT AUTO_INCREMENT,
    kurskod CHAR(6) NOT NULL,
    kursansvarig CHAR(3) NOT NULL,
    lasperiod INT NOT NULL,
    
    PRIMARY KEY (id),
    FOREIGN KEY (kurskod) REFERENCES kurs(kod),
    FOREIGN KEY (kursansvarig) REFERENCES larare(akronym)
);



DROP TABLE IF EXISTS t1;
DROP TABLE IF EXISTS t2;



--
-- Ange teckenkodning för en tabell
--
CREATE TABLE t1 (i INT) CHARSET utf8 COLLATE utf8_swedish_ci;
CREATE TABLE t2 (
    i INT
)
ENGINE INNODB
CHARSET utf8
COLLATE utf8_swedish_ci
;

--
-- Update table larare and larare_pre to use same charset
-- and collation.
--
-- ALTER TABLE larare CONVERT TO CHARSET utf8 COLLATE utf8_swedish_ci;
ALTER TABLE larare_pre CONVERT TO CHARSET utf8 COLLATE utf8_swedish_ci;
SHOW CREATE TABLE kurs;
-- SHOW CREATE TABLE kurstillfalle \G;
SHOW CREATE TABLE kurstillfalle;


--
-- Make copy of table
--
DROP TABLE IF EXISTS larare_pre;
CREATE TABLE larare_pre LIKE larare;
INSERT INTO larare_pre SELECT * FROM larare;



-- Copy of views 
SELECT
    CONCAT(fornamn, ' ', efternamn, ' (', LOWER(avdelning), ')') AS Namn,
    TIMESTAMPDIFF(YEAR, fodd, CURDATE()) AS Ålder
FROM larare;

DROP VIEW IF EXISTS v_name_alder;
CREATE VIEW v_name_alder
AS
SELECT
    CONCAT(fornamn, ' ', efternamn, ' (', LOWER(avdelning), ')') AS Namn,
    TIMESTAMPDIFF(YEAR, fodd, CURDATE()) AS Ålder
FROM larare;

-- Använd vyn
SELECT * FROM v_name_alder;


SELECT * FROM v_name_alder
WHERE Namn LIKE '%di%'
ORDER BY Ålder DESC
LIMIT 3;

-- Vy med Larare.* och Ålder
-- 1) Skapa en vy “v_larare” som innehåller samtliga 
-- kolumner från tabellen Lärare inklusive en ny kolumn med lärarens ålder.

DROP VIEW IF EXISTS v_larare;
CREATE VIEW v_larare
AS
SELECT
    akronym,
    avdelning,
    fornamn,
    efternamn,
    kon,
    lon,
    fodd,
    TIMESTAMPDIFF(YEAR, fodd, CURDATE()) AS Ålder
FROM larare;

-- Använd vyn
SELECT * FROM v_larare;

-- 2) Gör en SELECT-sats mot vyn som beräknar
-- medelåldern på respektive avdelning. Visa avdelningens namn 
-- och medelålder sorterad på medelåldern.

SELECT
    avdelning,
    ROUND(AVG(Ålder)) AS Snittålder
FROM v_larare
GROUP BY
    avdelning
ORDER BY
    Snittålder DESC;


-- SELECT akronym, avdelning, fornamn, efternamn, kon, lon, fodd FROM larare;



SELECT * FROM larare;


SELECT
    l.akronym,
    l.lon,
    l.kompetens,
    p.lon AS "pre-lon",
    p.kompetens AS "pre-kompetens"
FROM larare AS l
    JOIN larare_pre AS p
        ON l.akronym = p.akronym
ORDER BY akronym
;


DROP VIEW IF EXISTS v_lonerevision;
CREATE VIEW v_lonerevision
AS
SELECT
    l.akronym,
    l.fornamn,
    l.efternamn,
    l.kompetens AS "nukomp",
    p.lon AS "pre",
    l.lon AS "nu",
    p.kompetens AS "prekomp",
    l.kompetens - p.kompetens AS "diffkomp",
    l.lon - p.lon AS "diff",
    ROUND((100/p.lon)*l.lon, 2) - 100 AS proc,
    CASE WHEN (ROUND((100/p.lon)*l.lon, 2) - 100 > 3) THEN "ok" 
    ELSE "nok" END AS mini
FROM larare AS l
    JOIN larare_pre AS p
        ON l.akronym = p.akronym
ORDER BY proc DESC
;

-- Använd vyn
-- SELECT * FROM v_lonerevision;

SELECT
    akronym, fornamn, efternamn, pre, nu, diff, proc, mini
FROM v_lonerevision
ORDER BY proc  DESC
;

-- Kompetens rapport
SELECT
    akronym, fornamn, efternamn, prekomp, nukomp, diffkomp
FROM v_lonerevision
-- ORDER BY diffkomp DESC
ORDER BY
CASE diffkomp > 0
WHEN diffkomp > 0 THEN diffkomp
ELSE akronym END
DESC
;


-- Enbart kompetensen
-- SELECT
--    akronym, fornamn, efternamn, prekomp, nukomp, diffkomp
-- FROM v_lonerevision
-- ORDER BY nukomp DESC, diffkomp DESC
-- ;



-- SELECT
--    akronym, fornamn, efternamn, pre, nu, diff, proc, mini
-- FROM v_lonerevision
-- ORDER BY proc DESC
-- ;
-- SELECT * FROM larare
-- WHERE kompetens BETWEEN 3 AND 7
-- AND lon BETWEEN 30000 AND 40000;



