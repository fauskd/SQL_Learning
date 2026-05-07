-- first we create tables and insert values
CREATE TABLE students(
	id INT AUTO_INCREMENT PRIMARY KEY,
	first_name VARCHAR(150)
);


CREATE TABLE papers(
	title VARCHAR(150) NOT NULL,
	grade INT NOT NULL,
	student_id INT,
	FOREIGN KEY(student_id) REFERENCES students(id) ON DELETE CASCADE
);

INSERT INTO students (first_name) VALUES 
('Caleb'), ('Samantha'), ('Raj'), ('Carlos'), ('Lisa');

INSERT INTO papers (student_id, title, grade ) VALUES
(1, 'My First Book Report', 60),
(1, 'My Second Book Report', 75),
(2, 'Russian Lit Through The Ages', 94),
(2, 'De Montaigne and The Art of The Essay', 98),
(4, 'Borges and Magical Realism', 89);



select * from students;
select * from papers;


select first_name, title, grade
from students as s 
join papers as p
on s.id = p.student_id
order by grade desc;

select first_name, title, grade
from students as s 
left join papers as p
on s.id = p.student_id;


select first_name,
ifnull(grade, 0),
ifnull(title, 'Missing')
from students as s
left join papers as p
on s.id = p.student_id;



select first_name,
ifnull(avg(grade), 0) as average
from students as s
left join papers as p
on s.id = p.student_id
group by s.id
order by average desc;


select first_name,
ifnull(avg(grade), 0) as average,
case
when avg(grade) >= 75 then 'Passing'
when avg(grade) is null then 'Failing'
else 'Failing' 
end as passing_status
from students as s
left join papers as p
on s.id = p.student_id
group by s.id
order by avg(grade) desc;