-- ITEM Table  has two columns namely ItemName and TotalQuantity. 
-- Write a SQL query  to duplicate the rows based on total count in output table by adding two new columns ID and CatID

-- #	ItemName	TotalQuantity
-- 1	Apple	2
-- 2	Orange	3

-- #	id	itemname	catid	totalquantity
-- 1	1	Apple	1	2
-- 2	2	Apple	2	2
-- 3	3	Orange	1	3
-- 4	4	Orange	2	3
-- 5	5	Orange	3	3

Create Table Item(
ItemName Varchar(30),
TotalQuantity int
)
Insert into Ite m Values('Apple',2)
Insert into Item Values('Orange',3)

with cte_a(itemname, catid, totalquantity) as
(
select itemname, 1, totalquantity from item
union all
select ItemName, catid + 1, TotalQuantity from cte_A
where catid + 1 <= TotalQuantity 
)
--select * from cte_a
select ROW_NUMBER() OVER (ORDER BY ItemName) AS id, ItemName, catid, TotalQuantity from cte_A
order by ItemName; 

