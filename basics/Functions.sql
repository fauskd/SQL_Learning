#Functions (COUNT, SUM,AVG, MIN, MAX)
select count(student_id) from students where fees > 5000;

select sum(fees) as total_fees from students;

select avg(fees) as avg_fees from students;

select max(age) from students;

select min(age) from students;
