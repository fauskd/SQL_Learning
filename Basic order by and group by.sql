SELECT * FROM Parks_and_Recreation.employee_demographics;

select gender 
from employee_demographics
group by gender;

select gender, avg(age) 
from employee_demographics
group by gender;

select occupation 
from employee_salary
group by occupation;

select occupation, salary 
from employee_salary
group by occupation, salary;


select gender, avg(age), max(age), min(age), count(age) 
from employee_demographics
group by gender;

# ORDER BY

select * 
from employee_demographics
order by first_name asc;

select * 
from employee_demographics
order by gender, age;

select * 
from employee_demographics
order by gender, age desc;

select * 
from employee_demographics
order by 5, 4 desc;



