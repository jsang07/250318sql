1.
ABS(-15) : 15
CEIL(15.7) : 16
COS(3.14159) : -1
FLOOR(15.7) : 15
LOG(10,100) : 2
MOD(11,4) : 3
POWER(3,2) : 9
ROUND(15.7) : 16
SIGN(-15) : -1
TRUNCATE(15.7, 0) : 15
CHAR(67 USING utf8) : C
CONCAT('HAPPY','Birthday') : HAPPYBirthday
LOWER('Birthday') : birthday
LPAD('Page 1',15,'*.') : *.*.*.*.*Page 1
REPLACE('JACK','J','BL') : BLACK
RPAD('Page 1',15,'*') : Page 1*********
SUBSTR('ABCDEFG',3,4) : CDEF
TRIM(LEADING 0 FROM '00AA00') : AA00
UPPER('Birthday') : BIRTHDAY
ASCII('A') : 65
LENGTH('Birthday') : 8
ADDDATE('2024-02-14', INTERVAL 10 DAY ) : 2024-02-24
LAST_DAY(SYSDATE()) : 2024-10-31
NOW(): 2024-10-21 18:14:07
DATE_FORMAT(SYSDATE(), '%Y'): 2024
CONCAT(123): 123
CAST('12.3' AS DECIMAL(3,1)): 12.3
IF(1=1, 'aa', 'bb'): aa
IFNULL(123, 345): 123
IFNULL(NULL, 123): 123

2.
### (1) `SELECT * FROM Mybook;`

| bookid | price  |
|--------|--------|
| 1      | 10000  |
| 2      | 20000  |
| 3      | NULL   |

### (2) `SELECT bookid, IFNULL(price, 0) FROM Mybook;`

| bookid | IFNULL(price, 0) |
|--------|------------------|
| 1      | 10000            |
| 2      | 20000            |
| 3      | 0                |

### (3) `SELECT * FROM Mybook WHERE price IS NULL;`

| bookid | price |
|--------|-------|
| 3      | NULL  |

### (4) `SELECT * FROM Mybook WHERE price='';`

| bookid | price |
|--------|-------|
| *(결과 없음)* | *(결과 없음)* |

### (5) `SELECT bookid, price+100 FROM Mybook;`

| bookid | price+100 |
|--------|-----------|
| 1      | 10100     |
| 2      | 20100     |
| 3      | NULL      |

### (6) `SELECT SUM(price), AVG(price), COUNT(*) FROM Mybook WHERE bookid >= 4;`

| SUM(price) | AVG(price) | COUNT(*) |
|------------|------------|----------|
| NULL       | NULL       | 0        |

### (7) `SELECT COUNT(*), COUNT(price) FROM Mybook;`

| COUNT(*) | COUNT(price) |
|----------|---------------|
| 3        | 2             |

### (8) `SELECT SUM(price), AVG(price) FROM Mybook;`

| SUM(price) | AVG(price) |
|------------|------------|
| 30000      | 15000      |

3.
### (1) `SELECT COUNT(A) FROM R;`

| COUNT(A) |
|----------|
| 2        |

### (2) `SELECT * FROM R WHERE A IN (12, 10, NULL);`

| A  | B    |
|----|------|
| 12 | NULL |
| 10 | 12   |

### (3) `SELECT A, COUNT(*) FROM R GROUP BY A;`

| A    | COUNT(*) |
|------|----------|
| NULL | 2        |
| 10   | 1        |
| 12   | 1        |

5.
(1) 각 custid에 대한 custid, address, saleprice의 합산이다.
(2) 각 custid에 대해 이름과, 판매가의 평균 출력
(3) custid가 3이하이고, 주문한 고객중에 판매가 합산

6. 4번

7.
(1) select distinct(name) from Customer
where address like '%대한민국%' and custid not in (select custId from orders)

(2) select name from Customer c
where not exists (select * from orders o where o.custId = c.custId) and address like '%대한민국%';

(3) select distinct(c1.name) from Customer c1
join Customer c2 on c1.custId = c2.custId
where c1.address like '%대한민국%' and c2.custId not in (select custid from orders);

8.
| 회원번호 | 등급 |
|----------|------|
| 1        | 1    |
| 2        | 2    |


9. 2 → 3 → 4 → 5 → 1 → 6

10.
편의성: 복잡한 쿼리를 간단하게 만들어줍니다.
보안성: 민감한 데이터를 숨기거나 접근 제한이 가능합니다.
유지보수 용이성: 데이터 구조 변경 시 뷰만 수정하면 됩니다.

11.
| 합계(B) |
|--------|
| 5000   |


12.
(1) CREATE VIEW highorders AS
SELECT B.bookid, B.bookname, C.name AS customername, B.publisher, O.saleprice
FROM Book B
JOIN Orders O ON B.bookid = O.bookid
JOIN Customer C ON O.custid = C.custid
WHERE O.saleprice >= 20000;

(2) SELECT bookname, customername FROM highorders;
DROP VIEW highorders;

(3) CREATE VIEW highorders AS
SELECT B.bookid, B.bookname, C.name AS customername, B.publisher
FROM Book B
JOIN Orders O ON B.bookid = O.bookid
JOIN Customer C ON O.custid = C.custid
WHERE O.saleprice >= 20000;



