--
-- Create scheme for database skolan.
-- By Egodrone for course databas!
-- 2019-01-20
-- 



--
-- Create table: larare
--
DROP TABLE IF EXISTS larare;
CREATE TABLE larare
(
    akronym CHAR(3),
    avdelning CHAR(4),
    fornamn VARCHAR(20),
    efternamn VARCHAR(20),
    kon CHAR(1),
    lon INT,
    fodd DATE,

    PRIMARY KEY (akronym)
);

-- SHOW TABLES;
-- SELECT * FROM larare;
