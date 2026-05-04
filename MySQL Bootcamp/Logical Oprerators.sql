-- IN or Not in

-- select all books not published in 2017
select * from books
where released_year not in(2017);

-- another way to find out 
select * from books
where released_year != 2017 or pages >400;

-- between

-- select books name published between 1985 to 1995
select title, released_year from books
where released_year between 1985 and 1995;

-- another way
select title, released_year from books
where released_year < 1995 and released_year >= 1985;

-- select books whose title names do not start with w
select * from books
where title not like 'w%';

-- select books written by Dave Eggers and published after the year 2010
select * from books
where author_fname = 'Dave'
and author_lname = 'Eggers'
and released_year > 2010;

-- or operator and in 
select * from books
where author_fname = 'Dave'
|| released_year > 2010;

-- select books written by 'Carver', 'Lahiri', 'Smith'
select * from books
where author_lname in ('Carver', 'Lahiri', 'Smith');



-- case and when operator
select title, stock_quantity,
case
	when stock_quantity >100 then '***'
    when stock_quantity >=50 and stock_quantity <= 100 then '**'
    else '*'
end as stock
from books;

select title, stock_quantity,
case
	when stock_quantity between 0 and 50 then '*'
    when stock_quantity between 50 and 100 then '**'
    else '***'
end as stock
from books;

-- another way
select title, stock_quantity,
case 
	when stock_quantity <= 50 then '*'
    when stock_quantity <= 100 then '**'
    else '***'
end as stock_star
from books;

-- select all books written before 1980
select * from books
where released_year < 1980;

-- select all books written by 'Egger' or 'Chabon' last name
select * from books
where author_lname in('Eggers', 'Chabon');

-- select all books written By 'Lahiri' and published after 2000
select * from books
where author_lname = 'Lahiri'
and released_year > 2000;

-- select all books with page counts between 100 and 200
select * from books
where pages between 100 and 200;

-- select all books whose author lname starts with 'C' or 'S'
select * from books
where author_lname like 'C%' or author_lname like 'S%';


-- If title contains 'stories'   -> Short Stories, Just Kids and A Heartbreaking Work  -> Memoir
-- Everything Else -> Novel
SELECT title,author_lname,
	CASE
		WHEN title LIKE '%stories%' THEN 'Short Stories'
		WHEN title = 'Just Kids' OR title = 'A Heartbreaking Work of Staggering Genius' THEN 'Memoir'
		ELSE 'Novel'
	END AS 'TYPE'
FROM books;