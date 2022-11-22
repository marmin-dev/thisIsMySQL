-- 1970년 이후 태어나고 신장이 182 이상인 사람의 ID와 이름 조회하기
SELECT userID, name from usertbl 
WHERE birthYear >= 1970 AND height >=182;
-- 1970년 이후에 태어났거나 신장이 182 이상인 사람 조회하기
SELECT * FROM usertbl
WHERE birthYear >= 1970 OR height >= 182;
-- 키가 180 이상 183 이하인 사람 조회하기
SELECT * FROM usertbl
WHERE height>=180 AND height<=183;

SELECT * FROM usertbl
WHERE BETWEEN 180 AND 183;
-- OR IN() 경남, 전남, 경북에 사는 사람 조회하기
SELECT * FROM usertbl
WHERE addr='경남' OR addr='전남' OR add='경북';

SELECT * FROM usertbl
WHERE addr IN('경남','전남','경북');
-- 문자열의 내용 검색 김씨 조회하기(LIKE)
SELECT * FROM usertbl
WHERE name LIKE '김%';

--이름이 말민인 사람 조회하기
SELECT * FROM usertbl
WHERE name LIKE '_말민';
