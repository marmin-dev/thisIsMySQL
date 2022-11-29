USE sqldb;
USE tabledb;
SHOW INDEX FROM usertbl;
SHOW TABLE STATUS LIKE 'usertbl'; -- 인덱스의 크기가 16KB로 되어있다
CREATE INDEX idx_usertbl_addr
ON usertbl (addr); -- 단순 보조 인덱스 생성
SHOW TABLE STATUS LIKE 'usertbl';
ANALYZE TABLE usertbl; -- 생성한 인덱스를 실제 적용시키기
CREATE UNIQUE INDEX idx_usertbl_birthYear
ON usertbl(birthyear); -- 중복되는 정보가 있어 유니크 보조인덱스 생성이 불가능하다
CREATE UNIQUE INDEX idx_usertbl_name
ON usertbl(name);
SELECT * FROM usertbl;
DELETE FROM usertbl WHERE birthYear = '1963';
DROP INDEX idx_usertbl_name ON usertbl;
CREATE INDEX idx_usertbl_namebirth
ON usertbl (name,birthyear); -- 열을 조합해서 인덱스를 생성하기
SHOW INDEX FROM usertbl;
SELECT * FROM usertbl WHERE name = '윤종신' and birthYear = '1969';

