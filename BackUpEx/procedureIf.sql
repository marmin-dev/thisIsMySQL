DROP PROCEDURE IF EXISTS ifproc;
DELIMITER $$
CREATE PROCEDURE ifproc()
BEGIN
DECLARE var1 INT;
SET var1 = 100;

IF var1 = 100 THEN
SELECT '100이오!';
ELSE
SELECT '100이 아니오';
END IF;
END $$
DELIMITER ;
CALL ifproc();

USE employees;
DELIMITER $$
CREATE PROCEDURE ifproc2()
BEGIN
DECLARE hireDate DATE;
DECLARE today DATE;
DECLARE days INT;

SELECT hire_date INTO hireDate
FROM employees.employees
WHERE emp_no = 10001;
SET today = DATE(now());
SET days = DATEDIFF(today,hireDate);
IF(days/365)>=5 THEN
SELECT '5년 이상 근무하셨슴다'+days;
ELSE
SELECT '5년 이하 근무' + days;
END IF;
END$$
DELIMITER ;
CALL ifproc2();

