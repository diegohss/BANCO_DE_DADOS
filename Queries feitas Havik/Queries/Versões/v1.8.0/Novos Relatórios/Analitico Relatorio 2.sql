USE [havik]
GO

declare @dt_ini datetime
set @dt_ini='2012-05-01'
declare @dt_fim datetime
set @dt_fim='2012-05-31'


select distinct lider.nome_usuario equipe, 
	   obs.id_cliente cliente_obs,usobs.nome_usuario usuario_obs,CONVERT(char(10),obs.dt_alteracao,23) data_obs,
	   status.id_cliente cliente_status, us.nome_usuario usuario_status, status.status, status.substatus,
	   cli.nome candidato
	   
from bc_cliente base
 
left join bc_cli_consultor nota on
	nota.id_cliente=base.id
	
left join bh_cli_consultor_obs obs on
	obs.id_cliente=nota.id_cliente and
	obs.usuario_alteracao=nota.usuario_alteracao
	
-- Ultimo Status
inner join (
select distinct 
	ult.usuario_criacao,
	ult.id_cliente,
	ult.id_status,
	st.descricao status,
	ult.id_substatus,
	sub.descricao substatus
		
from (select st.id
from bh_cli_status st
where ((st.id_status=2 and st.id_substatus=13) or (st.id_status=3 and st.id_substatus=17)) and st.exibir=1)ult_st

left join bh_cli_status ult on
	ult.id=ult_st.id

left join br_cli_status st on
	st.id=ult.id_status		

left join br_cli_substatus sub on
	st.id=ult.id_status		
			
)status on
	status.id_cliente=obs.id_cliente
	
left join bc_cliente cli on
	cli.id=obs.id_cliente	
	
left join bc_usuario us on
	us.id=status.usuario_criacao
	
left join bc_usuario usobs on
	usobs.id=obs.usuario_alteracao
	
left join br_equipe eq on
	eq.id_colaborador=status.usuario_criacao
	
left join bc_usuario lider on
	lider.id=eq.id_lider		
	
where (obs.usuario_alteracao is not null) and
((convert(char(10),nota.dt_alteracao,23) between convert(char(10),@dt_ini,23) and convert(char(10),@dt_fim,23))
and
(convert(char(10),obs.dt_alteracao,23) between convert(char(10),@dt_ini,23) and convert(char(10),@dt_fim,23)))

--group by GROUPING SETS (us.nome_usuario,())

--order by qtd_entrevistas desc