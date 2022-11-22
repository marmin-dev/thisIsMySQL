USE sqldb;
SET @myVar1 = 5;
SET @myVar2 = 3;
SET @myVar3 = 4.25;
SET @myVar4 = '가수 이름==>';

SELECT @myVar1 + @myVar2;
SELECT @myVar4, Name FROM usertbl WHERE height > 180;
PREPARE myQuery FROM 'SELECT Name, height FROM userTbl ORDER BY height LIMIT ?';
EXECUTE myQuery USING @myVar2;