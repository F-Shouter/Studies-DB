-- -------------------------- EXERCÍCIO 01 -----------------------------------------
-- No MySQL Workbench, utilizando o banco de dados ‘sprint1’:
USE sprint1;

/* Escreva e execute os comandos para:
Criar a tabela chamada Atleta para conter os dados: 
idAtleta (int e chave primária da tabela), 
nome (varchar, tamanho 40), 
modalidade (varchar, tamanho 40), 
qtdMedalha (int, representando a quantidade de medalhas que o atleta possui) */
CREATE TABLE Atleta (
	idAtleta INT PRIMARY KEY, 
	nome VARCHAR(40),
	modalidade VARCHAR(40), 
	qtdMedalha INT
);

/* Inserir dados na tabela, procurando colocar mais de um atleta para cada modalidade
e pelo menos 5 atletas. */
INSERT INTO Atleta VALUES
	(1, 'Anne Yukari Yamasaki', 'corrida de salto', 2),
    (2, 'Jhum Yamasaki', 'corrida de bastão', 5),
    (3, 'Júlia Ayumi Yamasaki', 'corrida de salto', 7),
    (4, 'Lúcia Humie Kanbe Yamasaki', 'corrida de escada', 4),
    (5, 'Alberto Kioshi Yamasaki', 'corrida de trambolim', 1);

/* Escreva e execute os comandos para:
• Exibir todos os dados da tabela. */
SELECT * FROM Atleta;

-- Atualizar a quantidade de medalhas do atleta com id=1;
UPDATE Atleta SET qtdMedalha = 9 WHERE idAtleta = 1;

-- Atualizar a quantidade de medalhas do atleta com id=2 e com o id=3;
UPDATE Atleta SET qtdMedalha = 8 WHERE idAtleta IN (2,3);

-- Atualizar o nome do atleta com o id=4;
UPDATE Atleta SET nome = 'Lúcia Yamasaki' WHERE idAtleta = 4;

-- Adicionar o campo dtNasc na tabela, com a data de nascimento dos atletas, tipo date;
ALTER TABLE Atleta ADD COLUMN dtNasc DATE;

-- Atualizar a data de nascimento de todos os atletas;
UPDATE Atleta SET dtNasc = CASE
	WHEN idAtleta = 1 THEN '2001-09-18'
    WHEN idAtleta = 2 THEN '2005-11-03'
    WHEN idAtleta = 3 THEN '2000-03-27'
    WHEN idAtleta = 4 THEN '1976-08-16'
    WHEN idAtleta = 5 THEN '1971-03-24'
END 
WHERE idAtleta IN (1,2,3,4,5);

-- Excluir o atleta com o id=5;
DELETE FROM Atleta WHERE idAtleta = 5;

-- Exibir os atletas onde a modalidade é diferente de natação;
SELECT * FROM Atleta WHERE modalidade = 'nataçâo';

-- Exibir os dados dos atletas que tem a quantidade de medalhas maior ou igual a 3;
SELECT * FROM Atleta WHERE qtdMedalha >= 3;

-- Modificar o campo modalidade do tamanho 40 para o tamanho 60;
ALTER TABLE Atleta MODIFY COLUMN modalidade VARCHAR(60);

-- Descrever os campos da tabela mostrando a atualização do campo modalidade;
DESCRIBE Atleta;

-- Limpar os dados da tabela;
TRUNCATE TABLE Atleta;

-- -------------------------- EXERCÍCIO 02 -----------------------------------------
-- No MySQL Workbench, utilizando o banco de dados ‘sprint1’:
USE sprint1;

/* Criar a tabela chamada Musica para conter os dados: 
idMusica, 
titulo (tamanho 40), 
artista
(tamanho 40), 
genero (tamanho 40), 
sendo que idMusica é a chave primária da tabela. */
CREATE TABLE Musica (
	idMusica INT PRIMARY KEY,
    titulo VARCHAR(40),
    artista VARCHAR(40),
    genero VARCHAR(40)
);

/* Inserir dados na tabela, procurando colocar um gênero de música que tenha mais de uma
música, e um artista, que tenha mais de uma música cadastrada. Procure inserir pelo
menos umas 7 músicas. */
INSERT INTO Musica VALUES 
	(1, 'Amor Pirata', 'Jaum', 'POP'),
    (2, 'Numb', 'Linkin Park', 'Rock'),
    (3, 'Ballad Mona Lisa', 'Panic at The Disco', 'Rock'),
    (4, 'Friends', 'Kana Nishino', 'J-POP'),
    (5, 'Dona Morte', 'VNZ', 'SAD'),
    (6, 'Broke', 'Nico Collins', 'POP'),
    (7, 'Wannabe', 'Nightcore', 'POP');

