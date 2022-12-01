USE sqldb;
DROP PROCEDURE IF EXISTS userproc1;
DELIMITER $$
CREATE PROCEDURE userproc1(IN username VARCHAR(10))
BEGIN
SELECT * FROM usertbl WHERE name = username;
END $$
DELIMITER ;
CALL userproc1('조관우');
DROP PROCEDURE IF EXISTS userproc2;
DELIMITER $$
CREATE PROCEDURE userProc2(
IN userBirth INT,
IN userHeight INT
)
BEGIN
	SELECT * FROM usertbl
    WHERE birthYear > userBirth AND height > userHeight;
END $$
DELIMITER ;
CALL userProc2(1970,178);

DROP PROCEDURE IF EXISTS userProc3;
DELIMITER $$
CREATE PROCEDURE userProc3(
IN txtValue CHAR(10),
OUT outValue INT)
BEGIN
	INSERT INTO testTBL VALUES(NULL,txtValue);
    SELECT MAX(id) INTO outValue FROM testTbl;
END $$
DELIMITER ;

CREATE TABLE IF NOT EXISTS testTBL(
	id INT auto_increment PRIMARY KEY,
    txt CHAR(10)
);

CALL userProc3('테스트값',@myValue);
SELECT CONCAT('현재 입려된 ID값 ==>',@myValue);

DROP PROCEDURE IF EXISTS ifelseProc;

DELIMITER $$
CREATE PROCEDURE ifelseProc(
IN userName VARCHAR(10)
)
BEGIN
	DECLARE bYear INT;
    SELECT birthYear into byear FROM usertbl
    WHERE name = userName;
    IF(bYear >= 1980) THEN
		SELECT '아직 젊군요';
	
	ELSE
		SELECT '나이가 지긋하시네요';
	END IF;
END $$
DELIMITER ;

CALL ifelseProc('조용필');