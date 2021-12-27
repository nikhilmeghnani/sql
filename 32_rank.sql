-- Write a SQL query to get the output as shown in the Output tables

-- -- Input:
-- #	EmpName	DeptName	DeptNo	Salary
-- 1	Mark	HR	        101	    30,000
-- 2	John	Accountant	101	    20,000
-- 3	Smith	Analyst	    101	    25,000
-- 4	Donald	HR	        201	    40,000
-- 5	James	Analyst	    201	    22,000
-- 6	Maria	Analyst	    201	    38,000
-- 7	David	Manager	    201	    33,000
-- 8	Martin	Analyst	    301	    22,000
-- 9	Robert	Analyst	    301	    56,000
-- 10	Michael	Manager	    301	    34,000
-- 11	Robert	Accountant	301	    37,000
-- 12	Michael	Analyst	    301	    28,000

-- output
-- #	empname		deptname		deptno	salary
-- 1	John		Accountant		101		20,000
-- 2	Mark		HR				101		30,000
-- 3	James		Analyst			201		22,000
-- 4	Donald		HR				201		40,000
-- 5	Martin		Analyst			301		22,000
-- 6	Robert		Analyst			301		56,000

with cte_emp as
(
select empname, deptname, deptno, salary,
RANK() OVER (PARTITION BY deptno ORDER BY salary desc) AS rank_from_top,
RANK() OVER (PARTITION BY deptno ORDER BY salary asc) AS rank_from_bottom
from Employee_2
)
SELECT empname, deptname, deptno, salary FROM cte_emp
WHERE rank_from_top = 1 or rank_from_bottom = 1
ORDER BY deptno, salary


Create Table Employee_2(
EmpName Varchar(30),
DeptName Varchar(25),
DeptNo Bigint,
Salary Bigint);

Insert into Employee_2 Values('Mark','HR',101,30000);
Insert into Employee_2 Values('John','Accountant',101,20000);
Insert into Employee_2 Values('Smith','Analyst',101,25000);
Insert into Employee_2 Values('Donald','HR',201,40000);
Insert into Employee_2 Values('James','Analyst',201,22000);
Insert into Employee_2 Values('Maria','Analyst',201,38000);
Insert into Employee_2 Values('David','Manager',201,33000);
Insert into Employee_2 Values('Martin','Analyst',301,22000);
Insert into Employee_2 Values('Robert','Analyst',301,56000);
Insert into Employee_2 Values('Michael','Manager',301,34000);
Insert into Employee_2 Values('Robert','Accountant',301,37000);
Insert into Employee_2 Values('Michael','Analyst',301,28000);



