use havik

go

select cli.id,cli.id_antiga,cli.nome,
	   email.descricao email,cli.dt_alteracao	

from bc_cliente cli

left join bh_cli_email email on
	email.id_cliente=cli.id

where cli.id_antiga is not null and email.descricao is not null