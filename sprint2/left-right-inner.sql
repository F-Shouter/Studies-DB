create database aula08;
use aula08;
-- relaconamento forte, chave primária simples;
-- relacionamento fraco, chave primária composta pelo id e fk; linha cheia;
create table funcionario (
	idFunc int primary key,
    nome varchar(45),
    dtAdmissao date,
    fkSupervisor int not null,
    constraint fkFuncSuper foreign key (fkSupervisor) 
		references funcionario(idFUnc)
);

insert into funcionario  values
	(1, 'Alexandro', '2025-03-31', 1);
    
insert into funcionario (idFunc, nome, fkSupervisor) values
	(2, 'Gerson', 1),
    (3, 'Brandão', 1);
    
select 
	f.nome as 'Funcionário:',
    f.idFunc as 'ID Func:',
    s.nome as 'Supervisor',
    s.idFunc as 'ID Super'
from funcionario as f
join funcionario as s
on f.fkSupervisor = s.idFunc;

select 
	funcionario.nome,
    supervisor.nome
from funcionario
join funcionario as supervisor
on funcionario.fkSupervisor = supervisor.idFunc;

create table dependente (
	idDep int,
    fkFunc int,
    constraint pkComposta primary key (idDep, fkFunc),
    nome varchar(45),
    parentesco varchar(45),
    constraint fkFuncDep foreign key (fkFunc) references funcionario(idFUnc)
); -- Entidade fraca, depende de outra tabela. 

insert into dependente values 
	(1, 1, 'Isabela', 'filha');
    
insert into dependente values 
	(2, 1, 'Ademir', 'filho'),
    (1, 3, 'João', 'filho');
    
select 
	* from funcionario
    join dependente 
    on idFUnc = fkFunc;
    
select 
	ifnull (f.nome, 'sem dependente') as 'Funcionário',
    ifnull (d.nome, 'sem dependente') as 'Dependente:'
from funcionario as f
left join dependente as d
on idFunc = fkFunc;

select 
	f.nome as 'Nome_func:',
    s.nome as 'Supervisionado por:',
case 
	when d.nome is null or d.parentesco is null then '---------------'
else concat(d.nome, ' É ', d.parentesco)
end as Dependente
from funcionario as f
join funcionario as s
on f.fkSupervisor = s.idFunc
left join dependente as d
on f.idFunc = d.fkFunc;