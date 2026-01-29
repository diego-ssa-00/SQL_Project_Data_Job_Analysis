/*Data Types
When you create a new table, you must understand and specify the data type for each of the columns.
It´s is necessary when setting it up in order to have data integrity in your database.
If it did not meet the conditions of being different data types the We wouldn´t be able to insert it, this is really good at just having a first line of defense of having clean data.
Additionaly because of these characterizations of these data types, it also makes these SQL databases a lot more effcient in processing in queries,
it doesn´t have to guess what the datatype is inside of a column, it automatically knows and it can process this data with efficient */

/*Common DataTypes
INT: 
* An integer value: 123
* A whole number
* Range: -2,147,483,648 to 2,147,483,647 for a regular INT (4 bytes)

NUMERIC (precision, scale)
* A precise number with fixed decimal points
* PRECISION: Is the total number of digits, and
* SCALE: Is the number of digits to the right of the decimal point E.g. 123.456 with NUMERIC(6,3)

TEXT
* A string of characters: 'Hello, World'
* Stores variables-length strings with unlimited length
* Often used for string long - form text that doesn´t fit within the size constrains of VARCHAIR

VARCHAR(n)
* A variable-length string(where n is the maximus length): 'Hello' with VARCHAIR(10)
* Provides maximus character limit but can store strings of any length up to that limit

BOOLEAN
* Represents a logical entity that can be true, false, or NULL 
* Suitable for storing true/false values
* 1,0 or NULL

DATE
* A specific date without time 2024-02-06
* Format: YYYY-MMM-DD

TIMESTAMP
* A specific date and time without timezone: 2024-02-06 15:04:05
* Format: YYYY-MM-DD HH:MIN:SS, capable of including seconds depending on the precision

TIMESTAMP WITH TIME 
* A specific date and time with timezone information: 2024-02-06 15:04:05+00:00
* Similar to TIMESTAMP, but includes time zone information
* Adjusts stored time based on the time zone
* Useful for applications requiring time zone awareness
*/

/*Manipulate Tables
The following statements are used to manipulate tables 
CREATE TABLE: Create tables
INSERT TABLE: add columns (data) to your tables
ALTER TABLE: alter tables
    ADD: add columns
    RENAME COLUMN: rename columns
    ALTER COLUMN: change the datatype of a column
    DROP COLUMN: delete a column
DROP TABLE: delete tables
*/
/*Create Table
*CREATE - Create tables from scratch
*Format: 
CREATE TABLE table_name (
    column_name datatype,
    column_name2 datatype, 
    ....
);

Lets create job_applied table so We can track all the jobs We ´ve applied to.
* Create a job_applied table 
* Include information about the jobs We´ve applied to  */
CREATE TABLE job_applied  ( 
    job_id INT,
    application_sent_date DATE,
    custom_resume BOOLEAN,
    resume_file_name VARCHAR(255),
    cover_letter_sent BOOLEAN,
    cover_letter_file_name VARCHAR(255),
    status VARCHAR(50)
);

SELECT *
FROM job_applied;