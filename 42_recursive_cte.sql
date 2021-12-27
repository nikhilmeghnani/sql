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
