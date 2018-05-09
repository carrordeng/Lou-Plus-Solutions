
DROP DATABASE IF EXISTS shiyanlou001;
CREATE DATABASE shiyanlou001 CHARACTER SET = utf8;
USE shiyanlou001;

CREATE TABLE student(
    s_id INT,
    s_name VARCHAR(20) NOT NULL,
    s_sex ENUM("man","woman") DEFAULT "man",
    s_age INT NOT NULL,
    PRIMARY KEY (s_id)
) DEFAULT CHARSET=utf8;

CREATE TABLE course(
    c_id INT,
    c_name VARCHAR(20) NOT NULL,
    c_time INT,
    PRIMARY KEY (c_id), 
    UNIQUE (c_name)
) DEFAULT CHARSET=utf8;

CREATE TABLE sc(
    s_id INT,
    c_id INT,
    grade INT,
    PRIMARY KEY (s_id, c_id),
    FOREIGN KEY (s_id) REFERENCES student(s_id),
    FOREIGN KEY (c_id) REFERENCES course(c_id)
) DEFAULT CHARSET=utf8;


INSERT INTO student VALUES
    (1001, "shiyanlou1001", "man", 10),
    (1002, "shiyanlou1002", "woman", 20),
    (1003, "shiyanlou1003", "man", 18),
    (1004, "shiyanlou1004", "woman", 40),
    (1005, "shiyanlou1005", "man", 17);

INSERT INTO course VALUES
    (1, "java", 13),
    (2, "python", 12),
    (3, "c", 10),
    (4, "spark", 15);

INSERT INTO sc VALUES
    (1001, 3, 70),
    (1001, 1, 20),
    (1002, 1, 100),
    (1001, 4, 96),
    (1002, 2, 80),
    (1003, 3, 75),
    (1002, 4, 80);
