-- ALTER TABLE larare DROP COLUMN IF EXISTS kompetens;
-- Add column to table
ALTER TABLE larare ADD COLUMN kompetens INT;



-- Remove column from the table
ALTER TABLE larare DROP COLUMN kompetens;



-- Add column to table again
ALTER TABLE larare ADD COLUMN kompetens INT DEFAULT 1 NOT NULL;
SELECT akronym, fornamn, kompetens FROM larare;
SHOW COLUMNS FROM larare;
