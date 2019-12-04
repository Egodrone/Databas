--
-- Setup a user, create a database and grant access for the user
-- to the database.
--

-- Create the user 'user' with a backward compatible password algorithm
-- and the password 'pass'
CREATE USER IF NOT EXISTS 'user'@'%'
    IDENTIFIED WITH mysql_native_password
    BY 'pass'
;

-- Grant the user all privilegies on the database.
GRANT ALL PRIVILEGES
    ON dbwebb.*
    TO 'user'@'%'
;

-- Create the database 'dbwebb', but only if it does not exists.
CREATE DATABASE IF NOT EXISTS dbwebb;