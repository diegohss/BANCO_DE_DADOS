create view vw_cli_status_substatus
as
select top 1000
	base.id, 
	base.id_substatus,sub.descricao substatus,
	base.id_status,stat.descricao status

from bl_cli_status_substatus base

left join br_cli_substatus sub on
	sub.id=base.id_substatus

left join br_cli_status stat on
	stat.id=base.id_status
			
order by sub.descricao
	
go

