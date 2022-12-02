SET GLOBAL log_bin_trust_function_creators = 1;
USE sqldb;
-- 가장 기본적인 합계 함수
DELIMITER $$
CREATE FUNCTION userFunc(value1 INT, value2 INT)
RETURNS INT
BEGIN
	RETURN value1 + value2;
END $$
DELIMITER ;
SELECT userFunc(100,200);
-- 출생년도를 입력하면 나이가 출력되는 함수
DROP FUNCTION IF EXISTS getAgeFunc;
DELIMITER $$
CREATE FUNCTION getAgeFunc(bYear INT)
	RETURNS INT
BEGIN
DECLARE age INT;
SET age = YEAR(curdate()) - bYear;
RETURN age;
END $$
DELIMITER ;
SELECT getAgeFunc(1979);

-- 함수의 반환값을 SELECT INTO 문으로 저장하여 사용도 가능하다
SELECT getAgeFunc(1979) INTO @age1979;
SELECT @age1979;

-- 함수는 주로 테이블을 조회할 때 사용된다
SELECT userID, name, getAgeFunc(birthYear) FROM usetbl;



