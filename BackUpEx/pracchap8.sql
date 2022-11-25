USE tabledb;
DROP TABLE IF EXISTS buytbl, usertbl;
CREATE TABLE usertbl(
userID CHAR(8),
name VARCHAR(10),
birthYear INT,
addr CHAR(2),
mobile1 CHAR(3),
mobile2 CHAR(8),
height SMALLINT,
mDate DATE
);
CREATE TABLE buytbl(
num INT auto_increment PRIMARY KEY,
userid CHAR(8),
prodName CHAR(6),
groupName CHAR(4),
price INT,
amount SMALLINT
);
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
ADD CONSTRAINT PK_usertbl_userID
PRIMARY KEY (userId);

ALTER TABLE buytbl
ADD CONSTRAINT FK_buytbl_userID
foreign key (userId)
REFERENCES usertbl(userId);

DELETE FROM buytbl WHERE userid = 'BBK';
SET foreign_key_checks = 0;
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
SET foreign_key_checks = 1;
INSERT INTO usertbl VALUES 
('SSK','성시경',1979,'서울',NULL,NULL,186,'2013-12-12'),
('LJB','은지원',1963,'서울','016','66666666',182,'2009-9-9'),
('YJS','윤종신',1969,'경남',NULL,NULL,170,'2005-5-5'),
('EJW','은지원',1972,'경북','011','88888888',174,'2014-3-3'),
('JKW','조관우',1965,'경기','018','99999999',172,'2010-10-10'),
('BBK','바비킴',1973,'서울','011','00000000',176,'2013-5-5');
SELECT B.userid,U.name,B.prodname,B.groupname
FROM usertbl U
INNER JOIN buytbl B
ON U.userid = B.userid;
SELECT B.userid,U.name,B.prodname,B.groupname
FROM usertbl U
LEFT OUTER JOIN buytbl B
ON U.userid = B.userid;

ALTER TABLE buytbl
DROP foreign key FK_buytbl_userID;
ALTER TABLE buytbl
ADD CONSTRAINT FK_buytbl_userID
foreign key (userId)
REFERENCES usertbl(userId)
ON UPDATE CASCADE;
UPDATE usertbl SET userID = 'VVk' WHERE userId = 'BBK';

