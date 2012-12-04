USE [havik]
GO

/****** Object:  StoredProcedure [dbo].[sp_area]    Script Date: 08/31/2011 10:45:35 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_area]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_area]
GO

USE [havik]
GO

/****** Object:  StoredProcedure [dbo].[sp_area]    Script Date: 08/31/2011 10:45:35 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Diego
-- Create date: 30/08/2011
-- Description:	Fará o Insert na  
-- =============================================
CREATE PROCEDURE [dbo].[sp_area]
(
@tipo int,
@id_area int,
@descricao bigint,
@id_usuario bigint,
@retorno varchar(20) output
)
		
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	SET NOCOUNT ON;
-- Tipo 1 = Insert ; Tipo 2 = Update	
if @tipo=1
begin
	insert into br_area(descricao,usuario_criacao,dt_criacao)
	values (@descricao,@id_usuario,GETDATE())
	set @retorno=@@identity
	
		if @@error <> 0
	   begin
	   rollback transaction
	   return(1)
	   end
		else

		begin	 
		   commit transaction
		   return(@retorno)	
		end
end	

if @tipo=2
begin
	update br_area
	set descricao=@descricao,
		usuario_criacao=@id_usuario,dt_criacao=GETDATE()
	where id=@id_area
	
	set @retorno=@@identity
	
		if @@error <> 0
	   begin
	   rollback transaction
	   return(1)
	   end
		else

		begin	 
		   commit transaction
		   return(@retorno)	
		end
end

	
END

GO


