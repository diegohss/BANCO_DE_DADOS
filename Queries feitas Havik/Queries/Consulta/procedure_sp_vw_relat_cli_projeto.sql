create procedure sp_vw_relat_cli_projeto
(
@id_clente int
)
as

select hist.id_cliente,
	   cli.nome,	
	   hist.id_projeto,	
	   proj.nome projeto,
	   	

from bh_cli_projeto hist

	left join bc_cliente cli on
		cli.id=hist.id_cliente
    left join bc_projeto proj on
		proj.id=hist.id_projeto  		

where hist.id_cliente=@id_cliente

