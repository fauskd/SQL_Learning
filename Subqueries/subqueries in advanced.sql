
-- check the data 
select * from products;
select * from customers;
select * from orders;
select * from order_items;


-- basic subqueries
-- find the customers names who have ordered more than one order
select customer_id, 
concat(first_name, ' ', last_name) as full_name 
from customers 
where customer_id in (select distinct(customer_id) 
						from orders
						group by customer_id
						having count(*) >= 2);
                        
-- find the customer names who have not order more than one order
select * 
from customers 
where customer_id not in (select customer_id 
							from orders
							group by customer_id
							having count(*)>= 2);


-- Find products with a price higher than average
select * from products;


select price from products 
where price > (select avg(price) from products);

-- Find all orders made by customers from Texas
select * from orders;
select * from orders where customer_id in (select customer_id from customers
where state = 'TX');

-- alternative using join
select * from orders as o
join customers as c
on o.customer_id = c.customer_id
where state = 'TX';



-- Find all customers who ordered electronics products

-- using joins
select c.first_name,
c.last_name,
p.product_name,
p.category
from products as p
join order_items as oc
on p.product_id = oc.product_id
join orders as o
on o.order_id = oc.order_id
join customers as c
on c.customer_id = o.customer_id
where category = 'Electronics';

-- now using subquery

select * from customers as c
join orders as o on o.customer_id = c.customer_id
join order_items as oc on o.order_id = oc.order_id
where oc.product_id in (select product_id from products 
where category = 'Electronics');

-- SUBQUERIES WITH AVERAGE CALCULATION

-- Calculate the total amount spent by each customer
select customer_id, sum(total_amount) as total_spent from orders group by customer_id;

-- Calculate the average total spending across all customers
select avg(total_spent) from
(select customer_id, sum(total_amount) as total_spent from orders group by customer_id) as total_spent;

-- Identify customers whose total spending exceeds this average
SELECT *, 
    (SELECT SUM(total_amount) FROM orders WHERE customer_id = customers.customer_id) AS total_spent 
FROM customers 
WHERE
    (SELECT SUM(total_amount) FROM orders WHERE customer_id = customers.customer_id) > 
    (SELECT AVG(total_spent) AS average_customer_spending FROM 
        (SELECT customer_id, SUM(total_amount) AS total_spent FROM orders GROUP BY customer_id) AS customer_total);
        
        
-- Find customers who have ordered all products in the 'Electronics' category
SELECT c.email
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
WHERE p.category = "Electronics"
GROUP BY c.customer_id
HAVING COUNT(DISTINCT p.product_id) = (SELECT COUNT(*) FROM products WHERE category="Electronics");

-- Find all customers who are not from California but have purchased the same product-quantity combinations as California customers
SELECT c.email, c.state, p.product_name, oi.quantity FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON oi.order_id = o.order_id
JOIN products p ON oi.product_id = p.product_id
WHERE c.state != 'CA' 
AND (oi.product_id, oi.quantity) IN 
    (SELECT oi.product_id, oi.quantity FROM customers c
    JOIN orders o ON c.customer_id = o.customer_id
    JOIN order_items oi ON oi.order_id = o.order_id
    WHERE c.state = 'CA');

-- Find customers who have placed at least one order
-- Using JOIN
SELECT DISTINCT c.customer_id, c.email 
FROM customers c 
JOIN orders o ON c.customer_id = o.customer_id 
ORDER BY c.customer_id;

-- Using EXISTS
SELECT * FROM customers c 
WHERE EXISTS (
    SELECT 1 FROM orders o WHERE c.customer_id = o.customer_id
);

-- Find customers who haven't placed any orders
SELECT * FROM customers c 
WHERE NOT EXISTS (
    SELECT 1 FROM orders o WHERE c.customer_id = o.customer_id
);