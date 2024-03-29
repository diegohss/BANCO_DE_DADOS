USE [havik]
GO
/****** Object:  StoredProcedure [dbo].[sp_proj_site]    Script Date: 02/28/2012 16:11:58 ******/
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
@descricao varchar(4000) = null,
@resumo varchar(2000) = null,
@mostrar int,
@usuario int,
@retorno int output,
@titulo varchar(200) = null
)
		
AS
begin
	-- SET NOCOUNT ON added to prevent extra result sets from
	SET NOCOUNT ON;
	
declare @teste int

set @teste=0
set @teste=(select COUNT(*) from bc_proj_site where id_projeto=@id_projeto)

if @teste>=1
	begin 
		set @tipo=2
	end	

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
      ,titulo
	)
	values 
	(
	@id_projeto,
	@descricao,
	@resumo,
	@mostrar,
	GETDATE(),
	@usuario,
	@titulo	
	)
	

		if @@error <> 0
		begin
			set @retorno=0
			return(@retorno)
		end
	   	else
	   	begin
	   		set @retorno=1
	   		insert into bh_projeto(id_projeto,tp_mudanca,dt_alteracao,usuario_alteracao,tabela_alteracao)
			values (@id_projeto,'inserção',GETDATE(),@usuario,'bc_proj_site')
			return(@retorno)
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
       usuario_alteracao = @usuario,
       titulo=@titulo
 WHERE id_projeto = @id_projeto

		if @@error <> 0
		begin
			set @retorno=0
			return(@retorno)
		end
	   	else
	   	begin
	   		set @retorno=1
	   		insert into bh_projeto(id_projeto,tp_mudanca,dt_alteracao,usuario_alteracao,tabela_alteracao)
			values (@id_projeto,'update',GETDATE(),@usuario,'bc_proj_site')
			return(@retorno)
		end
		
end
end

	
				



