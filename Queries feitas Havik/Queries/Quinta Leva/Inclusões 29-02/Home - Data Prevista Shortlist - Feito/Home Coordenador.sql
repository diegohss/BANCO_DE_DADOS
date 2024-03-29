USE [havik]
GO
/****** Object:  StoredProcedure [dbo].[sp_vw_home_coordenador_2]    Script Date: 02/29/2012 17:19:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER procedure [dbo].[sp_vw_home_coordenador_2]
(
@usuario int
)

as

select  	
	   base.id_empresa,
	   base.id id_projeto,	
	   emp.razao_social empresa,
	   base.nome projeto,
	   entrega.nome_usuario responsavel_entrega,
	   col.nome_usuario colaborador_responsavel,
	   sta.descricao ultimo_status,
	   sub.descricao ultimo_substatus,	   
	   dt_ini=dbo.fn_dateformat(base.dt_ini,1),
	   dt_prevista_shortlist=dbo.fn_dateformat(base.dt_prev_shortlist,1)
	   
from bc_projeto base

left join bc_empresa_unq emp on
	emp.id=base.id_empresa

left join br_proj_status sta on
	sta.id=base.ultimo_status

left join br_proj_substatus sub on
	sub.id=base.ultimo_substatus
	
left join bc_usuario col on
	col.id=base.colaborador_responsavel

left join bc_usuario entrega on	
	entrega.id=base.responsavel_entrega
	
where (base.colaborador_responsavel in (select u.id from bc_usuario u where u.cargo='r1') or base.responsavel_entrega=@usuario) 
		and base.dt_fim is null
and (convert(char(10),base.dt_ini,23)>='2011-12-01' and base.dt_fim is null)
order by 9,3