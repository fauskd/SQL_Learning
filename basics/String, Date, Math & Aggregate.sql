-- For string we have many string functions. Here I will do practice some important functios.
-- so we create a new database and tables

create database test_string;
use test_string;

create table employees(
emp_id int auto_increment primary key,
first_name varchar(50),
last_name varchar(50),
email varchar(100), 
department varchar(50)
);

create table products(
product_id INT PRIMARY KEY,
product_name VARCHAR(100),
category VARCHAR(50),
price DECIMAL(10,2),
stock_quantity INT,
last_updated TIMESTAMP
);

insert into employees(first_name, last_name, email, department)
values ('John', 'Doe', 'john.doe@example.com', 'Marketing'),
('Jane', 'Smith', 'jane.smith@example.com', 'Sales'),
('Michael', 'Johnson', 'michael.johnson@example.com', 'IT'),
('Emily', 'Davis', 'emily.davis@example.com', 'HR'),
('Chris', 'Brown', 'chris.brown@example.com', 'Finance');

insert into products values
(1, 'Laptop Pro', 'Electronics', 1299.99, 50, '2024-01-15 10:00:00'),
(2, 'Desk Chair', 'Furniture', 199.99, 30, '2024-01-16 11:30:00'),
(3, 'Coffee Maker', 'Appliances', 79.99, 100, '2024-01-14 09:15:00'),
(4, 'Gaming Mouse', 'Electronics', 59.99, 200, '2024-01-17 14:20:00'),
(5, 'Bookshelf', 'Furniture', 149.99, 25, '2024-01-13 16:45:00');

-- check 
select * from employees;
select * from products;

-- Concat: combine two tables
select concat(first_name, ' ', last_name) as full_name from employees;

-- Length: Get the length of a columns contains string
select first_name, length(first_name) as len_str from employees;
select department, length(first_name) as len_str from employees;

-- Upper and lower: convert a column string into upper and lower case
select first_name, upper(first_name), lower(last_name) from employees;

-- Trim: Removes the leading and tailing spaces of a column string
select trim('       beat  ') as col;

-- Substring: can take the any position characters of a string 
select first_name, substring(first_name,1,2) as pos_cha from employees;
select department, substring(department,1,3) as pos_cha from employees;

-- Locate: find the position of a character or characters of a string
select first_name, locate('a', first_name) as cha_pos from employees;
select department, locate('n', department) as cha_pos from employees;
select first_name, locate('ch', first_name) as cha_pos from employees;

-- Replace: replace characters or words or syntax
select email, replace(email, 'example.com', 'amazon.com') from employees;

-- Reverse: reverses the characters of a string
select first_name, reverse(first_name) from employees;

-- Left and Right: split string 
select first_name,
left(email, 3) as first_3,
right(email, 3) as last_3
from employees;

-- Field: use for custom sorting
select field(category, 'Electronics', 'Furniture', 'Appliances') from products;
select *, field(category, 'Electronics', 'Furniture', 'Appliances') from products;


-- Now Date and time functions

select now() as current_datetime;
select curdate() as current_dated;
select curtime() as current_timed;

-- date time extract
select year(now()) as current_year;
select month(now()) as months;
select monthname(now()) as month_name;
select day(now()) as days;
select dayname(now()) as day_names;
select minute(now()) as time_min;
select second(now()) as time_sec;


-- Date formating (%W: day_name, %m: month_num, %M: month_name, %e: date, %Y: year)
select date_format('2025-05-12', '%W, %M %e, %Y')as long_formated;
select date_format('2025-05-12', '%m/%e/%Y')as short_formated;

CREATE TABLE orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(100),
    order_date DATETIME
);

INSERT INTO orders (customer_name, order_date) VALUES
('Alice', '2025-03-01 10:15:00'),
('Bob', '2025-03-02 14:45:30'),
('Charlie', '2025-03-03 09:30:15'),
('Akshay', '2024-03-01 10:15:00');

select * from orders;

-- split order_date
SELECT 
    order_id,
    customer_name,
    order_date,
    DATE(order_date) AS split_date,
    TIME(order_date) AS split_time
FROM orders;

-- find year, months, days
select *, 
year(order_date) as years,
month(order_date) as months,
day(order_date) as days
from orders;

-- format date
select *,  date_format(order_date, '%m/%e/%Y')as short_formated
from orders;

-- find name of the months
select *, monthname(order_date) as month_names
from orders;



create database test_numeric;
use test_numeric;

create table numbers(
id INT AUTO_INCREMENT PRIMARY KEY,
num_value DECIMAL(10,5)
);

insert into numbers(num_value)
values (25.6789),
(-17.5432),
(100.999),
(-0.4567),
(9.5),
(1234.56789),
(0);

select * from numbers;


-- Absolute value function
SELECT num_value, ABS(num_value) AS absolute_value FROM numbers;

-- Rounding functions
SELECT num_value, 
       CEIL(num_value) AS rounded_up, 
       FLOOR(num_value) AS rounded_down 
FROM numbers;

SELECT num_value, ROUND(num_value, 2) AS rounded_2_decimals FROM numbers;
SELECT num_value, TRUNCATE(num_value, 2) AS truncated_2_decimals FROM numbers;

-- Mathematical operations
SELECT num_value, POWER(num_value, 2) AS squared FROM numbers;
SELECT num_value, MOD(num_value, 3) AS remainder FROM numbers;
SELECT num_value, SQRT(ABS(num_value)) AS sqrt_value FROM numbers;



-- Now Aggregate functions 
-- count(), sum(), avg(), min(), max()

create table employees(
id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(50),
department VARCHAR(50),
salary DECIMAL(10,2),
hire_date DATE
);

insert into employees (name, department, salary, hire_date)
values ('Alice', 'HR', 50000, '2018-06-23'),
('Bob', 'IT', 70000, '2019-08-01'),
('Charlie', 'Finance', 80000, '2017-04-15'),
('David', 'HR', 55000, '2020-11-30'),
('Eve', 'IT', 75000, '2021-01-25'),
('Frank', 'Finance', 72000, '2019-07-10'),
('Grace', 'IT', 68000, '2018-09-22'),
('Hank', 'Finance', 90000, '2016-12-05'),
('Ivy', 'HR', 53000, '2022-03-19'),
('Jack', 'IT', 72000, '2017-05-12');

select * from employees;

-- how many emp's in HR
select count(*) as total_emps from employees where department = 'HR';

-- salary in every department
select department, sum(salary) as total_salary from employees
group by department;

-- average salary in every department
select avg(salary) from employees;

select department, round(avg(salary), 2) as avg_salary from employees
group by department;
















