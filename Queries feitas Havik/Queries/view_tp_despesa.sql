create view vw_emp_tp_despesas
as
select top 500 id, descricao 
from br_tp_despesas
order by descricao

go

create view vw_proj_cargo_tp_despesas
as
select top 500 id, descricao 
from br_tp_despesas
order by descricao

go

create view vw_cli_cargo_tp_despesas
as
select top 500 id, descricao 
from br_tp_despesas
order by descricao

go