select ltrim(rtrim(base.nome)),cli.qtd_dup dup_bc_cliente,
	   COUNT(base.nome) qtd_dup

from tmp_dup_clientes base

inner join (
select LTRIM(rtrim(cli.nome)) nome,COUNT(cli.nome) qtd_dup
from bc_cliente cli
group by LTRIM(rtrim(cli.nome))
)cli on
LTRIM(rtrim(cli.nome))=ltrim(rtrim(base.nome))
	
group by ltrim(rtrim(base.nome)),cli.qtd_dup

having COUNT(base.nome)>1