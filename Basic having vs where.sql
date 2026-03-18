SELECT occupation, avg(salary) 
FROM employee_salary
where occupation like '%manager%'
group by occupation 
having avg(salary)>75000
;