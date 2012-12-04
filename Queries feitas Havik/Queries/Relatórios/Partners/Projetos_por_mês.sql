select MONTH(proj.dt_ini) mes,YEAR(proj.dt_ini) ano,
	   cap.nome_usuario resp_captacao,
	   ent.nome_usuario resp_entrega,
	   col.nome_usuario colaborador_resp,
	   COUNT(distinct proj.id) qtd_projetos	
	
from bc_projeto proj

left join bc_usuario col on
	col.id=proj.colaborador_responsavel
	
left join bc_usuario cap on
	cap.id=proj.responsavel_captacao 	
	
left join bc_usuario ent on
	ent.id=proj.responsavel_entrega

where year(proj.dt_ini) in (2011,2012) and col.cargo='r1'

group by 
	   MONTH(proj.dt_ini),YEAR(proj.dt_ini),
	   cap.nome_usuario,
	   ent.nome_usuario,
	   col.nome_usuario