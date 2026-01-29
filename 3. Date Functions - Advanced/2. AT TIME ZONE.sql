/* AT TIME ZONE
*NOTES
-AT TIME ZONE: Converts timestamps between different zones.
- It can be used on timestamps with or time zone information.


- Recall:

* TIMESTAMP 
- A specfic date and time without timezone: 2024-02-05 15:04:05
- Format : YYYY-MM-DD HH:MI:SS

*TIMESTAMP WITH TIME ZONE
- A specfic date and time with zone information: 2024-02-06 15:04:05+00:00
- Similar to TIMESTAMP, but includes time zone information
*/


/*Now if we go back in to see the data that we imported (job postings_fact.csv) into our table (job_postings_fact.cvs - table)
and then scroll over to see the job_posted_date (a column of job postings_fact.csv - table)
have the convenient that the format of the data of this columnm, is a TIMESTAMP (DATE AND THEN TIME) but not include 
the timezone, data in our database not include the TIMEZONE INFORMATION (THE FORMAT THAT WE WANT TO INLCUDE IN OUR TABLE BELONGING TO THE DATABASE)*/

/* The before query that include the date time FORMAT (NOT THE TIME ZONE)*/
SELECT
    job_title_short AS title,
    job_location AS location,
    job_posted_date AS date_time
 FROM
    job_postings_fact
LIMIT
     5;

/* 
Timestamps with Time Zone (Not our situation)
- If our data came as a TIMESTAMP with TIMEZONE whenever we use this at TIMEZONE keyword.
- Stored as UTC, displayed per query´s or system´s time zone.
- AT TIME ZONE coverts UTC to the specified time zone correctly.

EXAMPLE: 
SELECT
    column_name AT TIME ZONE 'EST'
FROM 
    table_name;
*/


/*
Timestamps without Time Zone (our situation):
- Treated as a local time in PostgreSQL.
- Using AT TIME ZONE assumes the machine´s time zone for conversion; specificy it, or the default is UTC (UNIVERSAL TIME COORDINATED).
- In our situation (following the before case), We don´t have time zone information, We need to first specify the time zone that this value actually is, by saying AT TIME ZONE
  and then from there use AT TIME ZONE again, to specify the time zone that we want to go to.

- NOTES:
- Universal Time Coordinated (UTC) is the same that Coordinated Universal Time (CUT). 
- EST (EASTERN STANDARD TIME).

EXAMPLE:
In this example, We´re showing from UTC converting it to Eastern Standard Time (EST).

SELECT 
    column_name AT TIME ZONE 'UTC' AT TIME ZONE 'EST'
FROM 
    table_name;
NOTES: The values that conform the data that Luke collected are UTC, so if you want to have an specific time zone (e.g. EST) and your values are timestamp without timezone, you must know first that your value are UTC or other type of TIMEZONE, also can be  include the EAST.  */

SELECT
    job_title_short AS title,
    job_location AS location,
    job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'EST'
 FROM
    job_postings_fact
LIMIT
     5;
