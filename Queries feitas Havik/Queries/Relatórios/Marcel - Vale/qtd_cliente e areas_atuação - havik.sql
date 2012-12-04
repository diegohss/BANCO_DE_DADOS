select distinct emp.nome
from bc_projeto proj
left join bc_empresa_unq emp on
	emp.id=proj.id_empresa;
	
select distinct area.descricao area
from bc_projeto proj
left join br_area area on
	area.id=proj.area;	