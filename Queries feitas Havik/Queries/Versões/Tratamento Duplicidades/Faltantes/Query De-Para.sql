use havik
go

SELECT base.id_cliente,ltrim(rtrim(base.nome)) nome_dup,cli.id,ltrim(rtrim(cli.nome)) nome_cli

FROM tmp_cli_final base

left join bc_cliente cli on
	ltrim(rtrim(cli.nome))=ltrim(rtrim(base.nome))

