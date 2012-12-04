select area.descricao area,count(distinct clis.id_cliente) qtd_clientes
from bh_cli_status clis
left join bc_proj_oferta perf on
	perf.id_projeto=clis.id_projeto
left join bc_projeto proj on
	proj.id=clis.id_projeto	
left join br_area area on
	area.id=proj.area	
where ((clis.id_status=7 and clis.id_substatus=32 and clis.exibir=1) or
	  (clis.id_status=8 and clis.id_substatus=32 and clis.exibir=1) or
	  (clis.id_status=7 and clis.id_substatus is null and clis.exibir=1))
	  and perf.salario_mensal>=10000
group by area.descricao	  
order by qtd_clientes desc