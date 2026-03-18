#Unions
SELECT age, gender 
FROM employee_demographics
union
SELECT first_name, last_name
FROM employee_salary;

SELECT first_name, last_name
FROM employee_demographics
union
SELECT first_name, last_name
FROM employee_salary;

SELECT first_name, last_name
FROM employee_demographics
union distinct
SELECT first_name, last_name
FROM employee_salary;

SELECT first_name, last_name
FROM employee_demographics
union all
SELECT first_name, last_name
FROM employee_salary;

SELECT first_name, last_name, 'old_man' as label
FROM employee_demographics
where age>50 and gender='Male'
union 
SELECT first_name, last_name, 'old_lady' as label
FROM employee_demographics
where age>40 and gender='Female'
union
SELECT first_name, last_name, 'highly paid employees' as label
FROM employee_salary
where salary>70000;




