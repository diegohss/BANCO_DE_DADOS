select base.id id_projeto,
	   base.nome projeto,
	   cli.nome nome_candidato

from bc_projeto base

left join (select * from bh_cli_status 
		   where ((id_status=7 and id_substatus=32) or (id_status=7 and id_substatus is null)) and exibir=1)st on
	st.id_projeto=base.id
	
left join bc_cliente cli on
	cli.id=st.id_cliente
	
where (base.responsavel_captacao=3 or base.responsavel_entrega=3) and cli.nome is not null