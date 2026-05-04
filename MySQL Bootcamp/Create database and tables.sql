-- create database
create database mysql_bootcamp;
use mysql_bootcamp;

-- create table
create table if not exists pastries(
name varchar(50) primary key not null,
quantity int default 0);

show tables;
desc pastries;
drop table pastries;
show tables;