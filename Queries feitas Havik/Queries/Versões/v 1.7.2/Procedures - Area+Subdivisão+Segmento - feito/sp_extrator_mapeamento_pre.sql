USE [havik]
GO
/****** Object:  StoredProcedure [dbo].[sp_extrator_mapeamento_pre]    Script Date: 03/22/2012 11:44:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Query dos dados de mapeamento
ALTER procedure [dbo].[sp_extrator_mapeamento_pre]
(
@id_projeto int
)
as
select 
proj.id id_projeto,
proj.nome projeto,
status.dt_alteracao data,
status.status,
status.substatus,
status.motivo,
status.usuario_status,
status.follow,
status.entrevistador,
status.dt_agendada data_agendada,
status.hora hora_agendada,
cli.id id_cliente,
cli.nome nome_cliente,
DATEDIFF(year,cli.dt_nascimento,getdate()) Idade,
codi.area,
codi.subdivisao,
isnull(prof.empresa,prof.empresa_antiga) empresa,
prof.filial,
prof.cargo,
prof.salario,
prof.bonus,
dt_inicio=dbo.fn_dateformat(prof.dt_inicio,1),
dt_saida=dbo.fn_dateformat(prof.dt_saida,1),
tidi.descricao idioma,
idi.id_nvl_idioma nivel_idioma,
esc.descricao escolaridade,
grad.descricao graduacao,
acad.instituicao,
cur.curso certificacoes,
pre.obs

from bh_cli_projeto cproj

-- Ultimo Status
left join (
select ult.id,
	   ult.id_projeto,	
	   ult.id_cliente,	
       ult.id_status,
       dsta.descricao status,
       ult.id_substatus,
       dsub.descricao substatus,
       ult.id_motivo,
       mot.descricao motivo,
       ult.dt_alteracao,
       ent.nome_usuario entrevistador,
       ult.dt_agendada,
       ult.hora,
       fl.nome_usuario follow,
       us.nome_usuario usuario_status    
		
from (select ult.id_cliente,max(ult.id) id
from bh_cli_status ult
where ult.id_projeto=@id_projeto and ult.exibir=1 group by ult.id_cliente)ult_st

left join bh_cli_status ult on
	ult.id=ult_st.id

left join br_cli_status dsta on
	dsta.id=ult.id_status
	
left join br_cli_substatus dsub on
	dsub.id=ult.id_substatus
	
left join br_cli_motivos mot on
	mot.id=ult.id_motivo	
	
left join bc_usuario us on
	us.id=ult.usuario_criacao	
	
left join bc_usuario ent on
	ent.id=ult.entrevistador
	
left join bc_usuario fl on
	fl.id=ult.follow
			
)status on
	status.id_cliente=cproj.id_cliente 
	--and
	--status.id_projeto=cproj.id_projeto
	
-- Codificação
left join(
select
ult.id_cliente,
ult.id_area,
area.descricao area,
ult.id_subdivisao,
sub.descricao subdivisao,
ult.id_segmento,
seg.descricao segmento
from(
select ult_c.id_cliente,MAX(ult_c.id) id
from bh_cli_codifica ult_c
where ult_c.exibir=1
group by ult_c.id_cliente
)ult_c
left join bh_cli_codifica ult on
	ult.id=ult_c.id
left join br_area area on
	area.id=ult.id_area	
left join br_subdivisao sub on
	sub.id=ult.id_subdivisao	
left join br_segmento seg on
	seg.id=ult.id_segmento
) codi on 
	codi.id_cliente=cproj.id_cliente
	

--Profissional
left join (
select ult.id_cliente,
	   ult.id_empresa,
	   emp.nome empresa,
	   ult.empresa_antiga,
	   fil.nome filial,
	   ult.dt_inicio,
	   ult.dt_saida,
	   ult.id_cargo,
	   cargo.descricao cargo,
	   ult.salario,
	   ult.bonus
from (
SELECT a.id
FROM bh_cli_profissional a
WHERE a.ID IN
(SELECT TOP 1 b.id FROM bh_cli_profissional b WHERE b.id_cliente = a.id_cliente ORDER BY b.dt_inicio DESC)
)ult_prof
left join bh_cli_profissional ult on
	ult.id=ult_prof.id	
left join br_cargo cargo on
	cargo.id=ult.id_cargo	
left join bc_empresa_filial fil on
	fil.id=ult.id_filial		
left join bc_empresa_unq emp on
	emp.id=ult.id_empresa	
)prof on
	prof.id_cliente=cproj.id_cliente

-- Parte Academica
left join bh_cli_cursos cur on
	cur.id_cliente=cproj.id_cliente and
	cur.exibir=1

left join bh_cli_academico acad on
	acad.id_cliente=cproj.id_cliente and
	acad.exibir=1
	
left join br_graduacao grad on
	grad.id=acad.id_graduacao	
	
left join br_escolaridade esc on
	esc.id=acad.id_escolaridade	
	
left join bh_cli_idiomas idi on
	idi.id_cliente=cproj.id_cliente and
	idi.exibir=1

left join br_idiomas tidi on		
	tidi.id=idi.id_idioma

-- Parte Cliente
left join bc_cliente cli on
	cli.id=cproj.id_cliente
	
-- Parte Projeto
left join bc_projeto proj on
	proj.id=cproj.id_projeto	
	
-- Ultima Observação (Pré - Entrevista)
left join(
select ult.id_cliente,
	   ult.obs		
from (select ult.id_cliente,max(ult.id) id
from bh_cli_researcher_obs ult
group by ult.id_cliente)ult_st
left join bh_cli_researcher_obs ult on
	ult.id=ult_st.id
)pre on
	pre.id_cliente=cproj.id_cliente
	
	
where cproj.id_projeto=@id_projeto 

group by
proj.id,
proj.nome,
status.dt_alteracao,
status.status,
status.substatus,
status.motivo,
status.usuario_status,
status.follow,
status.entrevistador,
status.dt_agendada,
status.hora,
cli.id,
cli.nome,
DATEDIFF(year,cli.dt_nascimento,getdate()),
codi.area,
codi.subdivisao,
isnull(prof.empresa,prof.empresa_antiga),
prof.filial,
prof.cargo,
prof.salario,
prof.bonus,
dbo.fn_dateformat(prof.dt_inicio,1),
dbo.fn_dateformat(prof.dt_saida,1),
tidi.descricao,
idi.id_nvl_idioma,
esc.descricao,
grad.descricao,
acad.instituicao,
cur.curso,
pre.obs