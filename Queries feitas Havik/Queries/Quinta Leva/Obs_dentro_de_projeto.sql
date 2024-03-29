USE [havik]
GO
/****** Object:  StoredProcedure [dbo].[sp_vw_proj_obs]    Script Date: 02/13/2012 17:56:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


ALTER procedure [dbo].[sp_vw_proj_obs] (@id_projeto bigint)
as
SELECT base.id
	  ,left(base.obs,40) mini_obs
	  ,base.obs
	  ,dt_cadastro=dbo.fn_dateformat(base.dt_alteracao,12)
	  ,col.nome_usuario
      
from bh_proj_obs base      
  
  left join bc_usuario col on
	col.id=base.usuario_alteracao
	
where base.id_projeto=@id_projeto
order by base.dt_alteracao desc



