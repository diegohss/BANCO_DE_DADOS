USE [havik]
GO

/****** Object:  View [dbo].[vw_proj_responsavel]    Script Date: 03/12/2012 13:34:24 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE view [dbo].[vw_proj_equipe]
as
select top 400
base.id,
base.nome_usuario
from bc_usuario base
where base.cargo in ('partner')
order by base.nome_usuario



GO


