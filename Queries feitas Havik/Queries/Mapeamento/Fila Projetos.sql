-- Query para extrair a fila dos Projetos:


select proj.id,
	   proj.nome,
	   dt_ini=dbo.fn_dateformat(proj.dt_ini,2),
	   dt_fim=dbo.fn_dateformat(proj.dt_fim,2),
	   proj.dt_ini_busca,
	   proj.dt_prev_shortlist,
	   proj.dt_ent_shortlist,
	   proj.grau_dificuldade,
	   proj.qtd_cand_shortlist,
	   resp.nome_usuario responsavel_entrega,
	   col.nome_usuario colaborador_responsavel
	   
from bc_projeto proj

left join bc_usuario resp on
	resp.id=proj.responsavel_entrega
	
left join bc_usuario col on
	col.id=proj.colaborador_responsavel	
 



