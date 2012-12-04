use havik
select us.nome_usuario,
	count(base.id) qtd

from bh_emp_obs base

left join bc_usuario us on
	us.id=base.usuario_alteracao

where base.obs is not null and base.usuario_alteracao<>1

group by us.nome_usuario