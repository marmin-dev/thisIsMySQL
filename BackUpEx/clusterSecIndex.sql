CREATE DATABASE IF NOT EXISTS testdb;
USE testdb;
CREATE TABLE IF NOT EXISTS clustertbl(
userId CHAR(8),
name VARCHAR(10)
);
INSERT INTO clustertbl VALUES ('LSG','이승기'),('KBS','김범수'),('KKH','김경호'),('JYP','조용필'),
('SSK','성시경'),('LJB','임재범'),('YJS','윤종신'),('EJW','은지원'),('JKW','조관우'),('BBK','바비킴');

SHOW VARIABLES LIKE 'innodb_page_size';

SELECT * FROM clustertbl;

ALTER TABLE clustertbl
ADD CONSTRAINT PK_clustertbl_userId
PRIMARY KEY(userID);

-- PRIMARY KEY 로 오름차순 정렬되었다.클러스터형 인덱스가 생성되었기 때문에
SELECT * FROM clustertbl;

CREATE TABLE sectbl(
userID CHAR(8),
name VARCHAR(10)
);

INSERT INTO sectbl VALUES ('LSG','이승기'),('KBS','김범수'),('KKH','김경호'),('JYP','조용필'),
('SSK','성시경'),('LJB','임재범'),('YJS','윤종신'),('EJW','은지원'),('JKW','조관우'),('BBK','바비킴');

ALTER TABLE sectbl
ADD CONSTRAINT un_userid
UNIQUE (userid);

SELECT * FROM sectbl;

INSERT INTO clustertbl VALUES('FNT','푸니타');
INSERT INTO clustertbl VALUES('KAI','카아이');

