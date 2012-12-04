select base.usuario_alteracao,
	   us.nome_usuario,
	   status.id_projeto,
	   proj.nome,
	   COUNT(status.id_projeto) qtd_tot	

from bc_cli_researcher base

left join bh_cli_profissional prof on
	prof.id_cliente=base.id_cliente and
	prof.usuario_alteracao=base.usuario_alteracao
	
left join bh_cli_researcher_obs res on
	res.id_cliente=base.id_cliente and
	res.usuario_alteracao=base.usuario_alteracao	
	
left join bh_cli_status status on
	status.id_cliente=base.id_cliente and
	status.usuario_criacao=base.usuario_alteracao	
	
left join bc_usuario us on
	us.id=base.usuario_alteracao
	
left join bc_projeto proj on
	proj.id=status.id_projeto			
	
where 
-- Período de medição
CONVERT(CHAR(10),base.dt_alteracao, 23) between '2012-01-04' and '2012-02-20'
-- Verifica se a Analise (obs) da Entrevista 
and
res.obs is not null
-- Verificação do Profissional [Empresa + Experiência + Escolaridade]
and (
(prof.empresa_antiga is not null or prof.id_empresa is not null) and 
(prof.dt_inicio is not null and prof.dt_inicio<>'1900-01-01 00:00:00.000') and
prof.salario is not null
)
--Verificação Status [Dt Pré Entrevista = Dt Status + Pegar]
and
CONVERT(char(10),status.dt_alteracao,23)=CONVERT(char(10),base.dt_alteracao,23)

group by base.usuario_alteracao,
	   us.nome_usuario,
	   status.id_projeto,
	   proj.nome
	   


	
	
	