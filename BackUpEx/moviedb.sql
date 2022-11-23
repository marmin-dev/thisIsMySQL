CREATE DATABASE movieDB;
USE movieDB;

CREATE TABLE movietbl(
movie_id INT,
movie_title VARCHAR(30),
movie_director VARCHAR(20),
movie_star VARCHAR(20),
movie_script LONGTEXT,
movie_film LONGBLOB)
DEFAULT CHARSET=utf8mb4;

INSERT INTO movietbl VALUES(1,'지렁이 헌터','말민이','세종서민갑부',
LOAD_FILE('~/thisIsMySQL/moviedir/file.txt'),LOAD_FILE('~/thisIsMySQL/moviedir/IMG_0086 2.MOV'));
SELECT * FROM movietbl;
SHOW variables LIKE 'max_allowed_packet';
SHOW variables LIKE 'secure_file_priv';