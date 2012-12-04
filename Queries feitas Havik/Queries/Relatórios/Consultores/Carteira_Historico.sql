use havik
go
select distinct cap.nome_usuario resp_captacao,
	   ent.nome_usuario resp_entrega, 
	   proj.id_empresa,
	   emp.nome cliente,
	   proj.tipo_produto,
	   prod.descricao produto,
	   proj.id id_projeto,
	   proj.nome projeto


from bc_projeto proj

left join bc_empresa_unq emp on
	emp.id=proj.id_empresa
	
left join br_tp_produto prod on
	prod.id=proj.tipo_produto	
	
left join bc_usuario cap on
	cap.id=proj.responsavel_captacao	
	
left join bc_usuario ent on
	ent.id=proj.responsavel_entrega

where emp.id not in (5,6)
--proj.dt_fim is null

