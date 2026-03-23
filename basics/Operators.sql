#Operators (AND, OR, NOT, IN, LIKE, BETWEEN, NOT BETWEEN)
select * from students
where age >=21 and age <= 43 and address = 'Faridpur';

select * from students
where not age <=21  and not address = 'Pabna';

select * from students
where  age = 23 or age = 43 or age = 67;

select * from students
where  age in (23, 43, 67);

select name, age from students where name like 'a%';
select name, age from students where name like '%a';
select name, age from students where name like '%j%';
select name, age from students where name like 'a_%';
select name, age from students where name like 'j__%';
select name, age from students where name like 'a%l';

select * from students where age between 23 and 43;
select * from students where age not between 23 and 43;
