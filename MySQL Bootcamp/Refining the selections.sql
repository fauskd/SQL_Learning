select * from books;

-- insert more data into the table
insert into books(title, author_fname, author_lname, released_year, stock_quantity, pages)
values ('10% Happier', 'Dan', 'Harris', 2014, 29, 256), 
           ('fake_book', 'Freida', 'Harris', 2001, 287, 428),
           ('Lincoln In The Bardo', 'George', 'Saunders', 2017, 1000, 367);
           
-- distinct name
select distinct(author_lname) from books;
select count(*) from books;

select distinct(concat(author_fname, ' ', author_lname)) as full_name
from books;

-- Order by
select author_lname from books order by author_lname desc;

select released_year from books
order by released_year desc;

select title, author_fname, author_lname from books
order by author_fname;

-- Limit
select title, author_fname, author_lname
from books
order by author_fname, author_lname
limit 5;

select title, released_year from books
order by released_year desc
limit 0, 2;

-- like
select * from books
where author_fname like '%a';

select * from books
where author_fname like '%t%';

select * from books
where author_fname like 'D__';

select * from books
where stock_quantity like '___';

-- title contains 'stories'
select * from books
where title like '%stories%';

-- find the longest book
select title, pages from books
order by pages desc
limit 1;

-- select most recent book title and year
select concat(title, '--', released_year) as summary
from books 
order by released_year desc
limit 3;

-- find the books whose author_lname contains space
select title, author_lname from books
where author_lname like '% %';

-- Find The 3 Books With The Lowest Stock Select title, year, and stock
select title, released_year, stock_quantity from books
order by stock_quantity asc
limit 3;

-- Print title and author_lname, sorted first by author_lname and then by title
select title, author_lname from books
order by 2, 1;

select concat('My fagourite Author is:', ' ', upper(author_fname), ' ', upper(author_lname)) as str
from books;

-- Aggregate Functions

-- how many books in the dataset
select count(*) from books;

-- how many author fnames
select count(distinct(author_fname)) from books;

-- how many author lnames
select count(distinct(author_lname)) from books;

-- how many titles contain 'the'
select count(*) from books
where title like '%the%';

-- count how many books each author has written
select concat(author_fname, author_lname) as full_name,
count(*) as num_of_books
from books
group by full_name
order by num_of_books desc;

-- books count by released year
select released_year, count(*) as num_of_books
from books
group by released_year
order by num_of_books desc;

-- find minimum released year
select min(released_year) from books;

-- longest books with 2 queries
select * from books
where pages = (select max(pages) from books);

-- faster way
select * from books
order by pages desc
limit 1;

-- select each author public their first book
select concat(author_fname, ' ', author_lname) as full_name,
min(released_year) from books
group by 1;

-- find the longest pages books
select concat(author_fname, ' ', author_lname) as full_name,
max(pages) from books
group by 1;

-- sum of all pages
select sum(pages) as total_pages from books;

-- sum of all pages by each writer
select concat(author_fname, ' ', author_lname) as full_name,
sum(pages) from books
group by 1;

-- calculate average pages
select avg(pages) from books;

-- select average stock according to the released year
select released_year, avg(stock_quantity) from books
group by released_year
order by released_year desc;

-- how many books were released in each year
select released_year, count(*) as num_of_books
from books
group by 1
order by 1 desc;

-- sum of stocks
select sum(stock_quantity) as total_stocks
from books;

-- full name and average pages
select released_year as 'year',
count(*) as books,
avg(pages) as avg_pages from books
group by 1
order by 3 desc;
