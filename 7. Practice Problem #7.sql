/* Practice Problem 7 * /

/*
Find the count of the number of remote job postings per skill.
- Display the top 5 skills by their demand in remote jobs.
- Include skill ID, name, and count of postings requiring the skills.
*/

/* How are we going to tackle this, well remember that job_postings_fact table has all of our different job postings, 
   but it doesn´t have necessarily all the different skills in here. Instead We have to use that skills_job_dim table,
   to get the all different correlated jobs skills and then our final skills dimensional table (skills_dim) that includes
   the name of those skills. 
   
   So, the first thing that We´re going to do is build a CTE´s that basically collects the number of jobs postings per skills,
   so We´re going to have some sort of join between our job_postings_fact table and our skills_job_dim table.
   
   Once We have this temporary result set, We can then take this step further and then combine it with our skills_dim table, to actually give us
   final results that have the skills name in it.

   For all the joins within this portion, We´re  trying to get a count of jobs that actually exist. We don´t necessarily care about if there´s values don´t exist,
   so for this We´re going to find that inner join, that is the best method to use for this.
   */

/*So, let´s start with the very basics and then build upon there for the CTE´s.
We just want to look the skill_id column from the skills_job_dim table(that We´re going to just conveniently rename 'skills_to_job'), which We´re going to just conveniently
rename skills_to_job
*/
SELECT
    skill_id
FROM
    skills_job_dim AS skills_to_job


/*All right so We´re already seeing repeats in here, so We´re going to go ahead and just actually showcase the job_id column as well.*/
SELECT
    job_id,
    skill_id
FROM
    skills_job_dim AS skills_to_job --This one has so for the job _id let´s say is zero, which is one of the job_id. So, it has the skill_id assoiated of it, of zero and one (it´s not repeated or error, is correct; which means that multiple skills are associated with this job_id (0)).
                                    -- So there´s multiple skills associated with this job

/*
So let´s go ahead and actually join this on our job postings fact table, since that we know that they ´re correlated through that job_id column.
So, the first thing that We do is specify INNER JOIN after that FROM statement. We´re going to rename the job_postings_fact table as job_postings 
From there We´re going to specify how we´re going to connect this, and we´re connecting it on the job_id*/
SELECT
    job_postings.job_id, -- This was changed, because the job_id was ambiguous. So We need to specify right because it´s both of the 'skills_to_job" and 'job_postings' have the '.jpb_id', We added 'job_postings'.
    skill_id
FROM
    skills_job_dim AS skills_to_job
INNER JOIN job_postings_fact AS job_postings  ON job_postings.job_id = skills_to_job.job_id


/*
But if you recall we want to look at or filter for the jobs that have work from home as true or remote jobs*/ 
SELECT
    job_postings.job_id,   
    skill_id,
    job_postings.job_work_from_home ---- The first thing that We do is just add to the select statement to actually see it
FROM
    skills_job_dim AS skills_to_job
INNER JOIN job_postings_fact AS job_postings  ON job_postings.job_id = skills_to_job.job_id


/*So let´s actually now define that WHERE to meet this portion of the question remote jobs and We want to specify where jobs_postings of job_work_from_home is equal to TRUE. */
SELECT
    job_postings.job_id,   -- The first thing that We do is just add to the select statement to actually see it
    skill_id,
    job_postings.job_work_from_home -- We don´t need this column anymore, so we can delete it.
FROM
    skills_job_dim AS skills_to_job
INNER JOIN job_postings_fact AS job_postings  ON job_postings.job_id = skills_to_job.job_id
WHERE
    job_postings.job_work_from_home = True 


/*Delete the line*/
SELECT
                 -- Is no longer useful, so you can delete job_postings.job_id,
    skill_id,
    COUNT (*) AS skill_count --We want to get the count of the number of remote jobs postings per skill 
FROM
    skills_job_dim AS skills_to_job
INNER JOIN job_postings_fact AS job_postings  ON job_postings.job_id = skills_to_job.job_id
WHERE
    job_postings.job_work_from_home = True 
GROUP BY
    skill_id


/* CTE´s build much pretty*/
WITH remote_job_skills AS (
SELECT
                 -- Is no longer useful, so you can delete job_postings.job_id,
    skill_id,
    COUNT (*) AS skill_count --We want to get the count of the number of remote jobs postings per skill 
FROM
    skills_job_dim AS skills_to_job
INNER JOIN job_postings_fact AS job_postings  ON job_postings.job_id = skills_to_job.job_id
WHERE
    job_postings.job_work_from_home = True 
GROUP BY
    skill_id
)
SELECT *
FROM remote_job_skills


/* Move into actually doing that INNER JOIN with the skills_dim table*/
WITH remote_job_skills AS (
    SELECT
                 -- Is no longer useful, so you can delete job_postings.job_id,
        skill_id,
        COUNT (*) AS skill_count --We want to get the count of the number of remote jobs postings per skill 
    FROM
        skills_job_dim AS skills_to_job
    INNER JOIN job_postings_fact AS job_postings  ON job_postings.job_id = skills_to_job.job_id
    WHERE
        job_postings.job_work_from_home = True 
GROUP BY
    skill_id
)
SELECT 
    skills.skill_id, -- We need to specify the columns that We want for this
    skills AS skill_name, -- Next We want the skill name with that defined, we need to now have the most important value skill count
    skill_count
FROM
    remote_job_skills
INNER JOIN skills_dim AS skills ON skills.skill_id = remote_job_skills.skill_id
ORDER BY 
    skill_count DESC
LIMIT 5;


/* We´re going to throw one simple caveat to this question, because frankly We really care about "Data Analysis jobs".
   So, We´re going to filter our CTE´s further for data analysis jobs. */
   WITH remote_job_skills AS (
    SELECT
                 -- Is no longer useful, so you can delete job_postings.job_id,
        skill_id,
        COUNT (*) AS skill_count --We want to get the count of the number of remote jobs postings per skill 
    FROM
        skills_job_dim AS skills_to_job
    INNER JOIN job_postings_fact AS job_postings  ON job_postings.job_id = skills_to_job.job_id
    WHERE
        job_postings.job_work_from_home = True AND 
        job_postings.job_title_short = 'Data Analyst'
GROUP BY
    skill_id
)
SELECT 
    skills.skill_id, -- We need to specify the columns that We want for this
    skills AS skill_name, -- Next We want the skill name with that defined, we need to now have the most important value skill count
    skill_count
FROM
    remote_job_skills
INNER JOIN skills_dim AS skills ON skills.skill_id = remote_job_skills.skill_id
ORDER BY 
    skill_count DESC
LIMIT 5;