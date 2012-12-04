USE [havik]
GO

/****** Object:  StoredProcedure [dbo].[sp_vw_proj_perfil]    Script Date: 12/02/2011 16:18:37 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[sp_vw_proj_perfil] (@id_projeto int)
as
SELECT base.id
      ,base.id_projeto
      ,base.perfil id_perfil
      ,pfl.descricao perfil
      ,dt_cadastro=dbo.fn_dateformat(base.dt_criacao,12)
      ,col.nome_usuario
      
  FROM havik.dbo.bh_proj_perfil base
  
  left join br_proj_perfil pfl on
	pfl.id=base.perfil
  
  left join bc_usuario col on
	col.id=base.usuario_criacao
  
  where base.id_projeto=@id_projeto
  
order by pfl.descricao




GO


