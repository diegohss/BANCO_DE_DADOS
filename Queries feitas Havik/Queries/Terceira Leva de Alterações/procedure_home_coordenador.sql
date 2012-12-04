alter procedure sp_vw_home_coordenador_1
(
@usuario int
)

as

select base.id_cliente,	   	
	   base.id_projeto,	
	   proj.nome projeto,	
	   cli.nome cliente,
	   sta.descricao status,
	   sub.descricao substatus,
	   isnull(base.dt_agendada,base.dt_alteracao) data,
	   isnull(ent.nome_usuario,us.nome_usuario) usuario

from bh_cli_status base


inner join bh_cli_fups fups on
	fups.id_status=base.id_status and
	fups.id_substatus=base.id_substatus

left join bc_cliente cli on
	cli.id=base.id_cliente
	
left join bc_projeto proj on
	proj.id=base.id_projeto	
	
left join br_cli_status sta on
	sta.id=base.id_status

left join br_cli_substatus sub on
	sub.id=base.id_substatus
	
left join bc_usuario us on
	us.id=@usuario

left join bc_usuario ent on
	ent.id=base.entrevistador	

where us.cargo in ('r1') and fups.ativo='1' and fups.home=1
and
(GETDATE()=dateadd(DAY,fups.qtd_dias,base.dt_alteracao) or GETDATE()=dateadd(day,1,base.dt_agendada))

order by 7,3