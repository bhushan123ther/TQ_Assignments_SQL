use hr_db;
show tables;

select * from country;
select * from department;
select * from employee;
select * from jobs;
select * from location;
select * from region;

-- Write a query to display the names(first_name , last name) using alias name  "First Name" , "Last Name"
select first_name as First_Name , last_name as Last_Name from employee;

-- Write a query to get unique department ID from employee table
select distinct department_id from department;

-- Write a query to get all employee details from the employee table order by first name, descending.
select * from employee order by first_name desc;

-- Write a query to get the names (first_name, last_name), salary, PF of all the employees (PF is calculated as 12% of salary).
select first_name , last_name , salary , (salary * 0.12) as PF from employee; 

-- Write a query to get the employee ID, names (first_name, last_name), salary in ascending order of salary.
select employee_id,first_name,last_name,salary from employee order by salary;

-- Write a query to get the total salaries payable to employees.
select SUM(salary) as total_salary_payable from employee; 

-- Write a query to get the maximum and minimum salary from employees table.
select min(salary) as Minimum_Salary , max(salary) as Maximum_Salary from employee;

-- Write a query to get the average salary and number of employees in the employees table.
select avg(salary) as Average_Salary , count(*) as Number_of_employee from employee;

-- Write a query to get the number of employees working with the company.
select count(*) as Number_of_employees from employee;

-- Write a query to get the number of jobs available in the employees table. 
select count(distinct job_id) as number_of_jobs from jobs;

-- Write a query get all first name from employees table in upper case. 
select upper(first_name) as First_Name from employee;

-- Write a query to get the first 3 characters of first name from employees 
select left(first_name ,3) AS first_name_3_chars from employee;

-- Write a query to calculate 171*214+625. 
select  171 * 214 + 625 as Result;

-- Write a query to get the names (for example Ellen Abel, Sundar Ande etc.) of all the employees from employees table. 
select concat(first_name,'  ',last_name) as Employee_Name from employee;

-- Write a query to get first name from employees table after removing white spaces from both side. 
select trim(first_name) as First_name_trimemed from employee;

-- Write a query to get the length of the employee names (first_name, last_name) from employees table
select length(concat(first_name,last_name)) as Length_of_Name from employee;

-- Write a query to check if the first_name fields of the employees table contains numbers. 
select * from employee where first_name regexp'[0-9]';

-- Write a query to select first 5 records from a table. 
select * from employee limit 5;

-- Write a query to get monthly salary (round 2 decimal places) of each and every employee 
SELECT employee_id, ROUND((salary/12), 2) AS monthly_salary
FROM employee;
