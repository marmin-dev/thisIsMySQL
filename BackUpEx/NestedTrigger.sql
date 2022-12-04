DROP DATABASE IF EXISTS triggerDB;
CREATE DATABASE IF NOT EXISTS triggerDB;
USE triggerDB;
CREATE TABLE orderTbl( -- 구매테이블
orderNo INT auto_increment PRIMARY KEY,
userID VARCHAR(5),
prodName VARCHAR(5),
orderAmount INT);
CREATE TABLE prodTbl( -- 물품테이블
prodName VARCHAR(5),
account INT);
CREATE TABLE deliverTbl( -- 배송테이블
deliverNo INT auto_increment PRIMARY KEY,
prodName VARCHAR(5),
account INT);
INSERT INTO prodTbl VALUES ('사과',100),('배',100),('귤',100);
-- 물품 테이블에서 개수를 감소시키는 트리거
DROP TRIGGER IF EXISTS orderTrg;
DELIMITER //
CREATE TRIGGER orderTrg
	AFTER INSERT
    ON orderTBL
    FOR EACH ROW
BEGIN
	UPDATE prodTbl SET account = account - NEW.orderamount
    WHERE prodName = new.prodName;
    END //
    DELIMITER ;
-- 배송 테이블에 새 배송 건을 입력하는 트리거
DROP TRIGGER IF EXISTS prodTrg;
DELIMITER //
CREATE TRIGGER prodTrg
	AFTER UPDATE
    ON prodTBL
    FOR EACH ROW
BEGIN
	DECLARE orderAmount INT;
    -- 주문 개수
    SET orderAmount = OLD.account - NEW.account;
    INSERT INTO deliverTbl(prodName,account)
    VALUES(NEW.prodName, orderAmount);
END //
DELIMITER ;
INSERT INTO orderTbl Values(NULL,'JHON','배',5);
SELECT * FROM orderTbl;
SELECT * FROM prodTbl;
SELECT * FROM deliverTbl;

INSERT INTO orderTbl VALUES (NULL,'DANG', '사과',9);