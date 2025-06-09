-- (1)
SELECT COUNT(*) FROM BOOK;

-- (2)
SELECT COUNT(DISTINCT publisher) FROM BOOK;

-- (3)
SELECT name, address FROM Customer;

-- (4)
SELECT orderId 
FROM Orders 
WHERE orderdate BETWEEN '2024-07-04' AND '2024-07-07';

-- (5)
SELECT orderId 
FROM Orders 
WHERE orderdate NOT BETWEEN '2024-07-04' AND '2024-07-07';

-- (6)
SELECT name, address 
FROM Customer 
WHERE name LIKE '김%';

-- (7)
SELECT name, address 
FROM Customer 
WHERE name LIKE '김%이';

-- (8)
SELECT name 
FROM Customer 
WHERE custid NOT IN (
    SELECT custid 
    FROM Orders
);

-- (9)
SELECT SUM(salePrice), AVG(salePrice) 
FROM Orders;

-- (10)
SELECT name, SUM(salePrice) 
FROM Orders O 
JOIN Customer C ON C.custId = O.custId 
GROUP BY name;

-- (11)
SELECT name, bookId 
FROM Orders O 
JOIN Customer C ON C.custId = O.custId 
GROUP BY name, bookId;

-- (12)
SELECT * 
FROM Orders 
WHERE orderId = (
    SELECT orderid 
    FROM Orders o 
    JOIN BOOK b ON o.bookId = b.bookId 
    ORDER BY ABS(o.salePrice - b.price) DESC 
    LIMIT 1
);

-- (13)
SELECT C.name 
FROM Orders o 
JOIN Customer C ON C.custId = o.custId 
GROUP BY C.name 
HAVING AVG(o.salePrice) > (
    SELECT AVG(salePrice) 
    FROM Orders
);
