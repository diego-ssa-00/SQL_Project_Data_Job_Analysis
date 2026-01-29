/*
Union Operators 
The last major topic in the advanced section on UNIONS, this is very important to combining tables.
It´s directly if you will opposite of how We´re doing joins.
Combine result set of two or more SELECT statements into a a single result set.
* UNION: Remove duplicate rows
* UNION ALL: Includes all duplicate rows

NOTE: Each SELECT statement within the UNION must have the same number of columns in the result sets with similar data types.

So, joins are used in the case whenever we want to combine tables that maybe relate on a single value such as in the case of combining 
like the job_postings_fact table with the company_dim table. We ´re combing this on the company_id column (column that belong of both tables) column.
 
*/

-- Remember previously that We create three tables for those jobs postings in january, february and march. 
SELECT*
FROM january_jobs;

SELECT*
FROM february_jobs;

SELECT*
FROM march_jobs;

/* These tables (January, Febrerary and March jobs) has the same columns. So in this case If we wanted to combine these basically rowwise, We could use a union operator to do this.

UNION 
- NOTES:
* UNION - Combines results from two or more SELECT statements.
* They need to have the same amount of columns, and the data type must match.

SELECT column_name
FROM table_one

UNION --Combine the two tables

SELECT column_name
FROM table_two;

* Gets rid ( take action so as to be free of (troublesome or unwanted person or thing, do away with, throw away, throw out)) of duplicate rows (unlike UNION ALL).
* All rows are unique.
*/


/*So lets We star with this simple query, We want to look into seeing all different job titles and company IDs and job locations for the month of january. */

-- Get jobs and companies from January
SELECT
    job_title_short,
    company_id,
    job_location
FROM
    january_jobs

-- so now let´s actually join this (january_ jobs - table) with our february jobs table.

UNION -- First We must to specify UNION, then We ´re going to do another SELECT statement for the February jobs.

-- Get jobs and companies from February
SELECT
    job_title_short,
    company_id,
    job_location
FROM
    february_jobs -- We will making sure that we have the exact same of columns listed as January jobs.


UNION

SELECT 
    job_title_short,
    company_id,
    job_location
FROM
    march_jobs -- We will making sure that we have the exact same of columns listed as January jobs and February_jobs.


/*  
UNION ALL
-NOTES-
* UNION ALL - Combine the result of two or more SELECT statements.
* They need to have the same amount of columns, and the data type must match

SELECT column_name
FROM table_one

UNION ALL -- combine the two tables

SELECT column_name
FROM table_two

* Returns all rows, even duplicates (unlike UNION)
  * Personal Note: I mostly use this combine two tables together
*/

--Note: Using UNION ALL We should be getting back more values
SELECT
    job_title_short,
    company_id,
    job_location
FROM
    january_jobs

-- so now let´s actually join this (january_ jobs - table) with our february jobs table.

UNION ALL -- First We must to specify UNION, then We ´re going to do another SELECT statement for the February jobs.

-- Get jobs and companies from February
SELECT
    job_title_short,
    company_id,
    job_location
FROM
    february_jobs -- We will making sure that we have the exact same of columns listed as January jobs.


UNION ALL

SELECT 
    job_title_short,
    company_id,
    job_location
FROM
    march_jobs -- We will making sure that we have the exact same of columns listed as January jobs and February_jobs.