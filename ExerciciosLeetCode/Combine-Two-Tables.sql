CREATE TABLE Person (personId int, firstName varchar(255), lastName varchar(255));

CREATE TABLE Address (addressId int, personId int, city varchar(255), state varchar(255));

INSERT INTO Person (personId, lastName, firstName) values ('1', 'Wang', 'Allen');
INSERT INTO Person (personId, lastName, firstName) values ('2', 'Alice', 'Bob');
INSERT INTO Address (addressId, personId, city, state) values ('1', '2', 'New York City', 'New York');
INSERT INTO Address (addressId, personId, city, state) values ('2', '3', 'Leetcode', 'California');

SELECT firstName, lastName, city, state
FROM Person, Address 
WHERE Person.personId = Address.personId(+);