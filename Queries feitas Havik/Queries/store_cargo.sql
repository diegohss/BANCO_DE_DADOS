-- ================================================
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF ( OBJECT_ID('dbo.sp_cargo') IS NOT NULL ) 
   DROP PROCEDURE dbo.sp_cargo
GO
-- =============================================
-- Author:		Diego
-- Create date: 30/08/2011
-- Description:	Fará o Insert na  
-- =============================================
CREATE PROCEDURE sp_cargo
(
@tipo int,
@id_cargo int,
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
	insert into br_cargo(descricao,usuario_criacao,dt_criacao)
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
