select us.nome_usuario,
	   COUNT(distinct base.id_cliente) clientes_preenchidos	
from havik.dbo.bc_cli_researcher base

left join havik.dbo.bc_usuario us on
	us.id=base.usuario_alteracao
	
where CONVERT(CHAR(10),base.dt_alteracao, 23)>='2012-01-04'
	
group by us.nome_usuario	