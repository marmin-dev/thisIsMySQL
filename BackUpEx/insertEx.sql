-- 데이터의 삽입 SQL INSERT
USE sqldb;
CREATE TABLE testTBL1 (id int, userName char(3), age int);
INSERT INTO testTBL1 VALUES (1, '홍길동', 25);
-- 위의 예시에서 id와 이름만 입력하고 나이를 입력하고 싶지 않다면 테이블이름 뒤에 입력할 열의 목록을 나열할것.
INSERT INTO testTBL1 (userName, age) VALUES ('김길환',42);
-- 생략한 id 값에는 NULL 값이 들어간다
-- 열의 순서를 바꾸고 싶을 때도 꼭 열 이름을 입력할 순서에 맞춰 나열해 주어야한다
-- ID 값을 자동으로 주고 이름과 나이를 입력하는 테이블 
-- AUTO_INCREMENT를 하고 PK지정.
CREATE TABLE testtbl2(
id int auto_increment PRIMARY KEY,
userName CHAR(3),
age int);
INSERT INTO testtbl2 VALUES (NULL,'지민',25);
INSERT INTO testtbl2 VALUES (NULL,'윤하',32);
INSERT INTO testtbl2 VALUES (NULL,'지은',29);
SELECT * FROM testtbl2;
-- 마지막으로 자동증가한 id값을 알아보는 쿼리
SELECT LAST_INSERT_ID(id) FROM testtbl2;
-- testTBL2의 자동 증가를 100부터 시작한다
ALTER TABLE testTBL2 AUTO_INCREMENT=100;
INSERT INTO testTbl2 VALUES (NULL,'푸틴',23);
SELECT * FROM testtbl2;
-- 테이블 생성
CREATE TABLE testTbl3(
id int auto_increment PRIMARY KEY,
userName CHAR(3),
age int);
ALTER TABLE testTbl3 AUTO_INCREMENT = 1000;
-- 서버 변수인 auto_increment 증가율 3으로 교체하기
SET @@auto_increment_increment=3;
INSERT INTO testtbl3 VALUES (NULL,'지은',29);
INSERT INTO testtbl3 VALUES (NULL,'나연',32);
INSERT INTO testtbl3 VALUES (NULL,'고은',42);
INSERT INTO testtbl3 VALUES (NULL,'개운',14);
SELECT * FROM testtbl3;
-- 대량의 샘플데이터 생성하기
CREATE TABLE testtbl4(
id int,
Fname varchar(50),
Lname varchar(50));
INSERT INTO testtbl4
SELECT emp_no, first_name, last_name
FROM employees.employees
LIMIT 5000;
SELECT * FROM testtbl4;
-- 생성과 동시에 대량의 샘플데이터 생성하기
CREATE TABLE testtbl5(
SELECT emp_no, first_name, last_name FROM employees.employees LIMIT 5000); 
SELECT * FROM testtbl5;
UPDATE testtbl5 SET first_name ='Kim'
WHERE emp_no=10013;
