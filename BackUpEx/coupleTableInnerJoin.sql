-- INNER JOIN
-- usertbl과 buytbl의 전체 열 추출하기
SELECT *
FROM usertbl
	INNER JOIN buytbl
    ON buytbl.userID = usertbl.userID
    ORDER BY num;

SELECT userID, prodName, price
FROM usertbl
INNER JOIN buytbl
ON buytbl.userID = usertbl.userID;
-- 위의 쿼리문을 실행하는데 있어 userID가 불확실하다
-- 어느테이블의 userID를 추출할지 명시해줘야한다.
SELECT usertbl.userID, prodName, price
FROM usertbl
INNER JOIN buytbl
ON buytbl.userID = usertbl.userID;
-- WHERE 로도 INNER JOIN 구현이 가능하다
SELECT *
FROM buytbl,usertbl
WHERE buytbl.userID = usertbl.userID;
-- 코드를 좀더 명확히 하고 싶다면 열이름 앞에 테이블 네임을 붙히자
-- 다만 이렇게 할 경우 코드가 너무 길어지므로 별칭을 주도록 하자
SELECT U.userID, B.prodName, B.price
FROM usertbl U
INNER JOIN buytbl B
ON B.userID = U.userID;
-- 테이블에 별칭을 주기 위해서는 FROM과 INEER JOIN뒤 테이블 이름 뒤에 공백 이름을 주면된다
-- 코드를 더욱 간결하게 표현이 가능하다
-- DISTINCT 문을 활용해서 회원의 주소록을 뽑을 수 있다 물건을 구매한 회원들 조회
SELECT DISTINCT U.userID, U.name, U.addr
FROM usertbl U
INNER JOIN buytbl B
ON U.userID = B.userID
ORDER BY U.userID
-- 같은 결과를 EXISTS문을 사용해서 만들기
SELECT U.userID, U.name, U.addr
	FROM usertbl U
    WHERE EXISTS(
    SELECT * 
    FROM buytbl B
    WHERE U.userID = B.userID);

