use havik

go

select isnull(ins.id_nova,base.id_cliente) id_cliente,ltrim(rtrim(base.nome)) nome,
	   isnull(falt.id_nova,indup.id_nova) id_final,
	   ISNULL(falt.id_cliente,indup.id_cliente) teste

from tmp_dup_clientes base

left join tmp_cli_dup_faltantes falt on
	falt.id_cliente=base.id_cliente
	
left join tmp_cli_inserir ins on
	ins.id_cliente=base.id_cliente
	
left join tmp_cli_inserir2 indup on
	indup.id_cliente=base.id_cliente		

--where ltrim(rtrim(base.nome)) is null
	
order by 2