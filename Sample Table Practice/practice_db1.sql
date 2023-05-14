
CREATE TABLE employee_info (
`id` int(11) NOT NULL,
`name` varchar(265) NOT NULL,
`email` varchar(265) NOT NULL,
`department` varchar(265) NOT NULL,
`salary` int(11) NOT NULL,
`DOB` date NOT NULL,
`gender` varchar(265) NOT NULL,
PRIMARY KEY (ID)
);

INSERT INTO `employee_info` (`Id`, `name`, `email`, `department`, `salary`, `DOB`,`gender`) VALUES
('1', 'Karan Mehta', 'Karan@gmail.com','HR', '300000', '1998-05-10','M'),
('2', 'Rohit Sharma', 'Rohit@gmail.com','Admin', '75000', '1997-01-25','M'),
('3', 'Ankush Rajput', 'Ankush@gmail.com','Accounts', '60000', '1998-02-09','M'),
('4', 'Priyanshi Sharma', 'Priyanshi@gmail.com','HR', '500000', '1998-06-15','F'),
('5', 'Sanket Gupta', 'Sanket@gmail.com','Developer', '100000', '1997-05-07','M'),
('6', 'Shruti Kapoor', 'Shruti@gmailcom','Admin', '80000', '1995-11-26','F'),
('7', 'Rohit Sharma', 'Rohit@gmail.com','Admin', '75000', '1997-01-25','M'),
('8', 'Sanket Gupta','Sanket@gmail.com', 'Developer', '100000', '1997-05-07','M'),
('9', 'Geet Gour','Geet@gmail.com', 'Tester', '17000', '1998-07-03','F');

select * from employee_info;

-- write a query to delete the duplicate record from the employee_info table
delete e1
from employee_info e1, employee_info e2
where e1.email = e2.email
and e1.id > e2.id;
-- and e1.id != e2.id;      to delete both duplicate records 

-- WAQ to retrieve the first four character of employee name from the employee_info table
select substring(name,1,4)
from employee_info;

-- WAQ to find the number of employees whoes DOB is between 01/06/1995 to 30/06/1998 and the grouped according to gender
select count(*),gender
from employee_info
where dob
between '1995-01-01' AND '1998-06-30'
group by gender;

select count(*),gender
from employee_info
where dob
between str_to_date('01/01/1995','%d/%m/%Y') and str_to_date('30/06/1998','%d/%m/%Y')
group by gender;

-- WAQ to fetch all the records from the employee_info table ordered by Department in ascending order and salary in the descending order
select * 
from employee_info
order by department asc , salary desc;

-- WAQ to fetch details of all employees excluding the employees who are 'HR' and 'Admin'
select * 
from employee_info
where department
not in('HR','Admin');

-- WAQ to fetch 50% records from the employee_info table
-- works fine when id is in proper sequence i.e no record deleted
select *
from employee_info
where id<= (select count(id)/2 from employee_info);

-- WAQ to display the total salary of each employee after adding 10% increment in the salary
select id, name, salary+(salary/10)
as TotalSalary
from employee_info;
