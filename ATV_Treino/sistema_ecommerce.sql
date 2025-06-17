create table Clientes(
ID_Cliente serial primary key,
Nome varchar(100) not null,
Email varchar(100) not null,
DataCadastro date not null
);

create table Produtos(
ID_Produto serial primary key,
Nome varchar(100) not null,
Preco decimal (10,2) not null,
	constraint checar_preco_negativo check (Preco >=0),
Categoria varchar(100)	
);

create table Pedidos(
ID_Pedido serial primary key,
DataPedido date not null,
ID_Cliente int,
constraint fk_clienteid foreign key (ID_Cliente)
	references Clientes(ID_Cliente) on delete cascade   
);

create table ItensPedidos(
Quantidade int constraint checar_quantidade check (Quantidade > 0),
PrecoUnitario decimal (10,2) not null constraint checar_precounitario_negatio check (PrecoUnitario >= 0),
ID_Pedido int,
ID_Produto int,
constraint fk_pedidoid foreign key (ID_Pedido)
	references Pedidos(ID_Pedido) on delete cascade,
constraint fk_produtoid foreign key (ID_Produto)
	references Produtos(ID_Produto) on delete cascade
);

insert into Clientes(Nome, Email, DataCadastro) values
('João Silva', 'joao.silva@email.com', '2024-01-15' ),
('Maria Oliveira', 'maria.oliveira@email.com', '2024-02-20' ),
('Carlos Souza', 'carlos.souza@email.com', '2024-03-25' ),
('Ana Costa', 'ana.costa@email.com', '2024-04-10' ),
('Pedro Santos', 'pedro.santos@email.com', '2024-05-05' );

insert into Produtos(Nome, Preco, Categoria) values
('Notebook', 3.500, 'Eletronico'),
('Smartphone', 2.000, 'Eletronico'),
('Geladeira', 2.500, 'Eletrodomestico'),
('Fogão', 1.500, 'Eletrodomestico'),
('Micro-ondas', 800, 'Eletrodomestico');

insert into Pedidos(ID_Cliente, DataPedido) values
(1, '2024-06-15'),
(2, '2024-07-20'),
(3, '2024-08-25'),
(4, '2024-09-10'),
(5, '2024-10-05');

insert into ItensPedidos(ID_Pedido, ID_Produto, Quantidade, PrecoUnitario) values
(1, 1, 1, 3.500),
(1, 2, 2, 2.000),
(2, 3, 1, 2.500),
(3, 4, 1, 1.500),
(3, 5, 1, 800),
(4, 1, 1, 3.500),
(5, 2, 1, 2.000),
(5, 3, 1, 2.500);

select Nome, Email from Clientes;

select Nome from Produtos where Categoria = 'Eletronico';

select * from Pedidos order by (DataPedido) desc;

select sum(Quantidade) from ItensPedidos where ID_Pedido = 1;

select p.ID_Cliente, count(i.ID_Pedido) as numero_pedidos from Pedidos p
join ItensPedidos i on p.ID_Pedido = i.ID_Pedido
group by p.ID_Cliente;

select p.ID_Cliente, count(p.ID_Pedido) as numero_pedidos from Pedidos p
join ItensPedidos i on p.ID_Pedido = i.ID_Pedido
group by p.ID_Cliente
having count(p.ID_Pedido) > 1;































