USE [havik_teste]
GO

/****** Object:  View [dbo].[vw_fin_periodo]    Script Date: 04/04/2012 15:44:43 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER view [dbo].[vw_fin_periodo]
as
select top 500 id, descricao 
from br_fin_periodo
order by descricao




GO


