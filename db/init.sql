CREATE DATABASE IF NOT EXISTS demodb;
CREATE TABLE IF NOT EXISTS demodb.MyUsers ( firstname VARCHAR(30) NOT NULL,  lastname VARCHAR(30) NOT NULL);
GRANT ALL on demodb.* to 'demouser'@'%' identified by '12345678';
FLUSH PRIVILEGES;
