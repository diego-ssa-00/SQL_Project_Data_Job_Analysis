/*

EXTRACT
- NOTES:
* EXTRACT - GETS FILED (e.g., year, month, day) from a date/time value.

* EXAMPLE
SELECT 
    EXTRACT(MONTH FROM column_name) AS column_month
FROM
    table_name
    
*/

SELECT
    job_title_short AS title,
    job_location AS location,
    job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'EST' AS date_time,
    EXTRACT (MONTH FROM job_posted_date) AS date_month,
    EXTRACT (YEAR FROM job_posted_date) AS date_year
FROM    
    job_postings_fact
LIMIT 5;

/*
data_time, date_month and date_year are three columns, that we created after apply the date functions
(AT TIME ZONE AND EXTRACT).
*/


/* How tha date function actually is useful for?
   Well when we actually use this something like this, in combination with
   something like the GROUP BY function, We can do larger trend analysis 
   with SQL, specifically if we want to look at how jobs postings are trending 
   from month to month.
*/

SELECT
    job_id,
    EXTRACT(MONTH FROM job_posted_date) AS month
FROM
    job_postings_fact
LIMIT 5;

/* 
Now, I want to aggregate it, so I want to do a count of these differents job IDs
   for each month.
*/

SELECT
    COUNT(job_id),
    EXTRACT(MONTH FROM job_posted_date) AS month
FROM
    job_postings_fact
GROUP BY
    month;

/*
Now personally I only really care about data analyst roles,

*/

SELECT
    COUNT(job_id) AS job_posted_count,
    EXTRACT(MONTH FROM job_posted_date) AS month
FROM
    job_postings_fact
WHERE
    job_title_short = 'Data Analyst'
    
GROUP BY
    month
ORDER BY
    job_posted_count DESC;