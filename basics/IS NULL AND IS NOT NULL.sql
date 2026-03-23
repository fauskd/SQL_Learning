#SYNTEX (IS NULL/IS NOT NULL)
select * from students where address is null;
select * from students where address is not null;
select * from students where (email is null) 
or 
(address is null);