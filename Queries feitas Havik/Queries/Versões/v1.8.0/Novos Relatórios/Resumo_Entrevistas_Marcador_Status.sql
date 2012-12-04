use havik_teste
go

create procedure sp_relat_ent_marcada
(
@projetos int_list readonly,
@status int_list readonly,
@substatus int_list readonly,
@empresas int_list readonly,
@captacao int = null,
@entrega int = null,
@colab int = null,
@dt_ini datetime = null,
@dt_fim datetime = null,  
@pre int = null,
@colaborador int = null,
@tipo_relat int = null,
@usuario int
)
as

select CASE
   WHEN GROUPING(us.nome_usuario) = 1 THEN cast('TOTAL' as varchar(20))
   ELSE cast(us.nome_usuario as varchar(100)) END Entrevistador,
	   COUNT(nota.id) qtd_entrevistas

from bc_cliente base

left join bc_cli_consultor nota on
	nota.id_cliente=base.id
	
left join bh_cli_consultor_obs obs on
	obs.id_cliente=base.id and
	obs.usuario_alteracao=nota.usuario_alteracao
	
-- Ultimo Status
left join (
select ult.id,
	   ult.id_projeto,	
	   ult.id_cliente,	
       ult.id_status,
       dsta.descricao status,
       ult.id_substatus,
       dsub.descricao substatus,
       ult.id_motivo,
       mot.descricao motivo,
       ult.obs,
       ult.dt_alteracao,
       ent.nome_usuario entrevistador,
       ult.dt_agendada,
       ult.hora,
       fl.nome_usuario follow,
       ult.usuario_criacao,
       us.nome_usuario usuario_status    
		
from (select ult.id_cliente,max(ult.id) id
from bh_cli_status ult
where ((ult.id_status=2 and ult.id_status=12) or (ult.id_status=3 and ult.id_status=17)) and ult.exibir=1 group by ult.id_cliente)ult_st

left join bh_cli_status ult on
	ult.id=ult_st.id

left join br_cli_status dsta on
	dsta.id=ult.id_status
	
left join br_cli_substatus dsub on
	dsub.id=ult.id_substatus
	
left join br_cli_motivos mot on
	mot.id=ult.id_motivo	
	
left join bc_usuario us on
	us.id=ult.usuario_criacao	
	
left join bc_usuario ent on
	ent.id=ult.entrevistador
	
left join bc_usuario fl on
	fl.id=ult.follow
			
)status on
	status.id_cliente=base.id and
	status.usuario_criacao=obs.usuario_alteracao
	
left join bc_usuario us on
	us.id=status.usuario_criacao

where --(nota.usuario_alteracao is not null and obs.usuario_alteracao is not null and status.usuario_criacao is not null) and
(convert(char(10),base.dt_alteracao,23) between convert(char(10),@dt_ini,23) and convert(char(10),@dt_fim,23))

group by GROUPING SETS (us.nome_usuario,())

--order by qtd_entrevistas desc