use sqldb;
SELECT * FROM clubtbl; 
SELECT stdName, addr FROM stdtbl
UNION
SELECT clubname, clubRoom FROM clubtbl;

SELECT stdName, addr FROM stdtbl
UNION ALL
SELECT clubname, clubRoom FROM clubtbl;
-- 전화번호가 없는 사람 출력하기
SELECT name, CONCAT(mobile1,mobile2) AS '전화번호' FROM usertbl
WHERE name NOT IN (SELECT name FROM usertbl WHERE mobile1 IS NULL);

SELECT name, CONCAT(mobile1,mobile2) AS '전화번호' FROM usertbl
WHERE name IN (SELECT name FROM usertbl WHERE mobile1 IS NULL); 

