use havik
go
update cli
set cli.id_antiga=sit.idCandidatoSite

from bh_cli_email email

inner join bc_cliente cli on
	cli.id=email.id_cliente
inner join site.CandidatoSite sit on
	sit.Email=email.descricao and
	sit.Nome=cli.nome

where cli.id_antiga is null