-- Joina tabell
-- 1) Visa de lärare som inte har fått en löneökning om minst 3%.
-- 2) Gör en rapport som visar hur många % respektive lärare fick i löneökning.

--
-- JOIN
--
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

-- 1) Skapa rapporten som visar resultatet enligt nedan.
-- 1) Spara rapporten som en vy v_lonerevision.

SELECT
    l.akronym,
	l.fornamn,
    l.efternamn,
    p.lon AS "pre",
    l.lon AS "nu",
    l.lon - p.lon AS "diff",
    ROUND((100/p.lon)*l.lon, 2) - 100 AS proc,
        IF(ROUND((100/p.lon)*l.lon, 2) > 3, "ok", "nok") AS mini
FROM larare AS l
    JOIN larare_pre AS p
        ON l.akronym = p.akronym
ORDER BY proc DESC
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
