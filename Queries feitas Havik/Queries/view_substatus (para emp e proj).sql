create view vw_emp_status_substatus
as
select top 1000
	base.id, 
	base.id_substatus,sub.descricao substatus,
	base.id_status,stat.descricao status

from bl_emp_status_substatus base

left join br_emp_substatus sub on
	sub.id=base.id_substatus

left join br_emp_status stat on
	stat.id=base.id_status
			
order by sub.descricao
	
go

create view vw_proj_status_substatus
as
select top 1000
	base.id, 
	base.id_substatus,sub.descricao substatus,
	base.id_status,stat.descricao status

from bl_proj_status_substatus base

left join br_proj_substatus sub on
	sub.id=base.id_substatus

left join br_proj_status stat on
	stat.id=base.id_status
			
order by sub.descricao
	
go