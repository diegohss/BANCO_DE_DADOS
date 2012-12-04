-- Típo de Retorno: 1 = Automatico  ; 2 = Manual
select base.id_status,
	   st.descricao status,
	   base.id_substatus,
	   sub.descricao substatus,
	   fups.id,
	   fups.tp_retorno,
	   fups.follow,
	   fups.entrevistador,
	   fups.tp_cicatriz,
	   fups.qtd_dias,
	   fups.home
	   	   

from bl_cli_status_substatus base

left join bh_cli_fups fups on	
	fups.id_status=base.id_status and
	fups.id_substatus=base.id_substatus
	
left join br_cli_status st on
	st.id=base.id_status
	
left join br_cli_substatus sub on
	sub.id=base.id_substatus		
	
where sub.descricao like '%perfil%'

order by st.descricao