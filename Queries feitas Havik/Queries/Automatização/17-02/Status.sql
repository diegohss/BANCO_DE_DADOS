create procedure sp_extrator_status
(
@data_ini varchar(10)=null,
@data_fim varchar(10)=null
)

as

select 

proj.id id_projeto,
proj.nome projeto,
base.dt_alteracao data,
sta.descricao status,
sub.descricao substatus,
mot.descricao motivos,
col.nome_usuario,
fol.nome_usuario follow,
ent.nome_usuario entrevistador,
base.dt_agendada,
base.hora,
cli.id id_cliente,
cli.nome nome_candidato,
DATEDIFF(year,cli.dt_nascimento,getdate()) Idade

from bh_cli_status base

		left join br_cli_status sta on
			sta.id=base.id_status
		left join br_cli_substatus sub on
			sub.id=base.id_substatus
		left join bc_projeto proj on
			proj.id=base.id_projeto
		left join bc_cliente cli on
			cli.id=base.id_cliente
		left join bc_usuario ent on
			ent.id=base.entrevistador
		left join bc_usuario fol on
			fol.id=base.follow
		left join bc_usuario col on
			col.id=base.usuario_criacao
		left join br_cli_motivos mot on
			mot.id=base.id_motivo

where convert(char(10),base.dt_alteracao,23) between @data_ini and @data_fim