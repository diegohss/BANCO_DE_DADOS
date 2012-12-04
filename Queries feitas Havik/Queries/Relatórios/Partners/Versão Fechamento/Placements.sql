-- Levantar qtd de Placements
use havik
select cap.nome_usuario resp_captacao,
	   ent.nome_usuario resp_entrega,
	   proj.id_empresa,
	   emp.nome cliente,
	   proj.tipo_produto,
	   prod.descricao produto,
	   proj.id id_projeto,
	   proj.nome projeto
	
from bc_projeto proj

left join bh_proj_status st on
	st.id_projeto=proj.id
	
left join bc_empresa_unq emp on
	emp.id=proj.id_empresa
	
left join br_tp_produto prod on
	prod.id=proj.tipo_produto	
	
left join bc_usuario cap on
	cap.id=proj.responsavel_captacao	
	
left join bc_usuario ent on
	ent.id=proj.responsavel_entrega	
	
where st.id_status=8 and st.id_substatus=6 and 
convert(char(10),st.dt_alteracao,23) between '2012-07-01' and '2012-07-26'
