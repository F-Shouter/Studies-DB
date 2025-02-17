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

USE sprint1;
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
