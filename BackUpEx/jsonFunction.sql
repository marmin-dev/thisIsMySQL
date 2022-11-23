USE sqldb;
SELECT JSON_OBJECT('name',name,'height',height) AS 'JSON 값'
FROM usertbl WHERE height >= 180;
SET @json='{"usertbl":[
{"name":"이승기","height":182},
{"name":"성시경","height":186}
]
}';
-- JSON_VALID 함수는 문자열이 JSON 형식을 만족하는지 반환 1 True 0 false
SELECT JSON_VALID(@json) AS JSON_VALID;
-- JSON_SEARCH(@JSON,'ONE/ALL','STRING')- 세번쨰 파라미터에 지정된 문자열의 위치를 반환한다
-- ONE은 처음으로 반환되는 위치 하나만 반환, all은 전부다 반환한다
SELECT JSON_SEARCH(@JSON,'ONE','성시경') AS JSON_RESEARCH;
-- JSON_EXTRACT는 반대로 지정된 위치의 값을 반환한다
SELECT JSON_EXTRACT(@JSON,'$.usertbl[0].name') AS JSON_EXTRACT;
-- JSON_INSERT는 새로운 값을 추가한다
SELECT JSON_INSERT(@JSON,'$.usertbl[0].mdate','2009-09-09') AS JSON_INSERT;
-- JSON_REPLCAE는 값을 변경한다
SELECT JSON_REPLACE(@JSON,'$.usertbl[0].name','김길환') AS JSON_REPLACE;
SELECT @JSON;
-- JSON_REMOVE는 지정된 항목을 삭제한다
SELECT JSON_REMOVE(@JSON, '$.usertbl[0]') AS JSON_REMOVE;