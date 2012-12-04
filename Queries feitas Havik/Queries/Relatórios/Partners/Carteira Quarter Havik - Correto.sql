use havik
go
select count(distinct proj.id_empresa) qtd_clientes
	   
from bc_projeto proj

left join bc_empresa_unq emp on
	emp.id=proj.id_empresa
	
left join br_tp_produto prod on
	prod.id=proj.tipo_produto	
	
left join bc_usuario cap on
	cap.id=proj.responsavel_captacao	
	
left join bc_usuario ent on
	ent.id=proj.responsavel_entrega

where datediff(month,proj.dt_criacao,getdate())<=4
and emp.id not in (5,6)
--proj.dt_fim is null

--group by cap.nome_usuario