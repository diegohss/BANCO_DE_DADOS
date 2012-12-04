SELECT * 
  FROM [havik].[dbo].[bc_cli_base_cvs]
where dados is null and convert(char(10),dt_criacao,23)>'2011-12-23'
order by dt_criacao desc

