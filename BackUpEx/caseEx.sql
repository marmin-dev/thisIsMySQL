-- IF문을 이용하여 학점 프로그램 만들기
DELIMITER $$
CREATE procedure ifproc3()
BEGIN
DECLARE point INT;
DECLARE credit CHAR(1);
SET point = floor(100*rand());
IF point >= 90 THEN
SET credit = 'A';
ELSEif point >= 80 THEN
SET credit = 'B';
ELSEif point >= 70 THEN
SET credit = 'C';
ELSEif point >= 60 THEN
SET credit = 'D';
ELSE
SET credit = 'F';
END IF;
SELECT point;
SELECT credit;
END $$
DELIMITER ;
DROP procedure if exists ifproc3;
CALL ifproc3();
-- CASE문으로 개선하기
DELIMITER $$
CREATE procedure ifproc4()
BEGIN
DECLARE point INT;
DECLARE credit CHAR(1);
SET point = floor(100*rand());
CASE
WHEN point >= 90 THEN
SET credit = 'A';
WHEN point >= 80 THEN
SET credit = 'B';
WHEN point >= 70 THEN
SET credit = 'C';
WHEN point >= 60 THEN
SET credit = 'D';
ELSE
SET credit = 'F';
END CASE;
SELECT point;
SELECT credit;
END $$
DELIMITER ;
CALL ifproc4();
