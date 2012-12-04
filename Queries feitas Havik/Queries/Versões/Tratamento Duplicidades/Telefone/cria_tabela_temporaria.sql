use havik_teste
go
select id_cliente,telefone
into tmp_dup_telefone_cli
from bh_cli_telefone
group by id_cliente,telefone
having COUNT(telefone)>4

