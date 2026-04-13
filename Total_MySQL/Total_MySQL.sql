SELECT * FROM customers;


select * from customers where country = 'USA' and city = 'NYC';

select customerName, country, customerNumber from customers where creditLimit > 100000;


SELECT 
    *
FROM
    customers
WHERE
    creditLimit > 100000 AND country = 'USA'
        AND salesRepEmployeeNumber = 1165;


select * from customers where creditLimit > 100000 or country = 'USA' or country = 'Germany';

select * from customers where phone like '%44%';
select * from customers where contactFirstName like 'a%';
select * from customers where contactFirstName like '%a';


-- group by 
select contactFirstName, country, city from customers
order by country desc, city;

select contactFirstName, creditLimit from customers
order by creditLimit desc;

select contactFirstName, creditLimit, country from customers
where country = 'USA' order by contactFirstName;

-- limit
select * from customers limit 1;
select * from customers order by creditLimit desc limit 1;
select contactFirstName, creditLimit from customers order by creditLimit desc limit 1,1;
select * from customers order by creditLimit desc limit 1,4;


-- between
select contactFirstName, creditLimit from customers 
where creditLimit between 100000 and 150000
order by creditLimit desc;

select * from orders;

select shippedDate, status, customerNumber from orders where (orderDate between '2003-10-01' and '2003-10-31') and status = 'Shipped'
order by orderDate desc;


-- in and not in
select * from customers where country not in ('Germany', 'USA');
select * from customers where country in ('Germany');


-- string function
select contactFirstName,
length(contactFirstName),
length(trim(contactFirstName)),
upper(contactFirstName), 
lower(contactFirstName),
left (contactFirstName, 2),
right (contactFirstName, 3) from customers;

select * from employees;

select concat(firstName, ' ', lastName) as fullname,
concat(' ', firstName, lastName, jobTitle) as fullname_jobtitle from employees;


-- data aggregation numeric functions in MySQL
select * from orderdetails;
select sum(quantityOrdered) as total_ordered,
round(avg(quantityOrdered),2),
ceil (avg(quantityOrdered)),
floor(avg(quantityOrdered))from orderdetails;

select * from products;
select max(buyPrice), max(MSRP), count(productName) from products;

-- MySQL date functions
select * from orders;

select orderDate, month(orderDate), monthname(orderDate),
year(orderDate),
day(orderDate)from orders;

select *, datediff(shippedDate, orderDate) from orders;


-- case operator for that first we will create a new table
create database company;
USE company;

CREATE TABLE employees (
    emp_id INT,
    name VARCHAR(100),
    age INT,
    gender VARCHAR(10),
    department VARCHAR(50),
    salary DECIMAL(10, 2),
    country VARCHAR(50),
    city VARCHAR(50),
    hiredate DATE
);

INSERT INTO employees (emp_id, name, age, gender, department, salary, country, city, hiredate) VALUES
(1, 'John Doe', 30, 'Male', 'Engineering', 70000.00, 'USA', 'New York', '2020-01-10'),
(2, 'Jane Smith', 28, 'Female', 'Marketing', 65000.00, 'USA', 'San Francisco', '2021-02-15'),
(3, 'Ahmed Khan', 35, 'Male', 'Sales', 60000.00, 'UK', 'London', '2019-03-20'),
(4, 'Maria Garcia', 32, 'Female', 'HR', 58000.00, 'USA', 'Los Angeles', '2018-04-25'),
(5, 'Chen Wei', 40, 'Male', 'Engineering', 80000.00, 'China', 'Beijing', '2017-05-30'),
(6, 'Anna Müller', 29, 'Female', 'Research', 67000.00, 'Germany', 'Berlin', '2020-06-05'),
(7, 'Carlos Diaz', 38, 'Male', 'Finance', 72000.00, 'Spain', 'Madrid', '2019-07-10'),
(8, 'Aisha Al-Hamad', 34, 'Female', 'Marketing', 66000.00, 'UAE', 'Dubai', '2022-08-15'),
(9, 'Yuto Tanaka', 41, 'Male', 'Sales', 61000.00, 'Japan', 'Tokyo', '2018-09-20'),
(10, 'Emma Wilson', 27, 'Female', 'HR', 56000.00, 'UK', 'Manchester', '2021-10-25'),
(11, 'Oliver Jones', 45, 'Male', 'Engineering', 85000.00, 'USA', 'Seattle', '2016-11-30'),
(12, 'Sophia Brown', 26, 'Female', 'Research', 64000.00, 'Canada', 'Toronto', '2022-12-23'),
(13, 'Yuto Tanaka', 41, 'Male', 'Sales', 65000.00, 'Japan', 'Tokyo', '2018-09-20'),
(14, 'Emma Wilson', 27, 'Female', 'HR', 70000.00, 'UK', 'Manchester', '2021-10-25'),
(15, 'Oliver Jones', 45, 'Male', 'Engineering', 80000.00, 'USA', 'Seattle', '2016-11-30'),
(16, 'Sophia Brown', 26, 'Female', 'Research', 70000.00, 'Canada', 'Toronto', '2022-12-23'),
(17, 'Aisha Al-Hamad', 34, 'Female', 'Marketing', 80000.00, 'UAE', 'Dubai', '2022-08-15');

 select * from employees;
 
 select name, salary,
 case
 when salary < 60000 then '5%'
 when salary >= 60000 and salary < 70000 then '10%'
 when salary > 70000 and salary <= 80000 then '15%'
 else '20%'
 end as bonus from employees;
 
 
 -- group by 
 
 select * from employees;  
 select department, sum(salary) as total,
 round(avg (salary), 2) from employees
 group by department;
 
 select country, department, round(avg(salary)) as avg_salary
 from employees
 group by country, department;
 
 
 -- Having clause
 select * from customers;
 
 -- query the countries where the count of customers >= 5
 select country, count(customerNumber)as N from customers
 group by country
 having N>= 5;
 
 select * from products;
 
 select productLine, count(productcode)
 from products
 group by productline
 having count(productcode) >=10  ;
 
 -- JOINS
