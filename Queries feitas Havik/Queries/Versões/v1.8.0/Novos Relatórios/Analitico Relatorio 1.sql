USE [havik]
GO
/*
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
*/

declare @dt_ini datetime
declare @dt_fim datetime

set @dt_ini='2012-05-01'
set @dt_fim='2012-05-31'

select distinct
   lider.nome_usuario equipe, 
   obs.id_cliente cliente_obs,
   usobs.nome_usuario usuario_obs,
   convert(char(10),obs.dt_alteracao,23) data_obs,
   nota.id_cliente cliente_nota,
   us.nome_usuario usuario_nota,
   convert(char(10),nota.dt_alteracao,23) data_nota,
   cli.nome candidato
	
from bc_cli_consultor nota
	
left join bh_cli_consultor_obs obs on
	obs.id_cliente=nota.id_cliente and
	obs.usuario_alteracao=nota.usuario_alteracao
	
left join bc_usuario us on
	us.id=nota.usuario_alteracao
	
left join bc_usuario usobs on
	usobs.id=obs.usuario_alteracao		
	
left join br_equipe eq on
	eq.id_colaborador=nota.usuario_alteracao	
	
left join bc_usuario lider on
	lider.id=eq.id_lider	
	
left join bc_cliente cli on
	cli.id=obs.id_cliente	

where (obs.usuario_alteracao is not null) and
((convert(char(10),nota.dt_alteracao,23) between convert(char(10),@dt_ini,23) and convert(char(10),@dt_fim,23))
and
(convert(char(10),obs.dt_alteracao,23) between convert(char(10),@dt_ini,23) and convert(char(10),@dt_fim,23)))

--group by ROLLUP(lider.nome_usuario,us.nome_usuario)

order by 1,2
--GROUP BY GROUPING SETS((proj.id,proj.nome,stat.descricao,sub.descricao,mot.descricao),proj.nome,())
--order by qtd_entrevistas desc