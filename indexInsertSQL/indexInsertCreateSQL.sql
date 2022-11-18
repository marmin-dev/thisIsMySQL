--다른 테이블에서 특정 데이터만 추출해서 테이블 만들기
CREATE TABLE indexTBL (first_name varchar(14),last_name varchar(16),hire_date date);
INSERT INTO indexTBL
SELECT first_name, last_name, hire_date
FROM employees.employees
LIMIT 500;
--만들어진 테이블 데이터 불러오기
SELECT * FROM indexTBL;
--만들어진 테이블 데이터에서 Mary 라는 first_name가진 사람찾기
SELECT * FROM indexTBL WHERE first_name='Mary';
--Create Index SQL
CREATE INDEX idx_indexTBL_firstname ON indexTBL(first_name);
--인덱스로 데이터 찾기
SELECT * FROM indexTBL WHERE first_name='Mary';