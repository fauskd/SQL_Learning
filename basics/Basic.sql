#create a database
create database SQL_Learning;

#use
use SQL_Learning;



#create a table
create table users
(
id int unsigned,
name varchar(100),
age int unsigned,
email varchar(150),
password varchar(100),
contact varchar(15),
address text,
dob date,
gender enum('M', 'F', 'O'),
status boolean
);


#insert data
insert into users
(id, name, age, email, password, contact, address, dob, gender, status)
values 
(1, 'John', 34, 'john@gmail.com', '12345', '987654321', 'Faridpur', '1996-02-14', 'M', 1),
(2, 'Johny', 23, 'johny@gmail.com', '12345', '987654321', 'Faridpur', '1996-02-14', 'M', 1),
(3, 'Jenny', 43, 'jenny@gmail.com', '12345', '987654321', 'Pabna', '1996-02-07', 'M', 1),
(4, 'Sujon', 53, 'sujon@gmail.com', '12345', '987654321', 'Demra', '1996-02-28', 'M', 1),
(5, 'Pushpa', 43, 'pushpa@gmail.com', '12345', '987654321', 'Demra', '1996-03-06', 'F', 1);

#Another way to insert data where we don't have to mention columns names
insert into users
values 
(6, 'Demo', 45, 'demo@gmail.com', '12345', '987654321', 'Faridpur', '1996-04-14', 'M', 1),
(7, 'Test', 67, 'test@gmail.com', '12345', '987654321', 'Pabna', '1996-05-07', 'M', 1),
(8, 'Prio', 54, 'prio@gmail.com', '12345', '987654321', 'Kola', '1996-07-28', 'M', 1),
(9, 'Anjali', 25,'anjali@gmail.com', '12345', '987654321', 'Haba', '1996-01-06', 'F', 1);


#how to select columns
#first for all columns
select * from users;

#select multiple columns
select id, name, age from users;


#using alias to give name of a column
select id, name as first_name, age from users;


#where clause for using conditional approach
select id, name as first_name, age from users
where age = 34;










