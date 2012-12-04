use havik
go

select distinct 
       base.id,
       base.nome,	 			
	   email.descricao

from bc_cliente base

left join bh_cli_email email on
	email.id_cliente=base.id
	
left join bh_cli_telefone tel on
	tel.id_cliente=base.id
	
left join bh_cli_codifica cod on
	cod.id_cliente=base.id	
	
where tel.ddd in (21,021) and
	  (cod.id_segmento=1 and
	  cod.id_area=12) and
	  email.descricao is not null

