create table pet (
	idPet int primary key,
    nome varchar(45),
    raca varchar(45),
    fkMae int,
    fkPai int,
    constraint fkFilhoMae foreign key (fkMae)
		references pet(idPet),
	constraint fkFilhoPai foreign key (fkPai)
		references pet(idPet)); 
        
insert into pet values
	(1, 'Homero', 'vira-lata', null, null),
    (2, 'Marge', 'vira-lata', null, null),
    (3, 'Bart', 'vira-lata', 2, 1);
    
insert into pet values
	(4, 'Scooby doo pai', 'vira-lata', null, null),
    (5, 'Scooby doo mae', 'vira-lata', null, null),
    (6, 'Scooby doo', 'vira-lata', 5, 4);
    
select filho.nome as Nome_filho,
	mae.nome as Nome_mae,
    pai.nome as Nome_pai
    from pet as filho 
    join pet as mae
    on filho.fkMae = mae.idPet
    join pet as pai
    on filho.fkPai = pai.idPet;
    
insert into pet (idPet,nome) values 
	(7,'Scooby doo avô'),
    (8,'Scooby doo avó');
    
update pet set fkMae = 7, fkPai = 8 where idPet =5;

select filho.nome as filho,
	mae.nome as mae,
    avô.nome as avô,
    avó.nome as avó
    from pet as filho join pet as mae
    on filho.fkMae = mae.idPet
    join pet as avô
    on mae.fkMae = avô.idPet
    join pet as avó
    on mae.fkPai = avó.idPet;