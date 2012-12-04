USE [havik]
GO
/****** Object:  StoredProcedure [dbo].[sp_cli_reseacher_obs]    Script Date: 09/19/2011 19:11:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Diego
-- Create date: 30/08/2011
-- Description:	Fará o Insert na bh_emp_obs
-- =============================================
create PROCEDURE sp_cli_reseacher_obs
(
@tipo int,
@id_cliente bigint,
@obs varchar(4000),
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
	insert into bh_cli_reseacher_obs
	(
	id_cliente,
	obs,
	dt_alteracao,
	usuario_alteracao
	)
	values 
	(
	@id_cliente,
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
	   			insert into bh_cliente(id_cliente,tp_mudanca,dt_alteracao,usuario_alteracao,tabela_alteracao)
				values (@id_cliente,'inserção',GETDATE(),@usuario,'bh_cli_reseacher_obs')
	   		set @retorno=1
	   		return(@retorno)	
	   		
		end
	
end
end

	
				