/* Execute os comandos para:
a) Exibir todos os dados da tabela. */
SELECT * FROM Musica;

-- b) Adicionar o campo curtidas do tipo int na tabela;
ALTER TABLE Musica ADD COLUMN curtidas INT;

-- c) Atualizar o campo curtidas de todas as músicas inseridas;
UPDATE Musica SET curtidas = CASE
	WHEN idMusica = 1 THEN 10
    WHEN idMusica = 2 THEN 100
    WHEN idMusica = 3 THEN 1000
    WHEN idMusica = 4 THEN 10000
    WHEN idMusica = 5 THEN 100000
    WHEN idMusica = 6 THEN 1000000
    WHEN idMusica = 7 THEN 10000000
END
WHERE idMusica IN (1, 2, 3, 4, 5, 6, 7);

-- d) Modificar o campo artista do tamanho 40 para o tamanho 80;
ALTER TABLE Musica MODIFY COLUMN artista VARCHAR(80);

-- e) Atualizar a quantidade de curtidas da música com id=1;
UPDATE Musica SET curtidas = 80 WHERE idMusica = 1;

-- f) Atualizar a quantidade de curtidas das músicas com id=2 e com o id=3;
UPDATE Musica SET curtidas = 90 WHERE idMusica IN (2, 3);

-- g) Atualizar o nome da música com o id=5;
UPDATE Musica SET titulo = 'GanGan' WHERE idMusica = 5;

-- h) Excluir a música com o id=4;
DELETE FROM Musica WHERE idMusica = 4;

-- i) Exibir as músicas onde o gênero é diferente de funk;
SELECT * FROM Musica WHERE genero != 'funk';

-- j) Exibir os dados das músicas que tem curtidas maior ou igual a 20;
SELECT * FROM Musica WHERE curtidas >= 20;

-- k) Descrever os campos da tabela mostrando a atualização do campo artista;
DESCRIBE Musica;

-- l) Limpar os dados da tabela;
TRUNCATE TABLE Musica;

-- -------------------------- EXERCÍCIO 03 -----------------------------------------
-- No MySQL Workbench, utilizando o banco de dados ‘sprint1’:
USE sprint1;

/* Criar a tabela chamada Filme para conter os dados: 
idFilme, título (tamanho 50), 
genero(tamanho 40), 
diretor (tamanho 40), 
sendo que idFilme é a chave primária da tabela. */
CREATE TABLE Filme (
	idFilme INT PRIMARY KEY,
    titulo VARCHAR(50),
    genero VARCHAR(40),
    diretor VARCHAR(40)
);

/* Inserir dados na tabela, procurando colocar um gênero de filme que tenha mais de um
filme, e um diretor, que tenha mais de um filme cadastrado. Procure inserir pelo menos
uns 7 filmes. */
INSERT INTO Filme VALUES 
	(1, 'Titanic', 'Drama', 'Adolfo'),
    (2, 'Um Olhar no Paraìso', 'Terror', 'Ellen'),
    (3, 'Exorcismo', 'Terror', 'Will'),
    (4, 'Pokemon', 'Animaçâo', 'Shun'),
    (5, 'Pokemon 2', 'Animaçâo', 'Shun'),
    (6, 'Miraculos', 'Animaçâo', 'Anne'),
    (7, 'Karate Kid', 'Açâo', 'Ken');

/* Execute os comandos para:
• Exibir todos os dados da tabela. */ 
SELECT * FROM Filme;

-- Adicionar o campo protagonista do tipo varchar(50) na tabela;
ALTER TABLE Filme ADD COLUMN protagonista VARCHAR(50);

-- Atualizar o campo protagonista de todas os filmes inseridos;
UPDATE Filme SET protagonista = CASE
	WHEN idFilme = 1 THEN 'Eu'
    WHEN idFilme = 2 THEN 'Eu'
    WHEN idFilme = 3 THEN 'Eu'
    WHEN idFilme = 4 THEN 'Eu'
    WHEN idFilme = 5 THEN 'Eu'
    WHEN idFilme = 6 THEN 'Eu'
	WHEN idFilme = 7 THEN 'Eu'
END
WHERE idFilme IN (1,2,3,4,5,6,7);

-- Modificar o campo diretor do tamanho 40 para o tamanho 150;
ALTER TABLE Filme MODIFY COLUMN diretor VARCHAR(150);

