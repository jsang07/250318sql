-- (1)
INSERT INTO book (bookid, bookname, publisher, price) 
VALUES ('북 아이디가 필요하다.', '스포츠 세계', '대한미디어', 10000);

-- (2)
DELETE FROM book 
WHERE publisher = '삼성당';

-- (3)
DELETE FROM book 
WHERE publisher = '이상미디어';

-- (4)
UPDATE book 
SET publisher = '대한출판사' 
WHERE publisher = '대한미디어';

-- (5)
CREATE TABLE Bookcompany (
    name VARCHAR(20) PRIMARY KEY,
    address VARCHAR(20),
    begin DATE
);

-- (6)
ALTER TABLE Bookcompany 
ADD webaddress VARCHAR(30);

-- (7)
INSERT INTO Bookcompany (name, address, begin, webaddress) 
VALUES ('한빛아카데미', '서울시 마포구', '1993-01-01', 'http://hanbit.co.kr');
