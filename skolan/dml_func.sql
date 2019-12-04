-- 1) Skriv en SELECT-sats som skriver ut förnamn + efternamn + avdelning 
-- i samma kolumn enligt följande struktur: förnamn efternamn (avdelning). 
-- (Tips: Att slå ihop strängar kallas att konkatenera/concatenate).
SELECT
    CONCAT(fornamn, " ", efternamn, " ", avdelning) AS NamnAvdelning
FROM larare;

-- 2) Gör om samma sak men skriv ut avdelningens 
-- namn med små bokstäver och begränsa utskriften till 3 rader.
SELECT
    CONCAT(fornamn, " ", efternamn, " ", "(", LOWER(avdelning), ")") AS NamnAvdelning
FROM larare
LIMIT 3;

-- 1) Skriv en SELECT-sats som endast visar dagens datum.
SELECT CURDATE() today;

-- 2) Gör en SELECT-sats som visar samtliga lärare, 
-- deras födelseår samt dagens datum och klockslag.
SELECT
    fornamn,
    fodd,
    CURDATE() AS DagensDatum,
    CURRENT_TIME() Klockslag
FROM larare;

-- Beräkna ålder
-- 1) Skriv en SELECT-sats som beräknar lärarens ålder,
-- sortera rapporten för att visa vem som är äldst och yngst.

SELECT
    fornamn,
    fodd,
    ROUND(DATEDIFF(CURRENT_DATE(), fodd)/365) AS Ålder
FROM larare
ORDER BY
    Ålder DESC
;

SELECT
    fornamn,
    fodd,
    MONTHNAME(fodd) AS 'Månad'
FROM larare;

SELECT
    fornamn,
    fodd,
    MONTHNAME(fodd) AS 'Månad'
FROM larare
WHERE MONTH(fodd) = 5;

-- 1) Visa de lärare som är födda på 40-talet.
SELECT
    fornamn,
    fodd,
    YEAR(fodd) AS 'year'
FROM larare
WHERE YEAR(fodd) > 1939 AND YEAR(fodd) < 1950
ORDER BY
    fodd DESC;
