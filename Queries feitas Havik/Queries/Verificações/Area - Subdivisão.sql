select base.id_area,
	   area.descricao area,	
	   base.id_subdivisao,	
	   sub.descricao subdivisao

from bl_area_subdivisao base

left join br_area area on
	area.id=base.id_area
	
left join br_subdivisao sub on
	sub.id=base.id_subdivisao
	
where base.id_area=7 and base.id_subdivisao=94