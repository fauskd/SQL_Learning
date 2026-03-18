#String functions
select length('demographics') as length;

select first_name, length(first_name) as length
from employee_demographics
order by length;

select upper('demographics') as length;


#Trim
select first_name, 
left(first_name, 3) as left_3,
right(first_name, 3) as left_3,
substring(first_name, 2,3) as sel, 
birth_date, 
substring(birth_date, 6,2) as month
from employee_demographics;


#replace
select first_name, replace(first_name, 'a', 'z') as rep
from employee_demographics;

#locate
select first_name, locate('an', first_name) as loc
from employee_demographics;

#concate
select first_name, last_name,
concat(first_name, ' ', last_name) as full_name
from employee_demographics;





