use havik
go

select base.id_area,
	   ar.descricao area,
	   base.id_subdivisao,
	   sub.descricao subdivisao

from bl_area_subdivisao base

left join br_area ar on
	ar.id=base.id_area
	
left join br_subdivisao sub on
	sub.id=base.id_subdivisao
	
		