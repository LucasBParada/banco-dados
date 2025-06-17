create database competicao_triathlon;
use competicao_triathlon;
 
create table Atletas(
id_atleta int auto_increment primary key,
nome varchar(100) not null,
data_nascimento date not null,
pais varchar(100) not null
);
 
create table Competicoes(
id_competicoes int auto_increment primary key,
nome varchar(100) not null,
data_competicao date not null,
local_competicao varchar(100) not null
);
 
create table Resultados(
id int auto_increment primary key,
tempo time not null,
posicao int not null,
id_atleta int,
id_competicao int,
foreign key (id_atleta) references Atletas (id_atleta),
foreign key (id_competicao) references Competicoes (id_competicoes)
);
 
insert into Atletas (nome, data_nascimento, pais) values
('João Silva', '1990-05-15', 'Brasil'),
('Maria Oliveira', '1988-08-22', 'Portugal'),
('Carlos Souza', '1992-03-10', 'Brasil'),
('Pedro Santos', '1985-12-05', 'Argentina');
 
insert into Competicoes (nome, data_competicao, local_competicao) values
('Triathlon Rio 2025', '2025-01-15', 'Rio de Janeiro'),
('Triathlon Lisboa 2025', '2025-02-20', 'Lisboa'),
('Triathlon Madri', '2025-03-25', 'Madri');
 
insert into resultados (id_atleta, id_competicao, tempo, posicao) values
(1, 1, '02:15:30', 1),
(2, 1, '02:20:45', 2),
(3, 1, '02:25:50', 3),
(4, 2, '02:30:00', 1),
(1, 2, '02:35:15', 2),
(2, 3, '02:40:20', 1),
(3, 3, '02:45:25', 2),
(4, 3, '02:50:30', 3);
 
 
select nome, pais from Atletas;

select * from Atletas where pais = "Brasil";

select A.nome, C.nome, R.tempo, R.posicao from Resultados R
join Atletas A on R.id_atleta = A.id_atleta join Competicoes C on R.id_competicao = C.id_competicoes
where C.nome = 'Triathlon Rio 2025'
order by R.posicao;

select avg(Resultados.tempo) as media from Resultados
join Competicoes C ON Resultados.id_competicao = C.id_competicoes
where C.nome = 'Triathlon Lisboa 2025';

select A.nome, count(R.id_competicao) AS contagem_competicoes from Atletas A
join Resultados R on A.id_atleta = R.id_atleta
group by A.id_atleta;

select A.nome, count(R.id_competicao) as competicoes_participadas from Atletas A
join Resultados R on A.id_atleta = R.id_atleta
group by A.id_atleta
having count(R.id_competicao) > 1;


