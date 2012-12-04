create view vw_proj_escolaridade
as
select top 500 id, descricao 
from br_escolaridade
order by descricao

go

