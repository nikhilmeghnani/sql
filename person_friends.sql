CREATE TABLE friends 
(
    PersonID	INT,
    FriendID 	INT
);

INSERT INTO friends (PersonID, FriendID) VALUES ('1', '2');
INSERT INTO friends (PersonID, FriendID) VALUES ('1', '3');
INSERT INTO friends (PersonID, FriendID) VALUES ('2', '1');
INSERT INTO friends (PersonID, FriendID) VALUES ('2', '3');
INSERT INTO friends (PersonID, FriendID) VALUES ('3', '5');
INSERT INTO friends (PersonID, FriendID) VALUES ('4', '2');
INSERT INTO friends (PersonID, FriendID) VALUES ('4', '3');
INSERT INTO friends (PersonID, FriendID) VALUES ('4', '5');

CREATE TABLE persons 
(
    PersonID	INT,
    Name	VARCHAR(512),
    Email	VARCHAR(512),
    Score 	INT
);

INSERT INTO persons (PersonID, Name, Email, Score ) VALUES ('1', 'Alice', 'alice2018@hotmail.com', '88 ');
INSERT INTO persons (PersonID, Name, Email, Score ) VALUES ('2', 'Bob', 'bob2018@hotmail.com', '11 ');
INSERT INTO persons (PersonID, Name, Email, Score ) VALUES ('3', 'Davis', 'davis2018@hotmail.com', '27 ');
INSERT INTO persons (PersonID, Name, Email, Score ) VALUES ('4', 'Tara', 'tara2018@hotmail.com', '45 ');
INSERT INTO persons (PersonID, Name, Email, Score ) VALUES ('5', 'John', 'john2018@hotmail.com', '63');

with score_details as 
(
  select 
    f.personid, sum(p.score) as total_friend_score, count(1) as no_of_friends
  from friends f
  inner join persons p on p.personid = f.friendid
  group by f.personid
  having sum(p.score) > 100
)
select s.*, p.name as person_name
from persons p 
inner join score_details s on s.personid = p.personid
