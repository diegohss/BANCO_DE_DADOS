USE [havik_teste]
GO
/****** Object:  StoredProcedure [dbo].[sp_vw_relat_descrelat]    Script Date: 05/28/2012 14:57:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER procedure [dbo].[sp_vw_relat_descrelat]
(
@tipo int=null
)
as

select base.obs,base.nome_procedure

from br_relat_tipos base

where base.id=@tipo