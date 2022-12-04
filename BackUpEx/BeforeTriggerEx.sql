USE sqlDB;
DROP TRIGGER IF EXISTS usertbl_BeforeInsert;
DELIMITER //
CREATE TRIGGER userTbl_BeforeInsert
	BEFORE INSERT
	ON usertbl
    FOR EACH ROW
BEGIN
	IF NEW.birthYear < 1900 THEN
    SET NEW.birthYear = 0; -- 1900년 이전 출생이라면 0으로 저장 
    ELSEIF NEW.birthYear > YEAR(CURDATE()) THEN
    SET NEW.birthYear = YEAR(CURDATE()); -- 현재보다 늦은 날짜라면 현년도 저장
    END IF;
END //
DELIMITER ;
INSERT INTO usertbl VALUES('abc', '아베쎄', 1873, '서울', '010', '00000130', 179, '2013-5-5');
SELECT * FROM usertbl WHERE name='아베쎄';
UPDATE usertbl SET userid='ABC' WHERE name = '아베쎄';
INSERT INTO usertbl VALUES('BCD', '베쎄데', 2024, '뉴욕', '010', '02000130', 199, '2013-1-5');
SELECT * FROM usertbl WHERE name='베쎄데';
DROP TRIGGER usertbl_BeforeInsert;