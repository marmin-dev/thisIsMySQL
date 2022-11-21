CREATE DATABASE sqldb;
USE sqldb;
CREATE TABLE usertbl
(userID CHAR(8) NOT NULL PRIMARY KEY,--사용자 ID (PK)
name VARCHAR(10) NOT NULL, --이름
birthYear INT NOT NULL, --출생년도
addr CHAR(2) NOT NULL, --지역경기, 서울, 경남 식으로 2글자만 입력
mobile1 CHAR(3), --휴대폰의 국번 등등
mobile2 CHAR(8), -- 휴대폰의 나머지 전화번호 (하이픈 제외)
height SMALLINT, --키
mDate DATE); --회원가입일
CREATE TABLE buytbl
(num INT AUTO_INCREMENT NOT NULL PRIMARY KEY, --순번(PK)
userID CHAR(8) NOT NULL, --아이디(FK)
prodName CHAR(6) NOT NULL, --물품병
groupName CHAR(4), --분류
price INT NOT NULL, --단가
amount SMALLINT NOT NULL, --수량
FOREIGN KEY (userID) REFERENCES usertbl(userID)
);