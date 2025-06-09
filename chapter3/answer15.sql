-- (1-1) 
SELECT theaterName, theaterLocation FROM theater;

-- (1-2) 
SELECT * FROM theater WHERE theaterLocation = '잠실';

-- (1-3) 
SELECT userName FROM users WHERE userAddress = '잠실' ORDER BY userName ASC;

-- (1-4) 
SELECT theaterNum, cinemaNum, movieName FROM cinema WHERE price <= 8000;

-- (1-5) 
SELECT * 
FROM users 
JOIN theater ON theater.theaterLocation = users.userAddress;

-- (2-1)
SELECT COUNT(*) FROM theater;

-- (2-2) 
SELECT AVG(price) FROM cinema;

-- (2-3) 
SELECT COUNT(*) AS '고객 수' 
FROM reservation r
JOIN users u ON r.userNum = u.userNum
WHERE r.date = '2014-09-01';

-- (3-1) 
SELECT movieName 
FROM theater t
JOIN cinema c ON t.theaterNum = c.theaterNum
WHERE t.theaterName = '대한';

-- (3-2)
SELECT DISTINCT u.userName 
FROM users u 
JOIN reservation r ON u.userNum = r.userNum 
JOIN theater t ON r.theaterNum = t.theaterNum
WHERE t.theaterName LIKE '대한%';

-- (3-3)
SELECT SUM(c.price) 
FROM reservation r
JOIN cinema c ON c.cinemaNum = r.cinemaNum
WHERE r.theaterNum = (SELECT theaterNum FROM theater WHERE theaterName = '대한')
GROUP BY r.theaterNum;


-- (4-1) 
SELECT theaterNum, COUNT(theaterNum) 
FROM cinema 
GROUP BY theaterNum;

-- (4-2) 
SELECT * 
FROM cinema c 
JOIN theater t ON c.theaterNum = t.theaterNum 
WHERE t.theaterLocation = '잠실';

-- (4-3) 
SELECT theaterNum, COUNT(userNum) AS userCount
FROM reservation 
WHERE date = '2024-09-01' 
GROUP BY theaterNum;

-- (4-4) 
SELECT c.movieName, COUNT(*) AS reservationCount
FROM reservation r 
JOIN cinema c ON r.cinemaNum = c.cinemaNum 
WHERE date = '2024-09-01'
GROUP BY r.theaterNum, r.cinemaNum 
ORDER BY reservationCount DESC 
LIMIT 1;

-- (5-1) 
UPDATE cinema 
SET price = price + (price * 0.1);
