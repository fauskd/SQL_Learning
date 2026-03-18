#CTEs
with cte_example as
(
select gender, avg(salary) avg_sal, max(salary) max_sal, min(salary)min_sal, count(salary) count_sal
from employee_demographics as dem
join employee_salary as sal
on dem.employee_id = sal.employee_id
group by gender
)
select avg(avg_sal) from cte_example
;


select avg(avg_sal) from(
select gender, avg(salary) avg_sal, max(salary) max_sal, min(salary)min_sal, count(salary) count_sal
from employee_demographics as dem
join employee_salary as sal
on dem.employee_id = sal.employee_id
group by gender
) as example_query;



with cte_example1 as
(
select employee_id, gender, birth_date
from employee_demographics
where birth_date > 1978-01-01
), 
cte_example2 as
(
select salary, employee_id
from employee_salary
)
select *
from cte_example1
join cte_example2
on cte_example1.employee_id = cte_example2.employee_id
;











