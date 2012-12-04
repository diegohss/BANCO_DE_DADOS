INSERT INTO [bi_kivah].[dbo].[dim_usuario]
(
           [cod_usuario]
           ,[nome_usuario]
           ,[equipe]
           ,[cargo]
           ,[und_negocio]
           ,[ativo]
)
select
base.id cod_usuario,
isnull(base.nome_usuario,''),
equipe.nome_usuario equipe,
isnull(base.cargo,''),
'',
base.ativo

from havik.dbo.bc_usuario base

left join havik.dbo.br_equipe eq on
	eq.id_colaborador=base.id
	
left join havik.dbo.bc_usuario equipe on
	equipe.id=eq.id_lider
   

