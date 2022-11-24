DROP PROCEDURE IF EXISTS whileproc;
DELIMITER $$
CREATE PROCEDURE whileproc()
BEGIN
DECLARE num1 INT;
DECLARE hap INT;
SET num1 =1;
SET hap = 0;
WHILE(num1<=100) DO
SET hap = hap + num1;
SET num1 = num1 + 1;
END WHILE;
SELECT hap;
END $$
DELIMITER ;
CALL whileproc();
-- 1000이 넘으면 종료
DELIMITER $$
CREATE PROCEDURE whileproc2()
BEGIN
DECLARE num1 INT;
DECLARE hap INT;
SET num1 =1;
SET hap = 0;
mywhile:WHILE(num1<=100) DO
IF(num1 % 7)THEN
SET num1 = num1 + 1;
ITERATE mywhile;
END IF;
SET hap = hap + num1;
IF(hap >= 1000) THEN
LEAVE myWhile;
END IF;
SET num1= num1+1;
END WHILE;
SELECT hap;
END $$
DELIMITER ;
CALL whileproc();
CALL whileproc2();