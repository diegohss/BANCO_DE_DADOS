create view vw_emp_impostos
as
select top 500 id, descricao,aliquota
from br_impostos
order by descricao

go

create view vw_proj_impostos
as
select top 500 id, descricao,aliquota 
from br_impostos
order by descricao

go

create view vw_cli_impostos
as
select top 500 id, descricao,aliquota 
from br_impostos
order by descricao

go