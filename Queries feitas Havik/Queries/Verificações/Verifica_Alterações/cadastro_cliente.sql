select *


from bh_cliente

left join bc_usuario us on
	us.id=usuario_alteracao

where id_cliente=17541

order by dt_alteracao desc