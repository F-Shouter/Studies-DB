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