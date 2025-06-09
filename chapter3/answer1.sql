select bookname from BOOK where bookId =1; 
select bookname from BOOK where price >= 20000; 
select sum(salePrice) from Orders where custId = (select custId from customer where name = '박지성'); 
select count(BOOK) from Orders where custid = (select custId from Customer where name = '박지성'); 
select count(distinct publisher) from BOOK B join orders O on o.bookId = B.bookId where custid = (select custId from Customer where name = '박지성'); 
select bookname, price, abs(price - salePrice) from Orders O join BOOK B on O.bookId = B.bookId where custId = (select custid from customer where name = '박지성'); 
select bookname from Orders O 
join BOOK B on O.bookId = B.bookId 
where B.bookId not in (select bookid from orders where custid = 
(select custid from Customer where name = '박지성') where name = '박지성') group by bookname; 

