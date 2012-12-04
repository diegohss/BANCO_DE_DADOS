-- ================================================
-- Template generated from Template Explorer using:
-- Create Procedure (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the procedure.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF ( OBJECT_ID('dbo.sp_area_subdivisao') IS NOT NULL ) 
   DROP PROCEDURE dbo.sp_area_subdivisao
GO
-- =============================================
-- Author:		Diego
-- Create date: 30/08/2011
-- Description:	Fará o Insert na  
-- =============================================
CREATE PROCEDURE sp_area_subdivisao
(
@tipo int,
@id_area bigint,
@id_subdivisao bigint,
@id_usuario bigint,
@retorno bigint output
)
		
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	SET NOCOUNT ON;
-- Tipo 1 = Insert ; Tipo 2 = Update	
if @tipo=1
begin
	insert into bl_area_subdivisao(id_subdivisao,id_area,usuario_criacao,dt_criacao)
	values (@id_subdivisao,@id_area,@id_usuario,GETDATE())
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
/*
if @tipo=1
begin
	update bl_area_subdivisao
	set id_subdivisao=@id_subdivisao,id_area=@id_area,
		usuario_criacao=@id_usuario,dt_criacao=GETDATE())
	where id=@id
	
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
*/

	
END
GO
