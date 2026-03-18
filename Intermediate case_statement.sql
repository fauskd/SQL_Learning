#case statements
SELECT 
    first_name,
    last_name,
    CASE
        WHEN age <= 30 THEN 'Young'
        WHEN age BETWEEN 31 AND 50 THEN 'Old'
        WHEN age >= 50 THEN 'On the death door'
    END AS age
FROM
    employee_demographics;


#pay increase and bonus and < 50000 = 5% and >50000= 7% and finance = 10% bonus

select first_name, last_name, salary,
case
when salary<50000 then salary * 1.05
when salary>50000 then salary * 1.07
end as with_bonus,
case
when dept_id = 6 then salary * 0.10
end as bonus
from employee_salary;
