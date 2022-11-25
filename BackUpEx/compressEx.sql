CREATE DATABASE IF NOT EXISTS compressDB;
use compressDB;
CREATE TABLE normaltbl(emp_no int, first_name VARCHAR(14));
CREATE TABLE compresstbl (emp_no int, first_name VARCHAR(14))
ROW_FORMAT = COMPRESSED;
INSERT INTO normaltbl SELECT emp_no, first_name FROM employees.employees;
INSERT INTO compresstbl SELECT emp_no, first_name FROM employees.employees;
SHOW TABLE STATUS FROM compressDB;
