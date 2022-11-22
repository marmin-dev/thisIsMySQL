-- testtbl 의 Aamer이라는 성을 가진 사람 삭제하기
DELETE FROM testtbl4 WHERE Fname = 'Aamer';
-- LIMIT구문과 함께 사용하여 상위부터 자르기도 가능하다
DELETE FROM tableName;-- Transaction 발생, 테이블 구조는 남기고 
-- 데이터는 전부 삭제한다 DDL
DROP TABLE tableName;-- 테이블 자체를 삭제한다 DDL
TRUNCATE TABLE tableName; -- DDL Transaction을 발생시키지않고,
--테이블 구조는 남기고 데이터는 전부 삭제한다