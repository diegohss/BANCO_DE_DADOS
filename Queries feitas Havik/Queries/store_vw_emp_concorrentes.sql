create procedure vw_emp_concorrentes (@id_empresa bigint)
as
SELECT [id]
      ,[id_empresa]
      ,[id_concorrente]
      ,[dt_alteracao]
      ,[usuario_alteracao]
  FROM [havik].[dbo].[bh_emp_concorrentes]
where [id_empresa]=@id_empresa
order by [dt_alteracao] desc
  