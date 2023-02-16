CREATE TABLE Customer (id int, name varchar(25), referee_id int)

INSERT INTO Customer (id, name, referee_id) values ('1', 'Will', 'None');
INSERT INTO Customer (id, name, referee_id) values ('2', 'Jane', 'None');
INSERT INTO Customer (id, name, referee_id) values ('3', 'Alex', '2');
INSERT INTO Customer (id, name, referee_id) values ('4', 'Bill', 'None');
INSERT INTO Customer (id, name, referee_id) values ('5', 'Zack', '1');
INSERT INTO Customer (id, name, referee_id) values ('6', 'Mark', '2');

SELECT name
FROM Customer
WHERE referee_id <> 2
OR referee_id IS NULL;