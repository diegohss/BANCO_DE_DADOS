create view vw_emp_notas
as
select top 20 id, descricao
from br_notas
order by id

go

create view vw_proj_notas
as
select top 20 id, descricao
from br_notas
order by id

go

create view vw_cli_notas
as
select top 20 id, descricao
from br_notas
order by id

go