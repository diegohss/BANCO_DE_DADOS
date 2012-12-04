use havik
go

select base.id_resposta,resp.descricao,base.id_cliente,cproj.id_projeto,
	   base.usuario_alteracao,us.nome_usuario

from bh_cli_perguntas_respostas base

left join bc_usuario us on
	us.id=base.usuario_alteracao
	
left join br_cli_respostas resp on
	resp.id=base.id_resposta	
	
left join bh_cli_projeto cproj on
	cproj.id_cliente=base.id_cliente

left join bc_projeto proj on
	proj.id=cproj.id_projeto		

where CONVERT(char(10),base.dt_alteracao,23) between '2012-05-01' and '2012-05-31' 
and base.id_pergunta=2

