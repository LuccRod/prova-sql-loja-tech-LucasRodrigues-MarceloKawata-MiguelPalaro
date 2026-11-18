-- 1.1 
create table Categorias (
	Codigo int primary key auto_increment,
    Nome varchar(100) not null unique
);

-- 1.2
alter table Produtos add categoria_id int;
alter table Produtos add foreign key (categoria_id) references Categorias(Codigo);
alter table Produtos add Estoque int not null;

-- 1.3
insert into categorias (nome) values
		('Design e Modelagem'),
        ('Elétrica e Eletrônica'),
        ('Gestão'),
        ('Programação'),
        ('Sistemas Operacionais');

update produtos 
set categoria_id = 1
where Codigo in (1, 6, 7, 8);

update produtos 
set categoria_id = 2
where codigo in (2, 3);

update produtos
set categoria_id = 3
where codigo in (4, 5);

update produtos 
set categoria_id = 4
where codigo in (9, 10);

update produtos 
set categoria_id = 5
where codigo = 11;
-- drop database LojaTech2026;

update produtos
set estoque = 20
where codigo in (1, 3, 4, 5, 7, 8, 9, 10, 11);

update produtos
set estoque = 3
where codigo = 2;

-- 1.4

alter table Clientes add CEP varchar(9);

update Clientes
set cep = 12240760
where codigo = 1;

update Clientes
set cep = 12223670
where codigo = 2;