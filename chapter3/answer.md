1.
(1) select bookname from BOOK where bookId =1;
(2) select bookname from BOOK where price >= 20000;
(3) select sum(salePrice) from Orders where custId = (select custId from customer where name = '박지성');
(4) select count(*) from Orders where custid = (select custId from Customer where name = '박지성');
(5) select count(distinct publisher) from BOOK B join orders O on o.bookId = B.bookId
where custid = (select custId from Customer where name = '박지성');
(6) select bookname, price, abs(price - salePrice) from Orders O join BOOK B on O.bookId = B.bookId
where custId = (select custid from customer where name = '박지성');
(7) select bookname from Orders O join BOOK B on O.bookId = B.bookId
where B.bookId not in (select bookid from orders where custid = (select custid from Customer where name = '박지성')) where name = '박지성')) group by bookname;
2.
(1) select count(*) from BOOK
(2) select count(distinct publisher) from BOOK;
(3) select name, address from Customer;
(4) select orderId from Orders where orderdate between '2024-07-04' and '2024-07-07';
(5) select orderId from Orders where orderdate not between '2024-07-04' and '2024-07-07';
(6) select name, address from Customer where name like "김%";
(7) select name, address from Customer where name like "김%이";
(8) select name from Customer where custid not in (select custid from Orders);
(9) select sum(salePrice), avg(salePrice) from Orders;
(10) select name, sum(salePrice) from Orders O join Customer C on C.custId = O.custId group by name;
(11) select name, bookId from Orders O
join Customer C on C.custId = O.custId
group by name, bookid;
(12) select * from Orders where orderId = (select orderid from Orders o
join BOOK b on o.bookId = b.bookId order by abs(o.salePrice - b.price) desc limit 1);
(13) select C.name from orders o join Customer C on C.custId = O.custId
group by C.name having avg(o.salePrice) > (select avg(salePrice) from Orders);

3.
(1)
select name from Customer C
join Orders O on C.custId = O.custId
join BOOK B on B.bookId = O.bookId
where B.publisher
in (select B1.publisher from Customer C1
join Orders O1 on C1.custId = O1.custId
join BOOK B1 on B1.bookId = O1.bookId
where C1.custId = (select custid from customer where name = '박지성'))
and C.name != '박지성';
(2)
select name from Customer c
join orders o on c.custId = o.custId
join BOOK b on b.bookId = o.bookId
group by c.name
having count(distinct b.publisher) >= 2;
(3)
select b.bookId, b.bookname from BOOK b
join Orders O on b.bookId = O.bookId
group by b.bookId
having count(*) >= 0.3 * (select count(*) from Customer);

4.
(1) insert into book(bookid, bookname, publisher, price) values('북 아이디가 필요하다.','스포츠 세계', '대한미디어', 10000);
(2) delete from book where publisher = "삼성당";
(3) delete from book where publisher = "이상미디어";
(4) update book set publisher = '대한출판사' where publisher = '대한미디어';
(5) create table Bookcompany(
	name varchar(20) primary key,
    address varchar(20),
    begin date
);
(6) alter table bookcompany add webaddress varchar(30);
(7) insert into bookcompany(name, address, begin, webaddress) 
values('한빛아카데미','서울시 마포구','1993-01-01','<http://hanbit.co.kr>');

5.
(1) 책 구매를 하지 않은 고객
(2) 책을 구매한 고객
6.
DDL (데이터 정의어)
CREATE: 테이블, 뷰, 인덱스와 같은 데이터베이스 객체를 생성하는 데 사용됩니다.
ALTER: 기존 데이터베이스 객체의 구조를 수정하는 데 사용됩니다.
DROP: 데이터베이스 객체를 삭제하는 데 사용됩니다.

DML (데이터 조작어)
SELECT: 데이터베이스에서 데이터를 검색하는 데 사용됩니다.
INSERT: 데이터베이스에 새 데이터를 추가하는 데 사용됩니다.
DELETE: 데이터베이스에서 데이터를 삭제하는 데 사용됩니다.
UPDATE: 데이터베이스의 기존 데이터를 수정하는 데 사용됩니다.

DCL (데이터 제어어)
GRANT: 사용자에게 데이터베이스에 대한 액세스 권한을 부여하는 데 사용됩니다.
REVOKE: 사용자의 데이터베이스 액세스 권한을 취소하는 데 사용됩니다

7.
(1) select * where A=a2 from R
(2) select A, B from R
(3) SELECT * from R join S on R.C = S.C
8.
8번 결과
(1) INNER JOIN
A	B	C	D	E
a1	b1	c1	d1	e2
a2	b1	c1	d1	e2
a3	b1	c2	d3	e3

