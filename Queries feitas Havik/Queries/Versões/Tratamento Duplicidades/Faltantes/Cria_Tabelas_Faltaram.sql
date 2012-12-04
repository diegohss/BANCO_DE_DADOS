use havik

go

select base.*
into tmp_cli_final
from bc_cliente_dup base

left join tmp_cli_dup_faltantes falt on
	falt.id_cliente=base.id_cliente
	
left join tmp_de_para_dup dup on
	dup.id_cliente_dup=base.id_cliente
	
left join tmp_cli_inserir ins on
	ins.id_cliente=base.id_cliente
	
left join tmp_cli_inserir2 inse on
	ins.id_cliente=base.id_cliente
	
left join bc_cliente cli on
	cli.id=base.id_cliente	
	
where falt.id_cliente is null and
	  dup.id_cliente is null and	
	  ins.id_cliente is null and
	  inse.id_cliente is null and
	  cli.id is null	
	  
order by nome	  