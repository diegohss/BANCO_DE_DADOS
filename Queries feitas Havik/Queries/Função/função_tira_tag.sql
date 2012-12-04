CREATE FUNCTION TagStrip (@text VARCHAR(8000)) RETURNS VARCHAR(8000) 
AS 
BEGIN 
DECLARE @length INT WHILE 1 = 1 
BEGIN 
SET @length = LEN(@text) 
SET @text = REPLACE(@text, SUBSTRING(@text, CHARINDEX('< ', @text), CHARINDEX('>', @text) - CHARINDEX('< ', @text) + 1), SPACE(0)) 
IF @length = LEN(@text) BREAK END 
RETURN @text 
END