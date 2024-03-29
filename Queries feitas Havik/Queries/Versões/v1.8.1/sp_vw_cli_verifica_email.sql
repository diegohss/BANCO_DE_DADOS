USE [havik]
GO
/****** Object:  StoredProcedure [dbo].[sp_vw_cli_verifica_email]    Script Date: 07/13/2012 10:01:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER procedure [dbo].[sp_vw_cli_verifica_email]
(
@email varchar(200),
@retorno int output
)
as
begin
set @retorno = 1
end

begin
if exists	(	select 1 from bh_cli_email
				where LTRIM(RTRIM(descricao)) = LTRIM(RTRIM(@email))
			)
set @retorno = 0
end

return @retorno