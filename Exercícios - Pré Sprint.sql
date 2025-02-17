/* 1 – Loja de Jogos
No MySQL Workbench, crie o banco de dados "game_store".
A loja de jogos “Game Store” estava passando dificuldades de organização pois o
dono Mário, um simpático senhor italiano aposentado que trabalhou com
encanamento durante sua juventude, não tinha controle do seu estoque de jogos.

Para ajudar Mário a organizar sua loja de jogos, um estudante da SPTech propôs
criar uma tabela chamada “jogo” que continha o id como número e chave primária
que se autoincrementa, o nome do jogo com tamanho máximo de 30 caracteres, o
nome do diretor do jogo com tamanho máximo de 30 caracteres, o gênero com
tamanho de 30 caracteres, a data de lançamento, a nota do jogo (entre 0-10) e um
campo para guardar a quantidade de unidades disponíveis. */

CREATE DATABASE game_store;
USE game_store;
CREATE TABLE jogo (
	idJogo INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(30),
    diretor VARCHAR(30),
    genero VARCHAR(30),
    dtLancamento DATE,
    nota INT,
    unidade INT
);

ALTER TABLE jogo ADD CONSTRAINT chkNota
	CHECK(nota BETWEEN 0 AND 10);

-- 1. Insira pelo menos 5 registros para a tabela.
INSERT INTO jogo VALUES 
	(default, 'Super Mario', 'Shin', 'Aventura', '1999-01-01', 9, 5),
    (default, 'Mario Kart', 'Shin', 'Corrida', '1999-02-01', 10, 0),
    (default, 'Cook Mama', 'Shun', 'Cozinha', '1999-01-05', 8, 2),
    (default, 'Boberman', 'Shan', 'Bomba', '1999-05-01', 7, 2),
    (default, 'Kiko', 'Shen', 'Aventura', '2009-01-01', 5, 5);

-- 2. Altere a tabela para inserir uma coluna que represente o tipo de mídia que deve armazenar o tipo de jogo apenas com os valores “física” ou “digital”.
ALTER TABLE jogo ADD COLUMN tipoMidia VARCHAR(20);
ALTER TABLE jogo ADD CONSTRAINT chkMidia
	CHECK(tipoMidia IN ('física', 'digital'));

-- 3. Atualize os registros dos jogos inseridos anteriormente.
UPDATE jogo SET tipoMidia = CASE
	WHEN idJogo = 1 THEN 'digital'
    WHEN idJogo = 2 THEN 'digital'
    WHEN idJogo = 3 THEN 'digital'
    WHEN idJogo = 4 THEN 'digital'
    WHEN idJogo = 5 THEN 'física'
END
WHERE idJogo IN (1,2,3,4,5);

-- 4. Exiba apenas os jogos com data de lançamento a partir de 2015.
SELECT * FROM jogo WHERE dtLancamento > '2015-00-00';

-- 5. Exiba os jogos que tenham a letra “a” em seu nome e são de mídia física.
SELECT * FROM jogo WHERE nome LIKE '%a%' AND tipoMidia = 'física';

-- 6. Exiba os jogos onde o nome do diretor não contenha a letra “e”.
SELECT * FROM jogo WHERE diretor NOT LIKE '%e%';

-- 7. Altere a tabela para criar uma checagem na inserção da nota, onde o valor não pode ser menor que 0 e nem maior que 10.
ALTER TABLE jogo DROP CONSTRAINT chkNota;
ALTER TABLE jogo ADD CONSTRAINT chkNota
	CHECK(nota BETWEEN 0 AND 10);

-- 8. Exiba os jogos de um determinado gênero e que ainda esteja em estoque.
SELECT * FROM jogo WHERE genero = 'Aventura' AND unidade > 0;

-- 9. Exclua os jogos que não têm mais unidades disponíveis em estoque.
DELETE FROM jogo WHERE unidade <= 0;

