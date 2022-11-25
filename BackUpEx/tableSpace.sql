SHOW VARIABLES LIKE 'innodb_data_file_path';
SHOW VARIABLES LIKE 'innodb_file_per_table';
-- 테이블 스페이스 생성하기
CREATE TABLESPACE ts_a ADD DATAFILE 'ts_a.ibd';
CREATE TABLESPACE ts_b ADD DATAFILE 'ts_b.ibd';
CREATE TABLESPACE ts_c ADD DATAFILE 'ts_c.ibd';

use sqldb;
CREATE TABLE table_a (id int) TABLESPACE ts_a;
CREATE TABLE table_b (id int);
ALTER TABLE table_b TABLESPACE ts_b;
