USE [havik]
GO

/****** Object:  StoredProcedure [dbo].[sp_proj_obs]    Script Date: 09/21/2011 16:20:23 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Diego
-- Create date: 30/08/2011
-- Description:	Fará o Insert na bh_proj_obs
-- =============================================
CREATE PROCEDURE [dbo].[sp_proj_obs]
(
@tipo int,
@id_projeto bigint,
@obs varchar(4000),
@usuario int
)
		
AS
begin
	-- SET NOCOUNT ON added to prevent extra result sets from
	SET NOCOUNT ON;
	DECLARE @retorno int
-- Tipo 1 = Insert ; Tipo 2 = Update	
if @tipo=1
begin
	insert into bh_proj_obs
	(
	id_projeto,
	obs,
	dt_alteracao,
	usuario_alteracao
	)
	values 
	(
	@id_projeto,
	@obs,
	GETDATE(),
	@usuario	
	)
	
	set @retorno=@@identity		

		if @@error <> 0
		begin
			return(@@error)
		end
	   	else
	   	begin
	   		return(@retorno)	
		end
	
	insert into bh_projeto(id_projeto,tp_mudanca,dt_alteracao,usuario_alteracao,tabela_alteracao)
	values (@id_projeto,'inserção',GETDATE(),@usuario,'bh_proj_obs')
		
end
end

	
				


GO


