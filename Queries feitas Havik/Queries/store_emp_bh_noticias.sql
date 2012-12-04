USE [havik]
GO
/****** Object:  StoredProcedure [dbo].[sp_emp_noticias]    Script Date: 09/19/2011 19:11:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Diego
-- Create date: 30/08/2011
-- Description:	Fará o Insert na bh_emp_noticias
-- =============================================
create PROCEDURE [dbo].[sp_emp_noticias]
(
@tipo int,
@id_empresa bigint,
@noticias varchar(4000),
@usuario int
)
		
AS
begin
	-- SET NOCOUNT ON added to prevent extra result sets from
	SET NOCOUNT ON;
	DECLARE @retorno int
-- Tipo 1 = Insert ; Tipo 2 = Update	
if @tipo=1
begin
	insert into bh_emp_noticias
	(
	id_empresa,
	news,
	dt_alteracao,
	usuario_alteracao
	)
	values 
	(
	@id_empresa,
	@noticias,
	GETDATE(),
	@usuario
	
	)
	
	set @retorno=@@identity		

		if @@error <> 0
		begin
			return(@@error)
		end
	   	else
	   		return(@retorno)	
		end
	
	insert into bh_empresa (id_empresa,tp_mudanca,dt_alteracao,usuario_alteracao,tabela_alteracao)
	values (@id_empresa,'inserção',GETDATE(),@usuario,'bh_emp_noticias')
		

end

	
				

