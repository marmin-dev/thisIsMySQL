use tableDB;
DROP TABLE IF EXISTS usertbl, buytbl;
CREATE TABLE usertbl(
userId char(4) NOT NULL,
name CHAR(4) NOT NULL,
birthYear INT NOT NULL,
CONSTRAINT PK_userid PRIMARY KEY (userId)
);
-- FK 제약조건 이름 자동생성
CREATE TABLE buytbl(
userId CHAR(4) NOT NULL,
prodname VARCHAR(10) NOT NULL,
FOREIGN KEY (userId) REFERENCES usertbl(userId)
);
-- 제약 조건 이름 내가 정의하기
CREATE TABLE buytbl(
userId CHAR(4) NOT NULL,
prodname VARCHAR(10) NOT NULL,
CONSTRAINT FK_userId FOREIGN KEY (userId) REFERENCES usertbl(userId)
);
-- 생성이후 제약조건 설정하기
DROP TABLE buytbl;
CREATE TABLE buytbl(
userId CHAR(4) NOT NULL,
prodname VARCHAR(10) NOT NULL
);
ALTER TABLE buytbl
ADD CONSTRAINT FK_userId
FOREIGN KEY (userid)
REFERENCES usertbl(userid);
-- 설정된 외래키 확인하기
SHOW INDEX FROM buytbl;
-- 외래 키 옵션
ALTER TABLE buytbl
ADD CONSTRAINT FK_userId
FOREIGN KEY (userid)
REFERENCES usertbl(userid)
ON UPDATE CASCADE;
