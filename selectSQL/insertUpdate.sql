INSERT INTO memberTBL VALUES ('FIGURE','연아','경기 군포시 당정동');
UPDATE memberTBL SET memberAddress = '서울 강남구 역삼동' WHERE memberName = '연아';
DELETE FROM memberTBL WHERE memberName = '연아';
SELECT * FROM memberTBL;