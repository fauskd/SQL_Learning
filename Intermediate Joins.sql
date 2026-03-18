# inner join

SELECT * 
FROM employee_demographics as dem
inner join employee_salary as sal
on sal.employee_id = dem.employee_id
;

select dem.employee_id, age, occupation
from employee_demographics as dem
inner join employee_salary as sal
on dem.employee_id = sal.employee_id;

# outer join
SELECT * 
FROM employee_demographics as dem
left join employee_salary as sal
on sal.employee_id = dem.employee_id
;
SELECT * 
FROM employee_demographics as dem
right join employee_salary as sal
on sal.employee_id = dem.employee_id
;

# Self join

select * 
from employee_salary as emp1
join employee_salary as emp2
on emp1.employee_id = emp2.employee_id
;

select * 
from employee_salary as emp1
join employee_salary as emp2
on emp1.employee_id +1 = emp2.employee_id
;

select emp1.employee_id as emp_id_santa,
emp1.first_name as emp_f_name_santa,
emp1.last_name as emp_l_name_santa,
emp2.employee_id as emp_id,
emp2.first_name as emp_f_name,
emp2.last_name as emp_l_name
from employee_salary as emp1
join employee_salary as emp2
on emp1.employee_id +1 = emp2.employee_id
;

#joining multiple tables together

select *
from employee_demographics as dem
inner join employee_salary as sal
on dem.employee_id = sal.employee_id
inner join parks_departments as dep
on sal.dept_id = dep.department_id
;













