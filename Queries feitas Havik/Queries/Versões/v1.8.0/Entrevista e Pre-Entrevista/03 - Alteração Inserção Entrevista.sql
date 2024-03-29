USE [havik]
GO
/****** Object:  StoredProcedure [dbo].[sp_cli_consultor_obs]    Script Date: 05/10/2012 13:38:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Diego
-- Create date: 30/08/2011
-- Description:	Fará o Insert / Update na bh_emp_obs
-- =============================================
ALTER PROCEDURE [dbo].[sp_cli_consultor_obs]
(
@tipo int,
@id_cliente bigint,
@id_linha int = null,
@obs varchar(4000),
@usuario int,
@retorno int output
)
		
AS
begin

-- Verifica se é uma atualização ou inserção
set @id_linha=isnull(@id_linha,'')
if @id_linha<>'' 
begin
set @tipo=2
end
else
begin
set @tipo=1
end


	-- SET NOCOUNT ON added to prevent extra result sets from
	SET NOCOUNT ON;
-- Tipo 1 = Insert ; Tipo 2 = Update	
if @tipo=1
begin
	insert into bh_cli_consultor_obs
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
	
		if @@error <> 0
		begin
			set @retorno=0
			return(@retorno)
		end
	   	else
	   	begin
	   		set @retorno=1	
	   		insert into bh_cliente (id_cliente,tp_mudanca,dt_alteracao,usuario_alteracao,tabela_alteracao)
			values (@id_cliente,'inserção',GETDATE(),@usuario,'bh_cli_consultor_obs')		
	   		return(@retorno)			   		
		end
	
end

if @tipo=2
begin

		update bh_cli_consultor_obs
		set obs=@obs,
			dt_alteracao=GETDATE()
		where id=@id_linha


		if @@error <> 0
		begin
			set @retorno=0
			return(@retorno)
		end
	   	else
	   	begin
	   		set @retorno=1	
	   		insert into bh_cliente (id_cliente,tp_mudanca,dt_alteracao,usuario_alteracao,tabela_alteracao)
			values (@id_cliente,'update',GETDATE(),@usuario,'bh_cli_consultor_obs')		
	   		return(@retorno)			   		
		end

end

end

	
				

