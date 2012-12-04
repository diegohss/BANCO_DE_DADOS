create view vw_cli_ano_formacao
as
select top 500 id, descricao 
from br_cli_ano_formacao
order by descricao

go

create view vw_proj_ano_formacao
as
select top 500 id, descricao 
from br_cli_ano_formacao
order by descricao

go

create view vw_emp_ano_formacao
as
select top 500 id, descricao 
from br_cli_ano_formacao
order by descricao

go