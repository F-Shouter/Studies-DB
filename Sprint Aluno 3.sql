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
    temperatura DOUBLE,
    dtManutencao DATETIME,
    statusSensor VARCHAR(40),
    CONSTRAINT chkStatus 
		CHECK(statusSensor IN ('Ativo', 'Inativo', 'Manutenção')) -- constraint significa restrição
);

INSERT INTO sensor VALUES 
	(DEFAULT, 'DHT11', '2025-02-17 13:14:00', 'Pendente');
    
INSERT INTO sensor (tipo, dtManutencao, statusSensor) VALUES 
	('DAF11', '2026-01-17 13:00:00', 'Ativo');
    
SELECT * FROM sensor;
    
