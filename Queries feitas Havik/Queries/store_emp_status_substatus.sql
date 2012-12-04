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

IF ( OBJECT_ID('dbo.sp_emp_status_substatus') IS NOT NULL ) 
   DROP PROCEDURE dbo.sp_emp_status_substatus
GO
-- =============================================
-- Author:		Diego
-- Create date: 30/08/2011
-- Description:	Fará o Insert na  
-- =============================================
CREATE PROCEDURE sp_emp_status_substatus
(
@tipo int,
@id_status bigint,
@id_substatus bigint,
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
	insert into bl_emp_status_substatus(id_status,id_substatus,usuario_criacao,dt_criacao)
	values (@id_status,@id_substatus,@id_usuario,GETDATE())
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
	update bl_emp_status_substatus
	set id_status=@id_status,id_substatus=@id_substatus,
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
