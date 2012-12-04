update dup 
set dup.id_nova=cli.id
--select dup.id,dup.nome,cli.id,cli.nome
from tmp_cli_inserir dup
left join bc_cliente cli on
	LTRIM(rtrim(cli.nome))=LTRIM(rtrim(dup.nome))
where cli.id>47365

