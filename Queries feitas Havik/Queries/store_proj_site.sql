USE [havik]
GO

/****** Object:  StoredProcedure [dbo].[sp_proj_site]    Script Date: 09/21/2011 19:37:10 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		Diego
-- Create date: 30/08/2011
-- Description:	Fará o Insert na bh_proj_site
-- =============================================
CREATE PROCEDURE [dbo].[sp_proj_site]
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
	insert into bh_proj_site
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
	values (@id_projeto,'inserção',GETDATE(),@usuario,'bh_proj_site')
		
end
end

	
				



GO


