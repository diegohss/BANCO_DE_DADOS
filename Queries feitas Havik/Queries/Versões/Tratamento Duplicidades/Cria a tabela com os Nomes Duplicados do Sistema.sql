use havik
go
select LTRIM(RTRIM(base.nome)) nome,base.id
into tmp_dup_clientes
from bc_cliente base

inner join(
select LTRIM(RTRIM(cli.nome)) nome
from bc_cliente cli
group by LTRIM(RTRIM(cli.nome))
having COUNT(LTRIM(RTRIM(cli.nome)))>1
)dupcli on
	dupcli.nome=LTRIM(RTRIM(base.nome))
	
