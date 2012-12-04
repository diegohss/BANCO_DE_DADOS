use havik

go

delete from bh_cli_idiomas
DBCC CHECKIDENT ('bh_cli_idiomas', RESEED, 0)

go

INSERT INTO bh_cli_idiomas
(
           id_cliente
           ,id_idioma
           ,id_nvl_idioma
           ,dt_criacao
           ,usuario_criacao
)

select 
base.idCandidato,
'1',
base.nivelIngles,
GETDATE(),
isnull(us.id,'1')

from candidato base

  left join bc_usuario us on
	us.nome_usuario=base.usuarioCadastro

where base.ligIngles<>'0' and base.nivelIngles<>'0'

go

INSERT INTO bh_cli_idiomas
(
           id_cliente
           ,id_idioma
           ,id_nvl_idioma
           ,dt_criacao
           ,usuario_criacao
)

select 
base.idCandidato,
'2',
base.nivelEspanhol,
GETDATE(),
isnull(us.id,'1')

from candidato base

  left join bc_usuario us on
	us.nome_usuario=base.usuarioCadastro

where base.ligEspanhol<>'0' and base.nivelEspanhol<>'0'