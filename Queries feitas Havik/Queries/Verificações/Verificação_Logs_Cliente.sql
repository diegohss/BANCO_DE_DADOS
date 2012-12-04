select base.*,us.nome_usuario
from bh_cliente base
left join bc_usuario us on
	us.id=base.usuario_alteracao
where base.id_cliente=45918