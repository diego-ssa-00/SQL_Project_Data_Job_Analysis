/*
CTEs - Common Table Expression
-NOTES-
* CTE - A temporary result set that you can reference within a SELECT, INSERT, UPDATE OR DELETE statement.
* Exist ONLY during the execution of a query.
* It´s a defined query that can be referenced in the main query or other CTEs.
* WITH - used to define CTE at the beginning of a query.

WITH january_jobs AS ( -- CTE definition starts here
    SELECT*
    FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 1 
) -- CTE definition ends here

SELECT*
FROM january_jobs;
 

So let´s actually work a problem to see how CTE´s are used.
Find the companies that have the most job openings.
- Get the total number of jobs postings per company id (job_posting_fact).
- Return the total number of jobs with the company name (company name is the column name of company_dim). 

So, We´re going to be finding the companies with the most jobs openings, Now we need to break this up into two parts and that´s
why CTE´S are perfect for this, because first we get the need to get the total number of job postings per company id (which is located inside of our table of job_postings_fact),
but then once we have this total number, we then need to combine it with the company name (which is inside of our table company_dim, is a column).
*/

SELECT --Query Note: This displays multiple numbers because each company has multiple jobs postings (i.e., these are not duplicates)
    company_id
FROM
    job_postings_fact



/*Now we need to go into actually aggregating it. */
SELECT
    company_id,
    COUNT(*)
FROM
    job_postings_fact
GROUP BY
    company_id   -- the total number of jobs postings per company id (job_posting_fact). DONE
                 -- This is the core statement that We ´re going to be using inside of our CTE.



/**We ´re going to create the CTE (Common Table Expression)*/
WITH company_job_count AS(  --We create a new table and We gave new table name ('company_job_count').
SELECT
    company_id,
    COUNT(*)
FROM
    job_postings_fact
GROUP BY
    company_id
)

SELECT*
FROM company_job_count
/* We had before now it´s just through that temporary result set. */


/*If you refresher on the schema we have that job_postings_fact that is connected to our company dim table, using
a company_id. So we need to use a join method in order to combine these two tables together.

To combine these two tables, we´re going to be using 'A' left join (A circle) and for this we want to use our A table (make sure, that we have everything from it
as the company_dim table), because maybe be some companies that don´t necessarily have jobs_postings, that We aggregated from the B table. 
So, we want everything to be listed there, so way if there isn´t a zero asssociated with it that there´s no job postings.

So as you guessed, the B (job_postings_fact) is going to be the fact table that we´re going to be combining to this (company_dim, table A). And A is going to be a company_dim table*/
/* Fact table in this exercise will be job_postings_fact*/


/* So let´s start simple with this basic query*/

SELECT name
FROM company_dim


/*So now that we have this let´s actually move into joining this(left jpin)*/

WITH company_job_count AS( 
SELECT
    company_id,
    COUNT(*)
FROM
    job_postings_fact
GROUP BY
    company_id
)

SELECT name
FROM company_dim
LEFT JOIN company_job_count ON company_job_count.company_id = company_dim.company_id


/* If you remember we want to get the total number of job postings per company id and have the basically associated with a company name. */ 

WITH company_job_count AS( 
SELECT
    company_id,
    COUNT(*) AS total_jobs
FROM
    job_postings_fact
GROUP BY
    company_id
)

SELECT
     company_dim.name AS company_name,
     company_job_count.total_jobs
FROM company_dim
LEFT JOIN company_job_count ON company_job_count.company_id = company_dim.company_id --Return the total number of jobs with the company name (company_dim). DONE

/* We need to order by total_jobs DESC*/

WITH company_job_count AS( 
SELECT
    company_id,
    COUNT(*) AS total_jobs
FROM
    job_postings_fact
GROUP BY
    company_id
)

SELECT
     company_dim.name AS company_name,
     company_job_count.total_jobs
FROM 
    company_dim
LEFT JOIN company_job_count ON company_job_count.company_id = company_dim.company_id 
ORDER BY
    total_jobs DESC
