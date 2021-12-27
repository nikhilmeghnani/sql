
-- input
-- #	studentname	subjects	marks
-- 1	David		English		85
-- 2	David		Maths		90
-- 3	David		Science		88
-- 4	John		English		75
-- 5	John		Maths		85
-- 6	John		Science		80
-- 7	Tom			English		83
-- 8	Tom			Maths		80
-- 9	Tom			Science		92

-- using pivot
select studentname, english, maths, science
from
(select studentname, subjects, marks from StudentInfo_1) as source_table
PIVOT
(max(marks) for subjects in (english, maths, science)) AS t

-- using case when
select studentname,
		max(case when subjects = 'English' then marks end) as English,
		max(case when subjects = 'Maths' then marks end) as maths,
		max(case when subjects = 'Science' then marks end) as science
from StudentInfo_1
group by StudentName;

-- output
-- #	studentname	English	maths	science
-- 1	David		85		90		88
-- 2	John		75		85		80
-- 3	Tom			83		80		92
-------------------------------------------------------------


Create Table StudentInfo_1
(
StudentName Varchar(30),
Subjects Varchar(30),
Marks Bigint
);

insert into StudentInfo_1 Values ('David', 'English', 85);
insert into StudentInfo_1 Values ('David', 'Maths', 90);
insert into StudentInfo_1 Values ('David', 'Science', 88);
insert into StudentInfo_1 Values ('John', 'English', 75);
insert into StudentInfo_1 Values ('John', 'Maths', 85);
insert into StudentInfo_1 Values ('John', 'Science', 80);
insert into StudentInfo_1 Values ('Tom', 'English', 83);
insert into StudentInfo_1 Values ('Tom', 'Maths', 80);
insert into StudentInfo_1 Values ('Tom', 'Science', 92);

