SELECT
    SUM(lon) AS Lönesumma,
    SUM(kompetens) AS Kompetens 
FROM larare
;
SELECT
    SUM(lon*0.064) AS lönepotten
FROM larare
;

-- Display old table
SELECT akronym, avdelning, fornamn, kon, lon, kompetens
FROM larare
ORDER BY lon DESC;

UPDATE larare SET lon = 85000 WHERE fornamn = 'Albus';
UPDATE larare SET kompetens = 7 WHERE fornamn = 'Albus';
UPDATE larare SET lon = lon + 4000 WHERE fornamn = 'Minerva';
UPDATE larare SET lon = lon + 2000 WHERE fornamn = 'Argus';
UPDATE larare SET kompetens = 3 WHERE fornamn = 'Argus';
UPDATE larare
    SET
        lon = lon - 3000
    WHERE
        fornamn IN ('Gyllenroy', 'Alastor')
;
UPDATE larare
    SET
        lon = lon * 1.02
    WHERE
        avdelning IN ('DIDD')
;
UPDATE larare
    SET
        lon = lon * 1.03
    WHERE
        kon IN ('K')
	AND
        lon < 40000
;

UPDATE larare
    SET
        lon = lon + 5000
    WHERE
        fornamn IN ('Severus', 'Minerva', 'Hagrid')
;
UPDATE larare
    SET
        kompetens = kompetens + 1
    WHERE
        fornamn IN ('Severus', 'Minerva', 'Hagrid')
;
UPDATE larare
    SET
        lon = lon*1.022
    WHERE
        fornamn NOT IN ('Albus', 'Severus', 'Minerva', 'Hagrid')
;
-- Display new table
SELECT akronym, avdelning, fornamn, kon, lon, kompetens
FROM larare
ORDER BY lon DESC;

-- New total sum of all payments
SELECT
    SUM(lon) AS Lönesumma,
    SUM(kompetens) AS Kompetens 
FROM larare
;

SELECT
    (100/305000)*(SUM(lon)-305000) AS LönesummaChange
FROM larare
;
SELECT
    SUM(kompetens) AS Kompetens
FROM larare
;
-- (100/305000)*SUM((100/305000)*(lon-305000)) AS Lönesumma
SELECT akronym, avdelning, fornamn, kon, lon, kompetens
FROM larare
ORDER BY lon DESC
;
SELECT
    SUM(lon) AS Lönesumma,
    SUM(kompetens) AS Kompetens 
FROM larare
;
SELECT
    SUM(lon) AS Lönesumma,
    SUM(kompetens) AS Kompetens 
FROM larare
;