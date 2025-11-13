Two Marks:

---#6  Differentiate between DDL and DML commands with examples.
Aspect    DDL (Data Definition Language)    
		  DML (Data Manipulation Language)
Purpose    Defines/modifies structure of DB objects (tables, schemas, etc.)    Manipulates data stored inside tables 
Effect    Changes schema/structure, not the data    Changes the data (insert, update, delete, retrieve)
Auto Commit    
      Yes (changes are permanent automatically)    
       No (can be rolled back or committed)

>>>>Examples    CREATE, DROP, DELETE, SELECT


---#7 Write a query to fetch the second highest salary from an employee table.
 use market;
 select * from employees;
 select max(salary) from employees where salary < ( select max(salary) from employees);

---#8 Explain the difference between INNER JOIN and LEFT JOIN with an example.
INNER JOIN  
    Returns only rows that have matching values in both tables.

LEFT JOIN  
     Returns all rows from the left table, and matching rows from the right table. 
     If no match, NULL is shown.
     


---#9 What is a Trigger in MySQL? Give a use case.
       The stored programme which is automaticaly triggeer in update an functional conditiona of query.
	And make changes at database from an alternative which are not run again in SQL.

---#10 Why is Normalization important? Explain with an example.
     Normalization = process of organizing data in a database to reduce redundancy and improve consistency.
Ensures data is stored efficiently, avoids anomalies (insert, update, delete), and improves integrity.


Ten Mark:

  create database milestone1;
  use milestone1;
  
create table employee (emp_id int primary key,emp_name varchar(50),dept_id int,salary int,hire_date date);
insert into employee (emp_id, emp_name, dept_id, salary, hire_date) values (101, 'John', 1, 50000, '2018-05-12'),(102, 'Amit', 2, 65000, '2017-03-20'),(103, 'Sara', 2, 72000, '2019-08-15'),(104, 'Lina', 3, 48000, '2020-01-10'),(105, 'Raj', 4, 55000, '2016-09-25'),(106, 'Emma', 1, 60000, '2015-11-02');

create table attendance (att_id int primary key,emp_id int not null,att_date date not null,status varchar(10) check (status in ('Present', 'Absent')));
insert into  attendance (att_id, emp_id, att_date, status) values (1, 101, '2025-09-01', 'Present'),(2, 102, '2025-09-01', 'Absent'),(3, 103, '2025-09-01', 'Present'),(4, 104, '2025-09-01', 'Present'),(5, 105, '2025-09-01', 'Present'),(6, 106, '2025-09-01', 'Present');



-- a) Write a DDL command to create the departments table with dept_id as Primary Key and dept_name as NOT NULL.
create table department (dept_id int primary key,dept_name varchar(50) not null);

-- b) Insert two sample records into the departments table (e.g., Sales, IT).
insert into 
   department (dept_id, dept_name) 
values(1, 'Sales'),(2, 'IT'),(3, 'HR'),(4, 'Finance');

-- c) Write a query to display the employee name and department name using a JOIN between employees and departments.
select 
    * 
from 
	employee 
inner join 
    department using (dept_id);

-- d)Write a query to find the highest salary using an aggregate function.
select max(salary) from employee;
 
 -- e) Write a subquery to fetch the employees who earn more than the average salary.
select  
   emp_id, emp_name, salary 
from 
   employees 
where 
    salary > (select avg(salary) from employees);

-- f) Create a view named emp_salary_view to display emp_name, dept_name, salary.
create view 
  emp_salary_view as 
select 
     e.emp_name,d.dept_name,e.salary 
from 
     employees e 
join  
   departments d on e.dept_id = d.dept_id;





