-- =====================================================================
-- SCRIPT BASE - Avaliação Prática de SQL (MySQL 8 / Workbench)
-- Execute este script UMA vez, inteiro, antes de começar a prova.
-- Faça commit deste arquivo no repositório sem alterá-lo.
-- =====================================================================

DROP DATABASE IF EXISTS LojaTech2026;
CREATE DATABASE LojaTech2026 CHARACTER SET utf8mb4;
USE LojaTech2026;

CREATE TABLE Clientes (
    Codigo         INT AUTO_INCREMENT PRIMARY KEY,
    Nome           VARCHAR(100) NOT NULL,
    Cidade         VARCHAR(60),
    UF             CHAR(2),
    Email          VARCHAR(100),
    DataNascimento DATE
);

CREATE TABLE Produtos (
    Codigo     INT AUTO_INCREMENT PRIMARY KEY,
    Descricao  VARCHAR(150) NOT NULL,
    ValorVenda DECIMAL(9,2) NOT NULL,
    Ativo      TINYINT(1) NOT NULL DEFAULT 1
);

CREATE TABLE Vendas (
    Codigo     INT AUTO_INCREMENT PRIMARY KEY,
    Cliente    INT NOT NULL,
    Produto    INT NOT NULL,
    DataVenda  DATE,
    Quantidade INT,
    ValorVenda DECIMAL(18,2),   -- valor UNITÁRIO efetivamente praticado
    CONSTRAINT fkVendasClientes FOREIGN KEY (Cliente) REFERENCES Clientes (Codigo),
    CONSTRAINT fkVendasProdutos FOREIGN KEY (Produto) REFERENCES Produtos (Codigo)
);

-- 1.1 
create table Categorias (
	Codigo int primary key auto_increment,
    Nome varchar(100) not null unique
);

-- 1.2
alter table Produtos add categoria_id int;
alter table Produtos add foreign key (categoria_id) references Categorias(Codigo);
alter table Produtos add Estoque int not null;



INSERT INTO Clientes (Nome, Cidade, UF, Email, DataNascimento) VALUES
('João da Silva',       'São José dos Campos', 'SP', 'joao@uol.com',          '1987-10-22'),
('Ivete Sangalo',       'Salvador',            'BA', 'ivete@hotmail.com',     '1980-10-22'),
('Mario Alberto',       'São José dos Campos', 'SP', 'mario@gmail.com',       '1981-11-13'),
('Paulo Cunha',         'São José dos Campos', 'SP', 'paulo@hotmail.com',     '1980-01-01'),
('Maria das Dores',     'Taubaté',             'SP', 'maria@gmail.com',       '1977-01-02'),
('Paula Dutra',         'Caçapava',            'SP', 'paula@uol.com',         '1986-08-07'),
('Cristina dos Santos', 'Belo Horizonte',      'MG', 'cristina@uai.com.br',   '1988-08-22'),
('Júlia Monteiro',      'Jacareí',             'SP', 'julia@gmail.com',       '1985-03-13'),
('André Marques',       'Rio de Janeiro',      'RJ', 'andre@g1.com',          '1979-11-15'),
('Camila Capello',      'São Paulo',           'SP', 'CAPELLO@hotmail.com',   '1990-07-22'),
('Saulo Medeiros',      'Manaus',              'AM', NULL,                    '1995-03-12'),
('Karina Bach',         'Rio de Janeiro',      'RJ', 'karina@gmail.com',      '2000-07-24');

