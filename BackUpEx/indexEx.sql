USE tabledb;
SHOW INDEX FROM usertbl;
USE sqldb;
-- Unique Index 즉 보조인덱스는 여러개 생성이 가능하다
CREATE TABLE tbl1(
a INT PRIMARY KEY,
b INT UNIQUE,
c INT UNIQUE,
d INT);

SHOW INDEX FROM tbl1;

-- 클러스터형 인덱스가 비었다고 UNIQUE가 클러스터형 인덱스가 되는것은 아니다
CREATE TABLE tbl2(
a INT UNIQUE,
b INT UNIQUE,
c INT UNIQUE,
d INT);

SHOW INDEX FROM tbl2;

CREATE TABLE tbl3(
a INT UNIQUE NOT NULL,
b INT UNIQUE,
c INT UNIQUE,
d INT);

SHOW INDEX FROM tbl3;
-- a열에는 보조인덱스 생성, d열에 클러스터형 인덱스가 생성.
CREATE TABLE tbl4(
a INT UNIQUE NOT NULL,
b INT UNIQUE,
c INT UNIQUE,
d INT PRIMARY KEY);

SHOW INDEX FROM tbl4;

USE tabledb;
SHOW INDEX FROM buytbl;
SELECT * FROM buytbl;
SHOW INDEX FROM usertbl;
SELECT * FROM usertbl;
SHOW TABLES IN tableDB;