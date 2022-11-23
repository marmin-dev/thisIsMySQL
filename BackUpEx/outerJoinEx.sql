use sqldb;
SELECT U.userID, U.name, B.prodName, U.addr, CONCAT(U.mobile1, U.mobile2) AS '연락처'
FROM usertbl U
LEFT OUTER JOIN buytbl B
ON U.userId = B.userId;
-- 동일한 결과를 RIGHT OUTER 로 바꾸기
SELECT U.userID, U.name, B.prodName, U.addr, CONCAT(U.mobile1, U.mobile2) AS '연락처'
FROM buytbl B
RIGHT OUTER JOIN usertbl U
ON U.userId = B.userId;
-- 아무것도 구매한적 없는 회원 뽑기
SELECT U.userID, U.name, B.prodName, U.addr, CONCAT(U.mobile1, U.mobile2) AS '연락처'
FROM buytbl B
RIGHT OUTER JOIN usertbl U
ON U.userId = B.userId
WHERE B.prodname IS NULL;
-- 테이블 세개로 해보기
SELECT *
FROM stdtbl S
LEFT OUTER JOIN stdclubtbl SC
ON S.stdname = SC.stdname
LEFT OUTER JOIN clubtbl C
ON SC.clubname = C.clubname;
-- 아무데도 가입하지 않은 사람 찾기
SELECT *
FROM stdtbl S
LEFT OUTER JOIN stdclubtbl SC
ON S.stdname = SC.stdname
LEFT OUTER JOIN clubtbl C
ON SC.clubname = C.clubname
WHERE C.clubname IS NULL;
-- 가입한 인원이 없는 클럽 찾기
SELECT *
FROM stdtbl S
LEFT OUTER JOIN stdclubtbl SC
ON S.stdname = SC.stdname
RIGHT OUTER JOIN clubtbl C
ON SC.clubname = C.clubname;
-- 두 쿼리를 합쳐 둘다 확인하기
SELECT *
FROM stdtbl S
LEFT OUTER JOIN stdclubtbl SC
ON S.stdname = SC.stdname
LEFT OUTER JOIN clubtbl C
ON SC.clubname = C.clubname
WHERE C.clubname IS NULL
UNION
SELECT *
FROM stdtbl S
LEFT OUTER JOIN stdclubtbl SC
ON S.stdname = SC.stdname
RIGHT OUTER JOIN clubtbl C
ON SC.clubname = C.clubname;