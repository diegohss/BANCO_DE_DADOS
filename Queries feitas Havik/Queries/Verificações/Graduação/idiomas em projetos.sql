/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP 1000 [id]
      ,[id_projeto]
      ,[idioma]
      ,[nvl_idioma]
      ,[dt_criacao]
      ,[usuario_criacao]
      ,[exibir]
  FROM [havik].[dbo].[bh_proj_idiomas]