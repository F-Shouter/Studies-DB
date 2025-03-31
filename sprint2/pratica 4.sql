

# - Criar a modelagem;



# Exercício 1:

# 1 funcionário tem no mínimo um supervisor, que também é funcionário e no máximo 1 supervisor;

# 1 supervisor supervisiona no mínimo 1 funcionário e no máximo muitos;

# 1 funcionário trabalha em somente uma área da empresa, exemplo: marketing, financeiro, TI;

# 1 área tem muitos funcionários;

USE sprint2;
# - Criar as tabelas;
CREATE TABLE funcionarios(
	idFuncionarios INT PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(45),
  idade INT, 
  fkSupervisor INT,
  fkSetor INT,
  CONSTRAINT FOREIGN KEY fkFuncionarioSupervisor (fkSupervisor) REFERENCES funcionarios(idFuncionarios),
  CONSTRAINT FOREIGN KEY fkFuncionarioSetor (fkSetor) REFERENCES setor(idSetor)
);
# - Inserir dados;
INSERT INTO funcionarios VALUES 
	(DEFAULT, 'Vera', 40, NULL, 1),
  (DEFAULT, 'João pedro paulo', 30, 1, 4),
  (DEFAULT, 'Kaori', 20, 2, 4),
  (DEFAULT, 'Marcio', 27, 1, 4),
  (DEFAULT, 'Marcinho', 22, 4, 4),
  (DEFAULT, 'Paula', 40, 1, 1);

# - Criar as tabelas;
CREATE TABLE setor(
	idSetor INT PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(10),
  CONSTRAINT chkSetor CHECK(nome IN ('RH', 'marketing', 'financeiro', 'TI')) 
);
# - Inserir dados;
INSERT INTO setor VALUES 
	(DEFAULT, 'RH'),
  (DEFAULT, 'marketing'),
  (DEFAULT, 'financeiro'),
  (DEFAULT, 'TI');
  
  


# - SELECT com JOIN
SELECT f.nome AS 'Nome do funcionario', sf.nome AS 'Setor do funcionario', s.nome AS 'Nome do supervisor', ss.nome AS 'Setor do supervisor'
	FROM funcionarios AS f JOIN funcionarios AS s 
  ON f.fkSupervisor = s.idFuncionarios 
  JOIN setor as sf ON f.fkSetor = sf.idSetor
  JOIN setor as ss ON s.fkSetor = ss.idSetor;

# - SELECT com JOIN e WHERE
SELECT f.nome AS 'Nome do funcionario', s.nome AS 'Nome do supervisor' 
	FROM funcionarios AS f JOIN funcionarios AS s ON f.fkSupervisor = s.idFuncionarios 
  WHERE s.nome LIKE 'João%';

# - SELECT com JOIN e CASE

SELECT 
	f.nome AS 'Nome do funcionario',
	CASE 
		WHEN sf.nome = 'TI' THEN CONCAT('O ',f.nome, ' é brabo mesmo')
    ELSE 'só mais um funcionario que não é de t.i'
	END AS 'Descrição'
	FROM funcionarios AS f JOIN funcionarios AS s 
  ON f.fkSupervisor = s.idFuncionarios 
  JOIN setor as sf ON f.fkSetor = sf.idSetor
  JOIN setor as ss ON s.fkSetor = ss.idSetor;
  
  
#   Exercício 2:

# 1 usuário gerencia no mínimo 0 usuários e no máximo muitos usuários;

# 1 usuário é gerenciado por somente 1 usuário gerente;

# 1 usuário tem no mínimo 1 email e no máximo n emails;

# 1 email é somente de um usuário;

# - Criar a modelagem;
USE sprint2;

# - Criar as tabelas;
CREATE TABLE usuarios(
	idUsuario INT PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(50),
  senha VARCHAR(50),
  fkGerente INT, 
  CONSTRAINT FOREIGN KEY fkUsuarioGerente (fkGerente) REFERENCES usuarios(idUsuario)
);

# - Inserir dados;
INSERT INTO usuarios VALUES 
	(DEFAULT, 'henry','123456',NULL),
  (DEFAULT, 'fernando', '123456', 1),
  (DEFAULT, 'koga', '123456',2);


# - Criar as tabelas;
CREATE TABLE emails(
  endereco VARCHAR(45) PRIMARY KEY,
  fkUsuario INT,
  CONSTRAINT FOREIGN KEY fkEmailUsuario (fkUsuario) REFERENCES usuarios(idUsuario)
);

# - Inserir dados;
INSERT INTO emails VALUES 
	('henry.arcaya@gmail.com', 1),
  ('fernando@gmail.com', 2),
  ('franzhenry@gmail.com', 1),
  ('koga@gmail.com', 3);
  
  
  # - SELECT com JOIN
  
  SELECT u.nome AS 'Nome do usuario', e.endereco AS 'Email do usuario', g.nome AS 'gerente do usuario' FROM 
  usuarios AS u JOIN usuarios AS g ON u.fkGerente = g.idUsuario JOIN emails AS e ON e.fkUsuario = u.idUsuario;

# - SELECT com JOIN e WHERE
SELECT u.nome AS 'Nome do usuario', e.endereco AS 'Email do usuario', g.nome AS 'gerente do usuario' FROM 
  usuarios AS u JOIN usuarios AS g ON u.fkGerente = g.idUsuario JOIN emails AS e ON e.fkUsuario = u.idUsuario WHERE u.nome LIKE '%a%';

# - SELECT com JOIN e CASE
SELECT u.nome AS 'Nome do usuario', e.endereco AS 'Email do usuario', g.nome AS 'gerente do usuario', 
CASE  
	WHEN u.nome = 'koga'  THEN 'vish esse o gerente gosta na equipe'
  ELSE 'o gerente está olhando'
END
FROM 
  usuarios AS u JOIN usuarios AS g ON u.fkGerente = g.idUsuario JOIN emails AS e ON e.fkUsuario = u.idUsuario WHERE u.nome LIKE '%a%';