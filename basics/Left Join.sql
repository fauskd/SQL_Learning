create database LR_joins;
use LR_joins;

-- Left join will return all the rows. if no match with right table, it will return null values
-- so we create tables to see how the left join works 
-- First One To One

create table customers(
customer_id int primary key,
customer_name varchar(100) not null,
email varchar(100),
city varchar(50)
);

create table orders(
order_id int primary key,
customer_id int,
order_date date,
total_amount decimal(10,2)
);

insert into customers(customer_id, customer_name, email, city)
values (1, 'John Smith', 'john@example.com', 'New York'),
    (2, 'Jane Doe', 'jane@example.com', 'Los Angeles'),
    (3, 'Robert Johnson', 'robert@example.com', 'Chicago'),
    (4, 'Emily Davis', 'emily@example.com', 'Houston'),
    (5, 'Michael Brown', 'michael@example.com', 'Phoenix');
    
insert into orders(order_id, customer_id, order_date, total_amount)
values (101, 1, '2023-01-15', 150.75),
    (102, 3, '2023-01-16', 89.50),
    (103, 1, '2023-01-20', 45.25),
    (104, 2, '2023-01-25', 210.30),
    (105, 3, '2023-02-01', 75.00);
    
    
-- check the tables
select * from customers;
select * from orders;


-- Left join 
select * from customers
left join orders 
on customers.customer_id = orders.customer_id;

-- Find customers who have no order_id
select * from customers as c
left join orders as o
on c.customer_id = o.customer_id
where o.customer_id is null;

-- Find customer's names who have no order_id
select c.customer_name from customers as c
left join orders as o
on c.customer_id = o.customer_id
where o.customer_id is null;

-- Find customers orders and total amount
select c.customer_id, c.customer_name,count(o.order_id), -- we can use specific column to fill the values
 ifnull(sum(o.total_amount), 0) as total_spent -- fill null values
from customers as c
left join orders as o
on c.customer_id = o.customer_id
group by c.customer_id;


-- Find customers from New York city
select * from customers
left join orders 
using(customer_id)
where customers.city = 'New York';


-- Now Many To Many
-- So we create another table 

create table shipping(
shipping_id INT PRIMARY KEY,
order_id INT,
shipping_date DATE,
carrier VARCHAR(50),
tracking_number VARCHAR(50)
);


insert into shipping(shipping_id, order_id, shipping_date, carrier, tracking_number)
values (1001, 101, '2023-01-16', 'FedEx', 'FDX123456789'),
    (1002, 104, '2023-01-26', 'UPS', 'UPS987654321'),
    (1003, 105, '2023-02-02', 'USPS', 'USPS456789123');

-- Get customers, their orders, and shipping information
select c.customer_name, o.order_id, o.order_date, o.total_amount, s.carrier, s.tracking_number
from customers as c
left join orders as o
using(customer_id)
left join shipping as s
using(order_id);

-- Advanced filtering with aggregation
-- Find customers who haven't ordered in the past 30 days
SELECT 
    c.customer_id,
    c.customer_name,
    MAX(o.order_date) AS last_order_date
FROM 
    customers c
LEFT JOIN 
    orders o ON c.customer_id = o.customer_id
GROUP BY 
    c.customer_id, c.customer_name
HAVING                            -- we don't use where because having gives grouped results and max(o.order_date) is depending on group by
    MAX(o.order_date) IS NULL 
    OR MAX(o.order_date) < DATE_SUB(CURDATE(), INTERVAL 30 DAY);


