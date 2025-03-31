-- 1. Fazer a modelagem lógica (DER) de um sistema para cadastrar os alunos da faculdade e seus projetos.
-- (FEITO JÁ!)
-- - Cada aluno participa apenas de um projeto.
-- (FEITO JÁ!)
-- - Cada projeto pode ter a participação de um ou mais alunos.
-- (FEITO JÁ!)
-- - Há alguns alunos que atuam como representantes de outros alunos. Qualquer problema ou queixa que os alunos tiverem, -- devem falar com o aluno que os representa. O aluno representante, por sua vez, reporta os problemas/queixas à equipe de -- socioemocional.
-- (FEITO JÁ!)
-- - Cada aluno é representado apenas por um aluno.
-- (FEITO JÁ!)
-- - Sobre os alunos, o sistema guarda o ra (chave primária), nome, telefone.
-- (FEITO JÁ!)
-- - Sobre os projetos, o sistema guarda um identificador (chave primária), nome e a descrição do projeto.
-- (FEITO JÁ!)
--  Criar um banco de dados AlunoProjeto no MySQL, selecionar esse banco de dados e executar as instruções relacionadas a -- seguir.
create database AlunoProjeto;
use AlunoProjeto;

-- - Criar as tabelas equivalentes à modelagem.
create table projeto (
	idProjeto int primary key,
    nome varchar(45),
    descricao varchar(45)
);

create table aluno (
	ra int primary key,
    nome varchar(45),
    telefone char(12),
    fkProjeto int,
    fkRepresentante int,
    constraint fkAlunoProjeto foreign key (fkProjeto) 
		references projeto(idProjeto),
	constraint fkAlunoRepresentante foreign key (fkRepresentante) 
		references aluno(ra)
);

-- - Inserir dados nas tabelas.
insert into projeto values 
	(001, 'Temperatura em baús refrigerados', 'Registros interior do baú no transporte.'),
    (002, 'Gás natural em condominios', 'Registros condominios para gás natural.');
     
insert into aluno values
	(01251089,'Anne Yukari Yamasaki', '11-956922441', 001, null),
    (01251001,'Vitor Souza Restini', '11-950000000', 001, 01251089),
    (01251025,'Rebeca Oliveira', '11-956920000', 001, 01251089),
    (01252356,'João Victor', '11-956921111', 002, null),
    (01252222,'Hygor Osmar', '11-956956231', 002, 01252356),
    (01255589,'Felipe Sanatana', '11-956927777', 002, 01252356);
    
-- - Exibir todos os dados de cada tabela criada, separadamente.
select * from aluno;
select * from projeto;

-- - Fazer os acertos da chave estrangeira, caso não tenha feito no momento da criação.
-- (FEITO JÁ!)

-- - Exibir os dados dos alunos e dos projetos correspondentes.
select 
	a.ra as 'RA:',
	a.nome as 'Nome do aluno:',
    a.telefone as 'Telefone para contato:',
    r.ra as 'ID reprensentante:',
    r.nome as 'Nome do representante:',
    p.idProjeto as 'ID do projeto:',
    p.nome as 'Projeto:',
    p.descricao as 'Descrição breve:'
from aluno as a
join aluno as r
on a.fkRepresentante = r.ra
join projeto as p 
on a.fkProjeto = p.idProjeto;

-- - Exibir os dados dos alunos e dos seus representantes.
select 
	a.ra as 'RA:',
	a.nome as 'Nome do aluno:',
    a.telefone as 'Telefone para contato:',
    r.ra as 'ID reprensentante:',
    r.nome as 'Nome do representante:'
from aluno as a
join aluno as r
on a.fkRepresentante = r.ra;

-- - Exibir os dados dos alunos e dos projetos correspondentes, mas somente de um determinado projeto (indicar o nome do -- projeto na consulta).
select 
	a.ra as 'RA:',
	a.nome as 'Nome do aluno:',
    a.telefone as 'Telefone para contato:',
    p.idProjeto as 'ID do projeto:',
    p.nome as 'Projeto:',
    p.descricao as 'Descrição breve:'
