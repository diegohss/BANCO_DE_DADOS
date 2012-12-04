INSERT INTO havik.dbo.bh_cli_consultor_obs
           (
           id_cliente
           ,obs
           ,dt_alteracao
           ,usuario_alteracao
           )

select  cli.idCandidato,
	    dbo.HTMLFullDecode3(cli.comGerais),
	    GETDATE(),
	    isnull(base.usuario_alteracao,1)

from dbo.candidato cli

	left join bc_cliente base on
		base.id=cli.idCandidato

where cli.comGerais is not null

GO


