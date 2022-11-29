USE indexdb;
SELECT * FROM emp;
SHOW GLOBAL STATUS LIKE 'Innodb_pages_read';
SELECT * FROM emp WHERE emp_no = 100000;

SELECT * FROM emp_Se WHERE emp_no = 100000;
SELECT * FROM emp_c WHERE emp_no = 100000;

SELECT * FROM emp WHERE emp_no <110000;
SELECT * FROM emp_c WHERE emp_no <110000;
SELECT * FROM emp_se WHERE emp_no <110000;

SELECT * FROM emp WHERE emp_no <500000 LIMIT 1000000;
SELECT * FROM emp_c WHERE emp_no <500000 LIMIT 1000000;
SELECT * FROM emp_se WHERE emp_no <500000 LIMIT 1000000;

SELECT * FROM emp WHERE emp_no <500000 LIMIT 1000000;
SELECT * FROM emp_c WHERE emp_no <500000 LIMIT 1000000;
SELECT * FROM emp_se WHERE emp_no <500000 LIMIT 1000000;

SELECT * FROM emp_c WHERE emp_no = 100000/1;

ALTER TABLE emp ADD INDEX idx_gender(gender);
ANALYZE TABLE Emp; -- 생성한 인덱스를 통계에 적용시킴
SHOW INDEX FROM Emp;
SELECT * FROM emp WHERE gender = 'M' LIMIT 500000;
SELECT * FROM emp IGNORE INDEX (idx_gender) WHERE gender = 'M' LIMIT 500000;