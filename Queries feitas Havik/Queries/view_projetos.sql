create view vw_beneficios as
select top 100 [id],
       [descricao]
FROM [havik].[dbo].[tr_proj_beneficios]
order by descricao