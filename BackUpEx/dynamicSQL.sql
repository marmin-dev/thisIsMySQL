use sqldb;
PREPARE myQuery FROM 'SELECT * FROM usertbl WHERE userID = "EJW"';
EXECUTE myQuery;
DEALLOCATE PREPARE myQuery;

DROP TABLE IF EXISTS myTable;
CREATE TABLE myTable(id INT auto_increment PRIMARY KEY, mDate DATETIME);
SET @curDate = CURRENT_TIMESTAMP();
PREPARE myQuery FROM 'INSERT INTO myTable VALUES(NULL,?)';
EXECUTE myQuery USING @curDate;
deallocate prepare myQuery;
SELECT * FROM myTable;