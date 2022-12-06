DROP DATABASE IF EXISTS GisDB;
CREATE DATABASE GisDB;
USE GisDB;
CREATE TABLE StreamTbl(
MapNumber CHAR(10),
StreamName CHAR(20),
Stream GEOMETRY);
INSERT INTO StreamTbl VALUES ('330000001','한류천',ST_GeomFromText('LINESTRING(-10 30,-50 70,50 70)'));
INSERT INTO StreamTbl VALUES ('330000001','안양천',ST_GeomFromText('LINESTRING(-50 -70,30 -10,70 -10)'));
INSERT INTO StreamTbl VALUES ('330000002','일산천',ST_GeomFromText('LINESTRING(-70 50,-30 -30,30 -60)'));
CREATE TABLE BuildingTbl(
MapNumber CHAR(10),
BuildingName CHAR(20),
Building GEOMETRY);
INSERT INTO BuildingTbl VALUES ('330000005','하나은행',ST_GeomFromText('POLYGON((-10 50,10 30,-10 10,-30 30,-10 50))'));
INSERT INTO BuildingTbl VALUES ('330000001','우리빌딩',ST_GeomFromText('POLYGON((-50 -70,-40 -70,-40 -80,-50 -60,-50 -70))'));
INSERT INTO BuildingTbl VALUES ('330000002','디티오피스텔',ST_GeomFromText('POLYGON((40 0,60 0,60 -20,40 -20,40 0))'));

SELECT * FROM StreamTbl
UNION ALL
SELECT * FROM BuildingTbl;

SELECT * FROM StreamTbl WHERE ST_Length(Stream) > 140; -- 하천의 길이가 140m가 넘으면 출력
SELECT * FROM BuildingTbl WHERE ST_AREA(Building) < 500;

SELECT StreamName, BuildingName, Building, Stream
FROM Buildingtbl, StreamTbl
WHERE ST_Intersects(Building,Stream)=1 AND StreamName = '안양천'; -- 안양천과 교차하는 빌딩 출력하기

SELECT ST_BUFFER(Stream, 5) FROM StreamTbl; -- 하천의 폭을 5m로 지정하기
