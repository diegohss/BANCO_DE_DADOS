select us.nome_usuario,
	   COUNT(distinct base.id_cliente) qtd_contatos

from bh_cli_status base

left join bc_usuario us on
	us.id=base.usuario_criacao

where 
convert(char(10),base.dt_alteracao,23) between '2011-12-26' and '2012-01-24'  
and
(
(base.id_status=2 and base.id_substatus=10)
or
(base.id_status=2 and base.id_substatus=11)
or
(base.id_status=2 and base.id_substatus=13)
or
(base.id_status=2 and base.id_substatus=46)
)
and
us.cargo='r2'
group by us.nome_usuario