-- Atualizar o diretor do filme com id=5;
UPDATE Filme SET diretor = 'Eu' WHERE idFilme = 5;

-- Atualizar o diretor dos filmes com id=2 e com o id=7;
UPDATE Filme SET diretor = 'Eu' WHERE idFilme IN (2,7);

-- Atualizar o título do filme com o id=6;
UPDATE Filme SET titulo = 'Eu comigo mesmo' WHERE idFilme = 6;

-- Excluir o filme com o id=3;
DELETE FROM Filme WHERE idFilme = 3;

-- Exibir os filmes em que o gênero é diferente de drama;
SELECT * FROM Filme WHERE genero != 'drama';

-- Exibir os dados dos filmes que o gênero é igual ‘suspense’;
SELECT * FROM Filme WHERE genero = 'suspense';

-- Descrever os campos da tabela mostrando a atualização do campo protagonista e diretor;
DESCRIBE Filme;

-- Limpar os dados da tabela;
TRUNCATE TABLE Filme;

-- -------------------------- EXERCÍCIO 04 -----------------------------------------
-- No MySQL Workbench, utilizando o banco de dados ‘sprint1’:
USE sprint1;

/* Criar a tabela chamada Professor para conter os dados: 
idProfessor, 
nome (tamanho 50),
especialidade (tamanho 40), 
dtNasc (date), 
sendo que idProfessor é a chave primária da tabela. */
CREATE TABLE Professor (
	idProfessor INT PRIMARY KEY,
    nome VARCHAR(50),
    especialidade VARCHAR(40),
    dtNasc date
);

/* Exemplo do campo data: ‘AAAA-MM-DD’, ‘1983-10-13’.
Inserir dados na tabela, procurando colocar uma especialista para mais de um professor.
Procure inserir pelo menos uns 6 professores. */
INSERT INTO Professor VALUES
	(1, 'Vivian', 'DB', '1983-10-13'),
	(2, 'Vivian', 'Algoritmo', '1983-10-13'),
    (3, 'JP', 'Algoritimo', '1993-10-01'),
    (4, 'Karine', 'Socio Emocional', '1985-09-13'),
    (5, 'Frizza', 'PI', '1963-03-10'),
    (6, 'Monteiro', 'PI', '1973-06-13');

/* Execute os comandos para:
a) Exibir todos os dados da tabela. */
SELECT * FROM Professor;

-- b) Adicionar o campo funcao do tipo varchar(50), onde a função só pode ser ‘monitor’, ‘assistente’ ou ‘titular’;
ALTER TABLE Professor ADD COLUMN funcao VARCHAR(50),
ADD CONSTRAINT chk_funcao CHECK (funcao IN ('monitor', 'assistente', 'titular'));

-- c) Atualizar os professores inseridos e suas respectivas funções;
UPDATE Professor SET funcao = CASE
	WHEN idProfessor = 1 THEN 'monitor'
    WHEN idProfessor = 2 THEN 'monitor'
    WHEN idProfessor = 3 THEN 'assistente'
    WHEN idProfessor = 4 THEN 'titular'
    WHEN idProfessor = 5 THEN 'titular'
    WHEN idProfessor = 6 THEN 'titular'
END
WHERE idProfessor IN (1,2,3,4,5,6);

-- d) Inserir um novo professor;
INSERT INTO Professor VALUES
	(7,'Anne Yukari', 'MT', '2001-09-18', 'assistente');

-- e) Excluir o professor onde o idProfessor é igual a 5;
DELETE FROM Professor WHERE idProfessor = 5;

-- f) Exibir apenas os nomes dos professores titulares;
SELECT nome FROM Professor WHERE funcao = 'titular';

-- g) Exibir apenas as especialidades e as datas de nascimento dos professores monitores;
SELECT especialidade, dtNasc FROM Professor WHERE funcao = 'monitor';

-- h) Atualizar a data de nascimento do idProfessor igual a 3;
UPDATE Professor SET dtNasc = '1999-03-15' WHERE idProfessor = 3;

-- i) Limpar a tabela Professor;
TRUNCATE TABLE Professor;

-- -------------------------- EXERCÍCIO 05 -----------------------------------------
-- No MySQL Workbench, utilizando o banco de dados ‘sprint1’: 
USE sprint1;

/* Criar a tabela chamada Curso para conter os dados: 
idCurso, nome (tamanho 50), 
sigla(tamanho 3), 
coordenador, 
sendo que idCurso é a chave primária da tabela. */
CREATE TABLE Curso (
	idCurso INT, 
	nome VARCHAR(50), 
	sigla VARCHAR(3), 
	coordenador VARCHAR(40)
);

