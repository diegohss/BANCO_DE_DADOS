USE [havik]
GO
/****** Object:  StoredProcedure [dbo].[sp_vw_proj_aliquota]    Script Date: 06/05/2012 10:18:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_vw_proj_aliquota]
(
@id_imposto int = null
)
as
select aliquota,aliquota_net,verificar
from br_impostos imp
where imp.id=@id_imposto
