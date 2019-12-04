SELECT SUM(lon) FROM larare;
SELECT MIN(lon) FROM larare;
SELECT MAX(lon) FROM larare;

SELECT AVG(kompetens) FROM larare;

SELECT
    avdelning,
    AVG(kompetens)
FROM larare
GROUP BY avdelning
;

SELECT avdelning, kompetens, SUM(lon) as Summa
FROM larare
GROUP BY avdelning, kompetens
ORDER BY Summa DESC
;

-- Hur många lärare jobbar på de respektive avdelning?
SELECT avdelning, COUNT(avdelning) as Larare
FROM larare
GROUP BY avdelning
ORDER BY Larare DESC
;

-- Hur mycket betalar respektive avdelning ut i lön varje månad?
SELECT avdelning, SUM(lon) as Summa
FROM larare
GROUP BY avdelning
ORDER BY Summa DESC
;

-- Hur mycket är medellönen för de olika avdelningarna?
SELECT avdelning, AVG(lon) as Medellon
FROM larare
GROUP BY avdelning
ORDER BY Medellon DESC
;

-- Hur mycket är medellönen för kvinnor kontra män?
SELECT avdelning, kompetens, AVG(kompetens) as Kompetens
FROM larare
GROUP BY avdelning, kompetens
ORDER BY Kompetens DESC
;

-- Visa snittet på kompetensen för alla avdelningar, 
-- sortera på kompetens i sjunkande ordning och visa 
-- enbart den avdelning som har högst kompetens.
SELECT
    avdelning,
    AVG(kompetens) as Kompetens
FROM larare
GROUP BY avdelning
ORDER BY Kompetens DESC LIMIT 1
;

-- Agg funkt HAVING

SELECT
    avdelning,
    ROUND(AVG(lon)) AS Snittlon,
    COUNT(lon) AS Antal
FROM larare
GROUP BY
    avdelning
ORDER BY
    avdelning
;

-- Another 

SELECT
    avdelning,
    ROUND(AVG(lon)) AS Snittlon,
    COUNT(lon) AS Antal
FROM larare
GROUP BY
    avdelning
ORDER BY Snittlon DESC
;

-- And another
SELECT
    avdelning,
    ROUND(AVG(lon)) AS Snittlon,
    COUNT(lon) AS Antal
FROM larare
GROUP BY
    avdelning
ORDER BY ROUND(AVG(lon)) DESC
;

-- 1) Vi vill se snittlön per avdelning (och antal), men bara om snittlönen är större än 35000.
SELECT
    avdelning,
    ROUND(AVG(lon)) AS Snittlon,
    COUNT(lon) AS Antal
FROM larare
GROUP BY
    avdelning
HAVING
    Snittlon > 35000
ORDER BY
    Snittlon DESC
;

-- Vi vill se snittlönen per avdelning (och antal), 
-- men bara om det är 3 eller fler personer på den avdelningen.
SELECT
    avdelning,
    ROUND(AVG(lon)) AS Snittlon,
    COUNT(lon) AS Antal
FROM larare
GROUP BY
    avdelning
HAVING
    Antal > 2
ORDER BY
    Snittlon DESC
;

-- Om WHERE kontra HAVING
SELECT
    avdelning,
    ROUND(AVG(lon)) AS Snittlon,
    COUNT(lon) AS Antal
FROM larare
WHERE
    kompetens = 1
GROUP BY
    avdelning
ORDER BY
    avdelning
;


SELECT
    avdelning,
    ROUND(AVG(lon)) AS Snittlon,
    COUNT(lon) AS Antal
FROM larare
WHERE
    kompetens = 1
GROUP BY
    avdelning
HAVING
    Snittlon < 30000
ORDER BY
    avdelning
;

SELECT
    akronym,
    avdelning,
    lon
    FROM larare
    WHERE
        kompetens = 1
	AND avdelning = 'DIPT'
;

-- Uppgifter HAVING
-- 1) Visa per avdelning hur många anställda det finns gruppens snittlön,
-- sortera per avdelning och snittlön.

SELECT
    avdelning,
    ROUND(AVG(lon)) AS Snittlon,
    COUNT(lon) AS Antal
FROM larare
GROUP BY
    avdelning
HAVING
    Snittlon > 0
ORDER BY
    Snittlon DESC
;

-- 2) Visa samma sak som i 1), men visa nu även de kompetenser som finns. 
-- Du behöver gruppera på avdelning och per kompetens, sortera per avdelning och per kompetens.

SELECT
    avdelning,
	kompetens,
    ROUND(AVG(lon)) AS Snittlon,
    COUNT(lon) AS Antal
FROM larare
GROUP BY
    avdelning, kompetens
HAVING
    Snittlon > 0
ORDER BY
    avdelning ASC, kompetens DESC
;

-- 3) Visa samma sak som i 2), men ignorera de kompetenser som är större än 3.

SELECT
    avdelning,
	kompetens,
    ROUND(AVG(lon)) AS Snittlon,
    COUNT(lon) AS Antal
FROM larare
WHERE kompetens < 4
GROUP BY
    avdelning, kompetens
HAVING
    Snittlon > 0
ORDER BY
    avdelning ASC, kompetens DESC
;

-- 4) Visa samma sak som i 3), men exkludera de grupper
-- som har fler än 1 i Antal och snittlön mellan 30 000 - 45 000. Sortera per snittlön.

SELECT
    avdelning,
	kompetens,
    ROUND(AVG(lon)) AS Snittlon,
    COUNT(lon) AS Antal
FROM larare
WHERE kompetens <> 3
GROUP BY
    avdelning, kompetens
HAVING
    Snittlon > 29999 AND Snittlon < 45001
ORDER BY
    Snittlon DESC
;

SELECT akronym, avdelning, fornamn, efternamn, kon, lon, fodd FROM larare;
