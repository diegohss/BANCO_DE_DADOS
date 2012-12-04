-- Cálculo da Velocidade 
-- Velocidade se dá pelo cálculo dos Dias prometidos / Dias Executados
-- Serão levados em consideração os campos novos de Projeto
-- Prometidos = Dt Prevista Shortlist - Dt Inicio Busca
-- Executados = Dt Entrega Shortlist - Dt Inicio Busca
-- Relatório Gerencial

select 	
	us.nome_usuario usuario,
	proj.id id_projeto,
	proj.nome projeto,
	datediff(day,proj.dt_prev_shortlist,proj.dt_ini_busca)/
	DATEDIFF(day,proj.dt_ent_shortlist,proj.dt_ini_busca) velocidade
	

from bc_projeto proj

left join bh_cli_status base on
	base.id_projeto=proj.id
	
left join bc_usuario us on
	us.id=proj.colaborador_responsavel	

where CONVERT(CHAR(10),proj.dt_prev_shortlist, 23) between '2012-01-01' and '2012-01-31'
--and CONVERT(CHAR(10),proj.dt_prev_shortlist, 23)>=CONVERT(CHAR(10),base.dt_alteracao, 23)
--and base.usuario_criacao=proj.colaborador_responsavel

group by 	
	us.nome_usuario,
	proj.id,
	proj.nome,
	datediff(day,proj.dt_prev_shortlist,proj.dt_ini_busca),
	DATEDIFF(day,proj.dt_ent_shortlist,proj.dt_ini_busca) 
	
having 	datediff(day,proj.dt_prev_shortlist,proj.dt_ini_busca)/
	DATEDIFF(day,proj.dt_ent_shortlist,proj.dt_ini_busca) is not null