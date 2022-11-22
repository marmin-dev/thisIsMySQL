-- 구매액이 많은 사용자 순서대로 정렬하기
SELECT userId,name,SUM(amount * price) AS '총구매액'
FROM buyTbl GROUP BY userId;
-- WITH CTE 로 개선하기
WITH abc(userId, name, total)
AS
(
    SELECT userId, name, SUM(amount * price)
    FROM buyTbl GROUP BY userId
)
SELECT * FROM abc ORDER BY total DESC;
