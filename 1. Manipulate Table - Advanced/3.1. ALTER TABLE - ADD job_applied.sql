/* ALTER TABLE
ALTER TABLE- Used to select the table that you will add, delete, or modify columns in 
Similar to using FROM to specify a table for querying 
SQL
ALTER TABLE table_name
--ADD COLUMN
--RENAME COLUMN
--ALTER COLUMN
--DROP COLUMN*/
ALTER TABLE job_applied
ADD contact VARCHAR(50);

SELECT *
FROM job_applied
