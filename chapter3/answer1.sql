-- (1)
SELECT bookname 
FROM BOOK 
WHERE bookId = 1;

-- (2)
SELECT bookname 
FROM BOOK 
WHERE price >= 20000;

-- (3)
SELECT SUM(salePrice) 
FROM Orders 
WHERE custId = (
    SELECT custId 
    FROM Customer 
    WHERE name = '박지성'
);

-- (4)
SELECT COUNT(*) 
FROM Orders 
WHERE custId = (
    SELECT custId 
    FROM Customer 
    WHERE name = '박지성'
);

-- (5)
SELECT COUNT(DISTINCT publisher) 
FROM BOOK B 
JOIN Orders O ON O.bookId = B.bookId 
WHERE custId = (
    SELECT custId 
    FROM Customer 
    WHERE name = '박지성'
);

-- (6)
SELECT bookname, price, ABS(price - salePrice) 
FROM Orders O 
JOIN BOOK B ON O.bookId = B.bookId 
WHERE custId = (
    SELECT custId 
    FROM Customer 
    WHERE name = '박지성'
);

-- (7)
SELECT bookname 
FROM Orders O 
JOIN BOOK B ON O.bookId = B.bookId 
WHERE B.bookId NOT IN (
    SELECT bookId 
    FROM Orders 
    WHERE custId = (
        SELECT custId 
        FROM Customer 
        WHERE name = '박지성'
    )
) 
GROUP BY bookname;