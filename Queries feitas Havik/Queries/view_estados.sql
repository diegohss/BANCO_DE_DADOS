create view vw_emp_estados 
as
SELECT TOP 100 ufcod, ufsigla, ufnomex nome
FROM [havik].[dbo].[br_estados]
order by [UFNOMEX];

create view vw_proj_estados 
as
SELECT TOP 100 ufcod, ufsigla, ufnomex nome
FROM [havik].[dbo].[br_estados]
order by [UFNOMEX];

create view vw_cli_estados 
as
SELECT TOP 100 ufcod, ufsigla, ufnomex nome
FROM [havik].[dbo].[br_estados]
order by [UFNOMEX];