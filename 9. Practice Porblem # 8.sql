/*
Find job postings from the first quarter that have a salary greater than $70K
- Combine jobs posting tables from the first quarter of 2023 (Jan-March)
- Gets job postings with an average yearly salary $70,000
*/

/* 
Development: We want to do an analysis of the job postings from the first quarter of 2023, that have salary greater than $70,000. So, when We have those tables already on January, Febreaury and March, 
We ´re going to use our UNION operators to combine those tables and then We´re going to be using it within a subquery to then analyze it, allowing us to thus filter it for those jobs greater than 70,000
and get snapshot of the jobs.
We actually want so anytime, We´re building a subquery or CTE. We will use subquery (preference)
*/

SELECT *
FROM (
SELECT *
FROM january_jobs

UNION ALL

SELECT *
FROM february_jobs

UNION ALL

SELECT *
FROM march_jobs
) AS quarter1_job_postings


/* 
We don´t want all those different columns, so instead what We´re going to do is specify or define the four main columns of interest.
*/   

SELECT 
quarter1_job_postings.job_title_short,
quarter1_job_postings.job_location,
quarter1_job_postings.job_via,
quarter1_job_postings.job_posted_date::DATE --specifically only the date
FROM (
SELECT *
FROM january_jobs

UNION ALL

SELECT *
FROM february_jobs

UNION ALL

SELECT *
FROM march_jobs
) AS quarter1_job_postings

WHERE --We want to find the job postings that average yearly salary must greater than 70,000. 
quarter1_job_postings.salary_year_avg > 70000


/*
We will modify this information mainly in two things, one We want to see the salary and to the job_title_short will be 'Data Analyst'
*/
SELECT 
quarter1_job_postings.job_title_short, -- We can remove this previous table name (quarter1_job_postings), the query will be run without problems. It made the query more concise, is optional.
quarter1_job_postings.job_location,
quarter1_job_postings.job_via,
quarter1_job_postings.job_posted_date::DATE, --specifically only the date
quarter1_job_postings.salary_year_avg
FROM (
SELECT *
FROM january_jobs

UNION ALL

SELECT *
FROM february_jobs

UNION ALL

SELECT *
FROM march_jobs
) AS quarter1_job_postings

WHERE --We want to find the job postings that average yearly salary must greater than 70,000. 
quarter1_job_postings.salary_year_avg > 70000 AND
quarter1_job_postings.job_title_short = 'Data Analyst'

ORDER BY -- We will this list order by the salaries from highest to lowest (DESC)
quarter1_job_postings.salary_year_avg DESC 