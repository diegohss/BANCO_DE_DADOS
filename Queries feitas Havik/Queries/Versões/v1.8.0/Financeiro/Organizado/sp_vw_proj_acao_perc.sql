USE [havik]
GO

/****** Object:  StoredProcedure [dbo].[sp_vw_proj_acao_perc]    Script Date: 06/07/2012 18:02:13 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[sp_vw_proj_acao_perc]
(
@id_projeto int = null
)
as

select sum(fin.acumulado) valor_fatura

from bh_proj_financeiro fin

where fin.id_projeto=@id_projeto and fin.faturar=1 and fin.acao<>5
GO


