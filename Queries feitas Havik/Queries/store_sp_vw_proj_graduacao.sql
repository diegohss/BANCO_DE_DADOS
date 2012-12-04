USE [havik]
GO

/****** Object:  StoredProcedure [dbo].[sp_vw_proj_idiomas]    Script Date: 09/21/2011 15:16:33 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[sp_vw_proj_graduacao] (@id_projeto bigint)
as
SELECT base.id
      ,base.id_projeto
      ,base.graduacao id_graduacao
      ,grad.descricao graduacao
      ,base.nvl_graduacao id_nvl_graduacao
      ,nv_grad.descricao nivel_graduacao
      ,base.dt_criacao
      ,col.nome_usuario        
      
  FROM bh_proj_graduacao base
  
  left join bc_usuario col on
	col.id=base.usuario_criacao
	
  left join br_graduacao grad on
	grad.id=base.graduacao

  left join	br_nv_graduacao nv_grad on
	nv_grad.id=base.nvl_graduacao
	

where base.id_projeto=@id_projeto
order by base.dt_criacao desc
  


GO


