select proj.id,
	   isnull(proj.nome,'TOTAL') projeto,
	   COUNT(distinct base.id_cliente) qtd_clientes
	   	
from bh_cli_projeto base

left join bc_projeto proj on 
	proj.id=base.id_projeto
	
where proj.id in (1480,1510)

group by proj.id,isnull(proj.nome,'TOTAL')

with rollup

