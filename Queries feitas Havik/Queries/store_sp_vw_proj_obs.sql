USE [havik]
GO

/****** Object:  StoredProcedure [dbo].[sp_vw_proj_obs]    Script Date: 09/23/2011 09:41:07 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE procedure [dbo].[sp_vw_proj_obs] (@id_projeto bigint)
as
SELECT base.id
	  ,base.obs
	  ,base.dt_alteracao
      ,col.nome_usuario
      
from bh_proj_obs base      
  
  left join bc_usuario col on
	col.id=base.usuario_alteracao
	
where base.id_projeto=@id_projeto
order by base.dt_alteracao desc



