USE [havik]
GO
/****** Object:  StoredProcedure [dbo].[sp_vw_home_r2_2]    Script Date: 03/28/2012 17:13:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER procedure [dbo].[sp_vw_home_r2_2]
(
@usuario int
)

as

select  	
	   base.id_empresa,
	   base.id id_projeto,	
	   emp.razao_social empresa,
	   base.nome projeto,
	   sta.descricao ultimo_status,
	   sub.descricao ultimo_substatus,	   
	   base.dt_ini dt_ini,
	   base.dt_prev_shortlist dt_prevista_shortlist
	   
from bc_projeto base

left join bc_empresa_unq emp on
	emp.id=base.id_empresa

left join br_proj_status sta on
	sta.id=base.ultimo_status

left join br_proj_substatus sub on
	sub.id=base.ultimo_substatus
	
left join bc_usuario us on
	us.id=@usuario

where (base.colaborador_responsavel=@usuario or base.responsavel_entrega=@usuario) and base.dt_fim is null

order by 7,3