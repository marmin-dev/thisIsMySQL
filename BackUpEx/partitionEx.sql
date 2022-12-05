DROP DATABASE IF EXISTS partdb;
CREATE DATABASE IF NOT EXISTS partDB;
use partdb;
CREATE TABLE parttbl(
name CHAR(3) NOT NULL,
addr VARCHAR(2) NOT NULL)
PARTITION BY LIST COLUMNS(addr)(
PARTITION part1 VALUES IN ('경남'),
PARTITION part2 VALUES IN ('서울')
);
INSERT INTO parttbl VALUES('김길환','경남'),('김부환','서울'),('김정환','경남'),('김양환','서울'),('김인환','경남'),('김주환','서울'),('김경환','경남');

EXPLAIN SELECT * FROM parttbl;
