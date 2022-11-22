USE sqldb;
-- 현재 구매단가가 모두 1.5배 인상되었다면?
UPDATE buytbl SET price = price * 1.5;
-- DELETE FROM
DELETE FROM testtbl4 WHERE Fname = 'Aamer';
CREATE TABLE memberTBL (SELECT userID, name, addr FROM usertbl LIMIT 3);
ALTER TABLE memberTBL
ADD CONSTRAINT pk_memberTBL PRIMARY KEY (userID);
SELECT * FROM memberTBL;
INSERT IGNORE INTO memberTBL VALUES('BBK','비비코','미국');
INSERT IGNORE INTO memberTBL VALUES('SJH','서장훈','서울');
INSERT IGNORE INTO memberTBL VALUES('HJY','현주엽','경기');
-- 첫번째 데이터는 오류로 들어가지 않았지만 나머지 데이터는 잘 들어갔다
SELECT * FROM memberTBL;
INSERT IGNORE INTO memberTBL VALUES('BBK','비비코','미국')
ON DUPLICATE KEY UPDATE name='비비코', addr='미국';
INSERT INTO memberTBL VALUES('DJM','동짜몽','일본')
ON DUPLICATE KEY UPDATE name='동짜몽', addr='일본';

