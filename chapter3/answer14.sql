-- (1) 
SELECT *
FROM orders o
JOIN cart c ON o.bookId = c.bookid
WHERE c.custid = 1;

-- (2) 
SELECT *
FROM cart
WHERE bookid NOT IN (
    SELECT bookid 
    FROM orders 
    WHERE custid = 1
)
AND custid = 1;

-- (3) 
SELECT SUM(price)
FROM book b
JOIN cart c ON b.bookid = c.bookid;
