DROP TABLE IF EXISTS employee;

CREATE TABLE employee(
	emp_no INT PRIMARY KEY,
 	emp_title VARCHAR(30) NOT NULL,
 	birthdate  Date NOT NULL,
	first_name VARCHAR(30) NOT NULL,
	last_name VARCHAR(30) NOT NULL,
	sex VARCHAR(1) NOT NULL,
	hire_date Date NOT NULL
);

Select * from employee;
Select * from titles;

DROP TABLE IF EXISTS dept_managers;

CREATE TABLE departments(
-- 	id SERIAL PRIMARY KEY,
	dept_no VARCHAR(9) NOT NULL,
	dept_name VARCHAR(255) NOT NULL
);

ALTER TABLE IF EXISTS public.departments
    ADD COLUMN id Serial Primary Key;


CREATE TABLE dept_employees(
	emp_no INT NOT NULL,
	dept_no VARCHAR(10) NOT NULL
);

CREATE TABLE dept_managers(
	dept_no VARCHAR(10) NOT NULL,
	emp_no INT NOT NULL
);

CREATE TABLE salaries(
	emp_no INT not null,
	salary INT not null
);

Create Table titles(
-- 	id SERIAL PRIMARY KEY,
	title_id VARCHAR(10),
	title VARCHAR(30)
);

ALTER TABLE IF EXISTS public.titles
    ADD COLUMN id Serial Primary Key;

