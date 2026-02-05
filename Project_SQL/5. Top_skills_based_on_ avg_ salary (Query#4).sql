-- Question to answer--
/*
* What are the top skills based on salary?
- Look at the average salary associated with each skill for Data Analyst positions.
- Focuses on roles with specific salaries, regardless of location.
- Why? It reveals  how differents skills impact salary levels for Data Analyst and helps indentify the most financially rewarding skills to acquire or improve. */

--NOTE: This query is very similar to the last query resolved (query#3), because we need the name of the skills from skills_dim table and also the salary_year_avg from the job_postings_fact table.
--NOTE: Previously query (query#3) we did a count of values of the skills column, but now just need to do an aggregation method, basically doing the average of this average salaries.

--Copy the code of the query#3, because we going to reusable.

SELECT 
    skills,
    ROUND(AVG(salary_year_avg),0) AS avg_salary
FROM  job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst' 
    AND salary_year_avg IS NOT NULL -- Remember that We only focus on roles with specified salaries.
    -- AND job_work_from_home = true (If you want to examine remote location)
GROUP BY -- Remember anytime we do some sort of aggregation we have to a 'GROUP BY' 
    skills
ORDER BY 
    avg_salary DESC
LIMIT 25
/* The results of this code allow us to see that the top skills based on salary are focused , specifically for Data Analyst are on web development tools



/* We are going to compare for remote work */
SELECT 
    skills,
    ROUND(AVG(salary_year_avg),0) AS avg_salary
FROM  job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst' 
    AND salary_year_avg IS NOT NULL -- Remember that We only focus on roles with specified salaries.
    AND job_work_from_home = 'True'-- (If you want to examine remote location)
GROUP BY -- Remember anytime we do some sort of aggregation we have to a 'GROUP BY' 
    skills
ORDER BY 
    avg_salary DESC
LIMIT 25








































































