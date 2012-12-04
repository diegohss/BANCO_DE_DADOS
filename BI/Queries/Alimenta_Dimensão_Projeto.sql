INSERT INTO bi_kivah.dbo.dim_projeto
(
           cod_projeto
           ,nome_projeto
           ,empresa
           ,cidade
           ,estado
           ,resp_captacao
           ,resp_entrega
           ,resp_colaborador
           ,equipe_entrega
           ,dificuldade
           ,area
           ,subdivisao
           ,segmento
           ,tipo_carteira
)

select base.id cod_projeto,
	   base.nome nome_projeto,
	   emp.nome empresa,
	   cid.MUNNOME cidade,
	   uf.UFNOME estado,
	   cap.nome_usuario resp_captacao,
	   ent.nome_usuario resp_entrega,
	   col.nome_usuario resp_colaborador,
	   eq.nome_usuario equipe_entrega,
	   dif.descricao dificuldade,
	   area.descricao area,
	   sub.descricao subdivisao,
	   seg.descricao segmento,
	   '' tipo_carteira	  
	   

from havik.dbo.bc_projeto base

left join havik.dbo.br_proj_grau_dificuldade dif on
	dif.id=base.grau_dificuldade

left join havik.dbo.bc_empresa_unq emp on
	emp.id=base.id_empresa
	
left join havik.dbo.br_area area on
	area.id=base.area
		
left join havik.dbo.br_subdivisao sub on
	sub.id=base.subdivisao

left join havik.dbo.br_subdivisao seg on
	seg.id=base.segmento
		
left join havik.dbo.br_cidades cid on
	cid.MUNCOD=base.id_cidade

left join havik.dbo.br_estados uf on
	uf.UFCOD=base.id_estado	

left join havik.dbo.bc_usuario cap on
	cap.id=base.responsavel_captacao	
	
left join havik.dbo.bc_usuario ent on
	ent.id=base.responsavel_entrega
	
left join havik.dbo.bc_usuario col on
	col.id=base.colaborador_responsavel
	
left join havik.dbo.bc_usuario eq on
	eq.id=base.equipe
	
left join bi_kivah.dbo.dim_projeto rep on
	rep.cod_projeto=base.id
	
where rep.cod_projeto is null		