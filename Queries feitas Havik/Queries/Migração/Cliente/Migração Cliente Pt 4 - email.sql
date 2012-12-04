use havik

go

delete from bh_cli_email
DBCC CHECKIDENT ('bh_cli_email', RESEED, 0)

go


INSERT INTO havik.dbo.bh_cli_email
(
           id_cliente
           ,descricao
           ,dt_alteracao
           ,usuario_alteracao
           ,exibir
)

select 
base.idCandidato,
base.email,
GETDATE(),
isnull(us.id,'1'),
'1'

from candidato base

  left join bc_usuario us on
	us.nome_usuario=base.usuarioCadastro
where base.email is not null and base.email<>''

go

INSERT INTO havik.dbo.bh_cli_email
(
           id_cliente
           ,descricao
           ,dt_alteracao
           ,usuario_alteracao
           ,exibir
)

select 
base.idCandidato,
base.email2,
GETDATE(),
isnull(us.id,'1'),
'1'

from candidato base

  left join bc_usuario us on
	us.nome_usuario=base.usuarioCadastro
where base.email2 is not null and base.email2<>''