INSERT INTO Produtos (Descricao, ValorVenda, Ativo) VALUES
('3DS MAX 2020 - MODELAGEM, RENDER, EFEITOS',                 161.95, 1),
('MICROCONTROLADOR ARDUINO',                                  181.50, 1),
('ACIONAMENTOS ELÉTRICOS',                                     94.00, 1),
('ADMINISTRAÇÃO DE DEPARTAMENTO PESSOAL',                      85.00, 1),
('ADMINISTRAÇÃO DE SISTEMAS DE INFORMAÇÃO',                   107.00, 1),
('ADOBE FLASH PROFESSIONAL CS5 CRIANDO E ANIMANDO',            83.00, 0),
('ADOBE ILLUSTRATOR CS6 - DESCOBRINDO E CONQUISTANDO',        131.00, 1),
('ADOBE PHOTOSHOP CS5 - IMAGENS PROFISSIONAIS',                96.50, 1),
('PROGRAMAÇÃO EM PYTHON PARA INICIANTES',                     120.00, 1),
('PHP COM HTML5 E CSS3',                                      152.00, 1),
('VIRTUALIZAÇÃO DO SISTEMA OPERACIONAL LINUX',                 97.50, 1);

INSERT INTO Vendas (Cliente, Produto, DataVenda, Quantidade, ValorVenda) VALUES
(1,  2,  '2024-04-22', 2, 170.00),
(1,  9,  '2025-03-12', 1, 120.00),
(2,  6,  '2023-12-21', 1,  75.00),
(2,  5,  '2024-11-10', 2, 100.00),
(2,  2,  '2025-02-14', 1, 181.50),
(3,  7,  '2025-06-10', 1, 120.00),
(3,  10, '2025-06-10', 3, 140.00),
(4,  4,  '2024-12-21', 1,  85.00),
(4,  5,  '2025-07-01', 1, 107.00),
(5,  3,  '2025-08-15', 1,  94.00),
(5,  9,  '2025-09-02', 7, 110.00),
(6,  1,  '2026-01-23', 1, 150.00),
(6,  8,  '2026-02-05', 2,  90.00),
(7,  10, '2026-03-18', 1, 152.00),
(8,  9,  '2026-04-02', 2, 120.00),
(9,  2,  '2026-05-20', 1, 160.00),
(9,  7,  '2026-05-20', 1, 131.00),
(10, 1,  '2026-06-11', 1, 161.95),
(10, 9,  '2026-07-09', 1,  99.00),
(10, 10, '2026-08-30', 2, 152.00),
(1,  10, '2026-09-14', 1, 145.00),
(3,  2,  '2026-10-05', 1, 181.50);

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



select * from produtos;
select * from clientes;
select * from categorias;

-- PARTE 2

-- 2.1 ///////q

select codigo, nome, cidade, datanascimento
from clientes
where uf = 'SP' and datanascimento between '1980-01-01' and '1988-12-31' and nome like 'M%' || 'P%';

-- 2.2 - verificar se tem cep/email ou nao
select nome, email as 'Sem email', cep as 'Sem Cep'
from clientes
where email is null and cep is null;

-- 2.3
select a.nome, b.descricao, c.datavenda, c.quantidade, c.valorvenda, c.quantidade*c.valorvenda as 'ValorTotal'
from vendas c 
inner join clientes a on c.cliente = a.codigo
inner join produtos b on c.produto = b.codigo;

-- 2.4
select c.codigo, c.nome, v.quantidade as "quantidadeCompras"
from clientes c
left join vendas v on v.cliente = c.codigo;

-- 2.5 ////q
select p.descricao
from produtos p
right join vendas v on v.produto = p.codigo
where v.produto is null;

-- 3.1
select c.nome, count(v.codigo) as numerocompras, count(v.quantidade) as quantidadeitens, v.quantidade*p.valorvenda as 'faturamento'
from clientes c
inner join vendas v on c.codigo = v.cliente
inner join produtos p on v.produto = p.codigo
order by v.quantidade*p.valorvenda;

-- 3.2
select a.nome, min(b.valorvenda), max(b.valorvenda)
from vendas b
inner join clientes a on b.cliente = a.codigo
group by a.nome;

-- 3.3
select c.nome, sum(b.valorvenda)
from vendas b
inner join categorias c on 
group by c.categorias;

