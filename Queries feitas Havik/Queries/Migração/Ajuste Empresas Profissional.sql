use havik
go

update prof
set prof.id_empresa=base.id_empresa
 
FROM dados_prof base

inner join bh_cli_profissional prof on
	prof.empresa_antiga=base.empresa_antiga and
	prof.id_cliente=base.id_cliente
	
where prof.id_empresa is null	
	
	
	