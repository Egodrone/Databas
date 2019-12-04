SELECT (SELECT 'moped') AS 'Fordon';

SELECT
    akronym 
FROM larare
WHERE
    avdelning = 'DIDD'
;

SELECT
    *
FROM kurstillfalle
;

SELECT
    *
FROM kurstillfalle
WHERE
    kursansvarig IN (
        SELECT
            akronym 
        FROM larare
        WHERE
            avdelning = 'DIDD'
    )
;

(
    SELECT akronym, avdelning FROM larare WHERE avdelning = 'DIDD'
)
UNION
(
    SELECT akronym, avdelning FROM larare WHERE avdelning = 'DIPT'
)
;

-- Visa detaljer om den lärare som är äldst. 
-- Ta fram max ålder med en subquery och använd dess resultat i WHERE-satsen.
SELECT
    akronym,
    fornamn,
    efternamn,
    Ålder
FROM v_larare
WHERE
    Ålder IN (
        SELECT
            Ålder 
        FROM v_larare
        WHERE
            Ålder = (SELECT MAX(ÅLDER) FROM v_larare)
    )
;
