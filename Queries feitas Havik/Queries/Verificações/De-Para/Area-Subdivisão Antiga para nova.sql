/****** Script for SelectTopNRows command from SSMS  ******/
SELECT 
      base.empAtual,
      base.area_idArea,
      base.subdivisao_idSubDivisao,
      COUNT(base.idcandidato) qtd
      
FROM [havik].[dbo].[candidato] base

where base.area_idArea=15 and base.subdivisao_idSubDivisao=73

group by

base.empAtual,
      base.area_idArea,
      base.subdivisao_idSubDivisao