/****** Script for SelectTopNRows command from SSMS  ******/
use havik
SELECT COUNT(distinct id_projeto)
  FROM [havik].[dbo].[bh_proj_perfil]
  --order by dt_criacao desc