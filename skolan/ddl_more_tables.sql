SET NAMES 'utf8';
DROP TABLE IF EXISTS kurstillfalle;
DROP TABLE IF EXISTS kurs;
-- DROP TABLE IF EXISTS kurs;

CREATE TABLE kurs
(
    kod CHAR(6) PRIMARY KEY NOT NULL,
    namn VARCHAR(40),
    poang FLOAT,
    niva CHAR(3)
);

-- DROP TABLE IF EXISTS kurstillfalle;
CREATE TABLE kurstillfalle
(
    -- id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    id INT AUTO_INCREMENT,
    kurskod CHAR(6) NOT NULL,
    kursansvarig CHAR(3) NOT NULL,
    lasperiod INT NOT NULL,
    
    PRIMARY KEY (id),
    FOREIGN KEY (kurskod) REFERENCES kurs(kod),
    FOREIGN KEY (kursansvarig) REFERENCES larare(akronym)
);



DROP TABLE IF EXISTS t1;
DROP TABLE IF EXISTS t2;
--
-- Ange teckenkodning för en tabell
--
CREATE TABLE t1 (i INT) CHARSET utf8 COLLATE utf8_swedish_ci;
CREATE TABLE t2 (
    i INT
)
ENGINE INNODB
CHARSET utf8
COLLATE utf8_swedish_ci
;



--
-- Update table larare and larare_pre to use same charset
-- and collation.
--
-- ALTER TABLE larare CONVERT TO CHARSET utf8 COLLATE utf8_swedish_ci;
ALTER TABLE larare_pre CONVERT TO CHARSET utf8 COLLATE utf8_swedish_ci;
SHOW CREATE TABLE kurs;
-- SHOW CREATE TABLE kurstillfalle \G;
SHOW CREATE TABLE kurstillfalle;
