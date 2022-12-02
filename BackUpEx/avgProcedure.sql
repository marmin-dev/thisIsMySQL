SHOW TABLES;
select * FROM usertbl;
DROP PROCEDURE IF EXISTS cursorProc;
DELIMITER $$
CREATE PROCEDURE cursorProc()
BEGIN
	DECLARE userheight INT;
    DECLARE cnt INT DEFAULT 0;
    DECLARE totalHeight INT DEFAULT 0;
    
    DECLARE endOfRow BOOLEAN DEFAULT FALSE;
    
    DECLARE userCursor CURSOR FOR
		SELECT height FROM usertbl;
        
	DECLARE CONTINUE HANDLER
    FOR NOT FOUND SET endOfRow = TRUE;
    
    OPEN userCursor;
    
    cursor_loop:LOOP
		FETCH userCursor INTO userHeight;
        
        IF endOfRow THEN
			LEAVE cursor_loop;
		END IF;
        
	SET cnt = cnt + 1;
    SET totalHeight = totalHeight + userHeight;
    END LOOP cursor_loop;
    
	-- 고객 키의 평균을 출력한다
    
    
SELECT CONCAT('고객 키의 평균 ==>', (totalHeight / cnt));
CLOSE userCursor;
END $$
DELIMITER ; 
CALL cursorProc();