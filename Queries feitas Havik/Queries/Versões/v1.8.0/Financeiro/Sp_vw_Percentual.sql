use havik_teste
go 
create procedure sp_vw_proj_acao_perc
(
@id_projeto int = null
)
as

select sum(fin.percentual) percentual

from bh_proj_financeiro fin

where fin.id_projeto=@id_projeto