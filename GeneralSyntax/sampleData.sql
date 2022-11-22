-- 대량의 샘플데이터 생성
INSERT INTO testTbl4
SELECT emp_no, first_name, last_name
FROM employees.employees;
-- INSERT INTO ~ SELECT 문을 이용한 데이터 끌어오기
-- 생성과 동시에 대량의 샘플데이터 생성하기
CREATE TABLE testTbl(
    SELECT emp_no, name, addr FROM employees.employees
);