-- Analítico de Velocidade
select 	
	proj.id,
	proj.nome projeto,
	proj.dt_prev_shortlist,
	proj.dt_ini_busca,
	proj.dt_ent_shortlist,
	datediff(day,proj.dt_ini_busca,proj.dt_prev_shortlist) dias_prometidos,
	DATEDIFF(day,proj.dt_ini_busca,proj.dt_ent_shortlist) dias_executados,
	datediff(day,proj.dt_ini_busca,proj.dt_prev_shortlist)/
	DATEDIFF(day,proj.dt_ini_busca,proj.dt_ent_shortlist) velocidade,	
	us.nome_usuario researcher_responsavel,
	resp.nome_usuario responsavel_entrega,
	
	case when cand.diferenca <= 0
		then cand.cliente 
		end candidato_dentro_prazo,
	case when cand.diferenca > 0
		then cand.cliente 
		end candidato_fora_prazo		
from bc_projeto proj

left join bh_cli_status base on
	base.id_projeto=proj.id
	
left join bc_usuario us on
	us.id=proj.colaborador_responsavel	
	
left join bc_usuario resp on
	resp.id=proj.responsavel_entrega	
	
left join(
select base.id_projeto,
	   base.id_cliente,
	   DATEDIFF(day,proj.dt_prev_shortlist,base.dt_alteracao) diferenca,
	   proj.dt_prev_shortlist,
	   base.dt_alteracao,
	   cli.nome cliente
from bh_cli_status base
left join bc_projeto proj on
	proj.id=base.id_projeto
left join bc_cliente cli on
	cli.id=base.id_cliente	
where proj.dt_ent_shortlist is not null
and (base.id_status=3 and base.id_substatus=18)
)cand on
	cand.id_projeto=base.id_projeto and
	cand.id_cliente=base.id_cliente	

where CONVERT(CHAR(10),proj.dt_prev_shortlist, 23) between '2012-01-01' and '2012-01-31'
--and CONVERT(CHAR(10),proj.dt_prev_shortlist, 23)>=CONVERT(CHAR(10),base.dt_alteracao, 23)
--and base.usuario_criacao=proj.colaborador_responsavel


group by
	proj.id,
	proj.nome,
	proj.dt_prev_shortlist,
	proj.dt_ini_busca,
	proj.dt_ent_shortlist,
	datediff(day,proj.dt_ini_busca,proj.dt_prev_shortlist),
	DATEDIFF(day,proj.dt_ini_busca,proj.dt_ent_shortlist),
	datediff(day,proj.dt_ini_busca,proj.dt_prev_shortlist)/
	DATEDIFF(day,proj.dt_ini_busca,proj.dt_ent_shortlist),	
	us.nome_usuario,
	resp.nome_usuario,
	case when cand.diferenca <= 0
		then cand.cliente 
		end,
	case when cand.diferenca > 0
		then cand.cliente 
		end

/*having 	datediff(day,proj.dt_prev_shortlist,proj.dt_ini_busca)/
	DATEDIFF(day,proj.dt_ent_shortlist,proj.dt_ini_busca) is not null*/