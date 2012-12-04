use havik

go

delete from bc_cli_base_cvs

DBCC CHECKIDENT ('bc_cli_base_cvs', RESEED, 0)

go

insert into bc_cli_base_cvs
(
id_cliente,
nome_arquivo,
tipo_arquivo,
idioma,
caminho,
cv,
dados,
dt_criacao,
usuario_criacao
)

select base.idCandidato,
	   cast(cast(base.idCandidato as varchar(30)) + '_Português.html' as varchar(50)),
	   'application/vnd.ms-word',
	   1,
	   null,
	   null,
	   cast(cast(base.referencia_1 as nvarchar(max)) as varbinary(max)),
	   GETDATE(),
	   isnull(us.id,'1')

from candidato base

  left join bc_usuario us on
	us.nome_usuario=base.usuarioCadastro
	
where base.referencia_1 is not null and base.idCandidato is not null



