INSERT INTO [bi_kivah].[dbo].[dim_status_candidato]
(
           [cod_status]
           ,[status]
           ,[substatus]
)
select base.id cod_status,
	   st.descricao status,
	   sub.descricao substatus
from havik.dbo.bl_cli_status_substatus base

left join havik.dbo.br_cli_status st on
	st.id=base.id_status
left join havik.dbo.br_cli_substatus sub on
	sub.id=base.id_substatus
left join bi_kivah.dbo.dim_status_candidato rep on
	rep.cod_status=base.id	

where rep.cod_status is null
GO
INSERT INTO [bi_kivah].[dbo].[dim_status_empresa]
(
           [cod_status]
           ,[status]
           ,[substatus]
)
select base.id cod_status,
	   st.descricao status,
	   sub.descricao substatus
from havik.dbo.bl_emp_status_substatus base

left join havik.dbo.br_emp_status st on
	st.id=base.id_status
left join havik.dbo.br_emp_substatus sub on
	sub.id=base.id_substatus
left join bi_kivah.dbo.dim_status_empresa rep on
	rep.cod_status=base.id	

where rep.cod_status is null
GO


INSERT INTO [bi_kivah].[dbo].[dim_status_projeto]
(
           [cod_status]
           ,[status]
           ,[substatus]
)
select base.id cod_status,
	   st.descricao status,
	   sub.descricao substatus
from havik.dbo.bl_proj_status_substatus base

left join havik.dbo.br_proj_status st on
	st.id=base.id_status
left join havik.dbo.br_proj_substatus sub on
	sub.id=base.id_substatus
left join bi_kivah.dbo.dim_status_projeto rep on
	rep.cod_status=base.id	

where rep.cod_status is null
GO