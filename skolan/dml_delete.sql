--
-- Delete from database skolan.
-- By Egodrone for course databas.
-- 2019-01-25
-- 

-- Välj vilken databas du vill använda
USE skolan;

--
-- Delete rows from table
--
DELETE FROM larare WHERE fornamn = 'Hagrid';
DELETE FROM larare WHERE avdelning = 'DIPT';
DELETE FROM larare WHERE lon > 1
LIMIT 2;
DELETE FROM larare WHERE LENGTH("fornamn") > 0;
SELECT akronym, avdelning, fornamn, efternamn, kon, lon, fodd FROM larare;
