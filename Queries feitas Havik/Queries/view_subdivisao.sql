create view vw_emp_area_subdivisao
as
select top 1000
	base.id, 
	base.id_subdivisao,sub.descricao subdivisao,
	base.id_area,area.descricao area

from bl_area_subdivisao base

left join br_area area on
	area.id=base.id_area

left join br_subdivisao sub on
	sub.id=base.id_subdivisao
	
order by sub.descricao
	
go

create view vw_proj_area_subdivisao
as
select top 1000
	base.id, 
	base.id_subdivisao,sub.descricao subdivisao,
	base.id_area,area.descricao area

from bl_area_subdivisao base

left join br_area area on
	area.id=base.id_area

left join br_subdivisao sub on
	sub.id=base.id_subdivisao
	
order by sub.descricao

go

create view vw_cli_area_subdivisao
as
select top 1000
	base.id, 
	base.id_subdivisao,sub.descricao subdivisao,
	base.id_area,area.descricao area

from bl_area_subdivisao base

left join br_area area on
	area.id=base.id_area

left join br_subdivisao sub on
	sub.id=base.id_subdivisao
	
order by sub.descricao

go