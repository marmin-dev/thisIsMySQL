USE tabledb;

DROP TABLE IF EXISTS buytbl,usertbl;

CREATE TABLE usertbl(
userID CHAR(8),
name VARCHAR(10),
birthYear INT,
addr CHAR(2),
mobile1 CHAR(3),
mobile2 CHAR(8),
height INT,
mDATE DATE);

CREATE TABLE buytbl(
num int auto_increment PRIMARY KEY,
userid CHAR(8),
prodname CHAR(6),
groupName CHAR(4),
price int,
amount smallint);

DROP TABLE IF EXISTS usertbl;

INSERT INTO usertbl VALUES 
('LSG','이승기',1987,'서울','011','11111111',182,'2008-8-8'),
('KBS','김범수',NULL,'경남','011','22222222',173,'2012-4-4'),
('KKH','김경호',1971,'전남','019','33333333',177,'2007-7-7'),
('JYP','조용필',1950,'경기','011','44444444',166,'2009-4-4');

INSERT INTO buytbl VALUES
(NULL,'KBS','운동화',NULL,30,2),
(NULL,'KBS','노트북','전자',1000,1),
(NULL,'JYP','모니터','전자',200,1),
(NULL,'BBK','모니터','전자',200,5);

ALTER TABLE usertbl
ADD CONSTRAINT PK_userid
PRIMARY KEY (userID);

DESC usertbl; -- usertbl check status

ALTER TABLE buytbl
ADD CONSTRAINT FK_userid
foreign key(userid)
REFERENCES usertbl(userid); -- PK value and FK value dismatch

DELETE FROM buytbl WHERE userid = 'BBK'; -- Delete dismatch value and add constraint FK

SET FOREIGN_KEY_CHECKS = 0; -- FK constraint disable

INSERT INTO buytbl VALUES
(NULL,'BBK','모니터','전자',200,5),
(NULL,'KBS','청바지','의류',50,3),
(NULL,'BBK','메모리','전자',80,10),
(NULL,'SSK','책','서적',15,5),
(NULL,'EJW','책','서적',15,2),
(NULL,'EJW','청바지','의류',50,1),
(NULL,'BBK','운동화',NULL,30,2),
(NULL,'EJW','책','서적',15,1),
(NULL,'BBK','운동화',NULL,30,2);

SET FOREIGN_KEY_CHECKS = 1;

ALTER TABLE usertbl
ADD CONSTRAINT CK_birthYear
CHECK ((birthYear >= 1900 AND birthYear <= 2023) AND (birthYear IS NOT NULL)); -- Error 

UPDATE usertbl SET birthYear = 1979 WHERE userid = 'KBS';
UPDATE usertbl SET birthYear = 1971 WHERE userid = 'KKH';

INSERT INTO usertbl VALUES 
('SSK','성시경',1979,'서울',NULL,NULL,186,'2013-12-12'),
('LJB','은지원',1963,'서울','016','66666666',182,'2009-9-9'),
('YJS','윤종신',1969,'경남',NULL,NULL,170,'2005-5-5'),
('EJW','은지원',1972,'경북','011','88888888',174,'2014-3-3'),
('JKW','조관우',1965,'경기','018','99999999',172,'2010-10-10'),
('BBK','바비킴',1973,'서울','011','00000000',176,'2013-5-5');

CREATE VIEW v_inntbl AS
SELECT B.userid, U.name,U.addr,CONCAT(U.mobile1,U.mobile2) AS 'Phone Num'
FROM usertbl U
INNER JOIN buytbl B
ON B.userid = U.userid;

SELECT * FROM v_inntbl;

CREATE VIEW v_outtbl AS
SELECT B.userid, U.name,U.addr,CONCAT(U.mobile1,U.mobile2) AS 'Phone Num'
FROM usertbl U
LEFT OUTER JOIN buytbl B
ON B.userid = U.userid;

SELECT * FROM v_outtbl;

SELECT COUNT(*) FROM buytbl;

ALTER TABLE buytbl
DROP FOREIGN KEY FK_userid;

ALTER TABLE buytbl
ADD CONSTRAINT FK_userid
FOREIGN KEY (userid)
REFERENCES usertbl(userid)
ON UPDATE CASCADE; -- If PrimaryKey updated, update FK automatically

UPDATE usertbl SET userID = 'VVK' WHERE userid = 'BBK';

SELECT * FROM buytbl;

ALTER TABLE buytbl
DROP FOREIGN KEY FK_userid;

ALTER TABLE buytbl
ADD CONSTRAINT FK_userid
FOREIGN KEY (userid)
REFERENCES usertbl(userid)
ON UPDATE CASCADE -- If PrimaryKey updated, update FK automatically
ON DELETE CASCADE; -- If PrimaryKey deleted, delete FK automatically

