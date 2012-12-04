USE [havik_teste]
GO

/****** Object:  View [dbo].[vw_fin_responsavel]    Script Date: 04/05/2012 11:01:47 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE view [dbo].[vw_fin_responsavel]
as
select top 400
base.id,
base.nome_usuario
from bc_usuario base
where base.cargo in ('partner','consultor','r2','outro','coordenador')
order by base.nome_usuario



GO