from aluno as a
join projeto as p 
on a.fkProjeto = p.idProjeto
where p.nome = 'Temperatura em baús refrigerados';

-- 2. Fazer a modelagem lógica de um sistema para cadastrar as campanhas de doações que surgiram devido ao Covid-19 e os -- organizadores dessas campanhas
-- (FEITO JÁ!)
-- - Cada organizador organiza mais de uma campanha de doação.
-- (FEITO JÁ!)
-- - Cada campanha de doação é organizada por apenas um organizador.
-- (FEITO JÁ!)
-- - Sobre cada organizador, o sistema guarda um identificador, que identifica de forma única cada organizador. Esse -- identificador começa com o valor 30 e é inserido de forma automática. Além desse identificador, o sistema guarda o nome, -- o endereço (composto pelo nome da rua e bairro) e o e-mail do organizador.
-- (FEITO JÁ!)
-- - Sobre cada campanha de doação, o sistema guarda um identificador, que identifica de forma única cada campanha. Esse -- identificador começa com o valor 500 e é inserido de forma automática. O sistema também guarda a categoria da doação (ex: -- alimento ou produto de higiene, ou máscaras de proteção, etc), a instituição para a qual será feita a doação (pode haver -- até 2 instituições) e a data final da campanha.
-- (FEITO JÁ!)
-- - Um organizador mais experiente orienta outros organizadores novatos. Cada organizador novato é orientado apenas por um -- organizador mais experiente.
-- (FEITO JÁ!)

-- Escrever os comandos do MySQL para:
-- a) Criar um banco de dados chamado Campanha.
create database CampanhaDoacao;

-- b) Selecionar esse banco de dados.
use CampanhaDoacao;

-- c) Criar as tabelas correspondentes à sua modelagem.
create table organizador (
	idOrganizador int primary key auto_increment,
    nome varchar(45),
    endereco varchar(45),
    email varchar(45),
    fkOrganizadorExperiente int,
    constraint fkOrgOrganizadorExperiente foreign key (fkOrganizadorExperiente)
		references organizador(idOrganizador)    
); alter table organizador auto_increment = 30;

create table campanha (
	idCampanha int primary key auto_increment,
    categoria varchar(45),
    instituicao1 varchar(45),
	instituicao2 varchar(45),
    dtFinal date,
    fkOrganizador int,
    constraint fkCampanhaOrganizador foreign key (fkOrganizador)
		references Organizador(idOrganizador)
); alter table campanha auto_increment = 500;

alter table campanha add constraint chkCategoria check (categoria in ('alimento', 'produto de higiene', 'máscaras de proteção'));

-- d) Inserir dados nas tabelas, de forma que exista mais de uma campanha para algum organizador, e mais de um organizador -- novato sendo orientado por algum organizador mais experiente.
insert into organizador values
	(default, 'Anne Yukari Yamasaki', 'Liberdade - São Joaquim, 526', 'anne.yamasaki@sptech.school', null);
    
insert into organizador values
	(default, 'Jhum Yamasaki', 'Pindorama - Barroso, 001', 'jhum.yamasaki@gmail.com', 30),
    (default, 'Ayumi Yamasaki', 'Pindorama - Barroso, 001', 'julia.yamasaki@hotmail.com', 30),
    (default, 'Rebeca Oliveira', 'SP - Algum lugar, 123', 'rebeca.ferreira@sptech.school', null),
    (default, 'Samuel Barros', 'SP - Outro lugar, 456', 'samuel.barros@sptech.school', 33),
    (default, 'Lucas Queiroz', 'SP - Outro outro lugar, 789', 'lucas.queiroz@sptech.school', 33);
    
insert into campanha values 
	(default, 'alimento', 'Igreja', 'Escola', '2025-03-31', 30),
    (default, 'produto de higiene', 'Caridade', null, '2025-03-31', 30),
    (default, 'máscaras de proteção', 'Hospitais', null, '2025-03-31', 33);
    
