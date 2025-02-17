-- AULA 03
-- CHECK
-- ALIAS
-- CASE
-- IFNULL
-- NOT NULL
-- UNIQUE
-- DEFAULT

SHOW DATABASES;
USE sprint1;
SHOW TABLES;
CREATE TABLE sensor (
	idSensor INT PRIMARY KEY auto_increment,
    tipo VARCHAR(30) NOT NULL, -- não pode preencher vazio
    umidade DOUBLE,
    temperatura DOUBLE
);