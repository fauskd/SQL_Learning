create database window_functions;
use window_functions;
-- Create table 
drop table if exists baby_names;
create table baby_names(
gender varchar(10),
name varchar(20),
total int
);

-- Insert values
insert into baby_names 
values
('Girl', 'Ava', 95),
('Girl', 'Emma', 106),
('Boy', 'Ethan', 115),
('Girl', 'Isabella', 100),
('Boy', 'Jacob', 101),
('Boy', 'Liam', 84),
('Boy', 'Logan', 73),
('Boy', 'Noah', 120),
('Girl', 'Olivia', 100),
('Girl', 'Sophia', 88);


-- select by popular names
select * from baby_names
order by total desc;

-- add a popularity column
select gender, name, total,
row_number() over(order by total ) as popularity
from baby_names
;

-- try a different functions
select gender, name, total,
row_number() over(order by total ) as popularity,
rank() over(order by total ) as popularity_R,
Dense_rank() over(order by total ) as popularity_D
from baby_names
;

-- try different windows
select gender, name, total,
row_number() over(partition by gender order by total desc) as popularity
from baby_names
;


-- what are the top 3 most popular names for each gender
select * from
(select gender, name, total,
row_number() over(partition by gender order by total desc) as popularity
from baby_names) as pop
where popularity < 4;

-- More details about window
select * from pizza_types;
select category, name, 
count(category) over(partition by category)
from pizza_types
;

-- Running total / total revenue
with a as (select orders.order_date,
round(sum(order_details.quantity * pizzas.price),2) as sales
from orders 
join order_details
using (order_id)
join pizzas 
using (pizza_id)
group by orders.order_date)
select * , 
round(sum(sales) over(order by order_date),2) as running_date
from a;


-- MTD
with a as (select orders.order_date,
round(sum(order_details.quantity * pizzas.price),2) as sales
from orders 
join order_details
using (order_id)
join pizzas 
using (pizza_id)
group by orders.order_date)

select *,
round(sum(sales)over(order by order_date), 2) as running_total,
round(sum(sales)over(partition by month(order_date) order by order_date), 2) as monthly_total
from a;

-- rank, dense_rank, row_number
select pt.category,
pt.name,
p.size,
p.price,
rank() over(order by p.price desc) as rnk,
dense_rank() over(order by p.price desc) as dense_rnk,
row_number() over(order by p.price desc) as row_no
from pizzas as p
join pizza_types as pt
using(pizza_type_id);


-- fetch top 3 pizzas by each category
select * from (select p.size,
p.price,
pt.name,
pt.category,
dense_rank() over(partition by pt.category order by p.price desc) as dense_rnk
from pizzas as p
join pizza_types as pt
using(pizza_type_id)) a
where dense_rnk <= 3;


-- find out the median
with a as (select price, 
row_number() over(order by price) as position,
count(*) over() as n from pizzas)
select case
when n % 2 = 0 then(select avg(price) from a where position in ((n/2), (n/2)+1))
else (select price from a where position = (n+1)/2)
end as median from a limit 1;


-- lag and lead
-- Month over month growth ((cm-pm)/pm)
with a as (select month(orders.order_date) as months,
round(sum(order_details.quantity * pizzas.price),2) as sales
from orders 
join order_details
using (order_id)
join pizzas 
using (pizza_id)
group by month(orders.order_date))

select months, concat(coalesce(round(((sales - pre_months)/pre_months)*100, 2), 0), '%') as MoM_growth 
from
(select *, coalesce(lag(sales, 1) over(order by months), 0) as pre_months from a) as b;


-- first_value and last_value
select pt.category, 
pt.name,
p.size,
p.price,
first_value(pt.name) over(partition by pt.category order by p.price desc)
from pizzas as p
join pizza_types as pt
using (pizza_type_id);








