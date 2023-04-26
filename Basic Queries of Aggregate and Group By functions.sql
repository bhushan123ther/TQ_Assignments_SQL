use hr_db;
show tables;

select * from country;
select * from department;
select * from employee;
select * from jobs;
select * from location;
select * from region;

-- Write a query to list the number of jobs available in the employees table.
select count(distinct job_id) as Number_of_jobs from jobs;

-- Write a query to get the total salaries payable to employees.
select sum(salary) as Total_Salary_payable from employee; 

-- Write a query to get the minimum salary from employees table.
select min(salary) as Minimum_salary from employee;

-- Write a query to get the maximum salary from employees table.
select max(salary) as Maximum_salary from employee;

-- Write a query to get average salary from employees table.
select avg(salary) as Average_salary from employee;

-- Write a query to get the maximum salary of an employee working as a programmer
select e.first_name , max(e.salary) as Max_salary
from employee e 
join department d on e.Department_id = d.Department_Id where d.Department_Name='IT';

-- Write a query to get the average salary and number of employees working the department IT
select avg(e.salary) as Average_salary, count(*) as Number_of_employee
from employee e 
join department d on e.Department_Id = d.Department_Id where d.Department_Name='IT';

-- Write a query to get the highest, lowest, sum, and average salary of all employees.
select max(salary) as Max_salary , min(salary) as Min_salary , sum(salary) as Sum_salary , 
avg(salary) as Average_salary from employee;

 -- Write a query to get the number of employees with the same job
 SELECT job, COUNT(*) AS num_employees
 FROM emplo
 GROUP BY job;
 
 -- add column in a table
 alter table employee
 add column job_Id varchar(30);
 
 -- Write a query to get the number of employees with the same job
 select  j.job_title , count(*) as number_of_employees
 from jobs j
 join employee e on j.job_Id = e.job_Id 
 group by j.job_title;
 
 -- Write a query to get the difference between the highest and lowest salaries.
SELECT MAX(salary) - MIN(salary) AS salary_difference
FROM employee;

-- Write a query to find the manager ID and the salary of the lowest-paid employee for that manager.
select Manager_Id , min(salary) from employee;

-- Write a query to get the department ID and the total salary payable in each department.
SELECT d.department_id, SUM(e.salary) AS total_salary_payable
FROM employee e
JOIN department d ON e.department_id = d.department_id
GROUP BY d.department_id;

-- Write a query to get the average salary for each job ID excluding programmer.
SELECT j.job_id, AVG(e.salary) AS avg_salary
FROM employee e
JOIN jobs j ON e.job_id = j.job_id
WHERE j.job_title <> 'Developer'
GROUP BY j.job_id;

-- Write a query to get the total salary, maximum, minimum, average salary of employees (job ID wise), for department ID 90 only.

SELECT e.job_id, SUM(e.salary) AS total_salary, MAX(e.salary) AS max_salary, MIN(e.salary) AS min_salary, AVG(e.salary) AS avg_salary
FROM employee e
JOIN department d ON e.department_id = d.department_id
WHERE d.department_id = 1
GROUP BY e.job_id;
