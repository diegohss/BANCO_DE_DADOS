INSERT INTO havik.dbo.bh_cli_researcher_obs
           (
           id_cliente
           ,obs
           ,dt_alteracao
           ,usuario_alteracao
           )

select  cli.idCandidato,
	    dbo.HTMLFullDecode3(cli.referencia_3),
	    GETDATE(),
	    isnull(base.usuario_alteracao,1)

from dbo.candidato cli

	left join bc_cliente base on
		base.id=cli.idCandidato

where cli.referencia_3 is not null

GO


