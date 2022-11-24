use sqldb;
-- 구매액 높은순 정렬하기
SELECT userID, SUM(price*amount) AS '총구매액'
FROM buytbl
GROUP BY userID
ORDER BY SUM(price * amount) DESC;
-- INNER JOIN으로 사용자 이름도 출력하기
SELECT B.userID,U.name, SUM(price*amount) AS '총구매액'
FROM buytbl B
INNER JOIN usertbl U
ON B.userId = U.userId
GROUP BY userID 
ORDER BY SUM(price * amount) DESC;
-- RIGHT OUTER JOIN으로 구매하지 않은 고객의 명단도 출력하기
SELECT B.userID,U.name, SUM(price*amount) AS '총구매액'
FROM buytbl B
RIGHT OUTER JOIN usertbl U
ON B.userId = U.userId
GROUP BY userID, U.name
ORDER BY SUM(price * amount) DESC;
-- USERID usertbl로 변환하기
SELECT U.userID,U.name, SUM(price*amount) AS '총구매액'
FROM buytbl B
RIGHT OUTER JOIN usertbl U
ON B.userId = U.userId
GROUP BY userID, U.name
ORDER BY SUM(price * amount) DESC;
-- 우수고객 선정하기
SELECT U.userID,U.name, SUM(price*amount) AS '총구매액',
CASE 
	WHEN (SUM(price*amount)>=1500)THEN '최우수고객'
    WHEN (SUM(price*amount)>=1000)THEN '우수고객'
    WHEN (SUM(price*amount)>=1)THEN '일반고객'
    ELSE '유령고객'
    END AS '고객등급'
FROM buytbl B
RIGHT OUTER JOIN usertbl U
ON B.userId = U.userId
GROUP BY userID, U.name
ORDER BY SUM(price * amount) DESC;