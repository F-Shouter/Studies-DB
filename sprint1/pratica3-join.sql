/*Exercício 1.
No MySQL Workbench:
Crie um banco de dados chamado Sprint2;
Use o banco de dados Sprint2;*/
create database Sprint2;
use Sprint2;

/*Escreva e execute os comandos para:
• Criar a tabela chamada Atleta para conter os dados: idAtleta (int e chave
primária da tabela), nome (varchar, tamanho 40), modalidade (varchar, tamanho
40), qtdMedalha (int, representando a quantidade de medalhas que o atleta
possui)
• Inserir dados na tabela, procurando colocar mais de um atleta para cada
modalidade e pelo menos 5 atletas.*/
create table Atleta(
	idAtleta int primary key,
    nome varchar(40),
    modalidade varchar(40),
    qtdMedalha int 
);
insert into Atleta values
	(1, 'João Silva', 'Futebol', 3),
	(2, 'Maria Souza', 'Futebol', 2),
	(3, 'Pedro Santos', 'Vôlei', 5),
	(4, 'Ana Oliveira', 'Vôlei', 4),
	(5, 'Carlos Pereira', 'Basquete', 6),
	(6, 'Lucas Almeida', 'Basquete', 2),
	(7, 'Julia Costa', 'Natação', 8),
	(8, 'Renato Lima', 'Natação', 3),
	(9, 'Fernanda Rocha', 'Atletismo', 7),
	(10, 'Ricardo Alves', 'Atletismo', 4);

/*• Criar uma tabela chamada País para conter os dados: idPais (int e chave primária
da tabela), nome (varchar, tamanho 30), capital (varchar, tamanho 40);
• Inserir pelo menos 4 países na tabela país.*/
create table Pais (
	idPais int primary key,
    nome varchar(30),
    capital varchar(40)
);
insert into Pais values
	(1, 'Brasil', 'Brasília'),
	(2, 'Estados Unidos', 'Washington, D.C.'),
	(3, 'Alemanha', 'Berlim'),
	(4, 'Japão', 'Tóquio');

/*Fazer a modelagem lógica conforme a regra de negócio:
• 1 país tem 1 ou muitos atletas;
• 1 atleta é de 1 e somente 1 país;
Escreva e execute os comandos para:
• Criar a chave estrangeira na tabela correspondente conforme modelagem;*/
alter table Atleta add column fkPais int;
alter table Atleta add constraint fkAtletaPais
	foreign key (fkPais) references Pais(idPais);
    
/*• Atualizar o país de todos os atletas;*/
update Atleta set fkPais = 1;

/*• Exibir os atletas e seu respectivo país;*/
select * from Atleta;
select * from Pais;
    
/*• Exibir apenas o nome do atleta e o nome do respectivo país;*/
select a.nome as Atleta, p.nome as Pais
    from Atleta a join Pais p 
    on a.fkPais = p.idPais;
    
/*• Exibir os dados dos atletas, seus respectivos países, de uma determinada capital;*/
select a.idAtleta, a.nome, a.modalidade, a.qtdMedalha as Atleta, 
	p.nome, p.capital as Pais
    from Atleta a join Pais p 
    on a.fkPais = p.idPais
    where p.capital = 'Brasília';

/*Exercício 2:
No MySQL Workbench, utilizando o banco de dados ‘sprint2’:
• Criar a tabela chamada Musica para conter os dados: idMusica, titulo (tamanho
40), artista (tamanho 40), genero (tamanho 40), sendo que idMusica é a chave
primária da tabela.
• Inserir dados na tabela, procurando colocar um gênero de música que tenha mais
de uma música, e um artista, que tenha mais de uma música cadastrada. Procure
inserir pelo menos umas 3 músicas.*/
create table Musica (
	idMusica int primary key,
    titulo varchar(40),
    artista varchar(40),
    genero varchar(40)
);
insert into Musica values
	(1, 'Shape of You', 'Ed Sheeran', 'Pop'),
	(2, 'Blinding Lights', 'The Weeknd', 'Pop'),
	(3, 'Levitating', 'Dua Lipa', 'Pop'),
	(4, 'Bohemian Rhapsody', 'Queen', 'Rock'),
	(5, 'We Will Rock You', 'Queen', 'Rock'),
	(6, 'Smells Like Teen Spirit', 'Nirvana', 'Rock');

