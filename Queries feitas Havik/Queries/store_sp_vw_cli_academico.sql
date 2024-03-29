USE [havik]
GO
/****** Object:  StoredProcedure [dbo].[sp_vw_cli_academico]    Script Date: 09/29/2011 17:34:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER procedure [dbo].[sp_vw_cli_academico]
(
@id_cliente int
)

as

SELECT 
	   base.id,
       base.id_cliente,
       base.id_escolaridade,
       esc.descricao escolaridade,
       base.instituicao,
       base.id_graduacao,
       grad.descricao graduacao,
       base.id_ano_formacao,
       ano.descricao ano_formacao,
       base.dt_alteracao,
       col.nome_usuario
      
FROM bh_cli_academico base

left join bc_usuario col on
	col.id=base.usuario_criacao
	
left join br_escolaridade esc on
	esc.id	=base.id_escolaridade
	
left join br_graduacao grad on
	grad.id=base.id_graduacao	
	
left join br_cli_ano_formacao ano on
	ano.id=base.id_ano_formacao

where base.id_cliente=@id_cliente
