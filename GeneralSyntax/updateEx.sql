-- 길환이라는 이름을 가진 사람의 성을 김으로 변경한다
UPDATE testtbl SET first_name='KIM' WHERE last_name='KilHWAN';
-- 물건의 전체 단가를 1.5배 인상해서 적용한다
UPDATE buytbl SET price = price * 1.5;