-- Inserir dados na tabela, procure inserir pelo menos 3 cursos.
INSERT INTO Curso VALUES 
	(1, 'Análise Desenvolvimento de Sistemas', 'ADS', 'Paula'),
    (2, 'Sistemas de Informação', 'SI', 'Pedro'),
    (3, 'Ciências da Computação', 'CC', 'Marcio');
    
/* Execute os comandos para:
a) Exibir todos os dados da tabela. */
SELECT * FROM Curso;

-- b) Exibir apenas os coordenadores dos cursos.
SELECT coordenador FROM Curso;

-- c) Exibir apenas os dados dos cursos de uma determinada sigla.
SELECT * FROM Curso WHERE sigla LIKE 'ADS';

-- d) Exibir os dados da tabela ordenados pelo nome do curso.
SELECT * FROM Curso ORDER BY nome ASC;

-- e) Exibir os dados da tabela ordenados pelo nome do coordenador em ordem decrescente.
SELECT * FROM Curso ORDER BY coordenador DESC;

-- f) Exibir os dados da tabela, dos cursos cujo nome comece com uma determinada letra.
SELECT * FROM Curso WHERE nome LIKE 'A%';

-- g) Exibir os dados da tabela, dos cursos cujo nome termine com uma determinada letra.
SELECT * FROM Curso WHERE nome LIKE '%o';

-- h) Exibir os dados da tabela, dos cursos cujo nome tenha como segunda letra uma determinada letra.
SELECT * FROM Curso WHERE nome LIKE '_i%';

-- i) Exibir os dados da tabela, dos cursos cujo nome tenha como penúltima letra uma determinada letra.
SELECT * FROM Curso WHERE nome LIKE '%a_';

-- j) Elimine a tabela.
DROP TABLE Curso;

-- -------------------------- EXERCÍCIO 06-----------------------------------------
-- No MySQL Workbench, utilizando o banco de dados ‘sprint1’:
USE sprint1;

/* Você vai criar uma tabela para armazenar os dados de revistas (como por ex: Veja, Isto é,
Epoca, Quatro Rodas, Claudia, etc).
Escreva e execute os comandos para:
Criar a tabela chamada Revista para conter os campos: 
idRevista (int e chave primária da tabela), 
nome (varchar, tamanho 40), 
categoria (varchar, tamanho 30). 
Os valores de idRevista devem iniciar com o valor 1 e ser incrementado automaticamente pelo sistema. */
CREATE TABLE Revista (
	idRevista INT PRIMARY KEY AUTO_INCREMENT, 
	nome VARCHAR(40), 
	categoria VARCHAR(30)
); 
ALTER TABLE Revista auto_increment = 1;

-- Inserir 4 registros na tabela, mas sem informar a categoria.
INSERT INTO Revista VALUES 
	(default, 'Veja', 'esporte'),
	(default, 'Isto é', 'noticia'),
	(default, 'Epoca', 'beleza');

/* Escreva e execute os comandos para:
Exibir todos os dados da tabela. */
SELECT * FROM Revista;

-- Atualize os dados das categorias das 3 revistas inseridas. 
UPDATE Revista SET categoria = CASE
	WHEN idRevista = 1 THEN 'Beleza'
    WHEN idRevista = 2 THEN 'Beleza'
    WHEN idRevista = 3 THEN 'Beleza'
END 
WHERE idRevista IN (1,2,3);

-- Exibir os dados da tabela novamente para verificar se atualizou corretamente.
SELECT * FROM Revista;

-- Insira mais 3 registros completos.
INSERT INTO Revista VALUES 
	(default, 'NerdMagazine', 'coisas de nerd'),
    (default, 'Americanas', 'produtos web'),
    (default, 'Investigacion', 'investigação');
    
-- Exibir novamente os dados da tabela.
SELECT * FROM Revista;

-- Exibir a descrição da estrutura da tabela.
DESCRIBE Revista;

-- Alterar a tabela para que a coluna categoria possa ter no máximo 40 caracteres.
ALTER TABLE Revista CHANGE categoria categoria VARCHAR(40);

-- Exibir novamente a descrição da estrutura da tabela, para verificar se alterou o tamanho da coluna categoria.
DESCRIBE Revista;

-- Acrescentar a coluna periodicidade à tabela, que é varchar(15).
ALTER TABLE Revista ADD COLUMN periodicidade VARCHAR(15);

-- Exibir os dados da tabela.
SELECT * FROM Revista;

-- Excluir a coluna periodicidade da tabela.
ALTER TABLE Revista DROP COLUMN periodicidade;