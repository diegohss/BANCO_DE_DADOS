use havik
go
select distinct email.descricao email
from bh_cli_email email
left join bc_cli_opt_out opt on
	LTRIM(RTRIM(opt.email))=LTRIM(RTRIM(email.descricao))
where email.exibir=1 
and opt.email is null
