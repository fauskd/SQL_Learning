select * from series;
select * from reviews;
select * from reviewers;

select title, rating
from series as s 
join reviews as r
on s.id = r.series_id;


select title, avg(rating) as avg_ratings
from series as s
join reviews as r
on s.id = r.series_id
group by s.id
order by avg_ratings;



SELECT first_name,last_name
FROM reviewers
JOIN reviews ON reviewers.id = reviews.reviewer_id;


SELECT title AS unreviewed_series
FROM series
LEFT JOIN reviews ON series.id = reviews.series_id
WHERE reviews.id IS NULL;



SELECT genre, ROUND(AVG(rating),2) AS avg_rating
FROM series
JOIN reviews ON series.id = reviews.series_id
GROUP BY genre;



SELECT first_name,last_name,
	COUNT(rating) AS 'COUNT', 
	IFNULL(MIN(rating),0) AS 'MIN', 
	IFNULL(MAX(rating),0) AS 'MAX', 
	IFNULL(ROUND(AVG(rating),2),0) AS 'AVG',
	CASE
		WHEN COUNT(rating) > 10 THEN 'POWER USER'
		WHEN COUNT(rating) > 0 THEN 'ACTIVE'
		ELSE 'INACTIVE'
	END AS 'STATUS'
FROM reviewers
LEFT JOIN reviews ON reviewers.id = reviews.reviewer_id
GROUP BY reviewers.id;


SELECT title,rating,CONCAT(first_name,' ',last_name) AS 'reviewer'
FROM series
JOIN reviews ON series.id = reviews.series_id
JOIN reviewers ON reviewers.id = reviews.reviewer_id
ORDER BY title, rating DESC;