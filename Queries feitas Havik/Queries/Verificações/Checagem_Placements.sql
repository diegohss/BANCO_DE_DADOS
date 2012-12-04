select clis.id_cliente,
		cli.nome,
		clis.id_projeto,
		proj.nome  projeto

from bh_cli_status clis

left join bc_cliente cli on
	cli.id=clis.id_cliente
	
left join bc_projeto proj on
	proj.id=clis.id_projeto	

where 
	  (clis.id_status=7 and clis.id_substatus=32 and clis.exibir=1) 
order by clis.id_projeto	  