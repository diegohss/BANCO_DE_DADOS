USE [havik]
GO
/****** Object:  StoredProcedure [dbo].[nrel_entrevistas_agendadas]    Script Date: 09/28/2012 11:10:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--drop procedure nrel_entrevistas_agendadas
ALTER procedure [dbo].[nrel_entrevistas_agendadas]
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
begin

select base.nome candidato,
       convert(char(10),q.dt_agendada,23) quando,
       case 
       when left(proj.nome,5)='pro a' then
       'Pró Ativa'
       else
       proj.nome end projeto,       
       seg.descricao industria,
       base.id id_candidato,
       isnull(prof.empresa,prof.empresa_antiga) ultima_empresa

from bc_cliente base

left join bh_cli_status st on
	st.id_cliente=base.id
	
left join br_cli_status dsta on
	dsta.id=st.id_status	
	
left join br_cli_substatus dsub on
	dsub.id=st.id_substatus	
	
left join bc_projeto proj on
	proj.id=st.id_projeto	

left join br_segmento seg on
	seg.id=proj.segmento
	
left join(
select ult.id_cliente,ult.id_projeto,ult.dt_agendada
from(
select id_cliente,id_projeto,MAX(id) id
from bh_cli_status 
where (id_status in (2,5) and id_substatus in (13,26,27))
group by id_cliente,id_projeto
)t
left join bh_cli_status ult on
	ult.id=t.id	
)q on
	q.id_cliente=st.id_cliente and
	q.id_projeto=st.id_projeto
	
--Profissional
left join (
select ult.id_cliente,
	   ult.id_empresa,
	   emp.nome empresa,
	   ult.empresa_antiga,
	   fil.nome filial,
	   ult.dt_inicio,
	   ult.dt_saida,
	   ult.id_cargo,
	   cargo.descricao cargo,
	   ult.salario,
	   ult.bonus,	   
	   ult.id_segmento,
	   seg.descricao segmento,
	   ult.id_area,
	   area.descricao area,
	   ult.id_subdivisao,
	   sub.descricao subdivisao
from (
SELECT a.id
FROM bh_cli_profissional a
WHERE a.ID IN
(SELECT TOP 1 b.id FROM bh_cli_profissional b WHERE b.id_cliente = a.id_cliente ORDER BY b.dt_inicio DESC)
)ult_prof
left join bh_cli_profissional ult on
	ult.id=ult_prof.id	
left join br_area area on
	area.id=ult.id_area	
left join br_cargo cargo on
	cargo.id=ult.id_cargo	
left join br_subdivisao sub on
	sub.id=ult.id_subdivisao	
left join br_segmento seg on
	seg.id=ult.id_segmento
left join bc_empresa_filial fil on
	fil.id=ult.id_filial		
left join bc_empresa_unq emp on
	emp.id=ult.id_empresa	
)prof on
	prof.id_cliente=base.id
	
	
where 

-- Tipo de Status Filtrado
(st.id_status in (2,5) and st.id_substatus in (13,24,29,40))
and
-- Período
convert(char(10),q.dt_agendada,23) between 
convert(char(10),@dt_ini,23) and convert(char(10),@dt_fim,23)
-- Filtro Usuario Cadastrou Status
and 
(proj.id in (select n from @projetos) or not exists (select n from @projetos))
-- Filtro Empresa
and
(st.entrevistador=@colaborador or @colaborador is null)


end