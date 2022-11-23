-- 시스템 정보 함수
-- 시스템의 정보를 출력하는 함수를 제공한다
-- USER(), DATABASE() 현재 사용자 및 현재 선택된 데이터베이스를 구한다
SELECT CURRENT_USER(), DATABASE();
-- FOUND_ROWS() 바로앞의 SELECT문에서 조회된 해의 개수를 구한다
SELECT FOUND_ROWS();
-- ROW_COUNT() 바로 앞의 INSERT, UPDATE, DELETE 문에서 입력,수정,삭제된 행의 개수를 구한다
-- CREATE DROP문은 0을 반환하고, SELECT 문은 -1을 반환한다
USE sqldb;
UPDATE buytbl SET price = price *2;
SELECT ROW_COUNT();
-- VERSION() 현재 MySQL의 버전을 구한다
-- SLEEP(초) 쿼리의 실행을 입력한 초 만큼 멈춘다