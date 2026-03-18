#Subqueries
SELECT 
    *
FROM
    employee_demographics
WHERE
    employee_id IN (SELECT 
            employee_id
        FROM
            employee_salary
        WHERE
            dept_id = 1)
;


select first_name, salary, 
(select avg(salary)
from employee_salary
)
from employee_salary;










