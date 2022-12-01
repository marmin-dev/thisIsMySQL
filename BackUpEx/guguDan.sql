DROP TABLE IF EXISTS guguTBL;
CREATE TABLE guguTBL(txt VARCHAR(100));
DROP PROCEDURE IF EXISTS whileProc;
DELIMITER $$
CREATE PROCEDURE whileProc()
BEGIN
	DECLARE str VARCHAR(100);
    DECLARE i INT;
    DECLARE k INT;
    SET i =2;
    
    WHILE(i<10) DO
    SET str = '';
    SET k = 1;
    WHILE (k<10) DO
    SET str = CONCAT(str,' ',i,'x',k,'=',i*l);
    SET k = k + 1;
    END WHILE;
    SET i = i + 1;
    INSERT INTO guguTBL VALUES(str);
END WHILE;
END $$
DELIMITER ;

CALL whileProc();
SELECT * FROM guguTbl;
