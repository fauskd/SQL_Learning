-- create a table as cats
create table cats(
cat_id int not null primary key auto_increment,
name varchar(100),
breed varchar(100),
age int);


-- insert values into table
insert into cats(name, breed, age)
values('Ringo', 'Tabby', 4),
('Cindy', 'Maine Coon', 10),
('Dubledore', 'Maine Coon', 11),
('Egg', 'Persian', 4),
('Misty', 'Tabby', 14),
('George Michael', 'Ragdoll', 9),
('Jackson', 'Sphynx', 7);

select * from cats;

-- CRUD (Create, Read, Update and Delete) Commands

-- only cat_id
select cat_id from cats;

-- name and breed columns
select name, breed from cats;

-- just Tabby breed cats only
select name, age from cats
where breed = 'Tabby';


-- cat_id is equal to age
select name, age from cats 
where cat_id = age;

-- update name Jackson to Jack
update cats
set name = 'Jack'
where name = 'Jackson';

select name from cats;

-- change Ringo's breed to 'British Shorthair'
update cats
set breed = 'British Shorthair'
where name = 'Ringo';

select * from cats;

-- change both Maine Coon's age to be 12
update cats
set age = 12
where breed = 'Maine Coon';

select * from cats;

-- Delete all 4 years old cats
delete from cats where age = 4;
select * from cats;

-- delete cats whose age is equal to cat_id
delete from cats where age = cat_id;
select * from cats;  

-- delete all cats
delete from cats;
select * from cats;



