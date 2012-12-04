use havik
go
select distinct base.id id_candidato,
	   base.nome nome_candidato,
	   status.id_projeto,
	   status.projeto,
	   status.status,
	   status.substatus,
	   convert(char(10),status.dt_alteracao,23) data_status,
	   isnull(prof.empresa,prof.empresa_antiga) empresa,
	   prof.cargo,
	   convert(char(10),prof.dt_inicio,23) inicio_empresa,
	   prof.salario,
	   dbo.calculaidade(base.dt_nascimento) idade,
	   acad.escolaridade,
	   acad.graduacao
	      	   
from bc_cliente base
-- Ultimo Status
left join (
select ult.id,
	   ult.id_projeto,
	   proj.nome projeto,	
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
where ult.exibir=1
group by ult.id_cliente)ult_st

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
	
left join bc_projeto proj on
	proj.id=ult.id_projeto	
			
)status on
	status.id_cliente=base.id
	
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
	prof.id_cliente=base.id 
	

left join(
select ult.id_cliente,
	   ult.id_escolaridade,
	   esc.descricao escolaridade,
	   ult.id_graduacao,
	   grad.descricao graduacao,
	   ult.instituicao   

from (select acad.id_cliente,max(acad.id) id
	  from bh_cli_academico acad
	  where acad.exibir=1
	  group by acad.id_cliente)ult_st
	
left join bh_cli_academico ult on 	
	ult.id=ult_st.id
	
left join br_graduacao grad on
	grad.id=ult.id_graduacao	
	
left join br_escolaridade esc on
	esc.id=ult.id_escolaridade	
)acad on
	acad.id_cliente=base.id	
	
left join bh_cli_profissional cprof on
	cprof.id_cliente=base.id
	
where (cprof.id_empresa in (9474,2870) or cprof.empresa_antiga like '%banco safra%')