USE [havik]
GO

DECLARE	@return_value int

EXEC	@return_value = [dbo].[sp_teste_insert]
		@cnpj = N'14301200000169',
		@razao_social = N'Empresa Teste',
		@nome = N'Teste Ltda',
		@segmento = 2,
		@endereco = N'Rua Gastão Vidigal'

SELECT	'Return Value' = @return_value

GO
