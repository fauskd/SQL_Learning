create database group_by_test;
use group_by_test;

-- Group by 
-- First we will create table
create table employees(
id int auto_increment primary key,
name varchar(59),
department varchar(59), 
salary decimal(10,2), 
joining_date date
);

insert into employees(name, department, salary, joining_date)
values ('Alice', 'HR', 50000, '2020-06-15'),
('Bob', 'HR', 55000, '2019-08-20'),
('Charlie', 'IT', 70000, '2018-03-25'),
('David', 'IT', 72000, '2017-07-10'),
('Eve', 'IT', 73000, '2021-02-15'),
('Frank', 'Finance', 60000, '2020-11-05'),
('Grace', 'Finance', 65000, '2019-05-30'),
('Hannah', 'Finance', 62000, '2021-01-12');

-- check the data 
select * from employees;

-- insert more data to better understand
insert into employees(name, department, salary, joining_date)
values ('Tim', 'HR', 65000, '2019-05-30'),
('Tom', 'IT', 62000, '2021-01-12');


select * from employees;

-- Syntax for group by 
-- select col1,col2,... from table_name group by col1 or col2 etc.

-- Count employees in each department
select department, count(department) from employees 
group by department;

-- Get the average salary per department
select department, avg(salary) from employees 
group by department;

-- Get the highest and lowest salary in each department
select department, max(salary), min(salary) from employees 
group by department;

-- Count Employees per department and joining year
select department, count(department)as department_count, year(joining_date) as joining_year from employees 
group by department, year(joining_date);


-- order by highest salary
select department, avg(salary) from employees 
group by department
order by avg(salary) desc;


-- multiple status for salary range
select *,  
case
when salary < 60000 then 'low salary'
when salary between 60000 and 70000 then 'medium salary'
else 'high salary'
end as salary_range
from employees;

select count(*), 
case 
when salary < 60000 then 'low salary'
when salary between 60000 and 70000 then 'medium salary'
else 'high salary'
end as salary_range
from employees
group by salary_range;

-- Find departments with more than 2 employees
select department, count(*)as total_emp from employees group by department having total_emp > 2 ;

select department, count(*) as total_emp 
from employees
where joining_date > '2017-07-10'
group by department
having total_emp >2
order by department desc;

  