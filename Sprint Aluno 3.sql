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
	(DEFAULT, 'DHT11', '2025-02-17 13:14:00', 'Pendente'); -- 'Pendente fará ERRO'
    
INSERT INTO sensor (tipo, dtManutencao, statusSensor) VALUES 
	('DAF11', '2026-01-17 13:00:00', 'Ativo');
    
SELECT * FROM sensor;

DESCRIBE sensor;

-- data automática:
ALTER TABLE sensor 
	MODIFY COLUMN dtManutencao DATETIME DEFAULT CURRENT_TIMESTAMP;
    
INSERT INTO sensor (tipo, statusSensor) VALUES 
	('EAF11', 'Ativo');
    
-- excluir uma constraint
ALTER TABLE sensor DROP CONSTRAINT chkStatus;

ALTER TABLE sensor ADD CONSTRAINT chkStatus
	CHECK(statusSensor IN ('Ativo', 'Inativo', 'Manutenção'));
    
-- adicionar um campo com número de serie so sensor
ALTER TABLE sensor ADD COLUMN numSerie CHAR(3) UNIQUE; -- cada numSerie precisa ser único.

UPDATE sensor SET numSerie = '001' WHERE idSensor = 1;
UPDATE sensor SET numSerie = '001' WHERE idSensor = 2; -- ERRO por conta que o 001 é único.

-- alias = apelido
SELECT tipo AS 'Tipo de sensor',
	dtManutencao AS 'Data de manutenção' FROM sensor;
    
SELECT * FROM sensor;

-- IFNULL
SELECT IFNULL(numSerie, 'SEM NUMSERIE') AS numSerie FROM sensor;

-- CASE, tipo if else
SELECT tipo, CASE 
	WHEN statusSensor = 'ativo' THEN 1
    WHEN statusSensor = 'inativo' THEN 2
    WHEN statusSensor = 'manutenção' THEN 3
    ELSE 0
    END AS A FROM sensor;
    
