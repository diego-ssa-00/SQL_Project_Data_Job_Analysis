/* This query contain the same exercise of the another query called 'Pratice problem #7.sql' both of them have the same purpose, but the difference between both consist that this query is more shorter, more accurate. The other have a bigger written, but both of them are the same. */
-- Question to answer--
/*
* What are the most in demand- skills for data analysts?
- Join job postings to INNER JOIN table similar to query 2.
- Identify the top 5 in demand-skills for data analyst.
- Focus on all job postings (not only remotes job).
- Why? Retrieves the top 5 skills with highest demand in the job market, providing insights into the most valuable skills for job seekers.
*/

SELECT *
FROM  job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
LIMIT 5

/* Remember We´re trying to find, what are the most in demands skills?. Basically We´re going to find an aggregation of the sum of the skills, for this reason We´re going to need to provide a COUNT in order to find out. How many SQL entreis are?, How many phython?...   */
SELECT 
    skills,
    COUNT(skills_job_dim.job_id) AS demand_count
FROM  job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst' AND
    job_work_from_home = 'True' -- If you want to compare the reslts basing that job postings are in the remote location
GROUP BY -- Remember anytime we do some sort of aggregation we have to a 'GROUP BY' 
    skills
ORDER BY --Order by a demand_count descendant 
    demand_count DESC
LIMIT 5

-- In  general the trend is the same. Looks very similar because is in the same proportion. 