(2) LEFT OUTER JOIN
A	B	C	D	E
a1	b1	c1	d1	e2
a2	b1	c1	d1	e2
a3	b1	c2	d3	e3
a4	b2	c4	NULL	NULL

(3) RIGHT OUTER JOIN
A	B	C	D	E
a1	b1	c1	d1	e2
a2	b1	c1	d1	e2
a3	b1	c2	d3	e3
NULL	NULL	c5	d3	e3

(4) FULL OUTER JOIN


(5) CROSS JOIN (Cartesian Product)
A	B	C	D	E
a1	b1	c1	d2	e1
a1	b1	c1	d1	e2
a1	b1	c2	d3	e3
a1	b1	c5	d3	e3
a2	b1	c1	d2	e1
a2	b1	c1	d1	e2
a2	b1	c2	d3	e3
a2	b1	c5	d3	e3
a3	b1	c1	d2	e1
a3	b1	c1	d1	e2
a3	b1	c2	d3	e3
a3	b1	c5	d3	e3
a4	b2	c1	d2	e1
a4	b2	c1	d1	e2
a4	b2	c2	d3	e3
a4	b2	c5	d3	e3

9. SUM(col2) = 20
10. 1 2 3 4 5 6 7 8
11. a - 2  b - 2
12. 
(2) 
CREATE TABLE EMP (
  EMPNO integer NOT NULL,
  ENAME varchar(10),
  JOB varchar(9),
  MGR integer,
  HIREDATE DATE,
  SAL integer,
  PRIMARY KEY (EMPNO),
  DEPTNO integer,
  FOREIGN KEY (DEPTNO)
                REFERENCES DEPT(DEPTNO) ON UPDATE CASCADE
);
(5) EMP 데이터 넣으려고 할때 외래키인 DEPTNO를 50으로 넣었기 때문이다.
(7) ALTER TABLE DEPR ADD COLUMN managename varchar(100);
UPDATE DEPT
set managename = 'SMITH'
where DEPTNO = 1;

13.
(1)select address, changeday from cust_attr
where custid = 1;
(2)select phone, changeday
from cust_attr
where custid = 1;
(3)select phone from cust_attr
where custid = 1
order by changeday asc
limit 1;
(4)select phone from cust_attr
where custid = 1 and changeday = '2024-01-01'
order by changeday asc limit 1;

14.
(1)select * from orders o
join cart c on o.bookId = c.bookid
where c.custid = 1;
(2)select * from cart
where cart.bookid not in (select bookid from orders where custid = 1) and cart.custid = 1;
(3)select sum(price) from book b
join cart c on b.bookid = c.bookid;

15.
(1)
1
SELECT 
    theaterName, theaterLocation
FROM
    theater;
2
SELECT 
    *
FROM
    theater
WHERE
    theaterLocation = '잠실';
3
SELECT 
    userName
FROM
    users
WHERE
    userAddress = '잠실'
order by userName asc;
4
SELECT 
    theaterNum, cinemaNum, movieName
FROM
    cinema
WHERE
    price <= 8000;
5
select * from users join theater
on theater.theaterLocation = users.userAddress;
(2)
1
select count(*) from theater;
2
SELECT 
    AVG(price)
FROM
    cinema;
3
SELECT 
    COUNT(*) AS '고객 수'
FROM
    reservation,
    users
WHERE
    reservation.userNum = users.userNum
        AND date = '2014-09-01';
(3)
1
SELECT 
    movieName
FROM
    theater,
    cinema
WHERE
    theater.theaterName = '대한'
        AND theater.theaterNum = cinema.theaterNum;
2
select distinct(username) from users u
join reservation r on u.userNum = r.userNum
join movie.theater t on r.theaterNum = t.theaterNum
where t.theaterName like '대한';
3
select sum(price) from reservation r
join theater t on r.theaterNum = t.theaterNum
join cinema c on c.cinemaNum = r.cinemaNum
where r.theaterNum = (select theaterNum from theater where theaterName = '대한')
group by r.theaterNum

(4)
1
select theaterNum, count(theaterNum) from cinema
group by theaterNum;
2 select * from cinema c
join theater t on c.theaterNum = t.theaterNum
where t.theaterLocation = '잠실';
3 select count(userNum) from reservation
where date = '2024-09-01'
group by theaterNum;
4 select c.movieName, count(*) from reservation r
join cinema c on r.cinemaNum = c.cinemaNum
where date = '2024-09-01'
group by r.theaterNum, r.cinemaNum
order by count(*) desc limit 1;
(5) UPDATE cinema 
SET 
    price = price + (price * 0.1);

16.






















































