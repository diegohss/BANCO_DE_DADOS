USE [havik]
GO

/****** Object:  StoredProcedure [dbo].[vw_emp_fin_impostos]    Script Date: 09/19/2011 22:15:37 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[vw_emp_fin_impostos]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[vw_emp_fin_impostos]
GO

USE [havik]
GO

/****** Object:  StoredProcedure [dbo].[vw_emp_fin_impostos]    Script Date: 09/19/2011 22:15:37 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[vw_emp_fin_impostos] (@id_empresa bigint)
as
SELECT [id]
      ,[id_empresa]
      ,[id_imposto]
      ,[dt_alteracao]
      ,[usuario_alteracao]
  FROM [havik].[dbo].[bh_emp_fin_impostos]
where [id_empresa]=@id_empresa
order by [dt_alteracao] desc
  
GO


