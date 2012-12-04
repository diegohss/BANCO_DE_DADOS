create view vw_emp_cargo
as
select top 500 id, descricao 
from br_cargo
order by descricao

go

create view vw_proj_cargo
as
select top 500 id, descricao 
from br_cargo
order by descricao

go

create view vw_cli_cargo
as
select top 500 id, descricao 
from br_cargo
order by descricao

go