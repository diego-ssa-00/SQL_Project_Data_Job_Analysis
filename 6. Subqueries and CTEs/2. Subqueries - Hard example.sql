/*So let´s jump into some harder practice problems for each of these.
 First one, We ´re going to focus on is SUBQUERY 
 
 SUBQUERY 
 - NOTES

 * Subquery: query within another query.
 

 * It can be used in several places in the main query.
    * Such as the SELECT, FROM, WHERE, or HAVING CLAUSES.
 

 * It´s executed first, and the results are passed to the outer query.
    * It is used when you want to perform a calculation before the main query can complete its calculation. 
    
    EXAMPLE DEVELOPMENT 
    We wanted to get a list of companies that are offering jobs that don´t have any requirements for a degree.
    
    Currently in our column of job_no_degree_mention, we have a true or false value, and this says whether a degrees is going to be required or mentioned in the jobs_postings_fact,
    it´s located inside job_postings_fact table.  
    */
    
SELECT
    company_id,
    job_no_degree_mention
FROM
    job_postings_fact
WHERE
    job_no_degree_mention = true 

/*
So, I am pulling company IDs and then the job_no_degree_mention and for this all are going to be true.

Now, If you remember back from our diagram of the tables going here (job_postings_fact, skills_job_dim, company_dim and skills_dim (connected with skills_job_dim through skill_id column)),
We have that job_postings_fact table itself that has whether a degree is mentioned or not, and we have that company_id. However, we don´t have the company name in this (job_postings_fact - TABLE),
that´s in a separate table (company_dim), but can related and managed because both table (job_postings_fact and company_dim) have the same column (company_id).

So that´s why actually in this case the subquery is going to be so powerful, because we´re can to run a subquery to the jobs that have the associated company_id for
no degree mention (job_no_degree_mention) and then from there FILTER inside of the company_dim table.

In this case realistically the column of job_no_degree_mention belong to the subquery is not even necessary, So I am actually going to clean it out*/

SELECT 
    name AS company_name
FROM 
    company_dim
WHERE company_id IN (
    SELECT
        company_id
    FROM
        job_postings_fact
    WHERE
        job_no_degree_mention = true
)

/*
Just want to show this further that we are actually getting with the right data
*/

SELECT 
    company_id,
    name AS company_name
FROM 
    company_dim
WHERE company_id IN (
    SELECT
        company_id
    FROM
        job_postings_fact
    WHERE
        job_no_degree_mention = true
    ORDER BY
        company_id
)