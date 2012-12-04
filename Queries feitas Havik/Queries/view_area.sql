create view vw_emp_segmento_area
as
select top 1000
	base.id, 
	base.id_area,area.descricao area,
	base.id_segmento,seg.descricao segmento

from bl_segmento_area base

left join br_area area on
	area.id=base.id_area

left join br_segmento seg on
	seg.id=base.id_segmento
			
order by area.descricao
	
go

create view vw_proj_segmento_area
as
select top 1000
	base.id, 
	base.id_area,area.descricao area,
	base.id_segmento,seg.descricao segmento

from bl_segmento_area base

left join br_area area on
	area.id=base.id_area

left join br_segmento seg on
	seg.id=base.id_segmento
	
order by area.descricao

go

create view vw_cli_segmento_area
as
select top 1000
	base.id, 
	base.id_area,area.descricao area,
	base.id_segmento,seg.descricao segmento

from bl_segmento_area base

left join br_area area on
	area.id=base.id_area

left join br_segmento seg on
	seg.id=base.id_segmento
	
order by area.descricao

go	