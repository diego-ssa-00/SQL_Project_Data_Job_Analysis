/*
UPDATE - BONUS COMMAND
Update allows us to modify the exisitng data within a table
* UPDATE - Used to modify exisitng data in a table
* SET - Specifies the column to be updated and the new value for that column
* WHERE - Filters which rows to update based on a condition
SQL
UPDATE table_name 
SET column_name = 'new value'
WHERE condtion; */
UPDATE job_applied
SET    contact = 'Erlich Bachman'
WHERE  job_id = 1;

UPDATE job_applied
SET    contact = 'Dinesh Chugtai'
WHERE  job_id = 2;

UPDATE job_applied
SET    contact = 'Bertran Gilfoyle'
WHERE  job_id = 3;

UPDATE job_applied
SET    contact = 'Jian Yang'
WHERE  job_id = 4;

UPDATE job_applied
SET    contact = 'Big Head'
WHERE  job_id = 5;

SELECT * 
FROM job_applied