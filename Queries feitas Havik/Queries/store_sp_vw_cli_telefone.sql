use havik

go

create procedure sp_vw_cli_telefone
(
@id_cliente int
)

as

select tel.id,
	   tel.cod_pais,
	   tel.ddd,
	   tel.telefone,
	   tel.dt_alteracao,
	   col.nome_usuario

from bh_cli_telefone tel

	left join bc_usuario col on
		col.id=tel.usuario_alteracao

where tel.id_cliente=@id_cliente

order by tel.dt_alteracao desc











