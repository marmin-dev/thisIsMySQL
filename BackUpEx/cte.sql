USE sqldb;
SELECT userid AS '사용자', SUM(price * amount) AS '총구매액'
FROM buyTBL GROUP BY userid;
WITH abc(userId, total)
AS
(SELECT userid,sum(price * amount)
FROM buytbl GROUP BY userid)
SELECT * FROM abc ORDER BY total desc;
SELECT addr, MAX(height) FROM usertbl GROUP BY addr;
WITH cte_userTBL (addr, maxheight)
AS
(SELECT addr, max(height)
FROM usertbl GROUP BY addr)
SELECT * FROM cte_userTBL;

WITH cte_userTBL (addr, maxheight)
AS
(SELECT addr, max(height)
FROM usertbl GROUP BY addr)
SELECT AVG(maxheight *1.0) FROM cte_userTBL;


