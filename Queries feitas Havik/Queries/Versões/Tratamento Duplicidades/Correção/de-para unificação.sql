use havik
go
select distinct dups.id_cliente id_cliente_dup,dups.nome cliente_dup,base.id_cliente id_cliente,base.nome cliente
into tmp_de_para_dup
from (
select distinct email.id_cliente,ltrim(rtrim(email.descricao)) email, LTRIM(rtrim(cli.nome)) nome
from bh_cli_email_dup email 
left join bc_cliente_dup cli on
	cli.id_cliente=email.id_cliente 
--where email.exibir=1
)dups
left join (
select distinct email.id_cliente,ltrim(rtrim(email.descricao)) email, LTRIM(rtrim(cli.nome)) nome
from bh_cli_email email 
left join bc_cliente cli on
	cli.id=email.id_cliente 
--where email.exibir=1
)base on
	base.nome=dups.nome and
	base.email=dups.email
	
	
where base.id_cliente is not null	
	
	
order by 2	