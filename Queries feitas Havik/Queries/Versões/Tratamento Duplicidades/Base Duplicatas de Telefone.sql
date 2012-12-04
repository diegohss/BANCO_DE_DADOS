use havik
go
(
select *
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
)