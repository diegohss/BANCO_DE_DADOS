use havik
go

CREATE view vw_proj_responsavel_n
as
select distinct top 400
base.id,
base.nome_usuario
from bc_usuario base
where base.cargo in ('partner','consultor','r2','outro','coordenador')
and
base.ativo=1
and
base.id<>1
and
base.cargo not in ('excluir') 
order by base.nome_usuario



GO


