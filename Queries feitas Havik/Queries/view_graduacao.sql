create view vw_proj_graduacao
as
select top 500 id, descricao 
from br_graduacao
order by descricao

go

