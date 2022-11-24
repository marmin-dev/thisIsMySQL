CREATE DATABASE pracDB;
USE pracDB;
CREATE TABLE pivotTest(
name CHAR(3),
club CHAR(4),
clubmember INT);
INSERT INTO pivotTest VALUES ('김길환','배구부',14),('김길환','야구부',23),('김길환','택견부',22),
('김정환','배구부',14),('김택환','야구부',23),('김영환','택견부',22),
('감영환','야구부',23),('김택환','배구부',14),('김정환','택견부',22);
SELECT name,
SUM(IF(club='배구부',clubmember,0)) AS '배구부',
SUM(IF(club='야구부',clubmember,0)) AS '야구부',
SUM(IF(club='택견부',clubmember,0)) AS '야구부',
SUM(clubmember) AS '합계' from pivotTest
GROUP BY name;

SELECT JSON_OBJECT('name',name,'club',club,'clubmember',clubmember)
AS 'JSON값' FROM pivotTest;