use havik
go
update cvs 
set cvs.dados=t.dados,
	cvs.tipo_arquivo=t.tipo_arquivo,
	cvs.usuario_criacao=28,
	cvs.idioma=1,
	cvs.nome_arquivo=t.nome_arquivo
	
from site.CandidatoSite site
	inner join bc_cli_base_cvs_site t on
		t.id_cliente_site=site.idCandidatoSite
    inner join bh_cli_email email on
		email.descricao=site.Email
	inner join bc_cliente cli on
		cli.id=email.id_cliente
	inner join bc_cli_base_cvs cvs on
		cvs.id_cliente=cli.id

where cvs.usuario_criacao=28 and site.idCandidatoSistema is null
	
