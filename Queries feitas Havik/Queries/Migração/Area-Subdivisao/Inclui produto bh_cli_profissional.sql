alter table bh_cli_profissional
add produto bigint null

update bh_cli_profissional
set bh_cli_profissional.produto=cli.produto
from bc_cliente cli
where cli.id=bh_cli_profissional.id_cliente

