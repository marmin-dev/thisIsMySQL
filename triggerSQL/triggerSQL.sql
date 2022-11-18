CREATE TABLE deletedMemberTBL(
    memberId CHAR(8),
    memberName CHAR(5),
    memberAddress CHAR(20),
    deletedDate DATE
);


--트리거 생성
DELIMITER //
CREATE TRIGGER trg_deletedMemberTBL --트리거 이름
	AFTER DELETE --삭제된후 자동 실행
    ON memberTBL --이 데이터베이스에서
    FOR EACH ROW --각행마다
BEGIN
	INSERT INTO deletedMemberTBL
		VALUES (OLD.memberID, OLD.memberName, OLD.memberAddress, CURDATE());
        END //
        DELIMITER ;