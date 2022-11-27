CREATE VIEW v_inntbl AS
SELECT B.userid, U.name,U.addr,CONCAT(U.mobile1,U.mobile2) AS 'Phone Num'
FROM usertbl U
INNER JOIN buytbl B
ON B.userid = U.userid;

CREATE VIEW v_outtbl AS
SELECT B.userid, U.name,U.addr,CONCAT(U.mobile1,U.mobile2) AS 'Phone Num'
FROM usertbl U
LEFT OUTER JOIN buytbl B
ON B.userid = U.userid;

SELECT `userid`,`name` FROM v_inntbl; -- to See data From View use backtik on columnname

DROP VIEW v_outtbl; -- Delete View query

UPDATE v_inntbl SET addr = '부산' WHERE userid = 'VVK';

SELECT * FROM usertbl WHERE userid = 'VVK';

CREATE VIEW v_sum -- make view using aggregate function
AS
SELECT userid AS 'userid', SUM(price * amount) AS 'total'
FROM buytbl GROUP BY userid;

SELECT * FROM v_sum;




