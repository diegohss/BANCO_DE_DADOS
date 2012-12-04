select proj.id,
	   proj.qtd_cand_shortlist,
	   convert(CHAR(10),proj.dt_prev_shortlist, 23) shortlist,
	   proj.colaborador_responsavel,
	   us.nome_usuario
from bc_projeto proj
left join bc_usuario us on
	us.id=proj.colaborador_responsavel
where proj.dt_prev_shortlist between '2012-01-15' and '2012-02-20'