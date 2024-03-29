USE [havik]
GO
/****** Object:  StoredProcedure [dbo].[sp_relat_prest_contas_2]    Script Date: 06/15/2012 14:14:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

alter procedure [dbo].[sp_relat_inconsistencias]
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
-- Id_Cliente, Responsavel Obs (Usuario - Registrou), Data Obs,Responsavel Nota (Usuario - Registrou), Data Nota,
-- Responsavel Status Agendada, Data Status Agendada,(Contato - Entrevista Havik Agendada e Reagendada)
-- Responsavel Status Aprovação, Data Status Aprovação(Entrevista Havik - Aprovado Havik Shortlist)  
begin
select distinct lider.nome_usuario equipe,nota.id_cliente, 
	   usobs.nome_usuario usuario_obs,CONVERT(char(10),obs.dt_alteracao,23) data_obs,
	   usnota.nome_usuario usuario_nota,CONVERT(char(10),nota.dt_alteracao,23) data_nota,
	   case when ((status.id_status=2 and status.id_substatus=13) or (status.id_status=3 and status.id_substatus=17))
	   then us.nome_usuario
	   end resp_agendamento,
	   case when ((status.id_status=2 and status.id_substatus=13) or (status.id_status=3 and status.id_substatus=17))
	   then CONVERT(char(10),status.dt_alteracao,23)
	   end data_agendamento, 	   
	   case when (status.id_status=3 and status.id_substatus=18)
	   then us.nome_usuario
	   end resp_aprovacao,
	   case when (status.id_status=3 and status.id_substatus=18)
	   then CONVERT(char(10),status.dt_alteracao,23)
	   end data_aprovacao

	   
from bc_cliente base
 
left join bc_cli_consultor nota on
	nota.id_cliente=base.id
	
left join bh_cli_consultor_obs obs on
	obs.id_cliente=nota.id_cliente and
	obs.usuario_alteracao=nota.usuario_alteracao
	
-- Ultimo Status
inner join (
select distinct 
	ult.usuario_criacao,
	ult.id_cliente,
	ult.id_status,
	st.descricao status,
	ult.id_substatus,
	sub.descricao substatus,
	ult.id_projeto,
	ult.dt_alteracao
		
from (select st.id_cliente,max(st.id) id
from bh_cli_status st
where ((st.id_status=2 and st.id_substatus=13 and st.exibir=1) or 
(st.id_status=3 and st.id_substatus=17 and st.exibir=1) or
(st.id_status=3 and st.id_substatus=18 and st.exibir=1))
group by st.id_cliente)ult_st

left join bh_cli_status ult on
	ult.id=ult_st.id

left join br_cli_status st on
	st.id=ult.id_status		

left join br_cli_substatus sub on
	sub.id=ult.id_substatus		
			
)status on
	status.id_cliente=obs.id_cliente
	
left join bc_cliente cli on
	cli.id=obs.id_cliente	
	
left join bc_usuario us on
	us.id=status.usuario_criacao
	
left join bc_usuario usobs on
	usobs.id=obs.usuario_alteracao
	
left join bc_usuario usnota on
	usnota.id=nota.usuario_alteracao	
	
left join br_equipe eq on
	eq.id_colaborador=status.usuario_criacao
	
left join bc_usuario lider on
	lider.id=eq.id_lider		
	
where (obs.usuario_alteracao is not null) and
((convert(char(10),nota.dt_alteracao,23) between convert(char(10),@dt_ini,23) and convert(char(10),@dt_fim,23))
and
(convert(char(10),obs.dt_alteracao,23) between convert(char(10),@dt_ini,23) and convert(char(10),@dt_fim,23)))
and 
((obs.usuario_alteracao=@colaborador or @colaborador is null) or 
(nota.usuario_alteracao=@colaborador or @colaborador is null))
and
(status.id_projeto in (select n from @projetos) or not exists (select n from @projetos))
and
(status.id_status in (select n from @status) or not exists (select n from @status)) 
and
(status.id_substatus in (select n from @substatus) or not exists (select n from @substatus)) 

/*where (proj.responsavel_captacao=@captacao or @captacao is null) and (proj.responsavel_entrega=@entrega or @entrega is null)
	  and (proj.colaborador_responsavel=@colab or @colab is null)	
	  and (convert(char(10),base.dt_alteracao,23) between convert(char(10),@dt_ini,23) and convert(char(10),@dt_fim,23))
	  --and (pre.id is not null)
			   
GROUP BY GROUPING SETS((proj.id,proj.nome,stat.descricao,sub.descricao,mot.descricao),proj.nome,())*/
end

INSERT INTO bh_relatorios
(
modulo,
tipo,
dt_alteracao,
usuario
)
VALUES
(
'relatorios',
@tipo_relat,
GETDATE(),
@usuario
)


