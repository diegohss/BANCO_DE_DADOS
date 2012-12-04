USE [havik_teste]
GO

/****** Object:  View [dbo].[vw_proj_acao]    Script Date: 04/04/2012 10:45:34 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

create view [dbo].[vw_proj_acao]
as
select top 500 id, descricao 
from br_acao
order by descricao


GO


