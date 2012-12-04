use havik

go

create procedure sp_vw_cli_email
(
@id_cliente int
)

as

select email.id,
	   email.descricao email,
	   email.dt_alteracao,
	   col.nome_usuario

from bh_cli_email email

	left join bc_usuario col on
		col.id=email.usuario_alteracao

where email.id_cliente=@id_cliente

order by email.dt_alteracao desc











