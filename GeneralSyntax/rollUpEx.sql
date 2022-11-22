-- 분류별 합계 및 총합 구하기
SELECT num,groupName,SUM(price * amount) FROM buytbl
GROUP BY groupName,num WITH ROLLUP;