/*• Criar a tabela chamada Album para conter os dados: idAlbum, nome, tipo (digital
ou físico) e dtLancamento (DATE).
• Inserir pelo menos 2 albuns;*/
create table Album (
	idAlbum int primary key,
    nome varchar(45),
    tipo varchar(45),
    dtLancamento date
);
alter table Album add constraint chkTipo
	check (tipo in ('digital', 'físico'));
insert into Album values
(1, 'Future Nostalgia', 'Digital', '2020-03-27'),
(2, 'Abbey Road', 'Físico', '1969-09-26');

/*• Fazer a modelagem lógica conforme a regra de negócio:
• 1 album pode ter 1 ou muitas músicas;
• 1 música é de 1 e somente 1 album;
Execute os comandos para:
a) Exibir todos os dados das tabelas separadamente;*/
select * from Musica;
select * from Album;

/*b) Criar a chave estrangeira na tabela de acordo com a regra de negócio;*/
alter table Musica add column fkAlbum int;
alter table Musica add constraint fkAlbum 
	foreign key (fkAlbum) references Album(idAlbum);

/*c) Atualizar os álbuns de cada música;*/
update Musica set fkAlbum = 1;

/*d) Exibir as músicas e seus respectivos álbuns;*/
select * from Musica;
select * from Album;

/*e) Exibir somente o título da música e o nome do seu respectivo álbum;*/
select m.titulo as Musica, a.nome as Album
	from Musica m join Album a
    on m.fkAlbum = a.idAlbum;

/*f) Exibir os dados das músicas e seu respectivo álbum, de um determinado tipo.*/
select m.idMusica, m.titulo, m.artista, m.genero, m.fkAlbum as Musica,
	a.nome, a.tipo, a.dtLancamento as Album
    from Musica m join Album a 
    on m.fkAlbum = a.idAlbum
    where a.tipo = 'Digital';
    
/* Exercício 3:
Criar as tabelas;*/
create table pessoa (
	idPessoa int primary key,
    nome varchar(45),
    cpf char(11)
);
create table reserva (
	idReserva int primary key,
    dtReserva datetime,
    dtRetirada datetime,
    dtDevolucao datetime,
    fkPessoa int
);

/*- Configurar chave estrangeira*/
alter table reserva add constraint fkReservaPessoa
	foreign key (fkPessoa) references Pessoa(idPessoa);

/*- Inserir 5 registros*/
insert into pessoa values
	(1, 'João Silva', '12345678901'),
	(2, 'Maria Oliveira', '23456789012'),
	(3, 'Carlos Souza', '34567890123'),
	(4, 'Ana Santos', '45678901234'),
	(5, 'Pedro Almeida', '56789012345');
insert into reserva values
	(1, '2025-03-23 08:00:00', '2025-03-24 09:00:00', '2025-03-25 18:00:00', 1),
	(2, '2025-03-23 10:00:00', '2025-03-24 14:00:00', '2025-03-26 16:00:00', 2),
	(3, '2025-03-23 11:00:00', '2025-03-24 11:30:00', '2025-03-27 17:00:00', 3),
	(4, '2025-03-23 15:00:00', '2025-03-24 08:30:00', '2025-03-28 12:00:00', 4),
	(5, '2025-03-23 16:00:00', '2025-03-24 10:00:00', '2025-03-29 14:00:00', 5);

/*- Exibir dados;*/
select * from pessoa;
select * from reserva;

/*- Exibir dados com AS;*/
select p.idPessoa as "ID:(pessoa)",
	p.nome as "Nome:",
    p.cpf as "CPF",
    r.idReserva as "ID:(reserva)",
    r.dtReserva as "Data de reserva:",
    r.dtRetirada as "Data de retirada:",
    r.dtDevoluçao as "Data de devolução:"
    from pessoa p join reserva r
    on p.idPessoa = r.fkPessoa;
    
