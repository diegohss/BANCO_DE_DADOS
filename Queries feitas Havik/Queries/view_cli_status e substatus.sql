create view vw_cli_status
as
select top 500 id, descricao 
from br_cli_status
order by descricao

go

create view vw_cli_substatus
as
select top 500 id, descricao 
from br_cli_substatus
order by descricao

go
