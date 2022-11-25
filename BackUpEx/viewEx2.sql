use sqldb;
CREATE VIEW v_userbuytbl
AS SELECT U.userid AS 'USER ID',U.name AS 'USER NAME',B.prodName AS 'PRODUCT NAME',
U.addr AS 'ADDRESS', CONCAT(U.mobile1,U.mobile2) AS 'MOBILE PHONE'
FROM usertbl U
INNER JOIN buytbl B
ON U.userid = B.userid;
SELECT * FROM v_userbuytbl;
SELECT `USER NAME`,`USER ID` FROM v_userbuytbl; -- 백틱
-- 한글 열 이름도 가능하다 하지만 호환성 문제로 별로 권장하지는 않음
-- 뷰의 삭제
DROP VIEW v_userbuytbl;
CREATE OR REPLACE VIEW v_usertbl
AS
SELECT userid, name, addr FROM usertbl;
DESCRIBE v_usertbl; -- 뷰의 소스코드 확인하기a
UPDATE v_usertbl SET addr = '부산' WHERE userid = 'JKW';
-- 뷰를 통해 데이터 수정하기
CREATE VIEW v_sum
AS
SELECT userid AS 'userid', SUM(price * amount) AS 'total'
FROM buytbl GROUP BY userid;
SELECT * FROM v_sum;
-- 키가 177 이상인 뷰
CREATE VIEW v_height
AS
SELECT * FROM usertbl WHERE height >= 177;
SELECT * FROM v_height;
-- 키가 177 이상만 입력되게 하기
ALTER VIEW v_height
AS
SELECT * FROM usertbl WHERE height >= 177
WITH CHECK OPTION;
DROP TABLE IF EXISTS usertbl, buytbl;
