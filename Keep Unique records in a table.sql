select * from [Tutorial].[Marks];
--=========Keep Unique Records==================
--Add a row id column
ALTER table [Tutorial].[Marks] Add  RW_ID integer;

---CTE to create a virtual row number
with CTE
as 
(select Marks.*,ROW_NUMBER() over (order by student_id) as RW_CNT from [Tutorial].[Marks] AS Marks)

--use result of cte to update the rw_id
UPDATE [Tutorial].[Marks]
SET 
[Tutorial].[Marks].RW_ID=CTE.RW_CNT
FROM [Tutorial].[Marks]
INNER JOIN
CTE
ON [Tutorial].[Marks].Student_ID= CTE.student_id;

delete from [Tutorial].[Marks] where RW_ID not in (select max(rw_id) from [Tutorial].[Marks] group by Student_ID);

alter table [Tutorial].[Marks] drop column RW_ID;