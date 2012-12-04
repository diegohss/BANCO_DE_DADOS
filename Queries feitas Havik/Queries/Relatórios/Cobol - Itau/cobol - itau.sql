use havik
go
select distinct cli.id, 
	   cli.nome,
	   dbo.calculaidade(cli.dt_nascimento) Idade,
	   case when pre.id is null then 'não' else 'sim' end origem_pre,
	   case when cur.id is null then 'não' else 'sim' end origem_curso,
	   case when cvs.id is null then 'não' else 'sim' end origem_cv,
status.dt_alteracao data_status,
status.status,
status.substatus,
status.motivo,
status.usuario_status,
status.follow,
status.entrevistador,
status.dt_agendada data_agendada,
status.hora hora_agendada,
prof.area,
prof.subdivisao,
isnull(prof.empresa,prof.empresa_antiga) empresa,
prof.filial,
prof.cargo,
prof.salario,
prof.bonus,
dt_inicio=dbo.fn_dateformat(prof.dt_inicio,1),
dt_saida=dbo.fn_dateformat(prof.dt_saida,1),
escola.escolaridade,
escola.graduacao,
escola.instituicao	   
	   
	   
from bc_cliente cli

left join bh_cli_researcher_obs pre on
	pre.id_cliente=cli.id
	
left join bc_cli_base_cvs cvs on
	cvs.id_cliente=cli.id	
	
left join bh_cli_cursos cur on
	cur.id_cliente=cli.id	
	
left join bh_cli_academico acad on
	acad.id_cliente=cli.id	

left join
(	
select ult.id_cliente,
	   esc.descricao escolaridade,
	   grad.descricao graduacao,
	   ult.instituicao	   	
from(
select id_cliente,MAX(id) id
from bh_cli_academico
where exibir=1
group by id_cliente
)ult_ac

left join bh_cli_academico ult on
	ult.id=ult_ac.id
	
left join br_graduacao grad on
	grad.id=ult.id_graduacao	
	
left join br_escolaridade esc on
	esc.id=ult.id_escolaridade	

)escola on
	escola.id_cliente=cli.id

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
where ult.exibir=1 group by ult.id_cliente)ult_st

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
	status.id_cliente=cli.id	
	
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
	   ult.bonus,	   
	   ult.id_segmento,
	   seg.descricao segmento,
	   ult.id_area,
	   area.descricao area,
	   ult.id_subdivisao,
	   sub.descricao subdivisao
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
left join bc_empresa_filial fil on
	fil.id=ult.id_filial		
left join bc_empresa_unq emp on
	emp.id=ult.id_empresa	
)prof on
	prof.id_cliente=cli.id
	
where (pre.obs like '%cobol%') or contains(cvs.dados,'cobol') or (cur.curso like '%cobol%')

order by cli.id