create database test;
use test;

create table employees(
id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    department VARCHAR(50),
    salary DECIMAL(10,2),
    hire_date DATE
);

insert into employees(first_name, last_name, department, salary, hire_date)
values ('John', 'Doe', 'HR', 60000.00, '2022-05-10'),
('Jane', 'Smith', 'IT', 75000.00, '2021-08-15'),
('Alice', 'Johnson', 'Finance', 82000.00, '2019-03-20'),
('Bob', 'Williams', 'IT', 72000.00, '2020-11-25'),
('Charlie', 'Brown', 'Marketing', 65000.00, '2023-01-05');

-- check data 
select * from employees;

select first_name as 'First Name', last_name, department from employees;

select * from employees where department = 'IT' order by salary desc limit 1;

select * from employees limit 2;

select distinct department from employees;

select concat(first_name, ' ', last_name) as full_name, year(hire_date)as hire_year, round(salary, 1) from employees;