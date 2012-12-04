USE [havik_teste]
GO

/****** Object:  View [dbo].[vw_fin_status]    Script Date: 05/02/2012 16:06:31 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

create view [dbo].[vw_fin_nota]
as
SELECT TOP 100 [id]
      ,[descricao]
  FROM br_fin_nota
order by descricao  
GO


