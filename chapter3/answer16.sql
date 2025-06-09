USE salesdb;

-- (1) 
CREATE TABLE Salesperson (
    name VARCHAR(20) PRIMARY KEY,
    age INTEGER,
    salary INTEGER
);

CREATE TABLE `Order` (
    number INTEGER PRIMARY KEY,
    custname VARCHAR(20),
    salesperson VARCHAR(20),
    amount INTEGER,
    FOREIGN KEY (custname) REFERENCES Customer(name),
    FOREIGN KEY (salesperson) REFERENCES Salesperson(name)
);

CREATE TABLE Customer (
    name VARCHAR(20) PRIMARY KEY,
    city VARCHAR(20),
    industrytype VARCHAR(20)
);

INSERT INTO Salesperson (name, age, salary) VALUES ('김철수', 35, 50000);
INSERT INTO Customer (name, city, industrytype) VALUES ('한성기업', '서울', '전자');
INSERT INTO `Order` (number, custname, salesperson, amount) VALUES (1, '한성기업', '김철수', 30000);

-- (2) 
SELECT name, salary FROM Salesperson;

-- (3) 
SELECT name FROM Salesperson WHERE age < 30;

-- (4) 
SELECT name, city 
FROM Customer 
WHERE city LIKE '%S';

-- (5) 
SELECT COUNT(DISTINCT custname) AS customer_count
FROM Orders;

-- (6) 
SELECT salesperson, COUNT(*) AS order_count
FROM Orders
GROUP BY salesperson;

-- (7) 
SELECT DISTINCT salesperson
FROM Orders
WHERE custname IN (
    SELECT name FROM Customer WHERE city = 'LA'
);

-- (8) 
SELECT DISTINCT S.name, S.age
FROM Orders O
JOIN Customer C ON O.custname = C.name
JOIN Salesperson S ON O.salesperson = S.namename
WHERE C.city = 'LA';

-- (9) 
SELECT salesperson, COUNT(*) AS num_orders
FROM Orders
GROUP BY salesperson
HAVING COUNT(*) >= 2;

-- (10) 
UPDATE Salesperson
SET salary = 45000
WHERE name = 'TOM';