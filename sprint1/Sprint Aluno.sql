-- -------------------------------- Aula 1----------------------------------------

CREATE DATABASE sprint1;

-- --------------------------- EXERCÍCIO 1:-------------------------------------
USE sprint1;

CREATE TABLE Atleta (
	idAtleta INT PRIMARY KEY,
    nome VARCHAR(40),
    modalidade VARCHAR(40),
    qtdMedalha INT
);

INSERT INTO Atleta VALUES 
	(1, 'Anne Yukari Yamasaki', 'provas de pista', 1),
    (2, 'Jhum Yamasaki', 'provas de campo', 5),
    (3, 'Júlia Ayumi Yamasaki', 'combinadas', 2),
    (4, 'Lúcia Humie Kanbe Yamasaki', 'corrida em rua', 2),
    (5, 'Alberto Kioshi Yamasaki', 'corrida em montanha', 1);
    
-- Exibir todos os dados da tabela
SELECT * FROM Atleta;

-- Exibir apenas os nomes e quantidade de medalhas dos atletas
SELECT nome, qtdMedalha FROM Atleta;

--  Exibir apenas os dados dos atletas de uma determinada modalidade
SELECT * FROM Atleta WHERE modalidade = 'combinadas';

-- Exibir os dados da tabela ordenados pela modalidade
SELECT * FROM Atleta ORDER BY modalidade ASC;

-- Exibir os dados da tabela, ordenados pela quantidade de medalhas, em ordem decrescente
SELECT * FROM Atleta ORDER BY qtdMedalha DESC;

-- Exibir os dados da tabela, dos atletas cujo nome contenha a letra s
SELECT * FROM Atleta WHERE nome LIKE '%s%';  

-- Exibir os dados da tabela, dos atletas cujo nome comece com uma determinada letra
SELECT * FROM Atleta WHERE nome LIKE 'a%';

-- Exibir os dados da tabela, dos atletas cujo nome termine com a letra o
SELECT * FROM Atleta WHERE nome LIKE '%o';

--  Exibir os dados da tabela, dos atletas cujo nome tenha a penúltima letra r
SELECT * FROM Atleta WHERE nome LIKE '%r_';

-- Eliminar a tabela
DROP TABLE Atleta;

-- --------------------------- EXERCÍCIO 2:-------------------------------------
USE sprint1;

CREATE TABLE Musica (
	idMusica INT PRIMARY KEY,
    titulo VARCHAR(40),
    artista VARCHAR(40),
    genero VARCHAR(40)
);

INSERT INTO Musica VALUES 
	(1, 'Amor Pirata', 'Jaum', 'POP'),
    (2, 'Numb', 'Linkin Park', 'Rock'),
    (3, 'Ballad Mona Lisa', 'Panic at The Disco', 'Rock'),
    (4, 'Friends', 'Kana Nishino', 'J-POP'),
    (5, 'Dona Morte', 'VNZ', 'SAD'),
    (6, 'Broke', 'Nico Collins', 'POP'),
    (7, 'Wannabe', 'Nightcore', 'POP');
    
-- Exibir todos os dados da tabela
SELECT * FROM Musica;

-- Exibir apenas os títulos e os artistas das músicas
SELECT titulo, artista FROM Musica;

--  Exibir apenas os dados das músicas de um determinado gênero
SELECT * FROM Musica WHERE genero = 'POP';

-- Exibir apenas os dados das músicas de um determinado artista
SELECT * FROM Musica WHERE artista = 'Jaum';

-- Exibir os dados da tabela ordenados pelo título da música
SELECT * FROM Musica ORDER BY titulo ASC;

-- Exibir os dados da tabela ordenados pelo artista em ordem decrescente
SELECT * FROM Musica ORDER BY artista DESC;

-- Exibir os dados da tabela, das músicas cujo título comece com uma determinada letra
SELECT * FROM Musica WHERE titulo LIKE 'a%';

-- Exibir os dados da tabela, das músicas cujo artista termine com uma determinada letra
SELECT * FROM Musica WHERE artista LIKE '%o';

-- Exibir os dados da tabela, das músicas cujo gênero tenha como segunda letra uma determinada letra
SELECT * FROM Musica WHERE genero LIKE '_o%';

-- Exibir os dados da tabela, das músicas cujo título tenha como penúltima letra uma determinada letra
SELECT * FROM Musica WHERE titulo LIKE '%t_';

-- Elimine a tabela
DROP TABLE Musica;

-- --------------------------- EXERCÍCIO 3:-------------------------------------

