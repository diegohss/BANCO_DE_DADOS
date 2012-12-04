create view vw_busca_tp_contratacao
as
select top 500 id, descricao 
from br_tp_contratacao
order by descricao

go

