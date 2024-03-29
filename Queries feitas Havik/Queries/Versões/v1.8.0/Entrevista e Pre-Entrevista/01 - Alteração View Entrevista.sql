USE [havik]
GO
/****** Object:  StoredProcedure [dbo].[sp_vw_cli_consultor_obs]    Script Date: 05/10/2012 13:57:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


ALTER procedure [dbo].[sp_vw_cli_consultor_obs] (@id_cliente bigint)
as
SELECT base.id
	  ,left(base.obs,15) mini_obs
	  ,base.obs 
	  ,dt_cadastro=dbo.fn_dateformat(base.dt_alteracao,12)
	  ,base.usuario_alteracao
      ,col.nome_usuario
      
from bh_cli_consultor_obs base      
  
  left join bc_usuario col on
	col.id=base.usuario_alteracao
	
where base.id_cliente=@id_cliente
order by base.dt_alteracao desc



