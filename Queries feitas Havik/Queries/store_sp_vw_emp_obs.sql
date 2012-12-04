USE [havik]
GO

/****** Object:  StoredProcedure [dbo].[sp_vw_emp_obs]    Script Date: 09/23/2011 09:41:07 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE procedure [dbo].[sp_vw_emp_obs] (@id_empresa bigint)
as
SELECT base.id
	  ,base.obs
	  ,base.dt_alteracao
      ,col.nome_usuario
      
from bh_emp_obs base      
  
  left join bc_usuario col on
	col.id=base.usuario_alteracao
	
where base.id_empresa=@id_empresa
order by base.dt_alteracao desc



