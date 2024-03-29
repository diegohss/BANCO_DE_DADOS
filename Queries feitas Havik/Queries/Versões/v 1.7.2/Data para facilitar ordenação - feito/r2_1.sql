USE [havik]
GO
/****** Object:  StoredProcedure [dbo].[sp_vw_home_r2_1]    Script Date: 03/28/2012 17:12:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER procedure [dbo].[sp_vw_home_r2_1]
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
	   Convert(char(5),base.hora,108) hora,
	   ent.nome_usuario entrevistador,
	   fol.nome_usuario follow,
	   us.nome_usuario criador_status

from bh_cli_status base

left join (select st.id_cliente,st.id_projeto,MAX(st.id) id
from bh_cli_status st
group by st.id_cliente,st.id_projeto)ultimo on
	ultimo.id_cliente=base.id_cliente and
	ultimo.id_projeto=base.id_projeto

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
	
left join bc_usuario fol on
	fol.id=base.follow

where (us.cargo='r2') and fups.ativo='1' 
and (base.entrevistador=@usuario or base.follow=@usuario or base.usuario_criacao=@usuario) 
and fups.home=1
and
((CONVERT(CHAR(10), CURRENT_TIMESTAMP, 23)>=convert(char(10),dateadd(DAY,dbo.duteis(base.dt_alteracao,fups.qtd_dias),base.dt_alteracao),23)
or
CONVERT(CHAR(10), CURRENT_TIMESTAMP, 23)>=convert(char(10),dateadd(day,1,base.dt_agendada),23))
or
(fups.tp_retorno=2 and (CONVERT(CHAR(10), CURRENT_TIMESTAMP, 23)>=convert(char(10),base.dt_agendada,23)) ))
and
(base.id=ultimo.id)
--Não mostrar Projetos Antigos
and (
(convert(char(10),proj.dt_ini,23)>='2011-12-01' and proj.dt_fim is not null)
or
(proj.dt_fim is null)
)
