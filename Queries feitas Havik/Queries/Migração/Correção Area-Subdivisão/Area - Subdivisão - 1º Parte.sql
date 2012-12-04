select distinct cli.id id_cliente,
	   cli.nome,
	   area.descricao area,
	   sub.descricao subdivisao,
	   isnull(emp.nome,prof.empresa_antiga) empresa
	     
from bh_cli_profissional prof
left join bc_cliente cli on
	prof.id_cliente=cli.id
left join br_area area on
	area.id=prof.id_area
left join br_subdivisao sub on
	sub.id=prof.id_subdivisao
left join bc_empresa_unq emp on
	emp.id=prof.id_empresa			
where id_subdivisao=120