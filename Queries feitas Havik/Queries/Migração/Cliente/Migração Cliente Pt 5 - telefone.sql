use havik

go

delete from bh_cli_telefone
DBCC CHECKIDENT ('bh_cli_telefone', RESEED, 0)

go

INSERT INTO bh_cli_telefone
(
           id_cliente
           ,cod_pais
           ,ddd
           ,telefone
           ,dt_alteracao
           ,usuario_alteracao
           ,tp_telefone
           ,exibir
)
select
base.idCandidato,
'55',
LEFT(dbo.limpa_telefone(base.celular),2),
RIGHT(dbo.limpa_telefone(base.celular),8),
GETDATE(),
isnull(us.id,'1'),
'3',
'1'

from candidato base

  left join bc_usuario us on
	us.nome_usuario=base.usuarioCadastro
where base.celular is not null and base.celular<>''

GO


INSERT INTO bh_cli_telefone
(
           id_cliente
           ,cod_pais
           ,ddd
           ,telefone
           ,dt_alteracao
           ,usuario_alteracao
           ,tp_telefone
           ,exibir
)
select
base.idCandidato,
'55',
LEFT(dbo.limpa_telefone(base.telRes),2),
RIGHT(dbo.limpa_telefone(base.telRes),8),
GETDATE(),
isnull(us.id,'1'),
'2',
'1'

from candidato base

  left join bc_usuario us on
	us.nome_usuario=base.usuarioCadastro
where base.telRes is not null and base.telRes<>''

GO

INSERT INTO bh_cli_telefone
(
           id_cliente
           ,cod_pais
           ,ddd
           ,telefone
           ,dt_alteracao
           ,usuario_alteracao
           ,tp_telefone
           ,exibir
)
select
base.idCandidato,
'55',
LEFT(dbo.limpa_telefone(base.telRec),2),
RIGHT(dbo.limpa_telefone(base.telRec),8),
GETDATE(),
isnull(us.id,'1'),
'4',
'1'

from candidato base

  left join bc_usuario us on
	us.nome_usuario=base.usuarioCadastro
where base.telRec is not null and base.telRec<>''

GO