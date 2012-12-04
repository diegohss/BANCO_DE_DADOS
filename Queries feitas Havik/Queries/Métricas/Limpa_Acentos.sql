use havik 

go


IF EXISTS (
            SELECT *
              FROM sys.objects
             WHERE object_id = OBJECT_ID(N'[dbo].[fn_limpa_texto]')
               AND type IN (N'FN')
           )
 DROP FUNCTION fn_limpa_texto;
GO
CREATE FUNCTION fn_limpa_texto (@txt varchar(max)) RETURNS varchar(max)
AS
BEGIN
 DECLARE @txt0 varchar(max)
 --caixa baixa
    SET @txt0 = replace(@txt COLLATE Latin1_General_BIN, char(225),'a')  --SELECT '�',ASCII('�'); --225
    SET @txt0 = replace(@txt0 COLLATE Latin1_General_BIN,char(224),'a')  --SELECT '�',ASCII('�'); --224  
    SET @txt0 = replace(@txt0 COLLATE Latin1_General_BIN,char(227),'a')  --SELECT '�',ASCII('�'); --227
    SET @txt0 = replace(@txt0 COLLATE Latin1_General_BIN,char(226),'a')  --SELECT '�',ASCII('�'); --226
    SET @txt0 = replace(@txt0 COLLATE Latin1_General_BIN,char(233),'e')  --SELECT '�',ASCII('�'); --233
    SET @txt0 = replace(@txt0 COLLATE Latin1_General_BIN,char(232),'e')  --SELECT '�',ASCII('�'); --232
    SET @txt0 = replace(@txt0 COLLATE Latin1_General_BIN,char(234),'e')  --SELECT '�',ASCII('�'); --234
    SET @txt0 = replace(@txt0 COLLATE Latin1_General_BIN,char(237),'i')  --SELECT '�',ASCII('�'); --237
    SET @txt0 = replace(@txt0 COLLATE Latin1_General_BIN,char(236),'i')  --SELECT '�',ASCII('�'); --236
    SET @txt0 = replace(@txt0 COLLATE Latin1_General_BIN,char(238),'i')  --SELECT '�',ASCII('�'); --238
    SET @txt0 = replace(@txt0 COLLATE Latin1_General_BIN,char(243),'o')  --SELECT '�',ASCII('�'); --243
    SET @txt0 = replace(@txt0 COLLATE Latin1_General_BIN,char(242),'o')  --SELECT '�',ASCII('�'); --242
    SET @txt0 = replace(@txt0 COLLATE Latin1_General_BIN,char(244),'o')  --SELECT '�',ASCII('�'); --244
    SET @txt0 = replace(@txt0 COLLATE Latin1_General_BIN,char(245),'o')  --SELECT '�',ASCII('�'); --245
    SET @txt0 = replace(@txt0 COLLATE Latin1_General_BIN,char(250),'u')  --SELECT '�',ASCII('�'); --250
    SET @txt0 = replace(@txt0 COLLATE Latin1_General_BIN,char(249),'u')  --SELECT '�',ASCII('�'); --249
    SET @txt0 = replace(@txt0 COLLATE Latin1_General_BIN,char(251),'u')  --SELECT '�',ASCII('�'); --251
    SET @txt0 = replace(@txt0 COLLATE Latin1_General_BIN,char(252),'u')  --SELECT '�',ASCII('�'); --252
    SET @txt0 = replace(@txt0 COLLATE Latin1_General_BIN,char(231),'�')  --SELECT '�',ASCII('�'); --231
 -- caixa alta
    SET @txt0 = replace(@txt0 COLLATE Latin1_General_BIN,char(193),'A')  --SELECT '�',ASCII('�'); --193
    SET @txt0 = replace(@txt0 COLLATE Latin1_General_BIN,char(192),'A')  --SELECT '�',ASCII('�'); --192 
    SET @txt0 = replace(@txt0 COLLATE Latin1_General_BIN,char(194),'A')  --SELECT '�',ASCII('�'); --194
    SET @txt0 = replace(@txt0 COLLATE Latin1_General_BIN,char(195),'A')  --SELECT '�',ASCII('�'); --195
    SET @txt0 = replace(@txt0 COLLATE Latin1_General_BIN,char(201),'E')  --SELECT '�',ASCII('�'); --201
    SET @txt0 = replace(@txt0 COLLATE Latin1_General_BIN,char(200),'E')  --SELECT '�',ASCII('�'); --200
    SET @txt0 = replace(@txt0 COLLATE Latin1_General_BIN,char(202),'E')  --SELECT '�',ASCII('�'); --202
    SET @txt0 = replace(@txt0 COLLATE Latin1_General_BIN,char(205),'I')  --SELECT '�',ASCII('�'); --205
    SET @txt0 = replace(@txt0 COLLATE Latin1_General_BIN,char(204),'I')  --SELECT '�',ASCII('�'); --204
    SET @txt0 = replace(@txt0 COLLATE Latin1_General_BIN,char(206),'I')  --SELECT '�',ASCII('�'); --206
    SET @txt0 = replace(@txt0 COLLATE Latin1_General_BIN,char(211),'O')  --SELECT '�',ASCII('�'); --211
    SET @txt0 = replace(@txt0 COLLATE Latin1_General_BIN,char(210),'O')  --SELECT '�',ASCII('�'); --210
    SET @txt0 = replace(@txt0 COLLATE Latin1_General_BIN,char(212),'O')  --SELECT '�',ASCII('�'); --212
    SET @txt0 = replace(@txt0 COLLATE Latin1_General_BIN,char(213),'O')  --SELECT '�',ASCII('�'); --213
    SET @txt0 = replace(@txt0 COLLATE Latin1_General_BIN,char(218),'U')  --SELECT '�',ASCII('�'); --218
    SET @txt0 = replace(@txt0 COLLATE Latin1_General_BIN,char(217),'U')  --SELECT '�',ASCII('�'); --217
    SET @txt0 = replace(@txt0 COLLATE Latin1_General_BIN,char(219),'U')  --SELECT '�',ASCII('�'); --219
    SET @txt0 = replace(@txt0 COLLATE Latin1_General_BIN,char(220),'U')  --SELECT '�',ASCII('�'); --220
    SET @txt0 = replace(@txt0 COLLATE Latin1_General_BIN,char(199),'C')  --SELECT '�',ASCII('�'); --199
      
 RETURN (@txt0)
END
GO
     
-- Exemplo de uso da function
 
-- Ex.: 01 - Removendo acentos nas consultas
-- SELECT dbo.sp_rm_accent_pt_latin1('caf�, Sof�, p�,ca�a, CA�A, avi�es, sap�, �, s�tio, Avi�o, L�MPADA, mesa, cadeira, AVI�ES'); 
-- Retorno: cafe, Sofa, pe,caCa, CACA, avioes, sape, a, sitio, Aviao, LAMPADA, mesa, cadeira, AVIOES
 
 
-- Ex.: 02 - Removendo acentos no campo obs da tabela1
-- UPDATE tabela1 SET obs = dbo.sp_rm_accent_pt_latin1(obs); 