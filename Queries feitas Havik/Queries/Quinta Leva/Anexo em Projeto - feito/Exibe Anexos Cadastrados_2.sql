USE [havik]
GO
/****** Object:  StoredProcedure [dbo].[sp_vw_cli_anexos]    Script Date: 02/13/2012 17:14:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_vw_proj_carrega_anexos]
(
@id_projeto int 
)
as
select base.id,
	   ane.descricao tipo_anexo,
	   us.nome_usuario,
	   data_anexo=dbo.fn_dateformat(base.dt_criacao,12)

from bh_proj_anexos base

left join br_proj_tp_anexo ane on
	ane.id=base.tipo_anexo
	
left join bc_usuario us on
	us.id=base.usuario_criacao	
	
where base.id_projeto=@id_projeto
	
