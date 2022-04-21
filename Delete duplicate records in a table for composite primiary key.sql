--=========Remove Duplicate Records==================
--Prepare data:
drop table Tutorial.Marks_By_College;
Create table Tutorial.Marks_By_College
(
College_ID varchar(5),
Student_ID varchar(5),
Student_Name varchar(25),
Student_Department varchar(25),
Marks int
);

insert into Tutorial.Marks_By_College values ('1','1','Tommy','Electronics','90');
insert into Tutorial.Marks_By_College values ('1','2','Hary','Electricals','70');
insert into Tutorial.Marks_By_College values ('1','3','Richard','IT','60');
insert into Tutorial.Marks_By_College values ('2','1','Dany','IT','95');
insert into Tutorial.Marks_By_College values ('2','2','Racheal','Electronics','84');
insert into Tutorial.Marks_By_College values ('2','3','Joss','Electrical','72');
insert into Tutorial.Marks_By_College values ('1','1','Tommy','Electronics','90');

select * from Tutorial.Marks_By_College order by 1 asc;

--delete duplicate records
delete from Tutorial.Marks_By_College
	where exists  
	(
--find duplicate records	
	SELECT College_ID, Student_ID fROM
	(select College_ID, Student_ID, COUNT(*) AS cnt
	from Tutorial.Marks_By_College group by College_ID,Student_ID HAVING COUNT(*)>1) AS A
--
	where Tutorial.Marks_By_College.college_id=a.college_id 
	and Tutorial.Marks_By_College.student_id=a.student_id);

select * from Tutorial.Marks_By_College;

