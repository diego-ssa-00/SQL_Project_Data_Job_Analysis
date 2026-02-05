--Question to answer--
/*
* What are the top paying data analyst jobs?
- Identify the top 10 highest - paying Data Analyst roles that are available remotely.
- Focus on job postings with specified salaries (remove nulls).
- Why? Highlight the top-paying opportunities for Data Analysts, offering insights into our final problem question and answer that We´re going to get into finding the most optimal skills and most optimal roles to pursuing as a Data Analyst.
*/
SELECT
    job_id,
    job_title,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date
FROM
    job_postings_fact
WHERE
    job_title_short = 'Data Analyst' AND
    job_location = 'Anywhere' AND
    salary_year_avg IS NOT NULL
ORDER BY
    salary_year_avg DESC --NOTE: When you use the command 'ORDER BY', it will start by default order, that is ASC (ASCENDING), So in the case that you want to change, you must put DESC (DESCENDING).
LIMIT
    10


/*If you want to know the names of the company that offers these job, you must include LEFT JOIN */
SELECT
    job_id,
    job_title,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date,
    name AS company_name --'name' is a column that belong to the company_dim table, that you can select because you used the LEFT JOIN command and connect these two table (job_postings_fact and company_dim) throught the key column (company_id)
FROM
    job_postings_fact
LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE
    job_title_short = 'Data Analyst' AND
    job_location = 'Anywhere' AND
    salary_year_avg IS NOT NULL
ORDER BY
    salary_year_avg DESC --NOTE: When you use the command 'ORDER BY', it will start by default order, that is ASC (ASCENDING), So in the case that you want to change, you must put DESC (DESCENDING).
LIMIT
    10

