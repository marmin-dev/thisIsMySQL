use sqldb;
DROP TABLE buytbl;
CREATE TABLE backup_userTbl( -- 트리거에서 자동으로 개체를 생성해줄 테이블
userID CHAR(8) NOT NULL PRIMARY KEY,
name VARCHAR(10) NOT NULL,
birthYear INT NOT NULL,
addr CHAR(2) NOT NULL,
mobile1 CHAR(3),
mobile2 CHAR(8),
height SMALLINT,
mDATE DATE,
modType CHAR(2),
modDate DATE,
modUser VARCHAR(256));
DROP TRIGGER IF EXISTS backUserTbl_UpdateTrg;
-- 업데이트 트리거
DELIMITER //
CREATE TRIGGER backUptbl_UpdateTrg
	AFTER UPDATE
	ON userTbl
    FOR EACH ROW
BEGIN
	INSERT INTO backup_userTbl VALUES(OLD.userID,OLD.name,OLD.birthYear,
    OLD.addr,OLD.mobile1,OLD.mobile2,OLD.height,OLD.mDate,
    '수정',CURDATE(),current_user());
END //
DELIMITER ;
-- 삭제 트리거 
DELIMITER //
CREATE TRIGGER backUserTbl_DeleteTrg
	AFTER DELETE
    ON userTbl
    FOR EACH ROW
BEGIN
	INSERT INTO backUp_userTbl VALUES(OLD.userID,OLD.name,OLD.birthYear,
    OLD.addr,OLD.mobile1,OLD.mobile2,OLD.height,OLD.mDate,
    '삭제',CURDATE(),current_user());
END //
DELIMITER ;

UPDATE userTbl SET addr = '몽고' WHERE userID ='JKW';
SELECT * FROM backup_usertbl;
DELETE FROM userTbl WHERE height >= 177;

DELIMITER //
CREATE TRIGGER insert_warningTrg
AFTER INSERT
ON userTBL
FOR EACH ROW
BEGIN
SIGNAL SQLSTATE '45000'
SET MESSAGE_TEXT='데이터 입력 시도 금지';
END //
DELIMITER ;
INSERT INTO userTbl VALUES('ABC','에비씨',1977,'서울','011','11111111',181,'2019-12-25');
