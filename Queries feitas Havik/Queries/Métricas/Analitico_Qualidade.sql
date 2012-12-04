-- Analítico de Qualidade
select 	
	proj.id,
	proj.nome projeto,
	datediff(day,proj.dt_prev_shortlist,proj.dt_ini_busca) dias_prometidos,
	DATEDIFF(day,proj.dt_ent_shortlist,proj.dt_ini_busca) dias_executados,
	datediff(day,proj.dt_prev_shortlist,proj.dt_ini_busca)/
	DATEDIFF(day,proj.dt_ent_shortlist,proj.dt_ini_busca) velocidade,	
	us.nome_usuario colaborador_responsavel,
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

where CONVERT(CHAR(10),proj.dt_prev_shortlist, 23) between '2012-01-01' and '2012-03-01'
--and CONVERT(CHAR(10),proj.dt_prev_shortlist, 23)>=CONVERT(CHAR(10),base.dt_alteracao, 23)
--and base.usuario_criacao=proj.colaborador_responsavel


group by
	proj.id,
	proj.nome,
	datediff(day,proj.dt_prev_shortlist,proj.dt_ini_busca),
	DATEDIFF(day,proj.dt_ent_shortlist,proj.dt_ini_busca),
	datediff(day,proj.dt_prev_shortlist,proj.dt_ini_busca)/
	DATEDIFF(day,proj.dt_ent_shortlist,proj.dt_ini_busca),	
	us.nome_usuario,
	case when cand.diferenca <= 0
		then cand.cliente 
		end,
	case when cand.diferenca > 0
		then cand.cliente 
		end


-- 1º Opção = Entrevista Havik - Aprovado Shortlist = 3-18
-- 2º Opção = Shortlist - Aprovado = 4-23