-- 10. Renomeie a coluna “diretor” para “criador” e exiba como ficou a estrutura da tabela. 
ALTER TABLE jogo CHANGE diretor criador VARCHAR(30);

-- -------------------------- EXERCÍCIO 02 -------------------------------------
/* 2 – Esportes Olímpicos
No MySQL Workbench, crie o banco de dados "olimpiadas".
Casimiro, um fã apaixonado por esportes, decidiu que queria acompanhar de
perto as Olimpíadas. Ele pediu ajuda a um amigo para criar uma tabela que
armazenasse informações sobre os esportes praticados nas Olimpíadas.
Eles criaram uma tabela chamada "esporte" que continha id como número e chave
primária que se autoincrementa, nome que armazena o nome do esporte com
limite de 40 caracteres, a categoria do esporte com limite de 20 caracteres que
aceita apenas ("Individual" ou "Coletivo"), o número de jogadores que podem
participar por equipe, estreia que armazena a data de quando o esporte estreou
nas Olimpíadas e o nome do país de origem do esporte com até 30 caracteres. */

CREATE DATABASE olimpiadas;
USE olimpiadas;

CREATE TABLE esporte (
	idEsporte INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(40),
    categoria VARCHAR(20),
    numJogador INT,
    dtEstreia DATE,
    origem VARCHAR(30)
);
SELECT * FROM esporte;
ALTER TABLE esporte ADD CONSTRAINT chkCategoria
	CHECK(categoria IN ('Individual', 'Coletivo'));

-- 1. Insira pelo menos 5 registros na tabela.
INSERT INTO esporte VALUES
	(default, 'Futebol', 'Coletivo', 11, '1863-10-26', 'Inglaterra'),
	(default, 'Basquete', 'Coletivo', 5, '1891-12-21', 'Estados Unidos'),
	(default, 'Tênis', 'Individual', 1, '1873-06-01', 'Inglaterra'),
	(default, 'Vôlei', 'Coletivo', 6, '1895-02-09', 'Estados Unidos'),
	(default, 'Judô', 'Individual', 1, '1882-01-01', 'Japão');

-- 2. Altere a tabela para adicionar uma coluna popularidade que armazene a popularidade do esporte como um valor decimal entre 0 e 10 e exiba como ficou a estrutura da tabela.
ALTER TABLE esporte ADD COLUMN popularidade DECIMAL;
ALTER TABLE esporte ADD CONSTRAINT chkPopularidade
	CHECK(popularidade BETWEEN 0 AND 10);

-- 3. Atualize os registros para definir a popularidade dos esportes inseridos anteriormente.
UPDATE esporte SET popularidade = CASE
	WHEN idesporte = 1 THEN '5'
    WHEN idesporte = 2 THEN '5'
    WHEN idesporte = 3 THEN '8'
    WHEN idesporte = 4 THEN '6'
    WHEN idesporte = 5 THEN '1'
END
WHERE idesporte IN (1,2,3,4,5);

-- 4. Exiba os esportes ordenados por popularidade em ordem crescente.
SELECT * FROM esporte ORDER BY popularidade ASC;

-- 5. Exiba apenas os esportes que estrearam nas Olimpíadas a partir do ano 2000.
SELECT * FROM esporte WHERE dtEstreia > '2000-00-00';

-- 6. Crie uma checagem para que não possa ser inserido valores dentro de estreia que seja menor que 06 de abril de 1896 e depois da data atual.
ALTER TABLE esporte ADD CONSTRAINT chkEstreia
	CHECK(dtEstreia > '1896-04-06');

-- 7. Altere a tabela para excluir a regra de inserção de categoria, assim podendo colocar valores além de "Individual" ou "Coletivo".
ALTER TABLE esporte DROP CONSTRAINT chkCategoria;

-- 8. Exiba apenas os esportes cujo nome do país de origem tenha "a" na segunda letra.
SELECT * FROM esporte WHERE origem LIKE '_a%';

