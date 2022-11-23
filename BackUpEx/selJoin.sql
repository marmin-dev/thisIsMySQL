USE sqldb;
CREATE TABLE emptbl
(emp CHAR(3),manager CHAR(3),empTel VARCHAR(8));
INSERT INTO emptbl VALUES('나사장',NULL,'0000'),('김재무','나사장','2222'),
('김부장','김재무','2222-1'),('이부장','김재무','2222-2'),('우대리','이부장','2222-2-1'),
('지사원','이부장','2222-2-2'),('이영업','나사장','1111'),('한과장','이영업','1111-1'),
('최정보','나사장','3333'),('윤차장','최정보','3333-1'),('이주임','윤차장','3333-1-1');
-- 우대리의 직속상관 연락처를 셀프조인을 통해 찾아보기
SELECT A.emp AS '부하직원', B.emp AS '직속상관',B.emptel AS '직속상관연락처'
FROM emptbl A
INNER JOIN emptbl B
ON A.manager = B.emp
WHERE A.emp ='우대리';