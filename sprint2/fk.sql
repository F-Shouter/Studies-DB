-- MODELO LOGICO
-- ALUNO EMPRESA RESPONSAVEL

CREATE DATABASE sprint2;
USE sprint2;


CREATE TABLE responsavel (
	idResponsavel INT PRIMARY KEY auto_increment,
    nome VARCHAR(45)
);

CREATE TABLE empresa (
	idEmpresa int primary key auto_increment,
    nome VARCHAR(45),
    fkResponsavel int unique,
    constraint fkResponsavel
		foreign key (fkResponsavel)
			references responsavel(idResponsavel)
);

CREATE TABLE aluno(
	ra char(8),
    nome varchar(45),
    email varchar(45),
    fkEmpresa int,
    constraint fkAlunoEMpresa
    foreign key (fkEmpresa)references empresa(idEmpresa)
);

-- num relacionamento 1:1, fl sempre vai ser UNIQUE

insert into responsavel VALUES 
	(default, 'Anne'),
	(default, 'Ricardo');
    
insert into empresa VALUES
	(default, 'C6Bank', 1),
    (default, 'Stefanini', 2);
    
insert into aluno (ra, nome, fkEmpresa) values
	('01251089', 'Anne', 3),
    ('01250011', 'Ricardo', 3),
    ('01252211', 'Carlos', 4);
    
    -- -----------------------------JOIN----------------------
SELECT * FROM responsavel JOIN empresa 
on idResponsavel = fkResponsavel;

select responsavel.nome as Responsa,
empresa.nome as Empresa
from responsavel join empresa on idResponsavel = fkResponsavel;

-- inner join = join

select a.nome as NomeAluni,
	e.nome as NomeEmpresa,
    r.nome as NomeResponsa
    FROM aluno as a JOIN empresa as e 
    ON a.fkEmpresa = e.idEmpresa
    JOIN responsavel as r
    ON e.fkResponsavel = r.idResponsavel
    WHERE a.nome = 'Anne'
    ;
    
    -- luis é um responsavel mas não foi responsavel por ninguem, se chamado com join na empresa e aluno, luis não aparecerá.
    -- criar na vm 
    