-- 출생년도가 1900년 이후 2023년 이전으로 설정하기
DROP TABLE IF EXISTS usertbl;
CREATE TABLE userTbl(
userId CHAR(4) NOT NULL,
name CHAR(4) NOT NULL,
birthYear CHAR(4) CHECK (birthYear >= 1900 AND birthYear <=2023) NOT NULL,
email VARCHAR(20) CHECK (email IN('@','.'))
);
CREATE TABLE userTbl(
userId CHAR(4) NOT NULL,
name CHAR(4) NOT NULL,
birthYear CHAR(4) CHECK (birthYear >= 1900 AND birthYear <=2023) NOT NULL,
email VARCHAR(20) 
CONSTRAINT ck_email CHECK (email IN('@','.'))
);