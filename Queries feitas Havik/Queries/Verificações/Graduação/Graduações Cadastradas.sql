/****** Script for SelectTopNRows command from SSMS  ******/
use havik
SELECT [id]
      ,[id_projeto]
      ,[graduacao]
      ,[nvl_graduacao]
      ,[dt_criacao]
      ,[usuario_criacao]
      ,[exibir]
  FROM [havik].[dbo].[bh_proj_graduacao]