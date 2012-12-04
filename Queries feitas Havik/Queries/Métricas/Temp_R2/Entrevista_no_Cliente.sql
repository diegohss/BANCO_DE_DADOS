select us.nome_usuario,
	   COUNT(distinct base.id_cliente) qtd_entrevistas

from bh_cli_status base

left join bc_usuario us on
	us.id=base.usuario_criacao

where 
convert(char(10),base.dt_alteracao,23) between '2011-12-26' and '2012-01-24'  
and
(
(base.id_status=5 and base.id_substatus=24)
or
(base.id_status=5 and base.id_substatus=29)
or
(base.id_status=5 and base.id_substatus=40)
or
(base.id_status=5 and base.id_substatus=39)
)
and
us.cargo='r2'
group by us.nome_usuario