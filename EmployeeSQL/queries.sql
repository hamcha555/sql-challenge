Select * from EMPLOYEE;
Select * from SALARIES;

ALTER TABLE EMPLOYEE DROP COLUMN Salary;

ALTER TABLE IF EXISTS public.departments
    ADD COLUMN  Serial Primary Key;


-- List the following details of each employee: employee number, last name, first name, sex, and salary.

SELECT EMPLOYEE.EMP_NO, EMPLOYEE.LAST_NAME, EMPLOYEE.FIRST_NAME, EMPLOYEE.SEX, SALARIES.SALARY
FROM EMPLOYEE
LEFT JOIN SALARIES ON EMPLOYEE.EMP_NO = SALARIES.EMP_NO;


-- List first name, last name, and hire date for employees who were hired in 1986.

SELECT EMP_NO, LAST_NAME, FIRST_NAME, SEX, HIRE_DATE
FROM EMPLOYEE
WHERE HIRE_DATE > '1985-12-31'
AND HIRE_DATE < '1987-01-01'
;

-- List the manager of each department with the following information: department number, department name,
-- 			the manager's employee number, last name, first name.
Select * from dept_managers;
Select * from departments;

CREATE VIEW managers AS
SELECT EMPLOYEE.EMP_NO,	EMPLOYEE.LAST_NAME,	EMPLOYEE.FIRST_NAME
-- , DEPT_MANAGERS.DEPT_NO
-- , DEPARTMENTS.DEPT_NAME
FROM EMPLOYEE
Where EMP_NO IN
	(
	Select EMP_NO
	From DEPT_MANAGERS
 	WHERE DEPT_NO IN
 	(
 		SELECT DEPT_NO
 		FROM Departments
 	)
);

Select * from managers;

CREATE VIEW managers_number AS
SELECT MANAGERS.EMP_NO,	MANAGERS.LAST_NAME,	MANAGERS.FIRST_NAME, DEPT_MANAGERS.DEPT_NO
FROM MANAGERS
LEFT JOIN DEPT_MANAGERS ON MANAGERS.EMP_NO = DEPT_MANAGERS.EMP_NO;

Select * from managers_number;

SELECT MANAGERS_NUMBER.EMP_NO,	MANAGERS_NUMBER.LAST_NAME,	MANAGERS_NUMBER.FIRST_NAME, MANAGERS_NUMBER.DEPT_NO, DEPARTMENTS.DEPT_NAME
FROM MANAGERS_NUMBER
LEFT JOIN DEPARTMENTS ON MANAGERS_NUMBER.DEPT_NO = DEPARTMENTS.DEPT_NO;


-- List the department of each employee with the following information: employee number, last name,
--		first name, and department name.

Select * from DEPT_MANAGERS;
Select * from DEPT_EMPLOYEES;
Select * from DEPARTMENTS;
Select * from ALL_EMP_DEPT_NO;
Select * from ALL_EMP_DEPT_NO_NAME;

CREATE TABLE ALL_EMP_DEPT_NO AS
SELECT DEPT_MANAGERS.EMP_NO, DEPT_MANAGERS.DEPT_NO
FROM DEPT_EMPLOYEES
CROSS JOIN DEPT_MANAGERS;

Select * from DEPT_MANAGERS;

CREATE TABLE ALL_EMP_DEPT_NO_NAME AS
SELECT ALL_EMP_DEPT_NO.EMP_NO, ALL_EMP_DEPT_NO.DEPT_NO, DEPARTMENTS.dept_name, DEPARTMENTS.id
FROM ALL_EMP_DEPT_NO
LEFT JOIN DEPARTMENTS ON DEPARTMENTS.DEPT_NO = ALL_EMP_DEPT_NO.DEPT_NO
;

CREATE TABLE ALL_EMP_DEPT_NAME_FINAL AS
SELECT ALL_EMP_DEPT_NO_NAME.EMP_NO, EMPLOYEE.LAST_NAME, EMPLOYEE.FIRST_NAME,
	ALL_EMP_DEPT_NO_NAME.dept_name, ALL_EMP_DEPT_NO_NAME.id
FROM ALL_EMP_DEPT_NO_NAME
LEFT JOIN Employee ON ALL_EMP_DEPT_NO_NAME.EMP_NO = Employee.EMP_NO
;

Select * from ALL_EMP_DEPT_NAME_FINAL;

-- List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."

SELECT FIRST_NAME, LAST_NAME, SEX FROM EMPLOYEE
WHERE FIRST_NAME = 'Hercules'
AND last_name like 'B%'
;

-- List all employees in the Sales department, including their employee number, last name, first name, and department name.

Select * from ALL_EMP_DEPT_NAME_FINAL
Limit 5;

Select * from Departments
;

SELECT EMP_NO, LAST_NAME, FIRST_NAME, dept_name
FROM ALL_EMP_DEPT_NAME_FINAL
Where dept_name = 'Sales'
;

-- List all employees in the Sales and Development departments, including their employee number, last name, first name,
-- 			and department name.

SELECT EMP_NO, LAST_NAME, FIRST_NAME, dept_name
FROM ALL_EMP_DEPT_NAME_FINAL
Where dept_name = 'Sales'
OR dept_name = 'Development'
;

-- In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

Select last_name, count(Last_name) as last_name_count
from Employee
Group by Last_name
Order by last_name_count desc
;