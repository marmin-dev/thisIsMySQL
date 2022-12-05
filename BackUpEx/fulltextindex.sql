CREATE DATABASE IF NOT EXISTS FullTextDb;
USE fulltextdb;
DROP TABLE If EXISTS fulltexttbl;
CREATE TABLE Fulltexttbl(
id int auto_increment PRIMARY KEY,
title varchar(15) NOT NULL,
description varchar(1000)
);
INSERT INTO FulltextTbl VALUES 
(NULL, '광해, 왕이 된 남자','왕위를 둘러싼 권력 다툼과 당쟁으로 혼란이 극에 달한 광해군 8년'), 
(NULL, '간첩','남한 내에 고장간첩 5만 명이 암약하고 있으며 특히 권력 핵심부에도 침투해있다.'), 
(NULL, '남자가 사랑할 때', '대책 없는 한 남자이야기. 형 집에 얹혀 살며 조카한테 무시당하는 남자'), 
(NULL, '레지던트 이블 5','인류 구원의 마지막 퍼즐, 이 여자가 모든 것을 끝낸다.'), 
(NULL, '파괴자들','사랑은 모든 것을 파괴한다! 한 여자를 구하기 위한, 두 남자의 잔인한 액션 본능!'), 
(NULL, '킹콩을 들다',' 역도에 목숨을 건 시골소녀들이 만드는 기적 같은 신화.'), 
(NULL, '테드','지상최대 황금찾기 프로젝트! 500년 전 사라진 황금도시를 찾아라!'), 
(NULL, '타이타닉','비극 속에 침몰한 세기의 사랑, 스크린에 되살아날 영원한 감동'), 
(NULL, '8월의 크리스마스','시한부 인생 사진사와 여자 주차 단속원과의 미묘한 사랑'), 
(NULL, '늑대와 춤을','늑대와 친해져 모닥불 아래서 함께 춤을 추는 전쟁 영웅 이야기'), 
(NULL, '국가대표','동계올림픽 유치를 위해 정식 종목인 스키점프 국가대표팀이 급조된다.'), 
(NULL, '쇼생크 탈출','그는 누명을 쓰고 쇼생크 감옥에 감금된다. 그리고 역사적인 탈출.'), 
(NULL, '인생은 아름다워','귀도는 삼촌의 호텔에서 웨이터로 일하면서 또 다시 도라를 만난다.'), 
(NULL, '사운드 오브 뮤직','수녀 지망생 마리아는 명문 트랩가의 가정교사로 들어간다'), 
(NULL, '매트릭스',' 2199년.인공 두뇌를 가진 컴퓨터가 지배하는 세계.');


CREATE FULLTEXT INDEX idx_description ON FulltextTbl(description);
SHOW INDEX FROM fulltexttbl;

SELECT * FROM fulltexttbl WHERE MATCH(description) AGAINST('스키점프' IN BOOLEAN MODE);
SELECT * FROM fulltexttbl WHERE MATCH(description) AGAINST('호텔*' IN BOOLEAN MODE);
SELECT * FROM fulltexttbl WHERE MATCH(description) AGAINST('남자*,여자*' IN BOOLEAN MODE);

SET GLOBAL innodb_ft_aux_table = 'fulltextdb/fulltexttbl'; 
SELECT word,doc_count,doc_id,position
FROM INFORMATION_SCHEMA.INNODB_FT_INDEX_TABLE; -- 설정상 3글자 이상만

DROP INDEX idx_description ON FulltextTbl;

CREATE TABLE user_stopword (value VARCHAR(30));

INSERT INTO user_stopword VALUES ('이야기'),('그리고');

SET GLOBAL innodb_ft_server_stopword_table = 'fulltextdb/user_stopword';
CREATE FULLTEXT INDEX idx_description ON fulltexttbl(description);
SELECT word FROM INFORMATION_SCHEMA.INNODB_FT_INDEX_TABLE WHERE word ='그리고';
