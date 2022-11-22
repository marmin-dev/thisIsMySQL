-- ANY, ALL , SOME 서브쿼리
-- 키 177 김경호 보다 큰 사람 찾기
SELECT name, height FROM usertbl WHERE height > 177;
SELECT name, height FROM usertbl WHERE height > 
(SELECT height FROM usertbl WHERE name = '김경호');
-- 경남지역의 사람의 키보다 크거나 같은 사람 찾기
SELECT name, height FROM usertbl WHERE height >= 
ANY(SELECT height FROM usertbl WHERE addr='경남');
--ANY를 뺴면 하위쿼리가 2개의 값을 반환하기 떄문에 거짓이다
-- 결과의 순서를 정하는 구문 ORDER BY
SELECT * FROM usertbl ORDER BY name; --이름순 오름차순 ASC생략
SELECT * FROM usertbl ORDER BY name DESC; --이름순 내림차순
SELECT * FROM usertbl ORDER BY height DESC, name ASC; 
--키순 내림차순을 기본으로 하나 키가 같으면 이름 오름차순
--ORDER BY 는 MySQL의 성능을 떨어뜨릴수 있기 떄문에 되도록 사용하지 말자
--ORDER BY 절은 SELECT FROM WHERE GROUP BY HAVING 중 가장 뒤에 위치
-- 중복된 것은 하나만 남기는 명령어 DISTINCT
-- 사용자의 거주지역을 알아보는 쿼리
SELECT DISTINCT addr FROM usertbl;
-- 출력하는 개수를 제한하는 LIMIT명령어 상위 N개만
-- 가장 오래근무한 상위 5명 검색하기
SELECT * FROM employees ORDER BY hire_date
LIMIT 5;
