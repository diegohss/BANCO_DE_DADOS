create procedure sp_vw_emp_projeto
(
@id_empresa int
)
as

select 
	proj.id_empresa,
	proj.id id_projeto,
	proj.nome projeto,
	proj.area id_area,
	proj.cargo id_cargo,		
	hist.qtd_clientes_vinculados,
	stat.status ultimo_status,
	stat.substatus ultimo_substatus

from bc_projeto proj

	left join (
select id_projeto,
	   COUNT(distinct id) qtd_clientes_vinculados
from bh_cli_projeto
group by id_projeto
)hist
 on
		hist.id_projeto=proj.id
		
	left join 
(select top 1 stat.id,
			 stat.id_projeto,
			 stat.id_status,
			 sta.descricao status,
			 stat.id_substatus,
			 sub.descricao substatus
from bh_proj_status stat
	left join br_proj_status sta on
		sta.id=stat.id_status
	left join br_proj_substatus sub on
		sub.id=stat.id_substatus	
order by stat.dt_alteracao desc) stat on
		stat.id_projeto=proj.id	

where proj.id_empresa=@id_empresa