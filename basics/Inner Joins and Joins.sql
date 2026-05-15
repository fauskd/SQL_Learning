create database Joins;
use joins;

-- Inner join or join returns rows only those who are matched.
-- One problem we can't find missing value with inner join or join.

-- First we will learn One To One relations

-- we create tables and insert values to the tables (for One To One )

create table authors(
author_id int primary key,
first_name varchar(50),
last_name varchar(50),
birth_year int
);

create table books(
book_id int primary key,
title varchar(100),
author_id int,
publication_year int,
price decimal(6,2)
);


insert into authors(author_id, first_name, last_name, birth_year)
values (1, 'Jane', 'Austen', 1775),
    (2, 'George', 'Orwell', 1903),
    (3, 'Ernest', 'Hemingway', 1899),
    (4, 'Agatha', 'Christie', 1890),
    (5, 'J.K.', 'Rowling', 1965);
    
    
insert into books(book_id, title, author_id, publication_year, price)
values (101, 'Pride and Prejudice', 1, 1813, 12.99),
    (102, '1984', 2, 1949, 14.50),
    (103, 'Animal Farm', 2, 1945, 11.75),
    (104, 'The Old Man and the Sea', 3, 1952, 10.99),
    (105, 'Murder on the Orient Express', 4, 1934, 13.25),
    (106, 'Death on the Nile', 4, 1937, 12.50),
    (107, 'Emma', 1, 1815, 11.99),
    (108, 'For Whom the Bell Tolls', 3, 1940, 15.75);
    
    
-- now check the result

select * from authors;
select * from books;

-- Now we will see the inner join or only join. because both are same.

select * from authors
join books
on authors.author_id = books.author_id;

-- replace the tables
select * from books
join authors
on books.author_id = authors.author_id; -- it returs all rows accept 5 author_id.

select * from books
inner join authors
on books.author_id = authors.author_id; -- so inner join also return the same result.


-- try it more smartly
select * from books
join authors
using(author_id); -- so when we use (using), it returns without multiple author_id.


-- now we try for specific columns
select books.book_id, authors.first_name, authors.birth_year
from authors 
join books
on authors.author_id = books.author_id;

-- Retrieve books with their author's information with conditions and ordering
-- Retrive books with there author's fullname, birth_year, but published after 1940.

select title, concat(first_name, ' ', last_name) as full_name, birth_year, publication_year 
from authors
inner join books
on authors.author_id = books.author_id
where books.publication_year > 1940;

-- How many books each author has written

select first_name, last_name, title
from authors
inner join books
on authors.author_id = books.author_id
group by authors.author_id;  -- this code will give us an error

-- Right code for this
select  a.first_name, a.last_name, count(*) as book_count
from authors as a
inner join books as b
on a.author_id = b.author_id
group by a.author_id;

-- If there are many tables, then how to use inner join or join?
-- For that we will create more two tables to understand
-- This is called Many To Many relations

-- So we need more tables to do this 

CREATE TABLE categories (
    category_id INT PRIMARY KEY,
    category_name VARCHAR(50)
);

INSERT INTO categories (category_id, category_name)
VALUES 
    (1, 'Fiction'),
    (2, 'Classic'),
    (3, 'Romance'),
    (4, 'Political'),
    (5, 'Mystery'),
    (6, 'Adventure');


CREATE TABLE book_categories (
    book_id INT,
    category_id INT,
    PRIMARY KEY (book_id, category_id)
);

INSERT INTO book_categories (book_id, category_id)
VALUES 
    (101, 1), (101, 2), (101, 3), -- Pride and Prejudice: Fiction, Classic, Romance
    (102, 1), (102, 2), (102, 4), -- 1984: Fiction, Classic, Political
    (103, 1), (103, 2), (103, 4), -- Animal Farm: Fiction, Classic, Political
    (104, 1), (104, 2), (104, 6), -- The Old Man and the Sea: Fiction, Classic, Adventure
    (105, 1), (105, 5), -- Murder on the Orient Express: Fiction, Mystery
    (106, 1), (106, 5), -- Death on the Nile: Fiction, Mystery
    (107, 1), (107, 2), (107, 3), -- Emma: Fiction, Classic, Romance
    (108, 1), (108, 2), (108, 6); -- For Whom the Bell Tolls: Fiction, Classic, Adventure


select * from books as b
inner join authors as a
on b.author_id = a.author_id
inner join book_categories as bc -- we can use (inner join) like this way
on b.book_id = bc.book_id -- we will join another table
inner join categories as c
on bc.category_id = c.category_id;

-- For the specific columns
select b.title, 
a.first_name, 
a.last_name, 
c.category_name
from books as b
inner join authors as a
on b.author_id = a.author_id
inner join book_categories as bc
on b.book_id = bc.book_id 
inner join categories as c
on bc.category_id = c.category_id;

-- using group by or group_concat
select b.title, 
a.first_name, 
a.last_name, 
group_concat(c.category_name separator ', ') as book_genre -- we use group_concat, because we have two columns which are needed to group by
from books as b
inner join authors as a
on b.author_id = a.author_id
inner join book_categories as bc
on b.book_id = bc.book_id 
inner join categories as c
on bc.category_id = c.category_id
group by b.book_id;


-- Filtering during join and after join
-- Return books published before 1950 and author's birth_year before 1900
-- Before join
select b.title, a.last_name, a.birth_year, b.publication_year
from authors as a
join books as b
on a.author_id = b.author_id
and b.publication_year < 1950
and a.birth_year < 1900;


-- After join
select b.title, a.last_name, a.birth_year, b.publication_year
from authors as a
join books as b
on a.author_id = b.author_id
where b.publication_year < 1950
and a.birth_year < 1900;

-- Return books published more than 70 years ago;
select b.title, a.last_name, b.publication_year
from authors as a
inner join books as b
on a.author_id = b.author_id
where year(curdate()) - b.publication_year > 70;


-- Find authors who have written more than one book
select a.first_name, count(*) as count_book
from books as b
join authors as a
on a.author_id = b.author_id
group by b.author_id
having count_book >1; -- Because we can not use where clause in count(*)