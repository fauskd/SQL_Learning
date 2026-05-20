create database sort;
use sort;

-- Sorting with order by
-- For this we create a table 
create table products(
product_id int primary key,
product_name varchar(100),
category varchar(50),
price decimal(10, 2),
stock_quantity int,
last_updated timestamp
);

Insert into products
values (1, 'Laptop Pro', 'Electronics', 1299.99, 50, '2024-01-15 10:00:00'),
(2, 'Desk Chair', 'Furniture', 199.99, 30, '2024-01-16 11:30:00'),
(3, 'Coffee Maker', 'Appliances', 79.99, 100, '2024-01-14 09:15:00'),
(4, 'Gaming Mouse', 'Electronics', 59.99, 200, '2024-01-17 14:20:00'),
(5, 'Bookshelf', 'Furniture', 149.99, 25, '2024-01-13 16:45:00');

-- check data 
select * from products;

-- Sort by price ascending order
select * from products order by price;

-- Sort by timestamp
select * from products order by last_updated;

-- multiple conditions
select * from products order by category, price desc;

-- sorting by column position
select * from products order by 4;

-- Advanced sorting techniques
select * from products
where category = 'Electronics'
order by price;


-- Sorting with functions
select product_name, length(product_name) from products;
select product_name from products order by length(product_name);
select * from products order by year(last_updated);


-- Order by with limit
select * from products order by stock_quantity desc limit 1;

-- Custom sorting
select * from products order by field(category, 'Electronics', 'Furniture', 'Appliances');
select * from products order by field(category, 'Electronics', 'Furniture', 'Appliances'), price;

-- sorting with case
select * from products order by 
case
when stock_quantity <= 50 and price >= 200 then 1
else 2
end;-- in ascending order 

select * from products order by 
case
when stock_quantity <= 50 and price >= 200 then 1
else 2
end desc; -- Result in descending order


