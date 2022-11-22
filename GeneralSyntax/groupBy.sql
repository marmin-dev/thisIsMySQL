-- 사용자 ID를 묶어 SUM함수로 구매 개수 합치기
SELECT userID, sum(amount) FROM buytbl GROUP BY userID;
-- 별칭(alias)를 사용하기
SELECT userID AS '사용자', sum(amount) AS '총구매개수' FROM buytbl
GROUP BY userID;

SELECT AVG(amount) FROM buytbl;
SELECT name, max(height), min(height) FROM usertbl GROUP BY name;
-- 원하는 결과가 도출되지 않고 전체 이름과 키가나옴
-- 가장 키큰 사람과 가장 키작은 사람 구하기
SELECT name, height FROM usertbl WHERE height = 
(SELECT MAX(height) FROM usertbl) OR height =
(SELECT MIN(height) FROM usertbl);
-- 휴대폰이 있는 사용자 수 조회하기
SELECT COUNT(mobile1) AS '휴대폰이 있는 사람' FROM usetbl;

