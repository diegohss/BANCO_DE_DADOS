USE [havik]
GO
/****** Object:  StoredProcedure [dbo].[sp_proj_site]    Script Date: 10/13/2011 19:17:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		Diego
-- Create date: 30/08/2011
-- Description:	Fará o Insert na bh_proj_obs
-- =============================================
ALTER PROCEDURE [dbo].[sp_proj_site]
(
@tipo int,
@id_projeto bigint,
@descricao varchar(4000),
@resumo varchar(2000),
@mostrar int,
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
	insert into bc_proj_site
	(
       id_projeto
      ,descricao_completa
      ,resumo_descricao
      ,mostrar_site
      ,dt_alteracao
      ,usuario_alteracao
	)
	values 
	(
	@id_projeto,
	@descricao,
	@resumo,
	@mostrar,
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
	   		return(@retorno)	
	   		insert into bh_projeto(id_projeto,tp_mudanca,dt_alteracao,usuario_alteracao,tabela_alteracao)
			values (@id_projeto,'inserção',GETDATE(),@usuario,'bc_proj_site')
		end
end	

if @tipo=2
begin
UPDATE bc_proj_site
   SET 
       descricao_completa = @descricao,
       resumo_descricao = @resumo,
       mostrar_site = @mostrar,
       dt_alteracao = GETDATE(),
       usuario_alteracao = @usuario
 WHERE id_projeto = @id_projeto

		if @@error <> 0
		begin
			set @retorno=0
			return(@retorno)
		end
	   	else
	   	begin
	   		set @retorno=1
	   		return(@retorno)	
	   		insert into bh_projeto(id_projeto,tp_mudanca,dt_alteracao,usuario_alteracao,tabela_alteracao)
			values (@id_projeto,'update',GETDATE(),@usuario,'bc_proj_site')
		end
		
end
end

	
				



