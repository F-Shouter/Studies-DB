-- Exercício 1:
-- 1 funcionário tem no mínimo um supervisor, que também é funcionário e no máximo 1 supervisor;
-- 1 supervisor supervisiona no mínimo 1 funcionário e no máximo muitos;
-- 1 funcionário trabalha em somente uma área da empresa, exemplo: marketing, financeiro, TI;
-- 1 área tem muitos funcionários;
-- - Criar a modelagem;
-- - Criar as tabelas;
CREATE DATABASE Sprint2;
USE Sprint2;

create table Area (
	idArea int primary key auto_increment,
    setor varchar(45)
);

CREATE TABLE Funcionario (
	idFuncionario int primary key auto_increment,
    nome varchar(45),
    fkSupervisor int,
    fkArea int,
    constraint fkFuncionarioSupervisor foreign key (fkSupervisor)
		references Funcionario(idFuncionario),
	constraint fkFuncionarioArea foreign key (fkArea)
		references Area(idArea)
);
 
-- - Inserir dados;
insert into Area values 
	(default, 'TI'),
    (default, 'Marketing'),
    (default, 'financeiro');
    
insert into Funcionario values 
	(default, 'Anne Yukari Yamasaki', null, null);
    
insert into Funcionario values 
	(default, 'Ricardo Bissaco', 3, 1);
    
-- - SELECT com JOIN
SELECT 
    funcionario.nome AS 'Nome do funcionário:',
    supervisor.nome AS 'Supervisor encarregado:',
    area.setor AS 'Setor da área:'
FROM Funcionario AS funcionario
JOIN Funcionario AS supervisor
ON funcionario.fkSupervisor = supervisor.idFuncionario
JOIN Area AS area
ON area.idArea = funcionario.fkArea;

-- - SELECT com JOIN e WHERE
SELECT 
    f.nome AS 'Nome do funcionário:',
    a.setor AS 'Setor trabalhando:'
FROM funcionario AS f
JOIN area AS a 
ON f.fkArea = a.idArea
where a.setor = 'TI';

-- - SELECT com JOIN e CASE
SELECT 
    f.idFuncionario AS 'ID func:',
    f.nome AS 'Funcionário:',
    s.idFuncionario AS 'ID super:',
    s.nome AS 'Supervisor:',
    CASE 
        WHEN f.fkSupervisor IS NOT NULL THEN 'Sim'
        ELSE 'Não'
    END AS 'Tem Supervisor?'
FROM funcionario AS f
JOIN funcionario AS s 
ON f.fkSupervisor = s.idFuncionario;

-- Exercício 2:
-- 1 usuário gerencia no mínimo 0 usuários e no máximo muitos usuários;
-- 1 usuário é gerenciado por somente 1 usuário gerente;
-- 1 usuário tem no mínimo 1 email e no máximo n emails;
-- 1 email é somente de um usuário;
-- - Criar a modelagem;
-- - Criar as tabelas;
create table email (
	idEmail int primary key auto_increment,
    fkUsuario int 
);
create table usuario (
	idUsuario int primary key auto_increment,
    nome varchar(45),
    fkGerente int
    );
    
alter table usuario add constraint fkUsuarioGerente
	foreign key (fkGerente)
    references usuario(idUsuario);
	
alter table email add constraint fkEmailUsuario
	foreign key (fkUsuario)
    references usuario(idUsuario);

-- - Inserir dados;
insert into usuario values 
	(default, 'Anne', null);
    
insert into usuario values 
	(default, 'Ricardo', 1);
    
insert into email values 
	(default, 1),
    (default, 2);

-- - SELECT com JOIN
select 
	u.nome as 'Nome do usuário:',
    g.nome as 'Gerente:'
from usuario as u
join usuario as g
on u.fkGerente = g.idUsuario;

-- - SELECT com JOIN e WHERE
select 
	u.nome as 'Usuário:',
    e.idEmail as 'ID de e-mail'
from email as e
join usuario as u
on e.fkUsuario = u.idUsuario
where u.idUsuario = 2;

-- - SELECT com JOIN e CASE
select 
	u.nome as 'Nome:',
    u.idUsuario as 'ID:',
    e.idEmail as 'ID E-mail:',
	case 
		when u.fkGerente is not null then 'Gerenciado'
        else 'Não gerenciado'
	end as 'É gerenciado?'
from usuario as u
join email as e
on u.idUsuario = e.fkUsuario;



