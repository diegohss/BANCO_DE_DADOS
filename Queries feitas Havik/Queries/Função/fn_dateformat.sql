/* 
Este script permite criar a fun��o dbo.fn_dateformat a qual possibilita a formata��o de uma 
data em at� 12 formatos diferentes.

Coloque o script sobre o Query Analyzer e execute o script na base de dados onde deseja que 
a fun��o seja criada.

OBS: Se desejar, use este script como um template para desenvolver sua pr�pria fun��o.

*/

USE HAVIK
GO
IF EXISTS (SELECT [name] FROM sysobjects WHERE id = object_id('dbo.fn_dateformat') and xtype='FN')
	DROP FUNCTION dbo.fn_dateformat
GO
CREATE FUNCTION dbo.fn_dateformat (@data smalldateTime, @formato int)
/***************************************************************************
Esta fun��o permite formatar uma data em um dos formatos abaixo.

Par�metros:
@data - data a ser formatada
@formato - determina o formato de sa�da para a data

Op��es de formato:
	1 - dia/mes/ano		->> 31/08/2005 (Default)
	2 - dia-mes-ano		->> 31-08-2005	
	3 - Somente dia		->> 31
	4 - Somente M�s		->> 08
	5 - Somente Ano		->> 2005
	6 - mes/dia/ano		->> 08/31/2005
	7 - mes-dia-ano		->> 08-31-2005
	8 - Formato Longo 	->> 31 de Agosto de 2005
	9 - Formato Curto 	->> 31-Agosto-2005
	10 - M�s/Ano	 	->> Agosto/2005
	11 - M�s/Ano	 	->> 08/2005
	12 - Dia/Hora	 	->> 31-08-2005 13:14

Exemplo:SELECT dbo.fn_dateformat(getdate(),1) as [dia/mes/ano]
		SELECT dbo.fn_dateformat(getdate(),10) as [Mes/Ano]
		SELECT dbo.fn_dateformat(getdate(),12) as [Dia/Hora]

Autor: Nilton Pinheiro
Website: http://www.mcdbabrasil.com.br
Baseado no Original: http://www.sqlservercentral.com/scripts/contributions/1568.asp
*******************************************************************************/

