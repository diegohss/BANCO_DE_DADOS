USE [havik]
GO

/****** Object:  StoredProcedure [dbo].[sp_vw_proj_status]    Script Date: 09/23/2011 09:41:07 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE procedure [dbo].[sp_vw_proj_status] (@id_projeto bigint)
as
SELECT base.id
	  ,base.id_status
	  ,stat.descricao status
      ,base.id_substatus
      ,sub.descricao substatus
      ,base.obs
      ,base.dt_alteracao
      ,col.nome_usuario
      
from bh_proj_status base      
  
  left join br_proj_status stat on
	stat.id=base.id_status
	
  left join br_proj_substatus sub on
	sub.id=base.id_substatus	
	
  left join bc_usuario col on
	col.id=base.usuario_alteracao
	
where base.id_projeto=@id_projeto
order by base.dt_alteracao desc
  

GO


