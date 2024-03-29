USE [havik]
GO
/****** Object:  StoredProcedure [dbo].[sp_vw_cli_status]    Script Date: 03/28/2012 17:28:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER procedure [dbo].[sp_vw_cli_status]
(
@id_cliente int
)
as

SELECT 
	   base.id,
       base.id_cliente,
       base.id_status,
       base.id_projeto,
       proj.nome projeto,
       '' indicado_por,
       stat.descricao status,
       base.id_substatus,
       sub.descricao substatus,
       mot.descricao motivo,
       fup.nome_usuario follow,
       ent.nome_usuario entrevistador,
       base.dt_agendada dt_agendada,
       base.hora,
       --CONVERT(VARCHAR(5),base.hora, 108) hora,
       base.obs,
       base.dt_alteracao dt_cadastro,
--       dt_cadastro=dbo.fn_dateformat(base.dt_alteracao,12),
       col.nome_usuario,
       base.exibir
       
FROM bh_cli_status base

left join bc_projeto proj on
	proj.id=base.id_projeto

left join bc_usuario col on
	col.id=base.usuario_criacao
	
left join bc_usuario ent on
	ent.id=base.entrevistador
	
left join bc_usuario fup on
	fup.id=base.follow
	
left join br_cli_status stat on
	stat.id=base.id_status

left join br_cli_substatus sub on
	sub.id=base.id_substatus
	
left join br_cli_motivos mot on
	mot.id=base.id_motivo	
	
where base.id_cliente=@id_cliente and base.exibir=1

order by base.id desc,base.dt_alteracao