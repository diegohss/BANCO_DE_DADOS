create view vw_emp_funcionarios
as
select top 500 id, descricao 
from br_funcionarios
order by descricao

go

create view vw_proj_funcionarios
as
select top 500 id, descricao 
from br_funcionarios
order by descricao

go

create view vw_cli_funcionarios
as
select top 500 id, descricao 
from br_funcionarios
order by descricao

go