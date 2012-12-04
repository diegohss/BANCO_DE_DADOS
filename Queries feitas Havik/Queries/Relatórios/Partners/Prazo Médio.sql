use havik
go
select distinct cap.nome_usuario resp_captacao,
	   ent.nome_usuario resp_entrega, 
	   proj.id_empresa,
	   emp.nome cliente,
	   proj.tipo_produto,
	   prod.descricao produto,
	   proj.id id_projeto,
	   proj.nome projeto,
	   datediff(day,proj.dt_ini,proj.dt_ent_shortlist) tempo

from bc_projeto proj

left join bc_empresa_unq emp on
	emp.id=proj.id_empresa
	
left join br_tp_produto prod on
	prod.id=proj.tipo_produto	
	
left join bc_usuario cap on
	cap.id=proj.responsavel_captacao	
	
left join bc_usuario ent on
	ent.id=proj.responsavel_entrega

where emp.id not in (5,6) and MONTH(proj.dt_ent_shortlist)=month(GETDATE())
--proj.dt_fim is null
--datediff(month,proj.dt_criacao,getdate())<=4
--and