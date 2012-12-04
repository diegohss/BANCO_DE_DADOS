INSERT INTO [bi_kivah].[dbo].[dim_financeiro]
(
           [cod_financeiro]
           ,[acao]
           ,[nome_projeto]
           ,[empresa]
           ,[resp_captacao]
           ,[resp_entrega]
           ,[resp_colaborador]
           ,[equipe_entrega]
           ,[impostos]
           ,[fee]
           ,[produto]
)
select base.id cod_financeiro,
	   base.acao,
	   proj.nome nome_projeto,
	   emp.nome empresa,
	   cap.nome_usuario resp_captacao,
	   ent.nome_usuario resp_entrega,
	   col.nome_usuario resp_colaborador,
	   eq.nome_usuario equipe,	  
	   base.id_impostos,
	   base.fee,
	   proj.tipo_produto produto

from havik.dbo.bh_proj_financeiro base

left join havik.dbo.bc_projeto proj on
	proj.id=base.id_projeto
	
left join havik.dbo.bc_empresa_unq emp on
	emp.id=proj.id_empresa	
	
left join havik.dbo.bc_usuario cap on
	cap.id=proj.responsavel_captacao	
	
left join havik.dbo.bc_usuario ent on
	ent.id=proj.responsavel_entrega
	
left join havik.dbo.bc_usuario col on
	col.id=proj.colaborador_responsavel
	
left join havik.dbo.bc_usuario eq on
	eq.id=proj.equipe
	
left join bi_kivah.dbo.dim_financeiro rep on
	rep.cod_financeiro=base.id
	
where rep.cod_financeiro is null			