-- 1. select customers names together with each order by the customer
select c.CustomerName, o.OrderID
from customers as c
join orders as o
using (CustomerID);

-- 2. select orderID together with name of the employee who handled the order
select o.OrderID, e.FirstName, e.LastName
from Orders as o
join employees as e
using (EmployeeID);


-- 3. select customers who did not placed any order yet
select c.CustomerID, c.CustomerName
from customers as c
left join orders as o
using (CustomerID)
where o.CustomerID is null;


-- 4. Select order id together with the name of products
select OrderID, ProductName
from order_details as od
join products as p
using (ProductID);

-- 5. Select products that no one bought
select p.ProductID, p.ProductName, od.OrderID
from products as p
left join order_details as od
on p.ProductID = od.ProductID
where od.OrderID is null;

-- 6. Select customer together with the products that he bought
select c.CustomerID, c.CustomerName, p.ProductName, od.OrderID
from customers as c
join orders using (CustomerID)
join order_details as od using (OrderID)
join products as p using (ProductID)
order by c.CustomerID asc;


-- 7. Select product names together with the name of corresponding category

select p.ProductID, p.ProductName, c.CategoryName
from products as p
join categories as c
using (CategoryID)
order by p.ProductID asc;
-- 8. Select orders together with the name of the shipping company
select o.OrderID, o.CustomerID, o.EmployeeID,o.OrderDate, s.ShipperName
from orders as o
join shippers as s 
using (ShipperID)
order by o.OrderID;


-- 9. Select customers with id greater than 50 together with each order they made
select c.CustomerID, c.CustomerName, o.OrderID
from customers as c
join orders as o
using (CustomerID)
where c.CustomerID > 50;


-- 10. Select employees together with orders with order id greater than 10400
select o.OrderID, e.EmployeeID, e.FirstName, e.LastName
from orders as o
join employees as e
using(EmployeeID)
where o.OrderID > 10400
order by e.EmployeeID;

-- 11. Select the most expensive product
select ProductID, ProductName, Price
from products
order by price desc
limit 1;


-- 12. Select the second most expensive product
select ProductID, ProductName, Price
from products
order by price desc
limit 1, 1;

-- 13. Select name and price of each product, sort the result by price in decreasing order
select ProductName, Price
from products
order by price desc;
 
 
-- 14. Select 5 most expensive products
select ProductID, ProductName, Price
from products
order by price desc
limit 5;


-- 15. Select 5 most expensive products without the most expensive (in final 4 products)
select ProductID, ProductName, Price
from products
order by price desc
limit 4 offset 1;

-- 16. Select name of the cheapest product (only name) without using LIMIT and OFFSET
select ProductName, Price
from products
where Price = (select min(Price) from products);


-- 17. Select name of the cheapest product (only name) using subquery
select ProductName
from products
where Price = (select min(Price) from products);

-- 18. Select number of employees with LastName that starts with 'D'
select employeeID, FirstName, LastName
from employees
where LastName like 'D%';

-- 19. Select orderID together with the total price of  that Order, order the result by total price of order in increasing order
select od.OrderID, sum(od.Quantity * p.Price) as total_price
from order_details as od
join products as p 
using (ProductID)
group by od.OrderID
order by total_price asc;

-- 20. Select customer who spend the most money
select c.CustomerID, c.CustomerName, sum(od.Quantity * p.Price) as total_price
from customers as c
join orders as o using (CustomerID)
join order_details as od using (OrderID)
join products as p using (ProductID)
group by c.CustomerID
order by total_price desc;



