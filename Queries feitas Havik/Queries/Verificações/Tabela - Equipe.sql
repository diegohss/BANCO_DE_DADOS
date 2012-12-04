use havik
go
select base.id,
	   base.id_lider,eq.nome_usuario equipe,
	   base.id_colaborador,us.nome_usuario colaborador,
	   base.funcao,base.cargo,
	   base.home

from br_equipe base
left join bc_usuario us on
	us.id=base.id_colaborador
left join bc_usuario eq on
	eq.id=base.id_lider
	