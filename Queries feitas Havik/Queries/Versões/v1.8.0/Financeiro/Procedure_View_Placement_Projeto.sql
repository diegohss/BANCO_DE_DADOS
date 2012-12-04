use havik_teste
go
create procedure sp_vw_proj_placement
(
@id_projeto int
)
as
select clis.id_cliente,
		cli.nome

from bh_cli_status clis

left join bc_cliente cli on
	cli.id=clis.id_cliente

where clis.id_projeto=@id_projeto and
	  (clis.id_status=7 and clis.id_substatus=32 and clis.exibir=1) 