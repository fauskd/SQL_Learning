create database sort1;
use sort1;

-- Set up table and data
create table products(
id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(100),
price DECIMAL(10,2),
category VARCHAR(50),
created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

insert into products(name, price, category)
values ('Laptop', 999.99, 'Electronics'),
('Smartphone', 499.99, 'Electronics'),
('Coffee Maker', 79.99, 'Appliances'),
('Headphones', 149.99, 'Electronics'),
('Blender', 59.99, 'Appliances'),
('Tablet', 299.99, 'Electronics'),
('Microwave', 199.99, 'Appliances'),
('Smart Watch', 249.99, 'Electronics'),
('Toaster', 39.99, 'Appliances'),
('Speaker', 89.99, 'Electronics');

-- check table
select * from products;

-- For the first two values
select * from products order by id limit 2;

-- with offset
-- offset number is for how many rows need to skip
select * from products order by id limit 2 offset 2;

-- there is another way to write offset
-- this is showing how many rows need to skip and how many to take
select * from products order by id limit 2, 3;

-- we can take differents rows for different pages
-- first page
select * from products limit 0, 3;

-- 2nd page
select * from products limit 3, 3;

-- 3rd page
select * from products limit 6, 4;

-- it has generic formula
 -- LIMIT (page_number - 1) * items_per_page, items_per_page
 
 
 -- Give me 5 random products
 -- we can use limit but it will return same data 
 select * from products limit 5;
 
 select * from products order by rand() limit 5; -- it is useful for the big data

