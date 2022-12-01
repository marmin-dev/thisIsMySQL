DROP PROCEDURE IF EXISTS errorProc;
DELIMITER $$
CREATE PROCEDURE errorProc()
BEGIN
	DECLARE i INT;
    DECLARE hap INT;
    DECLARE saveHap INT;
    
    DECLARE EXIT HANDLER FOR 1264
    BEGIN
		SELECT CONCAT('INT 오버플로 직ㄴ의 합계 -->',saveHap);
        SELECT CONCAT('1+2+3+4+...+',i,'=오버플로');
		END;
        SET i = 1;
        SET hap = 0;
        
        WHIlE (TRUE) DO
        SET saveHap = hap;
        SET hap = hap + i;
        SET i = i+1;
END WHILE;
END $$
DELIMITER ;

CALL errorProc();
