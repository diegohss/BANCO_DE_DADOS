USE [havik]
GO
/****** Object:  StoredProcedure [dbo].[sp_vw_home_partner_1]    Script Date: 11/30/2011 10:32:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_vw_home_consultor_1]
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
	   ent.nome_usuario entrevistador,
	   us.nome_usuario criador_status

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
	us.id=base.usuario_criacao

left join bc_usuario ent on
	ent.id=base.entrevistador	

where fups.ativo='1' and fups.home=1 and base.entrevistador=@usuario
and
(CONVERT(CHAR(10), CURRENT_TIMESTAMP, 103)=convert(char(10),dateadd(DAY,fups.qtd_dias,base.dt_alteracao),103)
or
CONVERT(CHAR(10), CURRENT_TIMESTAMP, 103)=convert(char(10),dateadd(day,1,base.dt_agendada),103))

order by 7,3
