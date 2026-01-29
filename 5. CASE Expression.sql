/*
CASE - EXPRESSION
- NOTES-
A CASE expressions is very common where if we want to create column based on a condition 
A CASE expression in SQL is a way to apply conditional logic within SQL queries.

SELECT
    CASE
        WHEN column_name = 'Value1' THEN 'Description for Value1'
        WHEN column_name = 'Value2' THEN 'Description for Value2'
        ELSE 'Other'
    END AS column_description
FROM
    table_name;
--iN THIS EXAMPLE CASE EXPRESSIONS IS USED WITH SELECT STATEMENT, BUT YOU CAN USED IT WITH OTHER THINGS, SUCH AS WHERE OR EVEN GROUP BY 



* CASE: begins the expression.

* WHEN: specifies the condition to look at.

* THEN: what to do when the condition is true.

* ELSE: (optional) provides output if none of the WHEN conditions are meet.

* END: concludes the case expression.

*/
/* Let´s look at a condition where we would maybe want to reclassify where a job is localted at,
and for this we need to look at the job location column
*/

SELECT
    job_title_short,
    job_location
FROM
    job_postings_fact;

/*
-New Scenario-
Label (VERB- assign to a category, especially inaccurately or restrictively.) new column as follows:
- 'Anywhere' jobs as 'Remote'
- 'New York, NY' jobs as 'Local'
- Otherwise (Else) 'Onsite'
*/

SELECT
    job_title_short,
    job_location,
    CASE
        WHEN job_location ='Anywhere' THEN 'Remote'
        WHEN job_location = 'New York, NY' THEN 'Local'
        ELSE 'Onsite'
    END AS location_category
FROM
    job_postings_fact;

/*
Now for analysis standpoint, we want to dive into this further,
we want to analyze how many jobs, we can apply to specfically the local ones
and the remote ones, also look at the onsites well.

So we can use something like the GROUP BY function, in order to aggregate all these
different values   
*/

SELECT
    COUNT(job_id) AS number_of_jobs,
    CASE
        WHEN job_location ='Anywhere' THEN 'Remote'
        WHEN job_location = 'New York, NY' THEN 'Local'
        ELSE 'Onsite'
    END AS location_category
FROM
    job_postings_fact
GROUP BY
    location_category;

/* 
If you recall specifially care about the data analyst jobs, 
so we´ll specify a filter for WHERE. 
*/
SELECT
    COUNT(job_id) AS number_of_jobs,
    CASE
        WHEN job_location ='Anywhere' THEN 'Remote'
        WHEN job_location = 'New York, NY' THEN 'Local'
        ELSE 'Onsite'
    END AS location_category
FROM
    job_postings_fact
WHERE
    job_title_short = 'Data Analyst'
GROUP BY
    location_category;