-- Retorna data como string
RETURNS nvarchar(20)
AS
BEGIN
	DECLARE @Datafmt nvarchar(20)
	-- Verifica se a data � v�lida
	IF @data Is Null SET @Datafmt = ''

	-- dia-mes-ano		
	ELSE IF @formato = 2
		BEGIN
			IF Day(@data) < 10 
				SET @Datafmt = '0' + Convert(varchar(2), Day(@data))
			ELSE 
				SET @Datafmt = Convert(varchar(2),Day(@data))
			SET @Datafmt = @Datafmt + '-'
			-- concatena o mes
			IF Month(@data) < 10 
				SET @Datafmt = (@Datafmt + '0' + Convert(varchar(2), Month(@data)))
			ELSE 
				SET @Datafmt = (@Datafmt + Convert(varchar(2), Month(@data)))
			SET @Datafmt = @Datafmt + '-'
			-- concatena o ano
			SET @Datafmt = @Datafmt + (SELECT Convert(varchar(4), Year(@data)))
		END
	-- somente dia
	ELSE IF @formato = 3
		BEGIN			
			IF Day(@data) < 10 
				SET @Datafmt = ('0' + CONVERT(varchar(2), Day(@data)))
			ELSE 
				SET @Datafmt = (Convert(varchar(2), Day(@data)))
		END
	-- somente m�s
	ELSE IF @formato = 4
		BEGIN			
			IF Month(@data) < 10 
				SET @Datafmt = '0' + Convert(varchar(2), Month(@data))
			ELSE 
				SET @Datafmt = Convert(varchar(2), Month(@data))
		END
	-- somente Ano
	ELSE IF @formato = 5
		BEGIN
			SET @Datafmt = (SELECT Convert(varchar(4), Year(@data)))
		END
	-- mes/dia/ano
	ELSE IF @formato = 6
		BEGIN
			IF Month(@data) < 10 
				SET @Datafmt = '0' + Convert(varchar(2), Month(@data))
			ELSE 
				SET @Datafmt = Convert(varchar(2), Month(@data))
			SET @Datafmt = @Datafmt + '/'
			-- concatena o dia
			IF Day(@data) < 10 
				SET @Datafmt = (@Datafmt + '0' + Convert(varchar(2), Day(@data)))
			ELSE 
				SET @Datafmt = (@Datafmt + Convert(varchar(2), Day(@data)))
			SET @Datafmt = @Datafmt + '/'
			-- concatena o ano
			SET @Datafmt = @Datafmt + (SELECT Convert(varchar(4), Year(@data)))
		END
	-- mes-dia-ano
	ELSE IF @formato = 7
		BEGIN
			IF Month(@data) < 10 
				SET @Datafmt = '0' + Convert(varchar(2), Month(@data))
			ELSE 
				SET @Datafmt = Convert(varchar(2), Month(@data))
			SET @Datafmt = @Datafmt + '-'
			-- concatena o dia
			IF Day(@data) < 10 
				SET @Datafmt = (@Datafmt + '0' + Convert(varchar(2), Day(@data)))
			ELSE 
				SET @Datafmt = (@Datafmt + Convert(varchar(2), Day(@data)))
			SET @Datafmt = @Datafmt + '-'
			-- concatena o ano
			SET @Datafmt = @Datafmt + (SELECT Convert(varchar(4), Year(@data)))
		END
	-- Formato Longo
	ELSE IF @formato = 8
		BEGIN
			IF Day(@data) < 10 
				SET @Datafmt = ('0' + Convert(varchar(2), Day(@data)))
			ELSE 
				SET @Datafmt =  Convert(varchar(2), Day(@data))
			SET @Datafmt = @Datafmt + ' de '
			-- concatena o m�s
			SET @Datafmt = @Datafmt + CASE Month(@data)
				WHEN 1 THEN 'Janeiro'
				WHEN 2 THEN 'Fevereiro'
				WHEN 3 THEN 'Mar�o'
				WHEN 4 THEN 'Abril'
				WHEN 5 THEN 'Maio'
				WHEN 6 THEN 'Junho'
				WHEN 7 THEN 'Julho'
				WHEN 8 THEN 'Agosto'
				WHEN 9 THEN 'Setembro'
				WHEN 10 THEN 'Outubro'
				WHEN 11 THEN 'Novembro'
				ELSE 'Dezembro'
				END		
			SET @Datafmt = @Datafmt + ' de '
			-- concatena o ano
			SET @Datafmt = @Datafmt + (SELECT Convert(varchar(4), Year(@data)))
		END
	-- Formato Curto
	ELSE IF @formato = 9
		BEGIN
			IF Day(@data) < 10 
				SET @Datafmt = ('0' + Convert(varchar(2), Day(@data)))
			ELSE 
				SET @Datafmt =  Convert(varchar(2), Day(@data))
			SET @Datafmt = @Datafmt + '-'
			-- concatena o m�s
			SET @Datafmt = @Datafmt + CASE Month(@data)
				WHEN 1 THEN 'Janeiro'
				WHEN 2 THEN 'Fevereiro'
				WHEN 3 THEN 'Mar�o'
				WHEN 4 THEN 'Abril'
				WHEN 5 THEN 'Maio'
				WHEN 6 THEN 'Junho'
				WHEN 7 THEN 'Julho'
				WHEN 8 THEN 'Agosto'
				WHEN 9 THEN 'Setembro'
				WHEN 10 THEN 'Outubro'
				WHEN 11 THEN 'Novembro'
				ELSE 'Dezembro'
				END		
			SET @Datafmt = @Datafmt + '-'
			-- concatena o ano
			SET @Datafmt = @Datafmt + (SELECT Convert(varchar(4), Year(@data)))
		END
	-- m�s/ano
	ELSE IF @formato = 10
		BEGIN			
			SET @Datafmt = CASE Month(@data)
				WHEN 1 THEN 'Janeiro'
				WHEN 2 THEN 'Fevereiro'
				WHEN 3 THEN 'Mar�o'
				WHEN 4 THEN 'Abril'
				WHEN 5 THEN 'Maio'
				WHEN 6 THEN 'Junho'
				WHEN 7 THEN 'Julho'
				WHEN 8 THEN 'Agosto'
				WHEN 9 THEN 'Setembro'
				WHEN 10 THEN 'Outubro'
				WHEN 11 THEN 'Novembro'
				ELSE 'Dezembro'
				END		
			SET @Datafmt = @Datafmt + '/'
			-- concatena o ano
			SET @Datafmt = @Datafmt + (SELECT Convert(varchar(4), Year(@data)))
		END
	-- mm/yyyy
	ELSE IF @formato = 11
			BEGIN
			IF Month(@data) < 10 
				SET @Datafmt = '0' + Convert(varchar(2), Month(@data))
			ELSE 
				SET @Datafmt = Convert(varchar(2), Month(@data))

			SET @Datafmt = @Datafmt + '/'

			-- concatena o ano
			SET @Datafmt = @Datafmt + (SELECT Convert(varchar(4), Year(@data)))
		END
	-- dd/mm/yyyy hh:mm (24h)
	ELSE IF @formato = 12
			BEGIN
			IF Day(@data) < 10 
				SET @Datafmt = ('0' + Convert(varchar(2), Day(@data)))
			ELSE 
				SET @Datafmt =  Convert(varchar(2), Day(@data))

			SET @Datafmt = @Datafmt + '/'

			-- concatena o mes
			IF Month(@data) < 10 
				SET @Datafmt = (@Datafmt + '0' + Convert(varchar(2), Month(@data)))
			ELSE 
				SET @Datafmt = (@Datafmt + Convert(varchar(2), Month(@data)))

			SET @Datafmt = @Datafmt + '/'

			-- concatena o ano
			SET @Datafmt = @Datafmt + (SELECT Convert(varchar(4), Year(@data)))
			
			-- concatena a hora
			SET @Datafmt = @Datafmt + ' ' + (SELECT Convert(varchar(5), @data,114))
		END

	-- dd/mm/yyyy (Default) = 1
	ELSE
		BEGIN
			IF Day(@data) < 10 
				SET @Datafmt = ('0' + Convert(varchar(2), Day(@data)))
			ELSE 
				SET @Datafmt =  Convert(varchar(2), Day(@data))

			SET @Datafmt = @Datafmt + '/'

			-- concatena o mes
			IF Month(@data) < 10 
				SET @Datafmt = (@Datafmt + '0' + Convert(varchar(2), Month(@data)))
			ELSE 
				SET @Datafmt = (@Datafmt + Convert(varchar(2), Month(@data)))

			SET @Datafmt = @Datafmt + '/'

			-- concatena o ano
			SET @Datafmt = @Datafmt + (SELECT Convert(varchar(4), Year(@data)))
		END

RETURN(@Datafmt)
END
GO