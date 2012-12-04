USE [havik]
GO

/****** Object:  StoredProcedure [dbo].[sp_vw_proj_concorrentes]    Script Date: 09/21/2011 15:12:58 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[sp_vw_proj_concorrentes] (@id_projeto bigint)
as
SELECT base.id
      ,base.id_projeto
      ,base.id_concorrente
      ,emp.nome concorrente
      ,base.dt_alteracao
      ,col.nome_usuario
  FROM bh_proj_concorrentes base
  
  left join bc_empresa_unq emp on
	emp.id=base.id_concorrente
	
  left join bc_usuario col on
	col.id=base.usuario_alteracao
	
where id_projeto=@id_projeto
order by base.dt_alteracao desc
  
GO


