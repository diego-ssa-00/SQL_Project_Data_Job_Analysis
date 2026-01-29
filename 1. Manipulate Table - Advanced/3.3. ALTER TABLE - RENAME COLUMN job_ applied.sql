/*RENAME COLUMN
*RENAME COLUMN - Rename column in an exisitng table
Need: 
Old columns name
New column name
SQL
ALTER NAME table_name
RENAME COLUMN  column_name TO new_name
*/
ALTER TABLE job_applied
RENAME COLUMN contact TO contact_name;

SELECT * 
FROM job_applied