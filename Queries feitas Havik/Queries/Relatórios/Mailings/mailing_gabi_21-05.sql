use havik
go
select base.nome,
	   email.descricao email
	   

from bc_cliente base

left join bh_cli_email email on
	email.id_cliente=base.id

left join bh_cli_codifica cod on
	cod.id_cliente=base.id
	
where base.nome is not null and email.descricao is not null and 
	  cod.id_segmento in (1,2,3,4) and
      ((cod.id_area=16) or
      (cod.id_area=13) or
      (cod.id_area=4))
      	
group by base.nome,
		 email.descricao      	
		 