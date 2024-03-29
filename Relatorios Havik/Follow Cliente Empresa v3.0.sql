USE [havik]
GO
/****** Object:  StoredProcedure [dbo].[nrel_follow_cli_empresa]    Script Date: 11/09/2012 13:06:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER procedure [dbo].[nrel_follow_cli_empresa]
(
@projetos int_list readonly, 
@status int_list readonly, 
@substatus int_list readonly, 
@empresas int_list readonly, 
@captacao int = null, 
@entrega int = null, 
@colab int = null, 
@dt_ini datetime = null, 
@dt_fim datetime = null,   
@pre int = null, 
@colaborador int = null, 
@tipo_relat int = null, 
@usuario int = null,
@equipe int = null
)
as
select distinct emp.id id_cliente,
	   emp.nome nome_cliente,
	   base.status status,
	   base.cadastrou_status,
	   base.responsavel_follow,
	   base.dt_agendada,
	   Convert(char(5),base.hora,108) hora,	 
	   base.obs,  
	   projeto.status_empresa classificacao

from( 
select ult.id_empresa,
       ult.id_status,
       st.descricao status,
       ult.follow,
       fll.nome_usuario responsavel_follow,
       ult.usuario_alteracao,
       resp.nome_usuario cadastrou_status,
       ult.dt_agendada,
       ult.hora,
       ult.obs
from(
select id_empresa,MAX(id) id
from bh_emp_status
group by id_empresa
)t
left join bh_emp_status ult on
	ult.id=t.id
	
left join br_emp_status st on
	st.id=ult.id_status	
	
left join bc_usuario resp on
	resp.id=ult.usuario_alteracao

left join bc_usuario fll on
	fll.id=ult.follow			
)base


left join(
select distinct b.id_empresa,
       case when stproj.id_status=2 and stproj.dt_fim is null then
		'ativo_standby'
		when stproj.id_status<>2 and stproj.dt_fim is null then
		'ativo_producao'
	   when stproj.dt_fim is not null then
	    'inativo'
	   end status_empresa
from(
select id_empresa,max(dt_ini) dt_ini
from bc_projeto
group by id_empresa
)b

left join 
(
select distinct st.id_projeto,bb.id_empresa,st.id_status,st.id_substatus,st.dt_alteracao,pr.dt_ini,pr.dt_fim
from(
select p.id_empresa,MAX(ult.id) id
from(
select id_projeto,MAX(id) id
from bh_proj_status
group by id_projeto
)t
left join bh_proj_status ult on
	ult.id=t.id
left join bc_projeto p on 
	p.id=t.id_projeto	
group by p.id_empresa
)bb

left join bh_proj_status st on
	st.id=bb.id		
	
left join bc_projeto pr on
	pr.id=st.id_projeto
		
)stproj on
	stproj.id_empresa=b.id_empresa
	
)projeto on
	projeto.id_empresa=base.id_empresa
	
left join bc_empresa_unq emp on
	emp.id=base.id_empresa	
		
where
-- Ter follow
base.follow is not null
and
-- Período
convert(char(10),base.dt_agendada,23) between 
convert(char(10),@dt_ini,23) and convert(char(10),@dt_fim,23)
-- Filtro Empresa
and 
(base.id_empresa in (select n from @empresas) or not exists (select n from @empresas))
-- Filtro Empresa
and
(base.follow=@colaborador or @colaborador is null)
