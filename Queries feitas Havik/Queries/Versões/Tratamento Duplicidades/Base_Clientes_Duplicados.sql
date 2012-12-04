use havik
go
-- Essa será base do loop (Cursor) que receberá as informações dos outros clientes iguais dessas IDs.
-- 
-- A terceira base receberá o id dos clientes que foram unificados
/*Base de Nomes de Clientes Repetidos*/
select LTRIM(RTRIM(base.nome)) nome,isnull(MAX(base.id_cliente),MAX(base.id_tel)) id_cliente
from(
select LTRIM(RTRIM(base.nome)) nome,email.id_cliente,tele.id_cliente id_tel

from bc_cliente base

inner join(
select LTRIM(RTRIM(cli.nome)) nome
from bc_cliente cli
group by LTRIM(RTRIM(cli.nome))
having COUNT(LTRIM(RTRIM(cli.nome)))>1
)dupcli on
	dupcli.nome=LTRIM(RTRIM(base.nome))

-- E-Mail
left join(		
select email.id_cliente,ltrim(rtrim(email.descricao)) email
from bh_cli_email email
inner join(
select ltrim(rtrim(email.descricao)) email
from bh_cli_email email
where email.exibir=1
group by ltrim(rtrim(email.descricao))
having COUNT(distinct email.id_cliente)>1
)dupmail on
	dupmail.email=ltrim(rtrim(email.descricao))
)email on
	email.id_cliente=base.id
	
-- Telefone

left join(
select tel.id_cliente
from bh_cli_telefone tel
inner join(
select ddd,telefone
from bh_cli_telefone
WHERE tp_telefone NOT IN (1,4)
group by ddd,telefone
having COUNT(distinct id_cliente)>1 
)duptel on
	duptel.ddd=tel.ddd and
	duptel.telefone=tel.telefone
)tele on
	tele.id_cliente=base.id	
	
where (email.id_cliente is not null or tele.id_cliente is not null)

)base
group by LTRIM(RTRIM(base.nome))
order by LTRIM(RTRIM(base.nome))