SELECT 
    p.productName, o.quantityOrdered, p.productCode
FROM
    products AS p
        INNER JOIN
    orderdetails AS o ON p.productCode = o.productCode;

SELECT 
    p.productName, o.quantityOrdered, p.productCode
FROM
    products AS p
        left JOIN
    orderdetails AS o ON p.productCode = o.productCode;
 
SELECT 
    c.*, e.*
FROM
    customers AS c
        CROSS JOIN
    employees AS e ON c.salesRepEmployeeNumber = e.employeeNumber;


SELECT 
    t1.customerName, t2.customerName, t1.country
FROM
    customers AS t1
        JOIN
    customers AS t2 ON t1.country = t2.country
WHERE
    t1.customerNumber <> t2.customerNumber;

-- Union and union all
SELECT 
    *
FROM
    januaryorders 
UNION SELECT 
    *
FROM
    februaryorders;

SELECT 
    *
FROM
    januaryorders 
UNION ALL SELECT 
    *
FROM
    februaryorders;
 
 
select * from januaryorders
intersect
select * from februaryorders;
 
select * from januaryorders
except
select * from februaryorders;


select a.order_id,
p.product_name,
p.price
from
(select * from januaryorders
union
select * from februaryorders) as a
join productdetails as p
on a.product_code = p.product_code;

-- name of top 5 products based on orders
select productName 
from
(select p.productName,
sum(o.quantityOrdered) as orders_total
from products as p
join orderdetails as o
on p.productCode = o.productCode
group by p.productName
order by orders_total desc
limit 5) as a;

-- find the second smallest creditlimit
select distinct creditLimit from customers
order by creditLimit
limit 1,1;
-- another way to find out 
select min(creditLimit) from customers
where 
creditLimit > 0;


-- query all the productlines with their % distribution to the total sales
SELECT 
    productCode,
    SUM(quantityOrdered) AS total_quantity,
    SUM(quantityOrdered) / SUM(SUM(quantityOrdered)) OVER() * 100 AS percentage
FROM 
    orderdetails
GROUP BY 
    productCode
ORDER BY 
    percentage DESC;


-- window functions
select customerName, country, creditLimit,
avg(creditLimit) over (partition by country) 
from customers;


select orderDate,sales,
sum(sales) over (order by orderDate)
from
(select o.orderDate,
sum(od.quantityOrdered * od.priceEach) as sales
from orders as o
join orderdetails as od
on o.orderNumber = od.orderNumber
group by orderDate) as a ;



select * from customers; 

select customerName, creditLimit, rn
from
(select customerName, creditLimit,
rank() over (order by creditLimit) as rn
from customers) as a
where rn <= 5;

select customerName, creditLimit, rn
from
(select customerName, creditLimit,
rank() over (order by creditLimit desc) as rn
from customers) as a
where rn <= 5;

select customerName, creditLimit,
row_number() over(order by creditLimit)
from customers;

-- CTEs in MySQL
with a as(select customers.customerName,
sum(orderdetails.quantityOrdered * orderdetails.priceEach) as sales
from customers join orders
on customers.customerNumber = orders.customerNumber
join orderdetails
on orders.orderNumber = orderdetails.orderNumber
group by customers.customerName),

b as (select customers.customerName,
sum(payments.amount) as payments
from payments join customers
on payments.customerNumber = customers.customerNumber
group by customers.customerName)

select a.customerName, a.sales, b.payments,
(a.sales - b.payments) as pending
from a join b on a.customerName = b.customerName;

-- views in MySQL

create view s_n_o as
(select o.orderNumber, p.productName, p.productLine,
o.quantityOrdered, o.priceEach
from products as p
join orderdetails as o
on p.productCode = o.productCode);

select sum(quantityOrdered) from s_n_o where productLine = 'motorcycles';


create view france as 
select * from customers where country = 'france';

-- stored procedures in MySQL
create procedure US()
select * from customers where country = 'USA';

call US();







