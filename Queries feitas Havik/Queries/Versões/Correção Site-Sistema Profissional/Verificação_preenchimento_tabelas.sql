use havik
SELECT base.idOportunidade,base.idCandidatoSite,base.Sincronizado,base.DataAplicacao,
	   proj.id_cliente,proj2.id_cliente,
	   cli.id_antiga,cli.id id_sistema, 
	   site.idCandidatoSistema  id_site_sistema

  FROM site.CandidadoOportunidade base
	left join site.CandidatoSite site on
		site.idCandidatoSite=base.idCandidatoSite
	left join bc_cliente cli on
		cli.id_antiga=site.idCandidatoSite 			
	left join bh_cli_projeto proj on
		proj.id_cliente=site.idCandidatoSistema
	left join bh_cli_projeto proj2 on
		proj2.id_cliente=cli.id

where proj.id_cliente is null		
  order by base.DataAplicacao desc