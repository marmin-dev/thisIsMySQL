ALTER TABLE usertbl ADD grade VARCHAR(5);
DELIMITER $$
CREATE PROCEDURE gradeProc()
BEGIN
DECLARE id VARCHAR(10); -- 사용자 아이디를 저장할 변수
DECLARE hap BIGINT; -- 총 구매액을 저장할 변수
DECLARE userGrade CHAR(5); -- 고객 등급 변수

DECLARE endOfRow BOOLEAN DEFAULT FALSE;

DECLARE userCursor CURSOR FOR -- 커서 선언
SELECT U.userid, SUM(price * amount)
FROM buyTbl B
	RIGHT OUTER JOIN usertbl U
    ON B.userid = U.userid
    GROUP BY U.userid, U.name;
    
    DECLARE CONTINUE HANDLER
	FOR NOT FOUND SET endOfRow = TRUE;
    
    OPEN userCursor; -- 커서 열기
	grade_loop: LOOP
    FETCH userCursor INTO id, hap; -- 첫 행 값을 대입
    IF endOfRow THEN
		LEAVE grade_loop;
END IF;

CASE
	WHEN (hap >= 1500) THEN SET userGrade = '최우수고객';
    WHEN (hap >= 1000) THEN SET userGrade = '우수고객';
    WHEN (hap >= 1) THEN SET userGrade = '일반고객';
	ELSE SET userGrade = '유령고객';
    END CASE;
    
    UPDATE userTbl SET grade = userGrade WHERE userId = id;
    END LOOP grade_loop;
    CLOSE userCursor; -- 커서 닫기
    END $$
    DELIMITER ;
    CALL gradeProc();
    SELECT * FROM usertbl;
DROP PROCEDURE IF EXISTS gradeProc;