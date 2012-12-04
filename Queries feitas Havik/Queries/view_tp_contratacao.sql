create view vw_emp_tp_contratacao
as
select top 500 id, descricao 
from br_tp_contratacao
order by descricao

go

create view vw_proj_cargo_tp_contratacao
as
select top 500 id, descricao 
from br_tp_contratacao
order by descricao

go

create view vw_cli_cargo_tp_contratacao
as
select top 500 id, descricao 
from br_tp_contratacao
order by descricao

go