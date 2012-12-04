USE [havik]
GO
/****** Object:  StoredProcedure [dbo].[sp_emp_fin_particularidades]    Script Date: 09/19/2011 19:11:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Diego
-- Create date: 30/08/2011
-- Description:	Fará o Insert na bh_emp_fin_particularidades
-- =============================================
create PROCEDURE [dbo].[sp_emp_fin_particularidades]
(
@tipo int,
@id_empresa bigint,
@particularidades varchar(500),
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
	insert into bh_fin_particularidades
	(
	id_empresa,
	particularidades,
	dt_alteracao,
	usuario_alteracao
	)
	values 
	(
	@id_empresa,
	@particularidades,
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
	values (@id_empresa,'inserção',GETDATE(),@usuario,'bh_emp_fin_particularidades')
		

end

	
				

