use havik
go
create procedure sp_relat_ent_feita
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
@usuario int = null
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
	
left join bc_usuario us on
	us.id=nota.usuario_alteracao	

where (obs.usuario_alteracao is not null) and
(convert(char(10),base.dt_alteracao,23) between convert(char(10),@dt_ini,23) and convert(char(10),@dt_fim,23))

group by GROUPING SETS (us.nome_usuario,())

--order by qtd_entrevistas desc