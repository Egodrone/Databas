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
