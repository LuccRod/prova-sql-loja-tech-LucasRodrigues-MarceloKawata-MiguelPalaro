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