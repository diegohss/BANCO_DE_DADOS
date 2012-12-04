USE [havik_teste]
GO

/****** Object:  View [dbo].[vw_proj_colaborador]    Script Date: 03/02/2012 10:09:52 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO





CREATE view [dbo].[vw_cli_indicado]
as
select top 300
base.id,
base.nome_usuario
from bc_usuario base
where base.cargo not in ('excluir')
order by base.nome_usuario





GO


