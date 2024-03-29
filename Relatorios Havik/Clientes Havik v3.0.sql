USE [havik]
GO
/****** Object:  StoredProcedure [dbo].[nrel_cliente_havik]    Script Date: 10/05/2012 19:14:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--drop procedure nrel_cliente_havik
ALTER procedure [dbo].[nrel_cliente_havik]
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
@usuario int = null
)
as

select base.id id_empresa,
       base.nome empresa,
       seg.descricao segmento,
       SUM(case when projeto.status_empresa='ativo_standby' then
			1 else 0 end) ativo_standby,
       SUM(case when projeto.status_empresa='ativo_producao' then
			1 else 0 end) ativo_producao,			
       SUM(case when projeto.status_empresa='inativo' then
			1 else 0 end) inativo,		
       SUM(case when projeto.id_empresa is null and st.id_empresa is null and
       offl.id_empresa is not null then
			1 else 0 end) radar,							
       SUM(case when projeto.id_empresa is null and st.id_empresa is not null and
       offl.id_empresa is null then
			1 else 0 end) prospeccao					
			

from bc_empresa_unq base

left join(
select sta.id_empresa,max(sta.dt_alteracao) dt_alteracao
from bh_emp_status sta
group by sta.id_empresa
)st on
	st.id_empresa=base.id
	
left join br_segmento seg on
	seg.id=base.segmento
		
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
	p.id=ult.id_projeto	
group by p.id_empresa
)bb

left join bh_proj_status st on
	st.id=bb.id		
	
left join bc_projeto pr on
	pr.id=st.id_projeto
		
)stproj on
	stproj.id_empresa=b.id_empresa
	
)projeto on
	projeto.id_empresa=base.id
	
left join(
select id_empresa,max(dt_ini) dt_ini
from bc_projeto
group by id_empresa
)dtproj on
	dtproj.id_empresa=base.id	
	
left join(
select o.id_empresa,max(o.dt_criacao) dt_criacao
from bh_emp_offlimits o 
where o.keyaccount is not null
group by o.id_empresa
)offl on
	offl.id_empresa=base.id
	
where
-- Filtros por Periodo
-- Periodo Offlimits 
--convert(char(10),offl.dt_criacao,23) between 
--convert(char(10),@dt_ini,23) and convert(char(10),@dt_fim,23)
-- Periodo Status
--and
convert(char(10),st.dt_alteracao,23) between 
convert(char(10),@dt_ini,23) and convert(char(10),@dt_fim,23)
-- Periodo Projeto
and
convert(char(10),dtproj.dt_ini,23) between 
convert(char(10),@dt_ini,23) and convert(char(10),@dt_fim,23)
-- Filtro Empresa
and
(base.id in (select n from @empresas) or not exists (select n from @empresas))

group by base.id,
       base.nome,
       seg.descricao