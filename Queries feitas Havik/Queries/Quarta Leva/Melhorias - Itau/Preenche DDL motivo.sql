USE [havik]
GO
/****** Object:  StoredProcedure [dbo].[sp_vw_cli_substatus]    Script Date: 02/10/2012 11:36:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_vw_cli_motivo]
(
@id int = null
)
as

SELECT mot.id_motivo,m.descricao motivo, mot.id_substatus


FROM bl_cli_substatus_motivo mot

left join br_cli_motivos m on
	m.id=mot.id_motivo

WHERE (mot.id_substatus = @id)

