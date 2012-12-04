USE [havik]
GO

/****** Object:  StoredProcedure [dbo].[sp_projeto]    Script Date: 09/20/2011 19:31:45 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Diego
-- Create date: 30/08/2011
-- Description:	Fará o Insert na bc_projeto
-- =============================================
CREATE PROCEDURE [dbo].[sp_projeto]
(
@tipo int,
@id_projeto int,
@id_empresa int,
@nome varchar(200),
@segmento int,
@area int,
@subdivisao int,
@cargo int,
@tipo_produto int,
@responsavel_captacao int,
@responsavel_entrega int,
@colaborador_responsavel int,
@usuario int,
@retorno int output
--@erro int output,
--@desc_erro varchar(100) output
)
		
AS
begin

	-- SET NOCOUNT ON added to prevent extra result sets from
	SET NOCOUNT ON;
-- Tipo 1 = Insert ; Tipo 2 = Update	
if @tipo=1
begin
	insert into bc_projeto
	(
	nome,
	id_empresa,
	segmento,
	area,
	subdivisao,
	cargo,
	tipo_produto,
	responsavel_captacao,
	responsavel_entrega,
	colaborador_responsavel,
	dt_criacao,
	usuario_criacao
	)
	values 
	(
	@nome,
	@id_empresa,
	@segmento,
	@area,
	@subdivisao,
	@cargo,
	@tipo_produto,
	@responsavel_captacao,
	@responsavel_entrega,
	@colaborador_responsavel,
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
			values (@retorno,'inserção',GETDATE(),@usuario,'bc_projeto')	
			
	   		return(@retorno)	
	   		
	   	--	return (@erro)
		--	return (@desc_erro)
		end

end	

		
if @tipo=2
begin

UPDATE bc_projeto
   SET       
	   responsavel_captacao=@responsavel_captacao
      ,responsavel_entrega=@responsavel_entrega
      ,colaborador_responsavel=@colaborador_responsavel
 WHERE id=@id_projeto
 
 
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
			values (@retorno,'update',GETDATE(),@usuario,'bc_projeto')	
			
	   		return(@retorno)	
	   		
	   	--	return (@erro)
		--	return (@desc_erro)
		end

end	


end

	
				


GO


