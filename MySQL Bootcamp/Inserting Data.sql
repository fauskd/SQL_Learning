-- create a table named employee 
create table employee(
id int auto_increment not null primary key,
last_name varchar(100) not null,
first_name varchar(100) not null,
age int not null,
status varchar(150));


-- insert values into the table created
insert into employee(last_name, first_name, age, status)
values('Richard', 'Johnson', 30, 'Employed'),
('Jessica', 'Wong', 26, 'Student');

select * from employee;