USE [havik]
GO
/****** Object:  StoredProcedure [dbo].[sp_vw_cli_projeto]    Script Date: 10/03/2011 19:15:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER procedure [dbo].[sp_vw_cli_projeto]
(
@id_cliente int,
@id_gerente int
)

as

SELECT base.id,
       base.id_cliente,
       base.id_projeto,
       proj.nome projeto,
       base.dt_criacao,
       col.nome_usuario

FROM bh_cli_projeto base

	left join bc_usuario col on
		col.id=base.usuario_criacao
		
	left join bc_projeto proj on
		proj.id=base.id_projeto		

where base.id_cliente=@id_cliente and proj.responsavel_entrega=@id_gerente

order by base.dt_criacao desc