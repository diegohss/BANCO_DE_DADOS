create procedure sp_vw_home_agenda_entrevista_havik
(
@usuario int
)
as

select
base.id,
base.id_cliente,
cli.nome,
base.dt_agendada,
base.hora hora_agendada

from bh_cli_status base

left join bc_cliente cli on
	cli.id=base.id_cliente

where base.usuario_criacao=@usuario and base.dt_agendada=GETDATE()

order by base.hora desc
