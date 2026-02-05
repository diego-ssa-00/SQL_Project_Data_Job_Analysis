--Question to answer--
/*
* What skills are required for the top - paying data analyst jobs?
- Use the top 10 highest-paying Data Analyst jobs from the first query.
- Add the specific skills required for theese roles.
- Why? It provides a detailed look at which high-paying jobs demand certain skills, helping job seekers for understand which skills to develop that align to the top salaries.
 */
SELECT
    job_id,
    job_title, 
    job_location, -- This column can be removed for this query (it´s not important for this exrecise)
    job_schedule_type, -- This column can be removed for this query (it´s not important for this exrecise)
    salary_year_avg, 
    job_posted_date, -- This column can be removed for this query (it´s not important for this exrecise)
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


/* Removed the columns and USE CTE (Common Table Expressions)  */
WITH top_paying_jobs AS (  -- We specify this as top_paying_jobs result set

    SELECT
        job_id,
        job_title, 
        salary_year_avg,  
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
)

SELECT*
FROM top_paying_jobs


/*
If you recall the diagram of the actual database itself, that can updated in GITHUB, we must going to connect thse two tables
(skills_job_dim and skills_dim), because one of them (skills_dim) have the name of the skills inside of it.
We are going to use the INNER JOIN method
*/
WITH top_paying_jobs AS (  -- We specify this as top_paying_jobs result set

    SELECT
        job_id,
        job_title, 
        salary_year_avg,  
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
)

SELECT
    top_paying_jobs.*, -- It will give all the columns from top_paying_jobs 
    skills -- I want the skills from the skils_dim table
FROM top_paying_jobs
INNER JOIN skills_job_dim ON top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim. skill_id -- Addtionally We want to do join our skills_dim table connecting both of these on their skill ID column
ORDER BY   
    salary_year_avg DESC