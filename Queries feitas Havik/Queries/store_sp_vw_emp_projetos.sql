create procedure sp_vw_emp_projetos
(
@id_empresa int
)
as
select 	
	proj.id id_projeto,
	proj.id_empresa,	
	proj.tipo_produto id_produto,
	prod.descricao produto,
	car.descricao cargo,
	proj.dt_criacao,
	ult.status,
	ult.substatus,
	proj.usuario_criacao
	
from bc_projeto proj

left join bh_proj_status stat on
	stat.id_projeto=proj.id
	
left join br_cargo car on
	car.id=proj.cargo	
	
left join br_tp_produto prod on
	prod.id=proj.tipo_produto	
	
left join bh_proj_ult_status ult on
	ult.id_projeto=proj.id

where proj.id_empresa=@id_empresa

order by proj.dt_criacao desc