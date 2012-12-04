use havik
go

alter procedure sp_relat_cdd_ok
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
	   COUNT(distinct obs.id) qtd_aprovados

from bc_cliente base

left join bc_cli_consultor nota on
	nota.id_cliente=base.id
	
left join bh_cli_consultor_obs obs on
	obs.id_cliente=base.id and
	obs.usuario_alteracao=nota.usuario_alteracao

-- Status Entrevista
inner join (
select distinct 
	ult.usuario_criacao,
	ult.id_cliente  
		
from (select st.id
from bh_cli_status st
where ((st.id_status=2 and st.id_substatus=13) or (st.id_status=3 and st.id_substatus=17)) and st.exibir=1)ult_st

left join bh_cli_status ult on
	ult.id=ult_st.id

left join bc_usuario us on
	us.id=ult.usuario_criacao	
			
)ent on
	ent.id_cliente=obs.id_cliente
	
-- Status Aprovação
inner join (
select distinct 
	ult.usuario_criacao,
	ult.id_cliente  
		
from (select st.id
from bh_cli_status st
where (st.id_status=3 and st.id_substatus=18) and st.exibir=1)ult_st

left join bh_cli_status ult on
	ult.id=ult_st.id

left join bc_usuario us on
	us.id=ult.usuario_criacao	
			
)apv on
	apv.id_cliente=ent.id_cliente	
	
left join bc_usuario us on
	us.id=apv.usuario_criacao

where (obs.usuario_alteracao is not null) and
((convert(char(10),nota.dt_alteracao,23) between convert(char(10),@dt_ini,23) and convert(char(10),@dt_fim,23))
or
(convert(char(10),obs.dt_alteracao,23) between convert(char(10),@dt_ini,23) and convert(char(10),@dt_fim,23)))

group by GROUPING SETS (us.nome_usuario,())

--order by qtd_entrevistas desc