--
-- A crossjoin
--
SELECT * FROM kurs, kurstillfalle;

--
-- Join using WHERE, use alias AS to shorten the statement
--
SELECT *
FROM kurs AS k, kurstillfalle AS kt
WHERE k.kod = kt.kurskod;

--
-- Join using JOIN..ON
--
SELECT *
FROM kurs AS k
    JOIN kurstillfalle AS kt
        ON k.kod = kt.kurskod;

--
-- Join three tables
--
SELECT *
FROM kurs AS k
    JOIN kurstillfalle AS kt
        ON k.kod = kt.kurskod
    JOIN larare AS l
        ON l.akronym = kt.kursansvarig;

DROP VIEW IF EXISTS v_planering;
CREATE VIEW v_planering
AS
SELECT *
FROM kurs AS k
    JOIN kurstillfalle AS kt
        ON k.kod = kt.kurskod
    JOIN larare AS l
        ON l.akronym = kt.kursansvarig;

SELECT * FROM v_planering;

SELECT
    akronym,
    CONCAT(fornamn, ' ' ,efternamn) AS "Namn",
    COUNT(kursansvarig) AS "Tillfallen"
FROM v_planering
GROUP BY akronym
ORDER BY Tillfallen DESC;

SELECT
    akronym,
    fornamn,
    efternamn,
    fodd,
    TIMESTAMPDIFF(YEAR, fodd, CURDATE()) AS Ålder
FROM larare
ORDER BY Ålder DESC LIMIT 3;

-- de tre äldsta lärarna som också undervisar på kurser.
SELECT
    CONCAT(namn, ' (' , kod, ')') AS "Kursnamn",
    CONCAT(fornamn, ' ' ,efternamn, ' (',akronym,')') AS "Larare",
    TIMESTAMPDIFF(YEAR, fodd, CURDATE()) AS Ålder
FROM v_planering
ORDER BY Ålder DESC LIMIT 6;
    
        