-- e) Exibir todos os dados de cada tabela criada, separadamente.
select * from organizador;
select * from campanha;

-- f) Fazer os acertos da chave estrangeira, caso não tenha feito no momento da criação das tabelas.
-- (FEITO JÁ!)

-- g) Exibir os dados dos organizadores e os dados de suas respectivas campanhas.
select 
	o.idOrganizador as 'ID do organizador:',
    o.nome as 'Nome:',
    o.endereco as 'Endereço completo:',
    o.email as 'E-mail para contato:',
    o.fkOrganizadorExperiente as 'ID do organizador experiente reponsável por ele(a):',
    c.idCampanha as 'ID da campanha:',
    c.categoria as 'Categoria:',
    c.instituicao1 as 'Instituição para doação 1:',
    c.instituicao2 as 'Instituição para doação 2:',
    c.dtFinal as 'Data final para campanha:',
    c.fkOrganizador as 'ID do organizador da campanha:'
from organizador as o
left join campanha as c
on o.idOrganizador = c.fkOrganizador;

-- h) Exibir os dados de um determinado organizador (informar o nome do organizador na consulta) e os dados de suas -- respectivas campanhas.
select 
	o.nome as 'Nome do organizador:',
	c.fkOrganizador as 'ID do organizador:',
	c.idCampanha as 'ID da campanha:',
    c.categoria as 'Categoria:',
    c.instituicao1 as 'Instituição para doação 1:',
    c.instituicao2 as 'Instituição para doação 2:',
    c.dtFinal as 'Data final para campanha:'
from organizador as o
join campanha as c
on o.idOrganizador = c.fkOrganizador
where o.nome = 'Anne Yukari Yamasaki';   
    
-- i) Exibir os dados dos organizadores novatos e os dados dos respectivos organizadores orientadores.
select 
	o.nome as 'Nome do novato:',
    e.nome as 'Experiente que orienta ele(a):'
    
from organizador as o
join organizador as e
on o.fkOrganizadorExperiente = e.idOrganizador;

-- j) Exibir os dados dos organizadores novatos e os dados dos respectivos organizadores orientadores, porém somente de um -- determinado organizador orientador (informar o nome do organizador orientador na consulta).
select 
	o.nome as 'Nome do novato:',
    e.nome as 'Experiente que orienta ele(a):'
from organizador as o
join organizador as e
on o.fkOrganizadorExperiente = e.idOrganizador
where e.nome like 'R%';

-- l) Exibir os dados dos organizadores novatos, os dados das respectivas campanhas organizadas e os dados dos respectivos -- organizadores orientadores.
select 
	o.nome as 'Nome do organizador NOVATO:',
    c.categoria as 'Doação de:',
    c.instituicao1 as 'para:',
    c.instituicao2 as 'e:',
    e.nome as 'Organizador EXPERIENTE que orienta ele(a):',
    e.idOrganizador as 'ID do organizador EXPERIENTE:'
from organizador as e
join organizador as o
on e.idOrganizador = o.fkOrganizadorExperiente
join campanha as c
on e.idOrganizador = c.fkOrganizador;

-- m) Exibir os dados de um organizador novato (informar o seu nome na consulta), os dados das respectivas campanhas em que -- trabalha e os dados do seu organizador orientador.
select 
	o.nome as 'Nome do organizador NOVATO:',
    c.categoria as 'Doação de:',
    c.instituicao1 as 'para:',
    c.instituicao2 as 'e:',
    e.nome as 'Organizador EXPERIENTE que orienta ele(a):',
    e.idOrganizador as 'ID do organizador EXPERIENTE:'
from organizador as e
join organizador as o
on e.idOrganizador = o.fkOrganizadorExperiente
join campanha as c
on e.idOrganizador = c.fkOrganizador
where o.nome like 'J%';
