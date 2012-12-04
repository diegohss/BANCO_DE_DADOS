create view vw_proj_tp_produto
as
select top 500 id, descricao 
from br_tp_produto
order by descricao

go

create view vw_emp_tp_produto
as
select top 500 id, descricao 
from br_tp_produto
order by descricao

go
