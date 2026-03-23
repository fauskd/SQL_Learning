#constraints (NOT NULL, UNIQUE, DEFAULT, CHECK, FOREIGN KEY, PRIMARY KEY )
create table students
(
id int not null unique,
name varchar(100) not null,
email varchar(150) not null unique,
age tinyint check (age >= 18),
status boolean default 1
);

insert into students
(id, name, email, age) 
values 
(3, 'Kamal', 'kamal@gmail.com', 19),
(4, 'Puspa', 'puspa@gmail.com', 20),
(5, 'Reddy', 'reddy@gmail.com', 26),
(6, 'Dighi', 'dighi@gmail.com', 21), 
(7, 'Ajay', 'ajay@gmail.com', 25),
(8, 'Dev', 'dev@gmail.com', 30),
(9, 'Sanu', 'sanu@gmail.com', 31),
(10, 'Tom', 'tom@gmail.com', 35);






