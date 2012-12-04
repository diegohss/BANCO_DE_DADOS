USE [havik]
GO

/****** Object:  StoredProcedure [dbo].[vw_sp_emp_fin_impostos]    Script Date: 09/21/2011 15:05:51 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


create procedure dbo.sp_vw_emp_fin_impostos (@id_empresa bigint)
as
SELECT base.id
      ,base.id_empresa
      ,base.id_imposto
      ,imp.descricao imposto
      ,imp.aliquota
      ,base.dt_alteracao
      ,col.nome_usuario
  FROM havik.dbo.bh_emp_fin_impostos base
  
  left join br_impostos imp on
	imp.id=base.id_imposto
	
  left join bc_usuario col on
	col.id=base.usuario_alteracao
  
where base.id_empresa=@id_empresa
order by base.dt_alteracao desc
  

GO


