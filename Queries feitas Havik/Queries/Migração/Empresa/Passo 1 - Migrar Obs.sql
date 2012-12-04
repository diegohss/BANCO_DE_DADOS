INSERT INTO dbo.bh_emp_obs
           (
           id_empresa
           ,obs
           ,dt_alteracao
           ,usuario_alteracao
           )
 select
 base.id,
 dbo.HTMLFullDecode3(emp.observacoes),
 GETDATE(),
 isnull(base.usuario_criacao,1)
  
from dbo.empresa emp

	inner join bc_empresa_unq base on
		base.id_antiga=emp.idEmpresa		

where emp.observacoes is not null


