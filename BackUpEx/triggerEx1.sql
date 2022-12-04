CREATE DATABASE IF NOT EXISTS testDB;
USE testDB;
CREATE TABLE IF NOT EXISTS testTBL(id INT, txt VARCHAR(10));
INSERT INTO testTBL VALUES(1,'레드벨벳');
INSERT INTO testTBL VALUES(2,'잇지');
INSERT INTO testTBL VALUES(3,'블랙핑크');
-- testTBL에 트리거 부착하기
DROP TRIGGER IF EXISTS testTRG;
DELIMITER //
CREATE TRIGGER tstTrg
AFTER DELETE -- 삭제시 발생
ON testTbl -- 테스트 테이블에서
FOR EACH ROW -- 각행마다
BEGIN
SET @msg='가수 그룹이 삭제됨';
END //
DELIMITER ;
SET @msg ='';
INSERT INTO testTbl VALUES(4,'마마무');
SELECT @msg;
DELETE FROM testTBl WHERE txt = '마마무';
