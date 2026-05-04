-- create a new table
create table if not exists shirts(
shirt_id int auto_increment not null primary key,
articles varchar(100),
color varchar(100),
shirt_size varchar(10),
last_worn int
);

-- insert values into table
insert into shirts(articles, color, shirt_size, last_worn)
values ('t-shirt', 'white', 'S', 10),
('t-shirt', 'green', 'S', 200),
('polo shirt', 'black', 'M', 10),
('tank top', 'blue', 'S', 50),
('t-shirt', 'pink', 'S', 0),
('polo shirt', 'red', 'M', 5),
('tank top', 'white', 'M', 15),
('tank top', 'blue', 'S', 200);

select * from shirts;

-- add new shirt as purple polo shirt, size M, last_worn 50
insert into shirts(articles, color, shirt_size, last_worn)
values('polo shirt', 'purple', 'M', 50);

-- give articles and name only
select articles, color from shirts;

-- select all medium shirts
select * from shirts 
where shirt_size = 'M';

-- change size L for polo shirts
update shirts 
set shirt_size = 'L'
where articles = 'polo shirt';

select * from shirts;

-- update the shirt last worn 15 days ago change last worn to 0
update shirts
set last_worn = 0
where last_worn = 15;

-- alter tables shirt size
alter table shirts
modify column shirt_size varchar(2);

-- need change for the color white: change size to XS and color to off white
update shirts
set color = 'off white',
	shirt_size = 'XS'
where color = 'white';

select * from shirts;

-- delete all shirts where last worn 200 days ago
delete from shirts
where last_worn = 200;

select * from shirts;

-- delete all tank tops
delete from shirts 
where articles = 'tank top';

select * from shirts;

-- delete all shirts
delete from shirts;
select * from shirts;

