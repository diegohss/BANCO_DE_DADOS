USE [havik]
GO

/****** Object:  StoredProcedure [dbo].[sp_vw_emp_status]    Script Date: 09/23/2011 18:54:11 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE procedure [dbo].[sp_vw_emp_offlimits] (@id_empresa bigint)
as
SELECT
      
from bh_emp_status base      
  
  left join br_emp_status stat on
	stat.id=base.id_status
	
  left join br_emp_substatus sub on
	sub.id=base.id_substatus	
	
  left join bc_usuario col on
	col.id=base.usuario_alteracao
	
where base.id_empresa=@id_empresa
order by base.dt_alteracao desc
  

GO


