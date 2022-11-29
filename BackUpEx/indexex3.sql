-- 인덱스의 성능 비교
CREATE DATABASE IF NOT EXISTS indexdb;
USE indexdb;
SELECT COUNT(*) FROM employees.employees;

CREATE TABLE emp SELECT * FROM employees.employees ORDER BY rand();
CREATE TABLE emp_c SELECT * FROM employees.employees ORDER BY rand();
CREATE TABLE emp_se SELECT * FROM employees.employees ORDER BY rand(); -- 랜덤함수를 이용하여 테이블 만들기

SELECT * FROM emp LIMIT 5;
SELECT * FROM emp_c LIMIT 5;
SELECT * FROM emp_se LIMIT 5;

ALTER TABLE emp_c ADD PRIMARY KEY(emp_no);
ALTER TABLE emp_se ADD INDEX idx_emp_no(emp_no);

SELECT * FROM emp LIMIT 5;
SELECT * FROM emp_c LIMIT 5; -- 클러스터 인덱스만 정렬됨
SELECT * FROM emp_se LIMIT 5;

SHOW INDEX FROM emp;
SHOW INDEX FROM emp_c;
SHOW INDEX FROM emp_se; -- 인덱스 확인하기

SHOW TABLE STATUS;

SHOW global status like 'Innodb_pages-read';
SELECT * FROM emp WHERE emp_no = 100000;
SHOW global status like 'Innodb_pages-read';
