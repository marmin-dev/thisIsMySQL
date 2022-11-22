-- 테이블을 복사하는 CREATE  SELECT 구문 쿼리
CREATE TABLE buytbl2 (SELECT * FROM buytbl);
CREATE TABLE buytbl2 (SELECT prodname, price FROM buytbl);
-- PK나 FK의 제약조건은 복사되지 않는다 
