use havik
go

select base.id_status,st.descricao status,
	   base.id_substatus,sub.descricao subtatus

from bl_cli_status_substatus base

left join br_cli_status st on
	st.id=base.id_status
	
left join br_cli_substatus sub on
	sub.id=base.id_substatus	