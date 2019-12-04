-- CREATE DATABASE eshop;
CREATE DATABASE IF NOT EXISTS eshop;

SHOW DATABASES;

USE eshop;

-- Remove user if exists
DROP USER IF EXISTS 'user'@'%';

-- Skapa användaren med en bakåtkompatibel lösenordsalgoritm.
CREATE USER IF NOT EXISTS 'user'@'%'
IDENTIFIED
WITH mysql_native_password -- MySQL with version > 8.0.4
BY 'pass'
;

-- Ge användaren alla rättigheter på en eshop databas.
GRANT ALL PRIVILEGES
    ON eshop.*
    TO 'user'@'%'
;

SHOW GRANTS FOR 'user'@'%';
