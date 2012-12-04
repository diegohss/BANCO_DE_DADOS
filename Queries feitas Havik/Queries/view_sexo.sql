create view vw_emp_sexo
as
select top 500 id, descricao 
from br_sexo
order by descricao

go

create view vw_proj_sexo
as
select top 500 id, descricao 
from br_sexo
order by descricao

go

create view vw_cli_sexo
as
select top 500 id, descricao 
from br_sexo
order by descricao

go