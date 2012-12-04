create procedure sp_vw_emp_contato
(
@id_empresa int 
)
as

select cli.nome,
	   tel.cod_pais,
	   tel.ddd,
	   tel.telefone 

from bc_cliente cli

left join (select top 1 * 
from bh_cli_telefone tel 
where tel.id_cliente=1
			and tel.tp_telefone=2
order by tel.dt_alteracao desc) tel on
	tel.id_cliente=cli.id
	
where cli.empresa_contato=@id_empresa
