/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP 1000 [id]
      ,[id_projeto]
      ,[mostrar_site]
      ,[dt_alteracao]
      ,[usuario_alteracao]
  FROM [havik].[dbo].[bh_proj_site]
  where id_projeto=1400