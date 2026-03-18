SELECT * 
FROM Parks_and_Recreation.employee_salary;

#Using where clause
select *
from employee_salary
where first_name = 'Tom';

select *
from employee_salary
where salary >= 50000;

select *
from employee_demographics;

select *
from employee_demographics
where gender != 'Male'
;

select *
from employee_demographics
where birth_date > '1984-01-01'
;

# OR, AND, NOT logical operator

select *
from employee_demographics
where gender != 'Male ' and gender !='Female '
;

select *
from employee_demographics
where  birth_date > '1988-01-01'
or not gender = 'Male'
;
select *
from employee_demographics
where  (birth_date > 1988-01-01 and first_name = 'Ann')
or not gender = 'Male';

select *
from employee_demographics
where  (first_name = 'Ann' and age = 35) or age > 55
;


#LIKE Statement
select *
from employee_demographics
where  first_name like 'Jer%'
;

select *
from employee_demographics
where  first_name like '%Jer%'
;

select *
from employee_demographics
where  first_name like '%a%'
;

select *
from employee_demographics
where  birth_date like '1985%'
;







