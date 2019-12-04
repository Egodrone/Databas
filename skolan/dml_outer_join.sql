SELECT DISTINCT
    akronym AS Akronym,
CONCAT(fornamn, " ", efternamn) AS Namn
FROM v_planering
ORDER BY akronym;

--
-- Outer join, inkludera lärare utan undervisning
--
SELECT DISTINCT
    l.akronym AS Akronym,
    CONCAT(l.fornamn, " ", l.efternamn) AS Namn,
    l.avdelning AS Avdelning,
    kt.kurskod AS Kurskod
FROM larare AS l
    LEFT OUTER JOIN kurstillfalle AS kt
        ON l.akronym = kt.kursansvarig
;

SELECT DISTINCT
    l.akronym AS Akronym,
    CONCAT(l.fornamn, " ", l.efternamn) AS Namn,
    l.avdelning AS Avdelning,
    kt.kurskod AS Kurskod
FROM larare AS l
RIGHT OUTER JOIN kurstillfalle AS kt
ON l.akronym = kt.kursansvarig;


-- visa enbart de kurser som inte har kurstillfällen.
SELECT DISTINCT
    l.kod AS "Kurskod",
    namn AS "Kursnamn",
    kt.kurskod AS Lasperiod
FROM kurs AS l
    LEFT OUTER JOIN kurstillfalle AS kt
        ON l.kod = kt.kurskod
WHERE Lasperiod IS NULL
;
