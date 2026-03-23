#LIMIT AND OFFSET
select * from students order by name asc
limit 2;
select * from students where age>31
limit 2;

select * from students
limit 10 offset 2;