select us.nome_usuario,
	   base.id_cliente,
	   cli.nome,
	   base.id_projeto,
	   proj.nome projeto,
	   st.descricao status,
	   sub.descricao substatus,
	   base.obs,
	   fl.nome_usuario follow,
	   ent.nome_usuario entrevistador,
	   base.dt_agendada,
	   base.dt_alteracao

from bh_cli_status base

inner join bh_cli_fups fups on	
	fups.id_status=base.id_status and
	fups.id_substatus=base.id_substatus

left join bc_cliente cli on
	cli.id=base.id_cliente
	
left join bc_usuario us on
	us.id=base.usuario_criacao
	
left join bc_usuario fl on
	fl.id=base.follow
	
left join bc_usuario ent on
	ent.id=base.entrevistador
	
left join bc_projeto proj on
	proj.id=base.id_projeto

left join br_cli_status st on
	st.id=base.id_status
	
left join br_cli_substatus sub on
	sub.id=base.id_substatus

where CONVERT(CHAR(10),base.dt_alteracao,23) between '2011-12-27' and '2012-01-04'
and
((fups.entrevistador=1 or fups.follow=1)and fups.tp_retorno=2)
and
(base.dt_agendada is null or (base.entrevistador is null and base.follow is null))

order by base.dt_alteracao desc