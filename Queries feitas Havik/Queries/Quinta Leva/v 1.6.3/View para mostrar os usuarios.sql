USE [havik]
GO

/****** Object:  View [dbo].[vw_relat_colaborador]    Script Date: 03/08/2012 18:03:34 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE view [dbo].[vw_relat_usuarios]
as
select top 300
base.id,
base.nome_usuario
from bc_usuario base
where base.cargo not in ('excluir')
order by base.nome_usuario



GO


