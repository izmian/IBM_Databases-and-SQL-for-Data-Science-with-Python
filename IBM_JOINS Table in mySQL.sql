					######''''''	Working with Joins in MySQL using phpMyAdmin	''''''######

			# Exercise 1: Load the database
            
#1. Create a blank database named 'HR'. Use the script shared in the link below to create the required tables.

CREATE TABLE EMPLOYEES (
                            EMP_ID CHAR(9) NOT NULL, 
                            F_NAME VARCHAR(15) NOT NULL,
                            L_NAME VARCHAR(15) NOT NULL,
                            SSN CHAR(9),
                            B_DATE DATE,
                            SEX CHAR,
                            ADDRESS VARCHAR(30),
                            JOB_ID CHAR(9),
                            SALARY DECIMAL(10,2),
                            MANAGER_ID CHAR(9),
                            DEP_ID CHAR(9) NOT NULL,
                            PRIMARY KEY (EMP_ID));
                            
  CREATE TABLE JOB_HISTORY (
                            EMPL_ID CHAR(9) NOT NULL, 
                            START_DATE DATE,
                            JOBS_ID CHAR(9) NOT NULL,
                            DEPT_ID CHAR(9),
                            PRIMARY KEY (EMPL_ID,JOBS_ID));
 
 CREATE TABLE JOBS (
                            JOB_IDENT CHAR(9) NOT NULL, 
                            JOB_TITLE VARCHAR(30),
                            MIN_SALARY DECIMAL(10,2),
                            MAX_SALARY DECIMAL(10,2),
                            PRIMARY KEY (JOB_IDENT));

CREATE TABLE DEPARTMENTS (
                            DEPT_ID_DEP CHAR(9) NOT NULL, 
                            DEP_NAME VARCHAR(15) ,
                            MANAGER_ID CHAR(9),
                            LOC_ID CHAR(9),
                            PRIMARY KEY (DEPT_ID_DEP));

CREATE TABLE LOCATIONS (
                            LOCT_ID CHAR(9) NOT NULL,
                            DEP_ID_LOC CHAR(9) NOT NULL,
                            PRIMARY KEY (LOCT_ID,DEP_ID_LOC));

#2. Import the files to your local machine: Departments.csv, Jobs.csv, Jobs, History.csv, Locations.csv, Employees.csv

			# Exercise 2: JOINS
#1. Retrieve the names and job start dates of all employees who work for department number 5.
	# I used the Inner join operation with the EMPLOYEES table as the left table and the JOB_HISTORY table as the right table. 
	# The join was made over employee ID, and the query response will be filtered for the Department ID value 5.
  
SELECT E.F_NAME,E.L_NAME, JH.START_DATE 
FROM EMPLOYEES as E 
INNER JOIN JOB_HISTORY as JH 
ON E.EMP_ID=JH.EMPL_ID 
WHERE E.DEP_ID ='5';
			
#2. Retrieve employee ID, last name, department ID, and department name for all employees.
	# For this, I used the Left Outer Join operation with the EMPLOYEES table as the left table and the DEPARTMENTS table as the right table. 
	# The join will happen on the Department ID.

SELECT E.EMP_ID, E.L_NAME, E.DEP_ID, D.DEP_NAME
FROM EMPLOYEES AS E 
LEFT OUTER JOIN DEPARTMENTS AS D 
ON E.DEP_ID=D.DEPT_ID_DEP;

#3. Retrieve the First name, Last name, and Department name of all employees.
	# For this, I used the Full Outer Join operation with the EMPLOYEES table as the left table and the DEPARTMENTS table as the right table. 
	# A full outer join in MySQL is implemented as a UNION of left and right outer joins.

SELECT E.F_NAME, E.L_NAME, D.DEP_NAME
FROM EMPLOYEES AS E
LEFT OUTER JOIN DEPARTMENTS AS D
ON E.DEP_ID = D.DEPT_ID_DEP

UNION

SELECT E.F_NAME, E.L_NAME, D.DEP_NAME
FROM EMPLOYEES AS E
RIGHT OUTER JOIN DEPARTMENTS AS D
ON E.DEP_ID=D.DEPT_ID_DEP






