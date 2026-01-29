/* 
PRACTICE PROBLEM 6 
Create tables from other tables

* Create three tables:
- Jan 2023 jobs 
- Feb 2023 jobs 
- Mar 2023 jobs

* Foreshadowing: This will be used in another practice problem below.

* Hints: 
- Use CREATE TABLE table_name AS - syntax to create your table.
- Look at way to filter out only specific months (EXTRACT).
 
*/

/*

-- DEVELOPMENT-- 
We will start the query with the basics elements. 

*/
SELECT *
FROM job_postings_fact
LIMIT 10;

/* Once that  you make run the query, we must focus on the job_posted_date,
   because we want to make tables for every single month or at least the first
   three months, January, Febraury and March.

   So, we will start filtering the job_posted_date column and only get values that have
   January month in it. 
   
   -NOTE-
   We need to specify what this condiction actually meets of extract month from job_posted_date,
   in our case when it equals 1, because represent the first month of the year (january).
   */

SELECT *
FROM job_postings_fact
WHERE EXTRACT (MONTH FROM job_posted_date) = 1
LIMIT 10;

/* 
The next thing that We must to do use a statement of CREATE TABLE, and specify the name of this table,
so in their case is january_jobs and then We´ll use the AS, to assign this

NOTE: This is Jnuary, but We need to make the same thing to get the Febraury and March.
So, We need to copy all the query, and then We must to go into any AI assistant, in this case We´re using
chat GPT, specifically the chatbot for this course (SQL Query Assistant) - https://chatgpt.com/g/g-OWCUY5aNQ-sql-query-assistant
*/
--Jamuary
CREATE TABLE january_jobs AS
    SELECT *
    FROM job_postings_fact
    WHERE EXTRACT (MONTH FROM job_posted_date) = 1;

-- February
CREATE TABLE february_jobs AS 
    SELECT *
    FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 2;

-- March
CREATE TABLE march_jobs AS 
    SELECT *
    FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 3;

--DOUBLE CHECK--

SELECT job_posted_date
FROM march_jobs;