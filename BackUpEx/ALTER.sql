use tabledb;
select * from usertbl;
ALTER TABLE usertbl
ADD email VARCHAR(20)
CHECK (email in('@','.'))
NULL;
ALTER TABLE usertbl
	DROP COLUMN email;

ALTER TABLE usertbl
	CHANGE COLUMN name uname CHAR(5) NOT NULL; 