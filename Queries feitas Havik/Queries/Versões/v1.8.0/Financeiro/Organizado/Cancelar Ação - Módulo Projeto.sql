USE [havik]
GO
/****** Object:  StoredProcedure [dbo].[sp_proj_cancela_acao]    Script Date: 05/30/2012 18:54:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_proj_cancela_acao]
(
@id_projeto int,
@id_acao int,
@usuario int,
@retorno int output
)
as
begin
		INSERT INTO bh_fin_status
			 (
				    id_projeto
				   ,id_acao
				   ,id_status
				   ,usuario
				   ,dt_alteracao
			 )
			 VALUES
			 (
					@id_projeto,
					@id_acao,
					7,
					@usuario,
					GETDATE()
			)
set @retorno=1
return @retorno
end

