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
-- Description:	Fará o Insert na bh_emp_financeiro
-- =============================================
create PROCEDURE [dbo].[sp_emp_financeiro]
(
@tipo int,
@id_empresa bigint,
@keyaccount bigint,
@sucesso money,
@renainer money,
@parcela_1 money,
@parcela_2 money,
@parcela_3 money,
@pagamento bigint,
@vencimento bigint,
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
	insert into bh_emp_financeiro
	(
	id_empresa,
	keyaccount,
	sucesso,
	renainer,
	parcela_1,
	parcela_2,
	parcela_3,
	pagamento,
	vencimento,
	dt_alteracao,
	usuario_alteracao
	)
	values 
	(
	@id_empresa,
	@keyaccount,
	@sucesso,
	@renainer,
	@parcela_1,
	@parcela_2,
	@parcela_3,
	@pagamento,
	@vencimento,
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
	values (@id_empresa,'inserção',GETDATE(),@usuario,'bh_emp_financeiro')
		

end

	
				

