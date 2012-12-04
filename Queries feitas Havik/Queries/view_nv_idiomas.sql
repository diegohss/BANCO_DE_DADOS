create view vw_proj_nv_idiomas
as
select top 500 id, descricao 
from br_nv_idiomas
order by descricao

go

create view vw_cli_nv_idiomas
as
select top 500 id, descricao 
from br_nv_idiomas
order by descricao

go
