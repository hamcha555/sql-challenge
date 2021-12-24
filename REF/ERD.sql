Employees
-
emp_no INT PK
emp_title VARCHAR(10)
birthdate VARCHAR(15)
first_name VARCHAR(30)
last_name VARCHAR(30)
sex VARCHAR(1)
hire_date VARCHAR(15)
title_pkid INT FK - Titles.title_pkid
dept_mng_pkid INT FK - Dept_Managers.dept_mng_pkid
dept_emp_pkid INT FK - Dept_Employees.dept_emp_pkid
salary_pkid INT FK - Salaries.salary_pkid
dept_pkid INT FK - Departments.dept_pkid

Departments
-
dept_pkid INT PK
dept_no VARCHAR(9)
dept_name VARCHAR(255)

Dept_Employees
-
dept_emp_pkid INT PK
emp_no INT FK >- Employees.emp_no
dept_no VARCHAR(10) FK >- Departments.dept_no
dept_pkid INT FK - Departments.dept_pkid

Dept_Managers
-
dept_mng_pkid INT PK
dept_no VARCHAR(10) FK >- Departments.dept_no
emp_no INT FK >- Employees.emp_no
dept_pkid INT FK - Departments.dept_pkid

Salaries
-
salary_pkid INT PK
emp_no INT FK >- Employees.emp_no
salary INT

Titles
- 
title_pkid INT PK
title_id VARCHAR(10) FK - Employees.emp_title
title VARCHAR(30)