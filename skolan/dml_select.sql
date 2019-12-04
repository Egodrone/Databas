SELECT akronym, avdelning, fornamn, efternamn, kon, lon, fodd, kompetens
FROM larare;

SELECT akronym, avdelning, fornamn, efternamn, kon, lon, fodd, kompetens
FROM larare
WHERE avdelning IN ('DIDD');

SELECT akronym, avdelning, fornamn, efternamn, kon, lon, fodd, kompetens
FROM larare
WHERE akronym LIKE ('h%');

SELECT akronym, avdelning, fornamn, efternamn, kon, lon, fodd, kompetens
FROM larare
WHERE fornamn LIKE ('%o%');

SELECT akronym, avdelning, fornamn, efternamn, kon, lon, fodd, kompetens
FROM larare
WHERE lon > 29999 AND lon < 50000;

SELECT akronym, avdelning, fornamn, efternamn, kon, lon, fodd, kompetens
FROM larare
WHERE lon > 40000 AND kompetens < 7;

SELECT akronym, avdelning, fornamn, efternamn, kon, lon, fodd, kompetens
FROM larare
WHERE akronym IN ('sna', 'dum', 'min');

SELECT akronym, avdelning, fornamn, efternamn, kon, lon, fodd, kompetens
FROM larare
WHERE lon > 80000 OR kompetens = 2 AND avdelning IN ('ADM');

SELECT fornamn, lon
FROM larare;
-- ORDER BY fornamn;

SELECT fornamn, lon
FROM larare
ORDER BY efternamn DESC;

SELECT fornamn, lon
FROM larare
ORDER BY efternamn ASC;

SELECT fornamn, lon
FROM larare
ORDER BY lon DESC;

SELECT fornamn, lon
FROM larare
ORDER BY lon ASC;

SELECT fornamn, lon
FROM larare
ORDER BY lon DESC LIMIT 3;

--
-- Change namn of a column
--
SELECT
    avdelning AS 'Avdelning',
    fornamn AS 'Lärare',
    lon AS 'Lön'
FROM larare;