CREATE TABLE Filme (
	idFilme INT PRIMARY KEY,
    titulo VARCHAR(50),
    genero VARCHAR(40),
    diretor VARCHAR(40)
);

INSERT INTO Filme VALUES 
	(1, 'Titanic', 'Drama', 'Adolfo'),
    (2, 'Um Olhar no Paraìso', 'Terror', 'Ellen'),
    (3, 'Exorcismo', 'Terror', 'Will'),
    (4, 'Pokemon', 'Animaçâo', 'Shun'),
    (5, 'Pokemon 2', 'Animaçâo', 'Shun'),
    (6, 'Miraculos', 'Animaçâo', 'Anne'),
    (7, 'Karate Kid', 'Açâo', 'Ken');
    
-- Exibir todos os dados da tabela
SELECT * FROM Filme;

-- Exibir apenas os títulos e os diretores dos filmes
SELECT titulo, diretor FROM Filme;

-- Exibir apenas os dados dos filmes de um determinado gênero
SELECT * FROM Filme WHERE genero LIKE 'Animaçâo';

-- Exibir apenas os dados dos filmes de um determinado diretor
SELECT * FROM Filme WHERE diretor LIKE 'Shun';

-- Exibir os dados da tabela ordenados pelo título do filme
SELECT * FROM Filme ORDER BY titulo ASC;

-- Exibir os dados da tabela ordenados pelo diretor em ordem decrescente
SELECT * FROM Filme ORDER BY diretor DESC;

-- Exibir os dados da tabela, dos filmes cujo título comece com uma determinada letra
SELECT * FROM Filme WHERE titulo LIKE 'p%';

-- Exibir os dados da tabela, dos filmes cujo diretor termine com uma determinada letra
SELECT * FROM Filme WHERE diretor LIKE '%n';

-- Exibir os dados da tabela, dos filmes cujo gênero tenha como segunda letra uma determinada letra
SELECT * FROM Filme WHERE genero LIKE '_n%';

-- Exibir os dados da tabela, dos filmes cujo título tenha como penúltima letra uma determinada letra
SELECT * FROM Filme WHERE titulo LIKE '%o_';

-- Elimine a tabela.
DROP TABLE Filme;

-- --------------------------- EXERCÍCIO 4:-------------------------------------

CREATE TABLE Professor (
	idProfessor INT PRIMARY KEY,
    nome VARCHAR(50),
    especialidade VARCHAR(40),
    dtNasc date
);

INSERT INTO Professor VALUES
	(1, 'Vivian', 'DB', '1983-10-13'),
	(2, 'Vivian', 'Algoritmo', '1983-10-13'),
    (3, 'JP', 'Algoritimo', '1993-10-01'),
    (4, 'Karine', 'Socio Emocional', '1985-09-13'),
    (5, 'Frizza', 'PI', '1963-03-10'),
    (6, 'Monteiro', 'PI', '1973-06-13');
    
-- Exibir todos os dados da tabela
SELECT * FROM Professor;

-- Exibir apenas as especialidades dos professores
SELECT especialidade FROM Professor;

-- Exibir apenas os dados dos professores de uma determinada especialidade
SELECT * FROM Professor WHERE especialidade LIKE 'PI';
 
-- Exibir os dados da tabela ordenados pelo nome do professor
SELECT * FROM Professor ORDER BY nome ASC;

-- Exibir os dados da tabela ordenados pela data de nascimento do professor em ordem decrescente
SELECT * FROM Professor ORDER BY dtNasc DESC;

-- Exibir os dados da tabela, dos professores cujo nome comece com uma determinada letra
SELECT * FROM Professor WHERE nome LIKE 'v%';

-- Exibir os dados da tabela, dos professores cujo nome termine com uma determinada letra
SELECT * FROM Professor WHERE nome LIKE '%n';

-- Exibir os dados da tabela, dos professores cujo nome tenha como segunda letra uma determinada letra
SELECT * FROM Professor WHERE nome LIKE '_i%';

-- Exibir os dados da tabela, dos professores cujo nome tenha como penúltima letra uma determinada letra
SELECT * FROM Professor WHERE nome LIKE '%a_';

-- Elimine a tabela
DROP TABLE Professor;

-- --------------------------- EXERCÍCIO 5:-------------------------------------

CREATE TABLE Jogo (
	idJogo INT PRIMARY KEY,
    nome VARCHAR(50),
    comentario VARCHAR(200),
    ranking INT
);

