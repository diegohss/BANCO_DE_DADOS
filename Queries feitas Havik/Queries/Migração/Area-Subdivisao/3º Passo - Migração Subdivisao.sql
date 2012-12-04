update bc_projeto
set bc_projeto.subdivisao=sub.sub_nova
from subdivisao sub
where sub.sub_antiga=bc_projeto.subdivisao

go

update bh_cli_profissional
set bh_cli_profissional.id_subdivisao=sub.sub_nova
from subdivisao sub
where sub.sub_antiga=bh_cli_profissional.id_subdivisao