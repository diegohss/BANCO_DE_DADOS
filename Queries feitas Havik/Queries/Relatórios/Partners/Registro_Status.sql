use havik
select us.nome_usuario,
	   status.descricao status,
	   sub.descricao substatus,
	   COUNT(base.id) qtd

from bh_emp_status base

left join bc_usuario us on
	us.id=base.usuario_alteracao
	
left join br_emp_status status on
	status.id=base.id_status

left join br_emp_substatus sub on
	sub.id=base.id_substatus	
	
where us.cargo in ('partner','coordenador','consultor')

group by us.nome_usuario,
	   status.descricao,
	   sub.descricao