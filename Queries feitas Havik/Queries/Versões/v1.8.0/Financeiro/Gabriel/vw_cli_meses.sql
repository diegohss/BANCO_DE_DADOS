USE [havik_teste]
GO

/****** Object:  View [dbo].[vw_cli_meses]    Script Date: 04/16/2012 16:13:12 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE view [dbo].[vw_cli_meses]
as
select top 500 id, descricao 
from br_meses
order by id



GO


