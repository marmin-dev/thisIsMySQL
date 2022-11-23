-- 날짜 및 시간 함수
-- ADDDATE(날짜,차이), SUBDATE(날짜,차이) 날짜를 기준으로 차이를 더하거나 뺸 날짜를 구한다
SELECT ADDDATE('2021-01-01', INTERVAL 31 DAY);
SELECT SUBDATE('2021-01-01', INTERVAL 1 YEAR);
-- ADDTIME(날짜/시간, 시간), SUBTIME(날짜/시간,시간) 날짜/시간기준으로 시간을 더하거나 뺸 결과를 구한다
SELECT ADDTIME('2025-01-01 23:59:59', '1:2:3');
SELECT SUBTIME('2025-01-01 23:59:59', '1:2:3');
-- CURDATE(), CURTIME(), NOW(), SYSDATE()
-- CURDATE 는 현재 연-월-일을 CURTIME은 현재 시:분:초를, NOW와 SYSDATE 는 현재의 연-월-일 시:분:초 를구한다
-- YEAR, MONTH, DAY, HOUR... 날짜 또는 시간에서 원하는 것만 뺴기
SELECT YEAR(NOW());
-- DATE(), TIME() DATETIME형식에서 연-월-일 및 시:분:초 만 추출한다
SELECT DATE(NOW());
-- DATEDIFF(날짜1,날짜2), TIMEDIFF(날짜1 또는 시간1, 날짜1 또는 시간2)
-- DATEDIFF는 날짜1-날짜2의 일수를 결과로 구한다.
SELECT DATEDIFF('2015-11-21',NOW());
SELECT TIMEDIFF('23:22:11',TIME(NOW()));
-- DAYOFWEEK(날짜), MONTHNAME(),DAYOFYEAR(날짜)
-- 요일(1:일~7:토) 및 1년중 몇번쨰 날인지 구한다
SELECT DAYOFWEEK(DATE(now())),MONTHNAME(DATE(now())),DAYOFYEAR(DATE(NOW()));
-- LAST_DAY() 주어진 날짜의 마지막 날짜를구한다. 보통 그 달이 몇일까지 있는지 확인하SELECT LAST_DAY(NOW());
-- MAKEDATE(연도,정수) 연도에서 정수만큼 지난 날짜를 구한다
SELECT MAKEDATE(2021,132);
-- MAKETINE(시,분,초) 시,분,초를 이용해서 시:분:초 TIME 형식으로 만든다
SELECT MAKETIME(12,11,10);
-- PERIOD_ADD(연월,개월수), PERIOD_DIFF(연월1,연월2)
-- 연워에서 개월만큼의 개워리 지난 연월을 구한다, 후자는 연월1-연월2의 개월수를 구한다
SELECT PERIOD_ADD(202101,11), PERIOD_DIFF(202101,202203);
-- QUARTER(날짜) 날짜가 4분기 중에서 몇 분기인지를 구한다
SELECT QUARTER('2025-07-07');
-- TIME_TO_SEC(시간) 시간을 초 단위로 구한다
SELECT TIME_TO_SEC('12:11:10');
