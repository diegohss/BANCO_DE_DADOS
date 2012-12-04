declare @uteis int

set @uteis=dbo.contar_duteis('2012-01-01','2012-01-31')

select 
distinct
us.nome_usuario colaborador,
status.id_projeto,
proj.nome projeto,
(count(distinct base.id_cliente)/@uteis)*grau.fator quantidade

from (select t.id_cliente, MAX(t.id) id
from bc_cli_researcher t
group by t.id_cliente)t_base

left join bc_cli_researcher base on
	base.id=t_base.id

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
	
left join br_proj_grau_dificuldade grau on
	grau.id=proj.grau_dificuldade
	
where 
-- Período de medição
CONVERT(CHAR(10),base.dt_alteracao, 23) between '2012-01-01' and '2012-01-31'
-- Verifica se a Analise (obs) da Entrevista 
and
res.obs is not null
-- Verificação do Profissional [Empresa + Experiência + Escolaridade]
and (
(prof.empresa_antiga is not null or prof.id_empresa is not null) and 
(prof.dt_inicio is not null and prof.dt_inicio<>'1900-01-01 00:00:00.000') and
prof.salario is not null
)
----Verificação Status [Dt Pré Entrevista = Dt Status + Pegar]
and
CONVERT(char(10),status.dt_alteracao,23)=CONVERT(char(10),base.dt_alteracao,23)

group by 
us.nome_usuario,
status.id_projeto,
proj.nome,
grau.fator

order by us.nome_usuario,proj.nome
