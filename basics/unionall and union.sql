create database Unions;
use Unions;

-- Union and union all work on rows. It will give all rows from different table
-- Rule1: there must be a common column
-- Rule2: select columns number same otherwise it will return error
-- columns should be same data type

-- For this we will create tables
create table headquarters_employees(
employee_id INT PRIMARY KEY,
first_name VARCHAR(50),
last_name VARCHAR(50),
email VARCHAR(100),
hire_date DATE,
department VARCHAR(50),
salary DECIMAL(10,2)
);

create table branch_employees(
employee_id INT PRIMARY KEY,
first_name VARCHAR(50),
last_name VARCHAR(50),
email VARCHAR(100),
hire_date DATE,
department VARCHAR(50),
salary DECIMAL(10,2)
);

create table customers(
customer_id INT PRIMARY KEY,
first_name VARCHAR(50),
last_name VARCHAR(50),
email VARCHAR(100),
signup_date DATE,
status VARCHAR(20)
);

-- insert datas into all tables

insert into headquarters_employees
values (101, 'John', 'Smith', 'john.smith@company.com', '2018-03-15', 'IT', 75000.00),
(102, 'Mary', 'Johnson', 'mary.johnson@company.com', '2019-06-22', 'HR', 65000.00),
(103, 'Robert', 'Williams', 'robert.williams@company.com', '2017-11-08', 'Finance', 82000.00),
(104, 'Susan', 'Brown', 'susan.brown@company.com', '2020-01-30', 'Marketing', 68000.00),
(105, 'Michael', 'Davis', 'michael.davis@company.com', '2018-09-12', 'IT', 78000.00);

insert into branch_employees
values (201, 'James', 'Wilson', 'james.wilson@company.com', '2019-04-18', 'Sales', 62000.00),
(202, 'Patricia', 'Moore', 'patricia.moore@company.com', '2020-07-25', 'Marketing', 59000.00),
(203, 'Linda', 'Taylor', 'linda.taylor@company.com', '2018-08-15', 'HR', 61000.00),
(204, 'Robert', 'Williams', 'robert.williams@company.com', '2017-11-08', 'Finance', 82000.00), -- Duplicate employee who works at both locations
(205, 'Elizabeth', 'Anderson', 'elizabeth.anderson@company.com', '2019-12-03', 'Sales', 64000.00);

insert into customers
values (1001, 'David', 'Miller', 'david.miller@email.com', '2019-02-14', 'Active'),
(1002, 'Sarah', 'Wilson', 'sarah.wilson@email.com', '2020-05-20', 'Active'),
(1003, 'Michael', 'Davis', 'michael.davis@email.com', '2018-11-30', 'Inactive'), -- Same name as an employee
(1004, 'Jennifer', 'Garcia', 'jennifer.garcia@email.com', '2021-01-05', 'Active'),
(1005, 'Robert', 'Martinez', 'robert.martinez@email.com', '2019-08-22', 'Active');


-- check the data
select * from headquarters_employees;
select * from branch_employees;
select * from customers;


-- union all
select * from headquarters_employees
union all 
select * from branch_employees;
select * from customers;

select first_name, last_name, email from headquarters_employees
union all
select first_name, last_name, email from branch_employees;


-- Union 
-- Combine employee and customers contact information
select first_name, last_name, email, 'Employee' as contact_type from branch_employees
union
select first_name, last_name, email, 'Customer' as contact_type from customers;

-- Get all employees sort by last name
select employee_id, first_name, last_name from headquarters_employees
union 
select employee_id, first_name, last_name from branch_employees
order by last_name;

-- Filtering
-- Get employee contact information by there salary over 70000
select employee_id, first_name, last_name, email, salary from headquarters_employees
where salary > 70000
union 
select employee_id, first_name, last_name, email, salary from branch_employees
where salary > 70000
order by salary desc;

-- we want to do union on branch_employees and customers anyway
select employee_id, first_name, last_name, department, salary, null as status
from headquarters_employees
union
select customer_id, first_name, last_name, null, null, status
from customers
order by first_name;

-- Find all departments in headquarters and branch offices
select department from headquarters_employees
union
select department from branch_employees;

-- find departments those have in both tables
select * from (select distinct department from headquarters_employees
union all 
select distinct department from branch_employees)as c
group by department
having count(*) = 2;