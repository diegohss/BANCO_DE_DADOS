USE [havik]
GO

/****** Object:  StoredProcedure [dbo].[sp_proj_concorrentes]    Script Date: 09/20/2011 19:59:57 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Diego
-- Create date: 30/08/2011
-- Description:	Fará o Insert na bh_emp_concorrentes
-- =============================================
CREATE PROCEDURE [dbo].[sp_proj_concorrentes]
(
@tipo int,
@id_projeto int,
@concorrentes int,
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
	insert into bh_proj_concorrentes
	(
	id_projeto,
	id_concorrente,
	dt_alteracao,
	usuario_alteracao
	)
	values 
	(
	@id_projeto,
	@concorrentes,
	GETDATE(),
	@usuario
	
	)
	
		if @@error <> 0
		begin
		--	Set @erro=1
		--	Set @desc_erro = 'Ocorreu um erro ao atualizar....bla bla bla'
			set @retorno=0
		--	return (@erro)
		---	return (@desc_erro)
			return(@retorno)
		end
	   	else
	   	begin
	   		set @retorno=@@identity		
	   	--	set @erro=0
	   	--	set @desc_erro=''
	   		insert into bh_projeto (id_projeto,tp_mudanca,dt_alteracao,usuario_alteracao,tabela_alteracao)
			values (@retorno,'inserção',GETDATE(),@usuario,'bh_proj_concorrentes')		
	   		return(@retorno)		   		
	   	--	return (@erro)
		--	return (@desc_erro)
		end

end
	
		

end

	
				


GO


