CREATE TABLE Person (id int, email varchar(255));

INSERT INTO Person (id, email) values ('1', 'a@b.com');
INSERT INTO Person (id, email) values ('2', 'c@d.com');
INSERT INTO Person (id, email) values ('3', 'a@b.com');

SELECT email
FROM Person
GROUP BY email
HAVING COUNT(1)>1