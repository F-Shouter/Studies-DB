create database venda;

use venda;

create table cliente (
	idCliente int primary key auto_increment,
    nome varchar(45),
    email varchar(45),
    endereco varchar(45)
) auto_increment = 100;

create table produto (
	idProduto int primary key auto_increment,
    nome varchar(45),
    descricao varchar(45),
    preco decimal(10,2)
) auto_increment = 200;

create table venda (
	idVenda int primary key auto_increment,
    data date,
    valorTotalVenda decimal(10,2),
    qtdProduto int,
    valorDesconto decimal(10,2)
);
alter table venda auto_increment = 300;

alter table cliente add column fkIdClienteIndicado int;

alter table cliente add constraint fkIdClienteIndicado 
	foreign key (fkIdClienteIndicado) references cliente(idCliente);

alter table venda add column fkCliente int;

alter table venda add column fkProduto int;

alter table venda add constraint fkCliente 
	foreign key (fkCliente) references cliente(idCliente);

alter table venda add constraint fkProduto 
	foreign key (fkProduto) references produto(idProduto);

insert into cliente values 
	(default, 'Anne', 'anne@a.com', 'são paulo', null);
    
insert into cliente values 
	(default, 'João', 'joao@a.com', 'são bernado', 100);
    
insert into produto values 
	(default, 'remédio', 'para dor de cabeça', 20.89),
    (default, 'biscoito', 'de chocolate', 7.99),
    (default, 'ventilador', 'ar frio', 37.09);
    
insert into venda values 
	(default, '2025-04-29', 15.98, 2, 0.98, 100, 200);
    
insert into venda values 
	(default, '2025-04-28', 74.18, 2, 0.18, 100, 202);
    
insert into venda values 
	(default, '2025-04-28', 74.18, 2, 0.18, 101, 202);
    
select * from cliente;

select * from produto;

select * from venda;

select * from cliente 
	join venda
    on idCliente = fkCliente;
    
select c.nome,
	v.idVenda,
    v.data,
    v.valorTotalVenda,
    v.qtdProduto,
    v.valorDesconto
	from cliente as c
	join venda as v
    on idCliente = fkCliente;
    
select c.nome,
	v.idVenda,
    v.data,
    v.valorTotalVenda,
    v.qtdProduto,
    v.valorDesconto
	from cliente as c
	join venda as v
    on idCliente = fkCliente
    where c.nome like 'Anne';

select c.nome as 'Cliente:',
	i.nome as 'Cliente indicado:'
    from cliente as c
    join cliente as i
    on i.fkIdClienteIndicado = c.idCliente;
    
select c.nome as 'Cliente:',
	i.nome as 'Cliente indicado:'
    from cliente as c
    join cliente as i
    on i.fkIdClienteIndicado = c.idCliente
    where c.nome like 'Anne';
    
select c.nome as 'Cliente:',
	i.nome as 'Cliente indicado:',
    v.valorTotalVenda as 'Valor total da venda:',
    p.nome as 'Produto comprado:'
    from cliente as c
    join cliente as i
    on i.fkIdClienteIndicado = c.idCliente
    join venda as v 
    on c.idCliente = v.fkCliente
    join produto as p 
    on v.fkProduto = p.idProduto;
    
select v.data as 'Data da venda:',
	p.nome as 'Nome do produto:',
    v.qtdProduto as 'Quantidade do produto:'
    from venda as v
    join produto as p
    on v.fkProduto = p.idProduto
    where p.nome = 'remédio';
    
select concat(p.nome, ' ', v.qtdProduto) as 'Nome e Quantidade de produtos vendidos: ',
	p.preco as 'Valor do produto:'
    from venda as v
    join produto as p
    on v.fkProduto = p.idProduto;
    
insert into cliente values (default, 'Caio', 'caio@a.com', 'Rio de Janeiro', 101);
insert into cliente values (default, 'Damaris', 'damaris@a.com', 'Sao bento', null);

insert into venda values (default, '2025-04-30', 7.99, 1, 0, 102, 201);

select * from cliente
	left join venda
    on idCliente = fkCliente;
    
select min(preco) as 'Preço mínimo:',
	max(preco) as 'Preço máximo:'
    from produto;
    
select sum(preco) as 'Soma dos preços dos produtos:',
	avg(preco) as 'Média dos preços dos produtos:'
    from produto;
    
select count(*) as 'Quantidade de produtos com preço acima de média: '
	from produto
    where preco > (select avg(preco) from produto);
    
select sum(distinct preco) as 'Soma dos preços distintos:'
	from produto;
    
select v.idVenda,
	sum(p.preco) as 'Total da venda:'
    from venda as v
    join produto as p 
    on v.fkProduto = p.idProduto
    group by v.idVenda;