-- 9. Exiba os dados onde o número de jogadores por equipe esteja entre 4 e 11.
SELECT * FROM esporte WHERE numJogador between 4 AND 11;

-- 10. Remova os registros onde id seja 1, 3 e 5.
DELETE FROM esporte WHERE idEsporte IN (1,3,5);

-- -------------------------- EXERCÍCIO 03 -------------------------------------
/* 3 – Desenhos Animados
No MySQL Workbench, crie o banco de dados "desenho".
Você foi contratado para criar um banco de dados que armazene informações
detalhadas sobre desenhos animados exibidos na emissora. O objetivo é manter
um catálogo com as seguintes informações.
Para atender a essa necessidade, você propôs a criação de uma tabela com os
seguintes campos: id, um número inteiro chave primária da tabela, este valor
deverá ser autoincrementado a partir do 10. Título, um campo de texto com
tamanho de 50 caracteres que armazenará o título do desenho animado. A data de
lançamento um campo que armazenará a data de lançamento do desenho. O
nome da emissora original, um campo de texto com tamanho de 50 caracteres.
Classificação, um campo que armazenará a classificação indicativa do desenho.
Status, um campo de texto com tamanho de 15 caracteres, que armazenará o
status do desenho. Nota, um campo que armazenará a avaliação do desenho,
permitindo valores de 1 a 5. */

CREATE DATABASE desenho;
USE desenho;

CREATE TABLE animado (
	idDesenho INT PRIMARY KEY auto_increment,
    titulo VARCHAR(50),
    dtLancamento DATE,
    emissora VARCHAR(50),
    classificacao INT,
    status VARCHAR(15),
    nota INT
);
ALTER TABLE animado ADD CONSTRAINT chkNota CHECK(nota BETWEEN 1 AND 5 );

INSERT INTO animado (titulo, dtLancamento, emissora, classificacao, status, nota) VALUES
	('Avatar: A Lenda de Aang', '2005-02-21', 'Nickelodeon', 10, 'Finalizado', 5),
	('Rick and Morty', '2013-12-02', 'Adult Swim', 16, 'Em exibição', 2),
	('Os Simpsons', '1989-12-17', 'Fox', 12, 'Em exibição', 1),
	('Hora de Aventura', '2010-04-05', 'Cartoon Network', 10, 'Finalizado', 2),
	('Death Note', '2006-10-03', 'Nippon TV', 16, 'Finalizado', 4);

-- 1. Exibir todos os dados da tabela
SELECT * FROM animado;

-- 2. Exibir todos os desenhos com a classificação menor ou igual a 14 anos
SELECT * FROM animado WHERE classificacao <= 14;

-- 3. Exibir todos os desenhos de uma mesma emissora original
SELECT * FROM animado WHERE emissora = 'original';

-- 4. Modificar o campo status, para que aceite apenas o status 'exibindo', 'finalizado', 'cancelado', tente inserir algum outro valor para ver se a regra foi aplicada
ALTER TABLE animado CHANGE status statu VARCHAR(15);
UPDATE animado SET statu = NULL;
ALTER TABLE animado ADD CONSTRAINT chkStatu CHECK ( statu IN ('exibindo', 'finalizado', 'cancelado'));

-- 5. Modificar o status 'exibindo' para 'finalizado' de 2 desenhos pelo ID
UPDATE animado SET statu = CASE
	WHEN idDesenho = 1 THEN 'exibindo'
    WHEN idDesenho = 1 THEN 'finalizado'
    WHEN idDesenho = 1 THEN 'cancelado'
    WHEN idDesenho = 1 THEN 'exibindo'
    WHEN idDesenho = 1 THEN 'cancelado'
END 
WHERE idDesenho IN (1,2,3,4,5);

SELECT idDesenho FROM animado WHERE statu = 'exibindo';
UPDATE animado SET statu = 'finalizado' WHERE idDesenho = 1;

-- 6. Deletar a linha do desenho de ID 12
DELETE FROM animado WHERE idDesenho = 12;

