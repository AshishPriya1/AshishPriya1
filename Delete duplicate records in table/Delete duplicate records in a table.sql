--=========Remove Duplicate Records==================
--Prepare data:
drop table Tutorial.Marks;
Create table Tutorial.Marks
(
Student_ID varchar(5),
Student_Name varchar(25),
Student_Department varchar(25),
Marks int
);

insert into Tutorial.Marks values ('1','Tommy','Electronics','90');
insert into Tutorial.Marks values ('2','Hary','Electricals','70');
insert into Tutorial.Marks values ('3','Richard','IT','60');
insert into Tutorial.Marks values ('4','Dany','IT','95');
insert into Tutorial.Marks values ('5','Racheal','Electronics','84');
insert into Tutorial.Marks values ('6','Joss','Electrical','72');
insert into Tutorial.Marks values ('1','Tommy','Electronic','90');

select * from Tutorial.Marks order by 1 asc;

--delete duplicate records
delete from Tutorial.Marks where Student_ID 
	in 
--find duplicate records
	(select Student_ID from Tutorial.Marks group by Student_ID having count(*)>1);

select * from Tutorial.Marks;