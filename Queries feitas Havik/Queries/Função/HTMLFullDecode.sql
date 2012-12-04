
/*
Autor:          Thiago Satoshi Suzuki
Data Criação:   12/05/2010
Alterado Por:
Data Alteração:
*/
CREATE FUNCTION HTMLFullDecode (@text VARCHAR(4000)) RETURNS VARCHAR(4000) 
AS BEGIN
	SELECT @text = dbo.HTMLDecode(dbo.TagStrip(@text))
	
	RETURN @text
END