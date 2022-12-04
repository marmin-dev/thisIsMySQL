DROP DATABASE IF EXISTS testdb;
CREATE DATABASE IF NOT EXISTS testdb;
USE testdb;
CREATE TABLE ordertbl(
orderNo INT AUTO_INCREMENT PRIMARY KEY,
prodName VARCHAR(10),
amount INT);
CREATE TABLE prodtbl(
prodName VARCHAR(10),
amount INT);
CREATE TABLE delTbl(
    cusName VARCHAR(3),
    amount INT);
    
ALTER TAble orderTbl
ADD (cusName VARCHAR(3));
DELIMITER //

CREATE TRIGGER order_prod
AFTER INSERT
ON orderTbl
FOR EACH ROW
BEGIN
UPDATE prodTbl SET amount = prodTbl.amount - amount
WHERE prodTbl.prodname = new.prodName;
END //
DELIMITER ;

ALTER TABLE delTbl
DROP column amount;

DROP TRIGGER IF EXISTS prod_del;

DELIMITER //
CREATE TRIGGER prod_del
AFTER UPDATE
ON prodtbl
FOR EACH ROW
BEGIN
DECLARE newamount INT; SET newamount = OLD.amount - new.amount;
INSERT INTO delTbl VALUES ((SELECT cusName FROM ordertbl WHERE new.prodname = ordertbl.prodname),@newamount);
END //
DELIMITER ;

INSERT INTO prodtbl VALUES ('참치',100),('꽁치',100),('넙치',100);

INSERT INTO ordertbl VALUES (null,'넙치',10,'김길환');
SELECT * FROM prodtbl;
SELECT * FROM deltbl;
SELECT * FROM ordertbl;

