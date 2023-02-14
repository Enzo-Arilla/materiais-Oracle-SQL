CREATE TABLE Employee (id int, name varchar(255), salary int, managerId int);

INSERT INTO Employee (id, name, salary, managerId) values ('1', 'Joe', '70000', '3');
INSERT INTO Employee (id, name, salary, managerId) values ('2', 'Henry', '80000', '4');
INSERT INTO Employee (id, name, salary, managerId) values ('3', 'Sam', '60000', 'None');
INSERT INTO Employee (id, name, salary, managerId) values ('4', 'Max', '90000', 'None');

SELECT name Employee
FROM Employee E
WHERE salary > (SELECT salary FROM Employee WHERE id = E.managerId);