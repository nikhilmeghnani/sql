------------------------------------------------------------------------------------------------
-- Input table
-- Id		Product		Sales
-- 1,001	Keyboard	20
-- 1,002	Keyboard	25
-- 1,003	Laptop		30
-- 1,004	Laptop		35
-- 1,005	Laptop		40
-- 1,006	Monitor		45
-- 1,007	WebCam		50
-- 1,008	WebCam		55
------------------------------------------------------------------------------------------------
-- q1
select id, product,
min(sales) over (partition by product order by id) as sales_1
from sales1 s; 
-- output
-- id		product		sales_1
-- 1,001	Keyboard	20
-- 1,002	Keyboard	20
-- 1,003	Laptop		30
-- 1,004	Laptop		30
-- 1,005	Laptop		30
-- 1,006	Monitor		45
-- 1,007	WebCam		50
-- 1,008	WebCam		50
------------------------------------------------------------------------------------------------
-- q2
select id, product,
sum(sales) over (partition by product order by id) as sales_2
from sales1 s ;
-- output
-- id		product		sales_2
-- 1,001	Keyboard	20
-- 1,002	Keyboard	45
-- 1,003	Laptop		30
-- 1,004	Laptop		65
-- 1,005	Laptop		105
-- 1,006	Monitor		45
-- 1,007	WebCam		50
-- 1,008	WebCam		105
------------------------------------------------------------------------------------------------
Create Table Sales1
(
Id int,
Product Varchar(20),
Sales Bigint
);

Insert into Sales1 values(1001,'Keyboard',20);
Insert into Sales1 values(1002,'Keyboard',25);
Insert into Sales1 values(1003,'Laptop',30);
Insert into Sales1 values(1004,'Laptop',35);
Insert into Sales1 values(1005,'Laptop',40);
Insert into Sales1 values(1006,'Monitor',45);
Insert into Sales1 values(1007,'WebCam',50);
Insert into Sales1 values(1008,'WebCam',55);
------------------------------------------------------------------------------------------------
