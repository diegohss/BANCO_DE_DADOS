USE [havik]
GO
/****** Object:  StoredProcedure [dbo].[sp_vw_emp_obs]    Script Date: 10/05/2011 17:49:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create procedure sp_vw_cli_researcher_obs (@id_cliente bigint)
as
SELECT base.id
	  ,left(base.obs,15) mini_obs
	  ,base.obs 
	  ,base.dt_alteracao
      ,col.nome_usuario
      
from bh_cli_researcher_obs base      
  
  left join bc_usuario col on
	col.id=base.usuario_alteracao
	
where base.id_cliente=@id_cliente
order by base.dt_alteracao desc



