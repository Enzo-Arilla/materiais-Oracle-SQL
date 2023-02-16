CREATE TABLE Customers (id int, name varchar(255));
CREATE TABLE Orders (id int, customerId int);

INSERT INTO Customers (id, name) values ('1', 'Joe');
INSERT INTO Customers (id, name) values ('2', 'Henry');
INSERT INTO Customers (id, name) values ('3', 'Sam');
INSERT INTO Customers (id, name) values ('4', 'Max');

INSERT INTO Orders (id, customerId) values ('1', '3');
INSERT INTO Orders (id, customerId) values ('2', '1');

