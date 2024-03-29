USE [havik]
GO
/****** Object:  StoredProcedure [dbo].[sp_vw_cli_resposta]    Script Date: 04/02/2012 16:45:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_vw_cli_resposta]
(
@id_pergunta int = null, 
@id_cliente int = null
)
as

declare @teste int
set @teste=null
set @teste=(select distinct id_cliente from bh_cli_perguntas_respostas where id_cliente=@id_cliente and ((month(dt_alteracao)=month(GETDATE())) and (YEAR(dt_alteracao)=year(GETDATE())))) 
set @teste=ISNULL(@teste,0)

if @teste=0
begin
select base.id_resposta,
	   resp.descricao resposta

from bl_cli_perguntas_respostas base

left join br_cli_respostas resp on
	resp.id=base.id_resposta
	
where base.id_pergunta=@id_pergunta
end