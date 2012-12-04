select 
distinct
status.id_projeto,
proj.nome,
cli.nome nome_cliente,
grau.descricao nivel_dificuldade,
grau.fator,
us.nome_usuario colaborador,
resp.nome_usuario responsavel_entrega,
dt_pre_entrevista=dbo.fn_dateformat(base.dt_alteracao,2),
convert(char(5),base.dt_alteracao,108) hora_pre_entrevista,
pre.qtd_comunicacao,
pre.media_potencial,
pre.media_comunicacao,
pre.media_potencial,
isnull(prof.empresa,prof.empresa_antiga) empresa,
dt_inicio=dbo.fn_dateformat(prof.dt_inicio,2),
dt_saida=dbo.fn_dateformat(prof.dt_saida,2),
prof.salario,
prof.dt_alteracao ultima_alteracao_empresa,
acad.graduacao,
acad.escolaridade,	
status.status,
status.substatus,
dt_alteracao=dbo.fn_dateformat(status.dt_alteracao,2)


from bc_cli_researcher base

-- Profissional
left join(
select ult.id,
	   ult.id_cliente,
	   ult.id_empresa,
	   emp.nome empresa,
	   ult.empresa_antiga,
	   ult.dt_inicio,
	   ult.dt_saida,
	   ult.id_cargo,
	   cargo.descricao cargo,
	   convert(decimal(10),ult.salario) salario,  
	   ult.id_segmento,
	   seg.descricao segmento,
	   ult.id_area,
	   area.descricao area,
	   ult.id_subdivisao,
	   sub.descricao subdivisao,
	   ult.usuario_alteracao,
	   ult.tipo_contato,
	   ult.dt_alteracao
from (
SELECT a.id
FROM bh_cli_profissional a
WHERE a.ID IN
(SELECT TOP 1 b.id FROM bh_cli_profissional b WHERE b.id_cliente = a.id_cliente ORDER BY b.dt_inicio DESC)
)ult_prof

left join bh_cli_profissional ult on
	ult.id=ult_prof.id
	
left join br_area area on
	area.id=ult.id_area	
	
left join br_cargo cargo on
	cargo.id=ult.id_cargo
	
left join br_subdivisao sub on
	sub.id=ult.id_subdivisao
	
left join br_segmento seg on
	seg.id=ult.id_segmento

left join bc_empresa_unq emp on
	emp.id=ult.id_empresa		
)prof on
	prof.id_cliente=base.id_cliente and
	prof.usuario_alteracao=base.usuario_alteracao
	
left join (
select ult.id_cliente,
	   ult.id_graduacao,
	   grad.descricao graduacao,
	   ult.id_escolaridade,
	   esc.descricao escolaridade
from (
select ult_acad.id_cliente,max(ult_acad.id) id
from bh_cli_academico ult_acad
group by ult_acad.id_cliente
)ult_acad
left join bh_cli_academico ult on	
	ult.id=ult_acad.id and
	ult.id_cliente=ult_acad.id_cliente	
left join br_graduacao grad on
	grad.id=ult.id_graduacao
left join br_escolaridade esc on
	esc.id=ult.id_escolaridade			
)acad on 
	acad.id_cliente=base.id_cliente
	
left join bh_cli_researcher_obs res on
	res.id_cliente=base.id_cliente and
	res.usuario_alteracao=base.usuario_alteracao	
	
-- Pre-Entrevista
left join(
select distinct
base.usuario_alteracao,
base.id_cliente,
sum(case when base.c_senso>0 then 1 else 0 end)+
sum(case when base.c_eloquencia>0 then 1 else 0 end)+
sum(case when base.c_objetivo>0 then 1 else 0 end)+	     
sum(case when base.c_energia>0 then 1 else 0 end)+
sum(case when base.c_ouvinte>0 then 1 else 0 end)+
sum(case when base.c_mkt>0 then 1 else 0 end)+
sum(case when base.c_credibilidade>0 then 1 else 0 end)+
sum(case when base.c_estruturado>0 then 1  else 0 end) qtd_comunicacao,
sum(case when base.p_inteligencia>0 then 1 else 0 end)+
sum(case when base.p_maturidade>0  then 1 else 0 end)+
sum(case when base.p_visao>0  then 1 else 0 end)+
sum(case when base.p_confianca>0  then 1 else 0 end)+
sum(case when base.p_honestidade>0  then 1 else 0 end)+
sum(case when base.p_punch>0  then 1 else 0 end)+
sum(case when base.p_carisma>0  then 1 else 0 end) qtd_potencial,

cast(cast(sum(isnull(base.c_senso,0) + isnull(base.c_eloquencia,0) + isnull(base.c_objetivo,0) +
isnull(base.c_energia,0) + isnull(base.c_ouvinte,0) + isnull(base.c_mkt,0) + 
isnull(base.c_credibilidade,0) + isnull(base.c_estruturado,0)) as decimal(10,2))
/ cast(8*COUNT(base.id_cliente) as decimal(10,2)) as decimal(10,2)) media_comunicacao,

cast(cast(sum(isnull(base.p_inteligencia,0) + isnull(base.p_maturidade,0) + isnull(base.p_visao,0) + 
isnull(base.p_confianca,0) + isnull(base.p_honestidade,0) + isnull(base.p_punch,0) + isnull(base.p_carisma,0)) as decimal(10,2)) 
/ cast(7*COUNT(base.id_cliente) as decimal(10,2)) as decimal(10,2)) media_potencial

from bc_cli_researcher base

group by 
base.usuario_alteracao,
base.id_cliente
)pre on	
	pre.id_cliente=base.id_cliente and
	pre.usuario_alteracao=base.usuario_alteracao
	
-- Ultimo Status
left join (
select ult.id_projeto,	
	   ult.id_cliente,	
       ult.id_status,
       dsta.descricao status,
       ult.id_substatus,
       dsub.descricao substatus,
       ult.dt_alteracao,
       ult.usuario_criacao
		
from (select ult.id_cliente,max(ult.id) id
from bh_cli_status ult
group by ult.id_cliente)ult_st

left join bh_cli_status ult on
	ult.id=ult_st.id

left join br_cli_status dsta on
	dsta.id=ult.id_status
	
left join br_cli_substatus dsub on
	dsub.id=ult.id_substatus
)status on
	status.id_cliente=base.id_cliente	
	--status.usuario_criacao=base.usuario_alteracao
	
left join bc_usuario us on
	us.id=base.usuario_alteracao
	
left join bc_projeto proj on
	proj.id=status.id_projeto	

left join bc_usuario resp on
	resp.id=proj.responsavel_entrega	
	
left join br_proj_grau_dificuldade grau on
	grau.id=proj.grau_dificuldade
	
left join bc_cliente cli on
	cli.id=base.id_cliente				
	
where 
-- Período de medição
CONVERT(CHAR(10),base.dt_alteracao, 23) between '2012-01-01' and '2012-01-31'

-- Verifica se a Analise (obs) da Entrevista 
--and
--res.obs is not null
-- Verificação do Profissional [Empresa + Experiência + Escolaridade]
--and (
--(prof.empresa_antiga is not null or prof.id_empresa is not null) and 
--(prof.dt_inicio is not null and prof.dt_inicio<>'1900-01-01 00:00:00.000') and
--prof.salario is not null
--)
----Verificação Status [Dt Pré Entrevista = Dt Status + Pegar]
--and
--CONVERT(char(10),status.dt_alteracao,23)=CONVERT(char(10),base.dt_alteracao,23)

/*
group by base.usuario_alteracao,
	   us.nome_usuario,
	   status.id_projeto,
	   proj.nome*/