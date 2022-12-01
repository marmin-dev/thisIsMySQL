SELECT routine_name, routine_definition FROM information_schema.routines
where routine_schema = 'sqldb' AND routine_type = 'PROCEDURE'; -- 현재 저장된 프로시저의 이름 및 내용 확인
SHOW CREATE PROCEDURE sqldb.userProc3; -- 현재 저장된 프로시저의 내용확인

DROP PROCEDURE IF EXISTS nameProc;
DELIMITER $$
CREATE PROCEDURE nameProc(
IN tblName VARCHAR(20)
)
BEGIN
SELECT * FROM tblName;
END $$
DELIMITER ;

CALL nameProc('usertbl'); -- mysql에서는 파라미터로 테이블이름을 사용이 불가능하다
