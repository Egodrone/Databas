SET NAMES 'utf8';

DROP TABLE IF EXISTS person;
CREATE TABLE person
(
    fornamn VARCHAR(10)
);

INSERT INTO person VALUES
("Örjan"), ("Börje"), ("Bo"), ("Øjvind"),
("Åke"), ("Åkesson"), ("Arne"), ("Ängla"),
("Ægir")
;

SELECT * FROM person;

SELECT * FROM person
ORDER BY fornamn;

SHOW CREATE TABLE person;

SHOW CHARSET LIKE 'latin1';

SHOW COLLATION WHERE Charset = 'latin1';

SHOW CHARSET LIKE 'utf8';

SELECT HEX("©");

ALTER TABLE person CONVERT TO CHARSET utf8 COLLATE utf8_unicode_ci;

SELECT * FROM person
ORDER BY fornamn;

SHOW COLLATION WHERE Charset = 'utf8';

ALTER TABLE person CONVERT TO CHARSET utf8 COLLATE utf8_swedish_ci;

SELECT * FROM person
ORDER BY fornamn;
