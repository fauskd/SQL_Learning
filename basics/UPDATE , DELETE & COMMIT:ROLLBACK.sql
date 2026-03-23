#UPDATE , DELETE & COMMIT/ROLLBACK
update students set age = 30
where student_id = 3;

delete from students 
where student_id = 3;

select * from students;
commit;