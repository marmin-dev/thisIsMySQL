CREATE TABLE streamTbl(
    MapNumber CHAR(10),
    StreamName CHAR(20),
    Stream GEOMETRY
);
INSERT INTO streamTbl VALUES
('330000001','한류천',ST_GeomFromText('LINESTRING(-10 30,-50 70, 50 70)'0));