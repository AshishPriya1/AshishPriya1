/*=======================================================================================================
											RANK FUNCTIONS
=======================================================================================================*/
/*========================DATA PREPARATION==============================================================*/
--CREATE TABLE EMPLOYEE
CREATE Table Tutorial.Employee (
Employee_ID int,
Employee_Name varchar(255),
Salary int
);
---INSERTING DATA FOR PREPARATION
INSERT INTO Tutorial.Employee VALUES (1,'John',250000);
INSERT INTO Tutorial.Employee VALUES (2,'William',260000);
INSERT INTO Tutorial.Employee VALUES (3,'Andreas',260000);
INSERT INTO Tutorial.Employee VALUES (4,'Emily',230000);
INSERT INTO Tutorial.Employee VALUES (5,'Sunny',290000);
INSERT INTO Tutorial.Employee VALUES (6,'Mark',350000);
INSERT INTO Tutorial.Employee VALUES (7,'harry',260000);
INSERT INTO Tutorial.Employee VALUES (8,'Sony',290000);
INSERT INTO Tutorial.Employee VALUES (9,'Sammy',350000);

Select * from Tutorial.Employee;

/*=======================QUESTION 1 : Top 5 Employee by Salary=========================================*/

--#1 : use of top
select top 5 employee_id,employee_name,Salary from Tutorial.Employee order by Salary desc;

--#2 : use of rank
Select * from (
				select employee_id,employee_name,Salary, RANK() OVER (ORDER BY SALARY DESC) RNK from Tutorial.Employee
			  ) Employee
where RNK<=5;

--#3 : use of dense_rank
Select * from (
				select employee_id,employee_name,Salary, DENSE_RANK() OVER (ORDER BY SALARY DESC) RNK from Tutorial.Employee 
			  ) Employee
where RNK<=5;

--#4 : use of rownumber
Select * from (
				select employee_id,employee_name,Salary, ROW_NUMBER() OVER (ORDER BY SALARY DESC) RNK from Tutorial.Employee 
			   ) Employee
where RNK<=5;

/*=======================QUESTION 2 : Second highest salaried employee==================================================*/
--#1 : Use of top

SELECT TOP 1 * FROM (
					SELECT TOP 2 * FROM Tutorial.Employee ORDER BY Salary DESC
					) as EMPLOYEE ORDER BY SALARY ASC;

--#2 : Use of rownumber
SELECT * FROM (
				select  employee_id,employee_name,Salary, ROW_NUMBER() OVER (ORDER BY SALARY DESC) AS RNK from Tutorial.Employee 
			  ) AS EMPLOYEE
WHERE RNK=2;



