use havik

go

delete from bc_cli_cvs

DBCC CHECKIDENT ('bc_cli_cvs', RESEED, 0)

go

INSERT INTO havik.dbo.bc_cli_cvs
(
           id_cliente
           ,idioma
           ,caminho
           ,cv
           ,dt_alteracao
           ,usuario_criacao
)

select base.idCandidato,
	   '1',
	   null,
	   dbo.HTMLFullDecode3(base.referencia_1),
	   GETDATE(),
	   isnull(us.id,'1')

from candidato base

  left join bc_usuario us on
	us.nome_usuario=base.usuarioCadastro
	
where base.referencia_1 is not null and base.idCandidato is not null


GO


