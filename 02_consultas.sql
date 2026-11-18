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