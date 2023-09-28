create table icc_world_cup_2
(
Team_1 Varchar(20),
Team_2 Varchar(20),
Winner Varchar(20)
);
INSERT INTO icc_world_cup_2 values('India','SL','India');
INSERT INTO icc_world_cup_2 values('SL','Aus','Aus');
INSERT INTO icc_world_cup_2 values('SA','Eng','Eng');
INSERT INTO icc_world_cup_2 values('Eng','NZ','NZ');
INSERT INTO icc_world_cup_2 values('Aus','India','India');

select * from icc_world_cup_2;

with winner_details as
(
	select 
		team_1  as team_name,
		CASE WHEN team_1=winner then 1 else 0 end as winner_flag 
	from icc_world_cup_2 
	UNION ALL
	SELECT 
		team_2 as team_name,
		CASE WHEN team_2=winner then 1 else 0 end as winner_flag
	FROM icc_world_cup_2 
)
SELECT 
	team_name,
	count(*) as no_of_matches_played,
	sum(winner_flag) as no_of_matches_won,
	count(*) - sum(winner_flag) as no_of_matches_loss
FROM winner_details
group by team_name
order by no_of_matches_won desc
