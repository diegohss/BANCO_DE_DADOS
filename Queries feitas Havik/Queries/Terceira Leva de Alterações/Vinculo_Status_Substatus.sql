select
base.id_status,
stat.descricao status,
base.id_substatus,
sub.descricao substatus

from bl_cli_status_substatus base

left join br_cli_status stat on
	stat.id=base.id_status
	
left join br_cli_substatus sub on
	sub.id=base.id_substatus