    --    EXPERIMENT : DDL COMMANDS

-- (i) create the database

CREATE DATABASE dbmslab;

-- (ii) select the current database

USE dbmslab;

--  (iii)Create the following tables.
-- a.	employee (emp_no,emp_name,DOB, address, doj, mobile_no, dept_no, salary).
-- b.	department (dept_no, dept_name, location).
-- (iv)	Include necessary constraints.

create table employee(
    emp_no int PRIMARY KEY ,
    emp_name varchar(20) ,
    dob date ,
    address varchar(100),
    doj date ,
    mobile_no int(10),
    dept_no int(10) ,
    salary int(10),
    FOREIGN KEY (dept_no) REFERENCES department(dept_no) ON DELETE SET NULL

);

create table department(
    dept_no int(10) PRIMARY KEY,
    dept_name varchar(20) UNIQUE,
    location varchar(20)
    );

-- (v)	List all the tables in the current database

show tables;

-- (vi)	Display the structure of the employee table

DESCRIBE employee;

DESCRIBE department;


-- (vii)	Add a new column Designation to the employee table

ALTER TABLE employee
ADD COLUMN designation VARCHAR(20);


-- (viii)	Drop the column location from Dept table

ALTER TABLE department
DROP COLUMN location;


-- (ix)	Drop the tables

DROP TABLE employee;

DROP TABLE department;

-- (x)	Delete the database

DROP database dbmslab;
