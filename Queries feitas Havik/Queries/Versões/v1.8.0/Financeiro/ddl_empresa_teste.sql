create procedure sp_vw_fin_empresa
as
select distinct proj.id_empresa,emp.nome empresa
from bc_projeto proj
left join bc_empresa_unq emp on
	emp.id=proj.id_empresa
order by emp.nome	