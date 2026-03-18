#Stored procedures
create procedure large_salaries()
SELECT * 
FROM employee_salary
where salary >= 50000;

call large_salaries();