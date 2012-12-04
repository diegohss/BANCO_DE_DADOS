create view vw_emp_status
as
select top 500 id, descricao 
from br_emp_status
order by descricao

go

create view vw_proj_status
as
select top 500 id, descricao 
from br_proj_status
order by descricao

go