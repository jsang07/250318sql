-- (1)
SELECT name 
FROM Customer C 
JOIN Orders O ON C.custId = O.custId 
JOIN BOOK B ON B.bookId = O.bookId 
WHERE B.publisher IN (
    SELECT B1.publisher 
    FROM Customer C1 
    JOIN Orders O1 ON C1.custId = O1.custId 
    JOIN BOOK B1 ON B1.bookId = O1.bookId 
    WHERE C1.custId = (
        SELECT custId 
        FROM Customer 
        WHERE name = '박지성'
    )
) 
AND C.name != '박지성';

-- (2)
SELECT name 
FROM Customer C 
JOIN Orders O ON C.custId = O.custId 
JOIN BOOK B ON B.bookId = O.bookId 
GROUP BY C.name 
HAVING COUNT(DISTINCT B.publisher) >= 2;

-- (3)
SELECT B.bookId, B.bookname 
FROM BOOK B 
JOIN Orders O ON B.bookId = O.bookId 
GROUP BY B.bookId, B.bookname 
HAVING COUNT(*) >= 0.3 * (
    SELECT COUNT(*) 
    FROM Customer
);