-- 7. Exibir apenas os desenhos que comecem com uma determinada letra
SELECT * FROM animado WHERE titulo LIKE 'A%';

-- 8. Renomear a coluna classificacao para classificacaoIndicativa
ALTER TABLE animado CHANGE classificacao classificacaoIndicativa INT;

-- 9. Atualizar a nota e data de lançamento do desenho de ID 11
UPDATE animado SET nota = 2 AND dtLancamento = '2025-02-17' WHERE idDesenho = 11;

-- 10. Limpe todos os dados da tabela
TRUNCATE animado;

-- 11. Remover a regra do status do desenho
ALTER TABLE animado DROP constraint chkStatu;


-- -------------------------- EXERCÍCIO 04 -------------------------------------
/* 4 – Despensa do Scooby-Doo
No MySQL Workbench, crie o banco de dados "estoque".
A turma do Scooby Doo percebeu que os alimentos guardados no armário estavam
sumindo de forma muito rápida. Para ter um melhor controle, Fred propôs criar
um banco de dados que registrasse os dados de entrada e saída dos alimentos do
armário.
Ele criou uma tabela chamada "MisteriosSA", que possui os campos id um número
inteiro chave primária, nome um campo de texto para armazenar o nome do
produto, data da compra para armazenar a data na qual o produto foi comprado,
preço valor numérico com casas decimais, peso um valor numérico que armazena
o peso em gramas e data de retirada para armazenar a data em que o produto foi
consumido. */
CREATE database estoque;
USE estoque;

create table MisteriosSA (
	idAlimento INT primary KEY,
    nome VARCHAR(30),
    dtCompra date,
    preco DECIMAL(10.2),
    peso DOUBLE,
    dtRetirada DATE
);

-- 1. Insira na tabela, no mínimo 5 compras de alimentos com datas diferentes. Por agora, não preencha a coluna referente a "data de retirada".
INSERT INTO MisteriosSA (idAlimento, nome, dtCompra, preco, peso, dtRetirada) VALUES
	(1, 'Queijo', '2024-01-15', 25.50, 0.500, NULL),
	(2, 'Pão', '2024-02-02', 5.99, 0.300, NULL),
	(3, 'Leite', '2024-02-10', 4.50, 1.000, NULL),
	(4, 'Carne', '2024-02-20', 45.00, 1.500, NULL),
	(5, 'Maçã', '2024-03-01', 9.99, 1.200, NULL);

-- 2. Verifique se os valores foram inseridos corretamente.
SELECT * FROM MisteriosSA;

-- 3. Exiba os nomes, as datas de compra e retirada e o id dos alimentos ordenados a partir da data de compra mais antiga.
SELECT nome, dtCompra, dtRetirada, idAlimento FROM MisteriosSA ORDER BY dtCompra ASC;

-- 4. Alguém comeu uma caixa de biscoitos, atualize a data de retirada da caixa de “Biscoitos Scooby” que foi comprada a mais tempo.
INSERT INTO MisteriosSA (idAlimento, nome, dtCompra, preco, peso, dtRetirada) VALUES
	(6, 'Biscoitos Scooby', '2024-01-15', 25.50, 0.500, '2025-02-17');
UPDATE MisteriosSA SET dtRetirada = '2025-05-25' WHERE idAlimento = 6;

-- 5. Altere o nome da coluna id para idComida.
-- 6. Altere o tipo do check para que os alimentos só possam ser “Biscoitos Scooby” ou “Cachorro-quente”.
-- 7. Exiba os produtos onde o nome seja "Biscoitos Scooby" de forma que o nome das colunas dataCompra apareça como "data da compra" e dataRetirada apareça como "data da retirada".
-- 8. Exiba os alimentos que foram comprados antes do dia 25 de julho de 2024.
-- 9. Exiba os alimentos que possuem um preço acima ou igual a 30.50.
-- 10. Limpe a tabela.
