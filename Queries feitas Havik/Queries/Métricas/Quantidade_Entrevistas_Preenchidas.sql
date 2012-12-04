select us.nome_usuario,	 
	   COUNT(distinct base.id_cliente) qtd_entrevistas
	   
from bc_cli_consultor base

left join bc_usuario us on
	us.id=base.usuario_alteracao
	
where convert(char(10),base.dt_alteracao,23) between '2011-12-26' and '2012-01-20'

group by us.nome_usuario