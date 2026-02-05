--Question to Answer--
/*
* What are the most optimal skills to learn (aka it´s a high demand and high-paying skill)?
- Identify skills in high demand and associated with high average salaries for Data Analyst roles.
- Concentrate on remotes positions with specific salaries.
- Why? Targets skills that offer job security (high demand) amd finacial benefits (high salaries), offering strategic insights for career development in data analysis.
- The easiest solution basically to build on the code that We´re already built, is to use a CTE (Common Table Expression) for query#4 and query#3 and combine these two results together, on something like the skill ID. 
*/

/* 
- Combine the code of query#3 and query#4 throught CTE.
- Eliminate the ORDER BY for both codes 
- Change the GROUP BY, We put 'skill_id' because We are connecting these two code through skills_id, but remember We can also connect through skills.
-  We concentrate on remote positions and specified salries, so for this reason We must complete the WHERE command, you will see the modifications in the code.
*/
WITH skills_demand AS (
    SELECT 
        skills_dim.skill_id,
        skills_dim.skills, 
        COUNT(skills_job_dim.job_id) AS demand_count
    FROM  job_postings_fact
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE
        job_title_short = 'Data Analyst' 
        AND job_work_from_home = 'True' 
        AND salary_year_avg IS NOT NULL 
    GROUP BY 
        skills_dim.skill_id
), average_salary AS (
    SELECT 
        skills_job_dim.skill_id, 
        ROUND(AVG(salary_year_avg),0) AS avg_salary
    FROM  
        job_postings_fact
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE
        job_title_short = 'Data Analyst' 
        AND salary_year_avg IS NOT NULL  
        AND job_work_from_home = 'True'
    GROUP BY 
        skills_job_dim.skill_id
)
    SELECT
        skills_demand.skill_id,
        skills_demand.skills,
        demand_count,
        avg_salary
    FROM
        skills_demand
INNER JOIN average_salary ON skills_demand.skill_id = average_salary.skill_id
    WHERE
        demand_count>10 --We put that demand count must be greater than 10 because exist some demand count that are so low and have high salary. For this reason, We put a border of 10 like minimal. This number (10) is just an arbitrary number. 
                        -- You can´t put an aggregation method inside of WHERE, for this reason if you wan´t to put a arbitrary number, you can use a HAVING keyword, HAVING COUNT(skills_job_dim.job_id) > 10. The result table can be the same, but the HAVING keyword is not arbitrary.
    ORDER BY
        avg_salary DESC, 
        demand_count DESC
    LIMIT 25