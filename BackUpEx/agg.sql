-- 1000원 이상 물건을 구매한 사용자를 구해서 내림차순 정렬하기
SELECT userID AS '사용자', SUM(price*amount) AS '총구매액'
FROM buytbl GROUP BY userID HAVING SUM(price * amount) >=1000
ORDER BY SUM(price * amount) DESC;
-- 그룹별 합계 및 그 총합 구하기
SELECT num, groupName, SUM(price * amount) AS '비용'
FROM buytbl
GROUP BY groupName, num
WITH ROLLUP;
