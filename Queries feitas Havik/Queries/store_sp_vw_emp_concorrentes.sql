create procedure dbo.sp_vw_emp_concorrentes (@id_empresa bigint)
as
SELECT base.id
      ,base.id_empresa
      ,base.id_concorrente
      ,emp.nome concorrente
      ,base.dt_alteracao
      ,base.usuario_alteracao 
  FROM bh_emp_concorrentes base
  
  left join bc_empresa_unq emp on
	emp.id=base.id_concorrente
	
where id_empresa=@id_empresa
order by base.dt_alteracao desc
  