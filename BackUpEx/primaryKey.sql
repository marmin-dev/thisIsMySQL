use tableDB;
CREATE TABLE usertbl(
userID CHAR(8) NOT NULL PRIMARY KEY,
name VARCHAR(10) NOT NULL,
birthYear INT NOT NULL
);

DESCRIBE usertbl;
DROP TABLE IF EXISTS usertbl;
CREATE TABLE userTBL
( userID CHAR(8) NOT NULL,
name VARCHAR(10) NOT NULL,
birthyear INT NOT NULL,
CONSTRAINT PRIMARY KEY PK_userId(userID)
);
DROP TABLE IF EXISTS usertbl;
CREATE TABLE userTBL(
userID CHAR(8) NOT NULL,
name VARCHAR(10) NOT NULL,
brithYear DATE NOT NULL
);
ALTER TABLE userTBL
	ADD CONSTRAINT PK_userTBL_userID
		PRIMARY KEY (userId);
        
CREATE TABLE prodTbl(
prodCode CHAR(3) NOT NULL,
prodId CHAR(4) NOT NULL,
prodDate DATETIME NOT NULL,
prodCur CHAR(10) NULL
);
ALTER TABLE prodTbl
	ADD CONSTRAINT PK_prodTbl_prodcode_prodId
    PRIMARY KEY (prodCode, prodID);
SHOW KEYS FROM prodTbl;
-- 생성과 동시에 기본키 지정하기
DROP TABLE prodTbl;
CREATE TABLE prodTbl(
prodCode CHAR(3) NOT NULL,
prodId CHAR(4) NOT NULL,
prodDate DATETIME NOT NULL,
prodCur CHAR(10) NULL,
 CONSTRAINT PK_prodTbl_prodcode_prodId
    PRIMARY KEY (prodCode, prodID)
);