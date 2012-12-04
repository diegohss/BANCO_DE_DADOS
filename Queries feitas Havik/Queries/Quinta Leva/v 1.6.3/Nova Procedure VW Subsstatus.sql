USE [havik]
GO
/****** Object:  StoredProcedure [dbo].[sp_vw_relat_substatus]    Script Date: 03/07/2012 10:49:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[sp_vw_relat_substatus2]
(
@status int_list readonly
)
as

select distinct base.id_substatus,
	   sub.descricao substatus

from bl_cli_status_substatus base

left join br_cli_substatus sub on
	sub.id=base.id_substatus
	
where base.id_status in (select n from @status)	