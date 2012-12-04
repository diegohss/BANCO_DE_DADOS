select cvs.id,cvs.id_cliente,cli.nome,
	   cvs.nome_arquivo,cvs.tipo_arquivo,
	   cvs.tipo_arquivo,idi.descricao tp_anexo,
	   cvs.dt_criacao,us.nome_usuario usuario_criacao
from bc_cli_base_cvs cvs
left join bc_cliente cli on
	cli.id=cvs.id_cliente
left join bc_usuario us on
	us.id=cvs.usuario_criacao	
left join br_cli_cvs_idiomas idi on
	idi.id=cvs.idioma		

where cvs.dados is null and convert(char(10),cvs.dt_criacao,23)>'2011-12-23'
order by cvs.id