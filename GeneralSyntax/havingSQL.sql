-- 구매액이 1000원이 넘은 사용자 구하기
SELECT userId AS '사용자', SUM(price * amount) AS '총 구매액' 
FROM buytbl GROUP BY userId HAVING SUM(price * amount) >= 1000;