/*- Exibir dados com CASE;*/
select p.idPessoa as "ID(pessoa)",
	p.nome as "nome da pessoa:",
    r.dtReserva as "Reservado, hora:",
    case
		when r.dtReserva > '2025-03-23 11:00:00' then 'Depois das 10h'
        else 'Antes das 10h'
        end as "Status de reserva:" 
        from pessoa p join reserva r 
        on p.idPessoa = r.fkPessoa;

/*- Exibir dados com IFNULL;*/
select p.nome as "Nome:",
	ifnull(r.dtDevoluçao, 'Data de devolução pendente') as "Data de devolução"
    from pessoa p join reserva r 
    on p.idPessoa = r.fkPessoa;
    
/*Exercício 4:
- Criar as tabelas;*/
create table pessoa1 (
	idPessoa1 int primary key,
    nome varchar(45),
    dtNascimento date
);
create table pessoa2 (
	idPessoa2 int primary key,
    nome varchar(45),
    dtNascimento date,
    fkPessoa1 int
);

/*- Inserir 5 registros*/
insert into pessoa1 values
	(1, 'João Silva', '1990-01-01'),
	(2, 'Maria Oliveira', '1985-05-10'),
	(3, 'Carlos Pereira', '1992-07-15'),
	(4, 'Ana Souza', '1988-12-20'),
	(5, 'Lucas Costa', '1995-03-25');

insert into pessoa2 values
	(1, 'Pedro Silva', '2010-02-28', 1),
	(2, 'Julia Oliveira', '2012-04-13', 2),
	(3, 'Rafael Pereira', '2011-08-23', 3),
	(4, 'Larissa Souza', '2013-06-30', 4),
	(5, 'Gabriel Costa', '2014-01-17', 5);

/*- Configurar chave estrangeira*/
alter table pessoa2 add constraint fkPessoa2Pessoa1
	foreign key (fkPessoa1) references pessoa1(idPessoa1);

/*- Exibir dados;*/
select * from pessoa1;
select * from pessoa2;

/*- Exibir dados com AS;*/
select p1.nome as "Nome da 1:", p2.nome as "Nome da 2:"
	from pessoa2 p2 join pessoa1 p1
    on p2.fkPessoa1 = p1.idPessoa1;

/*- Exibir dados com CASE;*/
select p2.nome as "Nome 2:",
	p1.nome as "Nome 1:",
    case 
		when p2.dtNascimento > '2011-08-23' then 'Menos de 14 anos'
        else 'Maior de 14'
        end as "Idade:"
        from pessoa1 p1 join pessoa2 p2
        on p1.idPessoa1 = p2.fkPessoa1;
        
/*- Exibir dados com IFNULL;*/
select p1.nome as "Nome:",
	ifnull(p1.dtNascimento, 'Data de nascimento pendente') as "Data de nascimento"
    from pessoa1 p1;
    
/*Exercício 5:
Referente a regra de negócio acima, cria a modelagem utilizando um relacionamento 1:1, implemente com o script realizando os seguintes comandos:
- Criar as tabelas;*/
create table candidato (
	idCandidato int primary key,
    nome varchar(45),
    dtNasc date,
    situacao varchar(45),
    fkCarteiraHabilitacao int
);
create table carteiraHabilitacao (
	idCarteiraHabilitacao int,
    categoria varchar(45),
    veiculo varchar(45),
    validade date
);

alter table candidato add constraint chkSituacao
	check (situacao in ('aprovado', 'reprovado'));    
alter table carteiraHabilitacao add constraint chkCategoria
	check (categoria in ('A', 'B', 'AB', 'ACC'));

/*- Inserir 5 registros*/
insert into carteiraHabilitacao (idCarteiraHabilitacao, categoria, veiculo, validade) values
	(1, 'B', 'Carro', '2025-12-31'),
	(2, 'A', 'Moto', '2024-08-15'),
	(3, 'B', 'Carro', '2026-03-20'),
	(4, 'AB', 'Carro e Moto', '2025-06-10'),
	(5, 'ACC', 'Caminhão', '2024-11-01');

