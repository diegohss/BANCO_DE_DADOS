USE [havik]
GO

/****** Object:  StoredProcedure [dbo].[sp_proj_status]    Script Date: 09/21/2011 16:47:23 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Diego
-- Create date: 30/08/2011
-- Description:	Fará o Insert na bh_proj_status
-- =============================================
CREATE PROCEDURE [dbo].[sp_proj_status]
(
@tipo int,
@id_projeto int,
@id_status int,
@id_substatus int,
@obs varchar(4000) = null,
@usuario int,
@retorno int output
)
		
AS
begin
	-- SET NOCOUNT ON added to prevent extra result sets from
	SET NOCOUNT ON;
-- Tipo 1 = Insert ; Tipo 2 = Update	
if @tipo=1
begin
	insert into bh_proj_status
	(
	id_projeto,
	id_status,
	id_substatus,
	obs,
	dt_alteracao,
	usuario_alteracao
	)
	values 
	(
	@id_projeto,
	@id_status,
	@id_substatus,
	@obs,
	GETDATE(),
	@usuario
	)
	
	set @retorno=@@identity		

		if @@error <> 0
		begin
			set @retorno=0
			return(@retorno)
		end
	   	else
	   	begin
	   		insert into bh_projeto (id_projeto,tp_mudanca,dt_alteracao,usuario_alteracao,tabela_alteracao)
			values (@id_projeto,'inserção',GETDATE(),@usuario,'bh_proj_status')
	   		return(@retorno)
		end
	
end	
		

end
