-- MATH FUNCTION
-- ABS(숫자) 숫자의 절대값을 반환한다
SELECT ABS(-100);
-- ACOS ASIN ATAN ATAN2(숫자,숫자) SIN COS TAN 전부 (숫자)파라미터
-- 삼각함수와 관련된 함수를 제공한다
-- CEILING(숫자) FLOOR(숫자) ROUND(숫자) 올림, 내림, 반올림을 계산한다
SELECT CEILING(4.7), ROUND(4.7), FLOOR(4.7);
-- CONV(숫자,원래진수,변환할 진수) 숫자를 원래 진수에서 변환할 진수로 계산한다
SELECT CONV(128,10,16),CONV('AAAA',16,10);
-- DEGREES(숫자), RADIANS(숫자) 라디안을 각도값으로,각도값을 라디안으로 계산한다
SELECT DEGREES(PI()), RADIANS(180);
-- EXP(x), LN, LOG(숫자), LOG(밑수,숫자), LOG2,10(숫자) 지수와 로그와 관련된 함수를 제공한다
-- MOD(숫자1,숫자2) 또는 숫자1% 숫자2 또는 숫자1 MOD 숫자2 /숫자1을 숫자2로 나눈 나머지 값을 구한다
SELECT MOD(156,10),156 MOD 10;
-- POW(숫자1,숫자2), SQRT(숫자) 거듭제곱값 및 제곱근을 구한다
SELECT POW (2,3),SQRT(9);
-- RAND()는 0이상 1미만의 실수를 구한다.
SELECT RAND(), FLOOR(1+RAND()*(10-1));
-- SIGN(숫자) 숫자가 양수, 0 , 음수인지 구한다 -1 0 1 중 하나가 반환된다
SELECT SIGN(10);
-- TRUNCATE(숫자,정수) 숫자를 소수점을 기준으로 정수 위치까지 구하고 나머지는 버린다
SELECT TRUNCATE(123456.123455,-2);