insert into candidato (idCandidato, nome, dtNasc, situacao, fkCarteiraHabilitacao) values
	(1, 'João Silva', '1990-01-01', 'aprovado', 1),
	(2, 'Maria Oliveira', '1985-05-10', 'reprovado', 2),
	(3, 'Carlos Pereira', '1992-07-15', 'aprovado', 3),
	(4, 'Ana Souza', '1988-12-20', 'aprovado', 4),
	(5, 'Lucas Costa', '1995-03-25', 'reprovado', 5);

/*- Configurar chave estrangeira*/    
alter table candidato add constraint fkCandidatoHabilitacao
    foreign key (fkCarteiraHabilitacao) references carteiraHabilitacao(idCarteiraHabilitacao);

/*- Exibir dados;*/
select * from candidato;
select * from carteirahabilitacao;

/*- Exibir dados com AS;*/
select idCandidato as "ID do candidato:", nome as "Nome:" from candidato;

/*- Exibir dados com CASE;*/
SELECT nome, 
       CASE 
           WHEN situacao = 'aprovado' THEN 'Aprovado'
           WHEN situacao = 'reprovado' THEN 'Reprovado'
           ELSE 'Em análise'
       END AS "Situação do Candidato"
FROM candidato;

/*- Exibir dados com IFNULL;*/
SELECT nome, 
       IFNULL(situacao, 'Não Informado') AS "Situação"
FROM candidato;

/*Exercício 6:
Regra de negócio: 
1 Farmácia tem no mínimo 1 e no máximo 1 endereço, 1 endereço é de no mínimo 1 farmácia e no máximo 1.
1 Farmácia tem no mínimo 1 farmacêutico e no máximo n, 1 farmacêutico é de no mínimo 1 farmácia e no máximo 1.
- Criar a modelagem lógica na regra acima, com os campos de sua escolha.
- Criar as tabelas; 
- Configurar chave estrangeira;*/
 create table endereco (
	idEndereco int primary key,
    cidade varchar(45)
 );
create table farmacia (
	idFarmacia int primary key,
    rede varchar(45),
    fkEndereco int,
    foreign key (fkEndereco) references endereco(idEndereco)
);
create table farmaceutico (
	idFarmaceutico int primary key,
    nome varchar(45),
    fkFarmacia int,
    foreign key (fkFarmacia) references farmacia(idFarmacia)
);

/*- Inserir 5 registros;*/
insert into endereco (idEndereco, cidade) values
	(1, 'São Paulo'),
	(2, 'Rio de Janeiro'),
	(3, 'Belo Horizonte'),
	(4, 'Curitiba'),
	(5, 'Porto Alegre');
insert into farmacia (idFarmacia, rede, fkEndereco) values
	(1, 'Drogasil', 1),
	(2, 'Raia', 2),
	(3, 'Pague Menos', 3),
	(4, 'Farmácias São João', 4),
	(5, 'Droga Raia', 5);
insert into farmaceutico (idFarmaceutico, nome, fkFarmacia) values
	(1, 'Carlos Silva', 1),
	(2, 'Ana Oliveira', 2),
	(3, 'Juliana Santos', 3),
	(4, 'Rafael Costa', 4),
	(5, 'Fernanda Lima', 5);

/*- Exibir dados;*/
select * from endereco;
select * from farmacia;
select * from farmaceutico;

/*- Exibir dados com AS;*/
select idFarmacia as "ID da farmácia:", rede as "Rede:" from farmacia;

/*- Exibir dados com CASE;*/
SELECT nome,
       CASE 
           WHEN fkFarmacia = 1 THEN 'Farmácia 1'
           ELSE 'Outra Farmácia'
       END AS "Farmácia"
FROM farmaceutico;

/*- Exibir dados com IFNULL;*/
SELECT nome, IFNULL(cidade, 'Cidade não informada') AS "Cidade"
FROM endereco;

