/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP 1000 [id]
      ,[id_projeto]
      ,[descricao_completa]
      ,[resumo_descricao]
      ,[mostrar_site]
      ,[dt_alteracao]
      ,[usuario_alteracao]
  FROM [havik].[dbo].[bc_proj_site]
  where id_projeto=1400