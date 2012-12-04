USE havik
go
create view vw_proj_colaborador_n
as
select distinct top 300
base.id,
base.nome_usuario

from bc_usuario base

where base.cargo not in ('excluir') 
and 
base.ativo=1 
and 
base.id<>1
order by base.nome_usuario


