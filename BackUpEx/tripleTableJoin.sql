USE sqldb;
CREATE TABLE stdtbl(
stdname VARCHAR(10) NOT NULL PRIMARY KEY,
addr VARCHAR(4) NOT NULL
);
CREATE TABLE clubtbl(
clubName VARCHAR(10) NOT NULL PRIMARY KEY,
clubRoom CHAR(4) NOT NULL
);
CREATE TABLE stdClubTbl(
num INT auto_increment NOT NULL PRIMARY KEY,
stdName VARCHAR(10) NOT NULL,
clubName VARCHAR(10) NOT NULL,
foreign key(stdName) REFERENCES stdtbl(stdname),
foreign key(clubName) REFERENCES clubtbl(clubName));
INSERT INTO stdtbl VALUES ('김범수','경남'),('성시경','서울'),('조용필','경기'),
('은지원','경북'), ('바비킴','서울');
INSERT INTO clubtbl VALUES ('수영','101호'),('바둑','102호'),('축구','103호'),('봉사','104호');
INSERT INTO stdclubtbl VALUES (NULL,'김범수','바둑'),(NULL,'김범수','축구'),(NULL,'조용필','축구'),
(NULL,'은지원','축구'),(NULL,'은지원','봉사'),(NULL,'바비킴','봉사');

SELECT S.stdname,S.addr,C.clubName,C.clubroom
FROM stdtbl S
INNER JOIN stdclubtbl SC
ON S.stdName = SC.stdName
INNER JOIN clubtbl C
ON SC.clubName = C.clubName
ORDER BY S.stdName;
-- 기준에 따라 맞게 사용하면 된다
SELECT SC.stdname,S.addr,C.clubName,C.clubroom
FROM stdtbl S
INNER JOIN stdclubtbl SC
ON S.stdName = SC.stdName
INNER JOIN clubtbl C
ON SC.clubName = C.clubName
ORDER BY S.stdName;
