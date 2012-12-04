use havik_teste
go
select id_cliente,telefone,MAX(ID) id
into tmp_dup_telefone
from bh_cli_telefone
group by id_cliente,telefone
having COUNT(telefone)>4

