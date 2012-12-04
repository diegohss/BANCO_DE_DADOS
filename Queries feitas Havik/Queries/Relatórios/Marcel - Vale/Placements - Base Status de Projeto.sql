select proj.id id_projeto,proj.nome projeto,
	   emp.nome empresa,area.descricao area
from bc_projeto proj
left join br_area area on
	area.id=proj.area
left join bc_proj_oferta perf on
	perf.id_projeto=proj.id
left join bc_empresa_unq emp on
	emp.id=proj.id_empresa	
left join bh_proj_status st on
	st.id_projeto=proj.id	
where st.id_status=8 and st.id_substatus=6 and
	perf.salario_mensal>=10000
