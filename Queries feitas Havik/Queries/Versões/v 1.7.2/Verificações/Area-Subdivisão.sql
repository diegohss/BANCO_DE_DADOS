use havik_teste
go

select base.id_subdivisao,
	   sub.descricao

from bh_cli_profissional base

left join br_subdivisao sub on
	sub.id=base.id_subdivisao
	
group by base.id_subdivisao,
	   sub.descricao	