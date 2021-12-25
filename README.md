# sql-challenge
1. DATA ENGINEERING
    * I reviewed CSV in resources folder to understand database architecture noting TABLE names, column titles, and data types.
    * Please see ERD.jpg file in the EmployeeSQL folder for ERD image file.
    * Using this information, I created ERD to determine relationships between the CSV files and how to create tables in SQL with primary and foriegn keys.
    * Please see schemata.sql file in the EmployeeSQL folder for table schemata SQL code.
    * In pgAdmin I created tables 6 Tables that correspond with 6 CSV files and added primary key and foriegn keys as outlined byt ERD.jpg file.
    
2. DATA ANALYSIS
    * Please see queries.sql file in the EmployeeSQL folder for data analysis SQL code.
    * In pgAdmin I wrote SQL code to select , join, and filter data to run queries capturing requested information
            1. List the following details of each employee: employee number, last name, first name, sex, and salary.
            2. List first name, last name, and hire date for employees who were hired in 1986.
            3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
            5.List the department of each employee with the following information: employee number, last name, first name, and department name.
            6. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
            7. List all employees in the Sales department, including their employee number, last name, first name, and department name.
            8.List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
            9. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.