create database test;
use test;

-- create table
create table employees(
employee_id int primary key auto_increment,
first_name varchar(50)not null,
last_name varchar(50) not null,
hire_date date default (current_date()),
email varchar(100) unique,
phone_number varchar(100) unique,
salary decimal(10,2) check(salary > 0.0),
employee_status enum('active', 'on leave', 'terminated') default 'active',
created_at timestamp default current_timestamp,
updated_at timestamp default current_timestamp on update current_timestamp
);

-- Alter table command
-- add
alter table employees
add column description text;

alter table employees
add column location varchar(50) not null;

-- rename
alter table employees
rename column description to describe_all;

-- modify
alter table employees
modify column describe_all varchar(100) not null;