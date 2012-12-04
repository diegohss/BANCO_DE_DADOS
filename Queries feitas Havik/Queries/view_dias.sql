create view vw_emp_dias
as
select top 500 id, descricao 
from br_dias
order by descricao

go	

create view vw_cli_dias
as
select top 500 id, descricao 
from br_dias
order by descricao

go

create view vw_proj_dias
as
select top 500 id, descricao 
from br_dias
order by descricao
