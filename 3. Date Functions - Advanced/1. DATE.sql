/*DATE FUNCTIONS - ADVANCED /That DATE FUNCTIONS ALLOW US TO CAST OR CONVERT THE DIFFERENT DATA INTO DIFFERENT DATAYPE 
-DATE-

Handling Dates 
Date functions in SQL: Used to perform operations on date and times value. 

* :: DATE: Converts to a date format by removing the time portion.
* AT TIME ZONE: Converts a timestamp(date with time portion)  to a specified time zone.
* EXTRACT: Gets a speciic date parts (e.g., year, month, day) FAVORITE COMMAND OF LUKE.

job_posted_date - COLUMN
YYYY-MM-DD HH:MM:SS - THE TIMESTAMP FORMAT.

THIS COLUMN WILL BE OUR FOCUS DURING THIS SECTION

SELECT job_posted_date (COLUMN)
FROM job_postings_fact (TABLE)
LIMIT ;  */ 

SELECT job_posted_date
FROM job_postings_fact
LIMIT 10;


/* We´re going to look at is how to cast different values or types to different data type.
So, in this case of our job_posted_ date (column that belong to job_postings_fact) this is with timestamp format and we want to cast it, as a date format (DATE).
For make this, we must to use "::*/
SELECT
job_title_short AS title,
job_location AS location,
job_posted_date AS date
FROM
job_postings_fact


/*EXAMPLE FOR UNDERSTANDING
-NOTES-
   :: - Used for casting, which means converting a value from one data type to another.
   You can use it, to convert a host of different data type. 
   ::DATE - Convert this value into a date format.
   In this case, it´s converting a timestamp into a date format. */ 
SELECT 
'2023-02-19'::DATE,
'123'::INTEGER,
'true'::BOOLEAN,
'3.14'::REAL;



/* CONTINUE...
This is the complete form, We used :: to cast the timestamp format to a date format (job_posted_date as date - column)
REMEMBER: 'AS' MOT THE SAME '::'
*/
SELECT
job_title_short AS title,
job_location AS location,
job_posted_date :: DATE as date
FROM
job_postings_fact