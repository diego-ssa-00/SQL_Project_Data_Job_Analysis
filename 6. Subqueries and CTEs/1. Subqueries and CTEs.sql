/*
- Subqueries & CTEs
Subqueries and Common Table Expressions (CTEs): Used for organizing and simplifying
complex queries.

* Helps break down the query into a smaller, more managable parts.

* When to use one over the other?
- Subqueries are for simpler queries.
- CTEs are for more complex queries.

-NOTE- 
Technically, this is a 'temporary result set' and NOT a 'temporary table' (is not the same).

Now in order to show the power of subqueries and CTEs, is needed that we go back to the previous practice problem (Practice Problem #6)
of creating table for each of the different months 
*/

--January
CREATE TABLE january_jobs AS
    SELECT *
    FROM job_postings_fact
    WHERE EXTRACT (MONTH FROM job_posted_date) = 1;

-- February
CREATE TABLE february_jobs AS 
    SELECT *
    FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 2;

-- March
CREATE TABLE march_jobs AS 
    SELECT *
    FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 3;

--DOUBLE CHECK--

SELECT job_posted_date
FROM march_jobs;

/*

--SUBQUERY--

Nested - Adjective: (Of similar objects of graduated sizes) placed or stored one inisde the other.
Nested in programming means to place one programming construct, such as a loop, conditional statement, or function, inside another of the same or different type.

SUBQUERY: query nested inside a larger query.

* It can be used for simpler queries. 
* It can be used in SELECT, FROM. and WHERE clauses.

-EXAMPLE -
* The example is related with the case that we wanted to create a temporary result set of January jobs, a subquery is a query as you guessed 
it inisde of another query.
 * A subquery is a query as you guessed it inside of another query so in this case we have a SELECT* statement and then FROM and within (),
 we´re specifying that is subquery. In our case we want to select only the jobs where the job postings month (assign in job_posted_date- column) is JANUARY,
 and then we rename this table as January_jobs. 

SELECT*
FROM (--SubQuery starts here
    SELECT*
    FROM job_postings_fact
    WHERE EXTRACT (MONTH FROM job_posted_date) = 1 
) AS january_jobs;
--SubQuery ends here

*/
SELECT*
FROM (--SubQuery starts here
    SELECT*
    FROM job_postings_fact
    WHERE EXTRACT (MONTH FROM job_posted_date) = 1 
) AS january_jobs;
--SubQuery ends here


/*
ANOTHER TEMPORARY RESULT SET 

--COMMON TABLE EXPRESSIONS (CTEs) --

Common Table Expressions (CTEs): Define a temporary result set that you can reference.
* Can reference within a SELECT, INSERT, UPDATE, OR DELETE statement.
* Defined with WITH.  

* In this example, is the other popular way to create a temporary table, are Common Table Expressions (CTEs) and they can be used
in even more locations such as SELECT, INSERT, UPDATE or DELETE. This CTEs are defined using the WITH statement and you saying "WITH THIS NEW TABLE NAME (january_jobs) AND THEN
THE ALIAS 'AS' AND THEN FROM THERE WITHIN A PARENTHESIS WE´RE SPECIFYING THE ENTIRE QUERY THAT WE WANT TO RUN, TO PUT IN THIS NEW TABLE CALLLED january_jobs".  

FROM THERE WE CAN THEN RUN THE NEXT QUERY OF SELECT* FROM january_jobs.

EXMAPLE STRUCTURE:
WITH january_jobs AS (--CTE definition starts here
    SELECT *
    FROM job_postings_fact
    WHERE EXTRACT (MONTH FROM job_posted_date) = 1
)-- CTE definition ends here

SELECT*
FROM january_jobs;

*/


WITH january_jobs AS (--CTE definition starts here
    SELECT*
    FROM job_postings_fact
    WHERE EXTRACT (MONTH FROM job_posted_date) = 1
) --CTE definition ends here

SELECT*
FROM january_jobs;