USE [havik]
GO

declare @dt_ini datetime
declare @dt_fim datetime

set @dt_ini='2012-05-01'
set @dt_fim='2012-05-31'

select distinct lider.nome_usuario equipe, 
       obs.id_cliente obs_cliente,usobs.nome_usuario obs_usuario,
	   ent.id_cliente ent_cliente,us.nome_usuario ent_usuario,
	   apv.id_cliente apv_cliente,usapv.nome_usuario apv_usuario,
	   us.nome_usuario usuario_status, ent.status,ent.substatus,
	   cli.nome candidato

from bc_cliente base

left join bc_cli_consultor nota on
	nota.id_cliente=base.id
	
left join bh_cli_consultor_obs obs on
	obs.id_cliente=nota.id_cliente and
	obs.usuario_alteracao=nota.usuario_alteracao

-- Status Entrevista
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
			
)ent on
	ent.id_cliente=obs.id_cliente
	
-- Status Aprovação
inner join (
select distinct 
	ult.usuario_criacao,
	ult.id_cliente  
		
from (select st.id
from bh_cli_status st
where (st.id_status=3 and st.id_substatus=18) and st.exibir=1)ult_st

left join bh_cli_status ult on
	ult.id=ult_st.id

left join bc_usuario us on
	us.id=ult.usuario_criacao	
			
)apv on
	apv.id_cliente=ent.id_cliente	
	
left join bc_cliente cli on
	cli.id=obs.id_cliente		
	
left join bc_usuario us on
	us.id=ent.usuario_criacao
	
left join bc_usuario usobs on
	usobs.id=obs.usuario_alteracao	
	
left join bc_usuario usapv on
	usapv.id=apv.usuario_criacao	
	
left join br_equipe eq on
	eq.id_colaborador=ent.usuario_criacao
	
left join bc_usuario lider on
	lider.id=eq.id_lider		

where (obs.usuario_alteracao is not null) and
((convert(char(10),nota.dt_alteracao,23) between convert(char(10),@dt_ini,23) and convert(char(10),@dt_fim,23))
and
(convert(char(10),obs.dt_alteracao,23) between convert(char(10),@dt_ini,23) and convert(char(10),@dt_fim,23)))

--group by GROUPING SETS (us.nome_usuario,())

--order by qtd_entrevistas desc