-- Write a SQL query to get the output as shown in the Output tables using the string ‘INTERVIEW’


with alphabet_pattern as
(
--Base query
SELECT 'interview' as A, LENGTH('interview') as B
union all
--RECURSIVE part
select SUBSTRING(A, 1, B-1), B-1 from
alphabet_pattern where B-1 > 0
)
select a from alphabet_pattern;


-- #	A
-- 1	interview
-- 2	intervie
-- 3	intervi
-- 4	interv
-- 5	inter
-- 6	inte
-- 7	int
-- 8	in
-- 9	i