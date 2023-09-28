create table customer_orders1 (
order_id integer,
customer_id integer,
order_date date,
order_amount integer
);

insert into customer_orders1 values(1,100,cast('2022-01-01' as date),2000),(2,200,cast('2022-01-01' as date),2500),(3,300,cast('2022-01-01' as date),2100)
,(4,100,cast('2022-01-02' as date),2000),(5,400,cast('2022-01-02' as date),2200),(6,500,cast('2022-01-02' as date),2700)
,(7,100,cast('2022-01-03' as date),3000),(8,400,cast('2022-01-03' as date),1000),(9,600,cast('2022-01-03' as date),3000)
;

select * from customer_orders1;

WITH first_visit AS
(
  SELECT 
    customer_id
    ,MIN(order_date) AS first_visit_date
  FROM customer_orders1
  GROUP BY customer_id
),
visit_flag AS 
(
SELECT 
  co.*, 
  fv.first_visit_date,
  CASE WHEN fv.first_visit_date = co.order_date THEN 1 ELSE 0 END AS first_visit_flag,
  CASE WHEN fv.first_visit_date != co.order_date THEN 1 ELSE 0 END AS repeat_visit_flag
FROM first_visit fv
INNER JOIN customer_orders1 co ON co.customer_id = fv.customer_id
)
SELECT
  order_date,
  SUM(first_visit_flag) AS no_of_new_customers,
  SUM(repeat_visit_flag) AS no_of_repeated_customers
FROM visit_flag  
GROUP BY order_date
ORDER BY order_date;
