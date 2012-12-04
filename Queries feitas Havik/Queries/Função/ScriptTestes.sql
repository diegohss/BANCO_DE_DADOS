DECLARE @teste VARCHAR(1000)
SET @teste = '<p>Exemplo de texto digitado pelo usuário <br/>  <br /> realiza&ccedil;&atilde;o | realiza&Ccedil;&atilde;o de testes.... </p>  <p>FIM...</p>'

--Retirando TAGS
SELECT dbo.TagStrip(@teste) TagStripResult

--Substituindo caracteres
SELECT dbo.HTMLDecode(@teste) HTMLDecodeResult

--Retirando TAGS e Substituindo caracteres
SELECT dbo.HTMLDecode(dbo.TagStrip(@teste)) TagStripAndHTMLDecodeResult

--Retirando TAGS e Substituindo caracteres. Com Função
SELECT dbo.HTMLFullDecode(@teste) HTMLFullDecodeResult
