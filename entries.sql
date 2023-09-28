create table entries ( 
name varchar(20),
address varchar(20),
email varchar(20),
floor int,
resources varchar(10));

insert into entries 
values ('A','Bangalore','A@gmail.com',1,'CPU'),('A','Bangalore','A1@gmail.com',1,'CPU'),('A','Bangalore','A2@gmail.com',2,'DESKTOP')
,('B','Bangalore','B@gmail.com',2,'DESKTOP'),('B','Bangalore','B1@gmail.com',2,'DESKTOP'),('B','Bangalore','B2@gmail.com',1,'MONITOR')

select * from entries;

-- step 1
WITH floor_visit AS 
(
  SELECT
    name,
    floor,
    count(1) AS no_of_floor_visited,
    RANK() OVER (PARTITION BY name ORDER BY COUNT(1) DESC) AS rank
  FROM entries
  GROUP BY name, floor
)
SELECT * FROM floor_visit

-- step 2:
WITH floor_visit AS 
(
  SELECT
    name,
    floor,
    count(1) AS no_of_floor_visited,
    RANK() OVER (PARTITION BY name ORDER BY COUNT(1) DESC) AS rank
  FROM entries
  GROUP BY name, floor
)
SELECT 
  name,
  floor AS most_visited_floor
FROM floor_visit fv
WHERE rank = 1

-- step 3: Using string_agg
SELECT 
  name,
  COUNT(1) as total_visits,
  array_join(collect_set(resources),",") as resource_used
FROM entries
GROUP BY name

-- step 4: Combine with above cte
WITH floor_visit AS 
(
  SELECT
    name,
    floor,
    count(1) AS no_of_floor_visited,
    RANK() OVER (PARTITION BY name ORDER BY COUNT(1) DESC) AS rank
  FROM entries
  GROUP BY name, floor
),
total_visits AS 
(
  SELECT 
  name,
  COUNT(1) as total_visits,
  array_join(collect_set(resources),",") as resource_used
FROM entries
GROUP BY name
)
SELECT 
  fv.name,
  floor AS most_visited_floor,
  tv.total_visits,
  tv.resource_used
FROM floor_visit fv
INNER JOIN total_visits tv ON  fv.name = tv.name
WHERE rank = 1
