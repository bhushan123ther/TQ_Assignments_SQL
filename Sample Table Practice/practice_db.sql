use practice_db;
show tables;

create table department(dept_id int primary key, dept_name varchar(30));
insert into department values(1,'Admin'),(2,'Developer'),(3,'HR'),(4,'Tester'),(5,'Accountant');

create table manager(manager_id varchar(15) primary key, manager_name varchar(30), city varchar(30));
insert into manager values('M101','Sagar','Pune'),('M102','Ganesh','Nagpur'),('M103','Roshan','Pune'),('M104','Pratik','Mumbai'),('M105','Ravi','Pune'),('M106','Anand','Nagpur');

create table employee(emp_id int primary key, emp_name varchar(30),salary double, city varchar(40), dept_id int, manager_id varchar(15),
foreign key (dept_id) references department(dept_id), foreign key(manager_id) references manager(manager_id));

insert into employee values(1,'Karan',40000,'Mumbai',2,'M102'),
                           (2,'Rohit',66000,'Pune',1,'M106'),
                           (3,'Shubham',25000,'Banglore',5,'M105'),
                           (4,'Kishor',22000,'Nagpur',3,'M102'),
                           (5,'Mina',78000,'Kolkata',3,'M101'),
                           (6,'Githa',56000,'Chennai',3,'M103'),
                           (7,'Bhakti',33000,'Hydrabad',4,'M104'),
                           (8,'Rakhi',46000,'Indor',2,'M105'),
                           (9,'Raksha',45000,'Bhopal',3,'M102'),
                           (10,'Eshvari',17000,'Mumbai',2,'M101');
                           
select * from employee;
select * from department;
select * from manager;   

select e.emp_name , d.dept_name
from employee e join department d
on e.dept_id = d.dept_id ;
            


-- write a query to find the name of the department where more than two employees are working.
select d.dept_name
from department d left join employee e
on d.dept_id = e.dept_id 
group by e.dept_id 
having count(e.dept_id)>2; 

-- write sql query to calculate the average salary of each departmetn which higer than 22000. Find department name also in descending order.
select d.dept_name , avg(e.salary) 
from employee e join department d
on e.dept_id = d.dept_id
group by e.dept_id
having avg(e.salary)>22000
order by d.dept_name desc;

-- write a query to find the manager and employee who belongs to same city
select e.emp_name, m.manager_name , e.city
from employee e left join manager m
on e.manager_id = m.manager_id
where e.city = m.city;


-- write a query to find the manager and employee who belongs to same city.
select m.manager_name , e.emp_name from
employee e join manager m 
on e.manager_id =  m.manager_id
where e.city = m.city;

-- write a query to find those employee whose salary exists between 35k and 90k with the department and manager name    
select d.dept_name , m.manager_name , e.emp_name , e.salary
from employee e join department d
on e.dept_id = d.dept_id
join manager m on m.manager_id = e.manager_id
where e.salary between 35000 and 66000;
      

select * from employee;
select max(salary) as Maximum_Salary from employee;

select salary from employee
order by salary desc limit 1;      

select salary from employee
order by salary asc;

select min(salary) from employee
order by salary;

-- To get the even records
select * from employee
where mod(emp_id,2) = 0;

-- To get the odd records
select * from employee
where mod(emp_id,2) = 1;

-- TO get the first record from the table
  select * from Employee
  where emp_Id = (select min(emp_Id) from Employee);
  
  select * from Employee
  where emp_Id = (select max(emp_Id) from Employee);
  

