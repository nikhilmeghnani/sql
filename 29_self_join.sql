------------------------------------------------------------------------------------------------
-- input
-- EmployeeID	EmployeeName	ManagerID
-- 100			Mark			103
-- 101			John			104
-- 102			Maria			103
-- 103			Tom				[NULL]
-- 104			David			103

------------------------------------------------------------------------------------------------
-- below will not include the null value
select e.employeename, m.employeename as managername
from employee_1 e
inner join employee_1 m 
where e.managerid = m.employeeid;

-- output:
-- employeename	managername
-- David			Tom
-- Maria			Tom
-- Mark			Tom
-- John			David
------------------------------------------------------------------------------------------------
select e.employeename, ifnull(m.employeename,'Boss') as managername
from employee_1 e
left join employee_1 m
on e.managerid = m.employeeid;

-- output:
-- employeename	managername
-- Mark			Tom
-- John			David
-- Maria			Tom
-- Tom				Boss
-- David			Tom
------------------------------------------------------------------------------------------------

Create Table Employee_1(
EmployeeID Varchar(20),
EmployeeName Varchar(20),
ManagerID varchar(20));

Insert Into Employee_1 Values(100,'Mark',103);
Insert Into Employee_1 Values(101,'John',104);
Insert Into Employee_1 Values(102,'Maria',103);
Insert Into Employee_1 Values(103,'Tom',NULL);
Insert Into Employee_1 Values(104, 'David',103);
------------------------------------------------------------------------------------------------