INSERT INTO Jogo VALUES 
	(1, 'Cytus', 'Jogo de ritmo musical', 1),
    (2, 'Lanota', 'Jogo de ritmo musical', 2),
    (3, 'Phigros', 'Jogo de ritmo musical', 3),
    (4, 'Round 6', 'Jogo baseado em serie', 5),
    (5, 'Bomb It', 'Jogo de bombas', 4);

-- Exibir todos os dados da tabela
SELECT * FROM Jogo;

-- Exibir apenas os nomes dos jogos
SELECT nome FROM Jogo;

-- Exibir apenas o comentário de um determinado jogo
SELECT comentario FROM Jogo WHERE nome LIKE 'Cytus';

-- Exibir os dados da tabela ordenados pelo nome do jogo
SELECT * FROM Jogo ORDER BY nome ASC;

-- Exibir os dados da tabela ordenados pelo ranking em ordem decrescente
SELECT * FROM Jogo ORDER BY ranking DESC;

-- Exibir os dados da tabela, dos jogos cujo nome comece com uma determinada letra
SELECT * FROM Jogo WHERE nome LIKE 'l%';

-- Exibir os dados da tabela, dos jogos cujo nome termine com uma determinada letra
SELECT * FROM Jogo WHERE nome LIKE '%s';

-- Exibir os dados da tabela, dos jogos cujo nome tenha como segunda letra uma determinada letra
SELECT * FROM Jogo WHERE nome LIKE '_o%';

-- Exibir os dados da tabela, dos jogos cujo nome tenha como penúltima letra uma determinada letra
SELECT * FROM Jogo WHERE nome LIKE '%t_';

-- Exibir os dados da tabela, dos jogos cujo nome seja diferente de Minecraft
SELECT * FROM Jogo WHERE nome != 'Minecraft';

-- Elimine a tabela
DROP TABLE Jogo;

-- -------------------------------- Aula 2----------------------------------------

CREATE TABLE pessoa (
	idPessoa int primary key auto_increment,
	nome varchar(40),
	dtNasc date
);

INSERT INTO pessoa VALUES
	(default, 'Homem Aranha', '1999-01-10');

SELECT * FROM pessoa;

INSERT INTO pessoa (nome, dtNasc) VALUES
	('Super Homem', '1995-06-17'),
    ('Super Homem', '1995-06-17');
    
INSERT INTO pessoa VALUES
	(null, 'Aranhinha', '1999-01-10');
	-- NULL = NÃO TEM DADO 
    -- DEFAULT = PADRÃO, O ÚLTIMO ID +1
    
-- DATETIME = 'AAAA-MM-DD HH-MM-SS'
-- DATE = 'AAAA-MM-DD'	

DESCRIBE pessoa;

/*
CAMPOS NÚMERICOS:

	NÚMEROS INTEIROS:
		INT: ID por exemplo.
        TINYINT(menor que int): gasta menos espaço, "zero ou um" números boleanos. 
        
	NÚMEROS DECIMAIS:
		FLOAT: 7 caracteres (12345.67). Usado em altura por exemplo.
        DOUBLE: 15 caracteres (1234567891234.56)
        DECIMAL: 32 caracteres
			decimal(5,2)= 123.45 vai se 5 nímeros e volta 2 casas. (usado em dinheiro)
            decimal(7,3)= 1234.567
*/

ALTER TABLE pessoa ADD COLUMN altura FLOAT;

DESCRIBE pessoa;

SELECT * FROM pessoa;

ALTER TABLE pessoa ADD COLUMN salario DECIMAL(10,2);

INSERT INTO pessoa (nome, salario) VALUES
	('Hulk', 1.99);
    
UPDATE pessoa SET salario = 50.90 WHERE idPessoa = 1;

ALTER TABLE pessoa DROP COLUMN altura;

ALTER TABLE pessoa MODIFY COLUMN nome VARCHAR(50);

ALTER TABLE pessoa CHANGE dtNasc Nascimento VARCHAR(10);

DELETE FROM pessoa WHERE idPessoa = 2;

INSERT INTO pessoa (nome, salario) VALUES
	('Homem de Ferro', 100.66);

UPDATE pessoa SET Nascimento = '1200-55-66' WHERE idPessoa = 4;

ALTER TABLE pessoa auto_increment = 1000;

INSERT INTO pessoa (nome, Nascimento, salario) VALUES
	('Chapollin', '1856-02-12', 0.99);
    
TRUNCATE TABLE pessoa; 
-- LIMPA OS DADOS DA TABELA, INCLUSIVE O auto_increment e reinicia desde o 1 novamente.

DROP TABLE pessoa;











