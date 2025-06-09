-- 테이블 생성
CREATE TABLE Department (
    deptno INT PRIMARY KEY,
    deptname VARCHAR(50),
    manager VARCHAR(50)
);

CREATE TABLE Employee (
    empno INT PRIMARY KEY,
    name VARCHAR(50),
    phoneno VARCHAR(20),
    address VARCHAR(100),
    sex CHAR(1),
    position VARCHAR(20),
    deptno INT,
    FOREIGN KEY (deptno) REFERENCES Department(deptno)
);

CREATE TABLE Project (
    projno INT PRIMARY KEY,
    projname VARCHAR(100),
    deptno INT,
    FOREIGN KEY (deptno) REFERENCES Department(deptno)
);

CREATE TABLE Works (
    empno INT,
    projno INT,
    hours_worked INT,
    PRIMARY KEY (empno, projno),
    FOREIGN KEY (empno) REFERENCES Employee(empno),
    FOREIGN KEY (projno) REFERENCES Project(projno)
);

-- 예시 데이터 삽입 (아래 쿼리가 작동할 최소한의 데이터)
INSERT INTO Department VALUES (1, 'IT', '홍길동'), (2, 'HR', '이순신');

INSERT INTO Employee VALUES 
(101, '김철수', '010-1111-1111', '서울시', 'M', '사원', 1),
(102, '박영희', '010-2222-2222', '부산시', 'F', '사원', 1),
(103, '최지영', '010-3333-3333', '인천시', 'F', '팀장', 2),
(104, '이민수', '010-4444-4444', '대구시', 'M', '사원', 2);

INSERT INTO Project VALUES 
(1001, '프로젝트A', 1), 
(1002, '프로젝트B', 2);

INSERT INTO Works VALUES
(101, 1001, 30),
(102, 1001, 40),
(103, 1002, 25),
(104, 1002, 20);


-- (2) 
SELECT name FROM Employee;

-- (3) 
SELECT name FROM Employee WHERE sex = 'F';

-- (4) 
SELECT name FROM Employee 
WHERE name IN (SELECT manager FROM Department);

-- (5) 
SELECT E.name, E.address
FROM Employee E 
JOIN Department D ON E.deptno = D.deptno
WHERE D.deptname = 'IT';

-- (6) 
SELECT COUNT(*) AS num_employees
FROM Employee
WHERE deptno = (SELECT deptno FROM Department WHERE manager = '홍길동');

-- (7) 
SELECT D.deptname, E.name, SUM(W.hours_worked) AS total_hours
FROM Employee E
JOIN Works W ON E.empno = W.empno
JOIN Department D ON E.deptno = D.deptno
GROUP BY D.deptname, E.name
ORDER BY D.deptname ASC, E.name ASC;

-- (8)
SELECT P.projno, P.projname, COUNT(*) AS num_employees
FROM Project P
JOIN Works W ON P.projno = W.projno
GROUP BY P.projno, P.projname
HAVING COUNT(*) >= 2;

-- (9) 
SELECT name FROM Employee
WHERE deptno IN (
    SELECT deptno
    FROM Employee
    GROUP BY deptno
    HAVING COUNT(*) >= 3
);
