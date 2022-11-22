-- sqlDB의 구매 테이블에서 사용자가 구매한 물품의 개수를 보기위한 쿼리
USE sqldb;
SELECT userID, amount FROM buytbl ORDER BY userID;
-- 집계함수와 GROUP BY절을 이용하여 구매개수 내보내기
SELECT userID, sum(amount) FROM buytbl GROUP BY userID;
-- 가독성이 좋도록 별칭을 사용하여 결과를 출력하는 쿼리
SELECT userID AS '사용자 아이디', SUM(amount) AS '총 구매 개수'
FROM buytbl GROUP BY userID;
DESCRIBE buytbl;
-- 총 구매액을 결과값으로 출력하는 쿼리
SELECT userID AS '사용자 아이디', SUM(price*amount) AS '총 구매액'
FROM buytbl GROUP BY userID;
SELECT prodName, SUM(amount) FROM buytbl GROUP BY prodName;
-- 전체 구매자가 구매한 물품의 개수의 평균 구하기
SELECT AVG(amount) FROM buytbl;
SELECT name,MAX(height), MIN(height) FROM usertbl GROUP BY name;
SELECT name, height FROM usertbl
WHERE height = (SELECT MAX(height) FROM usertbl)
OR height = (SELECT MIN(height) FROM usertbl);
-- 휴대폰이 있는 사용자의 수 카운트하기
SELECT COUNT(*) FROM usertbl;
SELECT COUNT(mobile1) AS '휴대폰이 있는 사용자' FROM usertbl;

