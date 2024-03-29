USE [havik]
GO
/****** Object:  StoredProcedure [dbo].[sp_vw_emp_status]    Script Date: 09/21/2011 18:14:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[sp_vw_emp_status] (@id_empresa bigint)
as
SELECT base.id
	  ,base.id_status
	  ,stat.descricao status
      ,base.id_substatus
      ,sub.descricao substatus
      ,base.obs
      ,base.dt_alteracao
      ,col.nome_usuario
      
from bh_emp_status base      
  
  left join br_emp_status stat on
	stat.id=base.id_status
	
  left join br_emp_substatus sub on
	stat.id=base.id_substatus	
	
  left join bc_usuario col on
	col.id=base.usuario_alteracao
	
where base.id_empresa=@id_empresa
order by base.dt_alteracao desc
  
