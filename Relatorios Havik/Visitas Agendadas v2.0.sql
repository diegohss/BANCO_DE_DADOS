USE [havik]
GO
/****** Object:  StoredProcedure [dbo].[nrel_visitas_agendadas]    Script Date: 09/26/2012 17:04:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--drop procedure nrel_visitas_agendadas
ALTER procedure [dbo].[nrel_visitas_agendadas]
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
select distinct base.nome empresa,
	   seg.descricao segmento,
	   convert(char(10),st.dt_agendada,23) quando,
       st.obs result_esperados,
       CAST(isnull(dst.descricao,'') + '-' + isnull(dsub.descricao,'') as varchar(100)) status_acao,
       us.nome_usuario com_quem
       

from bc_empresa_unq base

left join bh_emp_status st on
	st.id_empresa=base.id
	
left join br_segmento seg on
	seg.id=base.segmento	
	
left join br_emp_status dst on
	dst.id=st.id_status
	
left join br_emp_status dsub on
	dsub.id=st.id_substatus
	
left join bc_usuario us on
	us.id=st.usuario_alteracao			
	
where 
-- Tipo Status Filtrado
st.id_status=7 and
-- Período
convert(char(10),st.dt_alteracao,23) between 
convert(char(10),@dt_ini,23) and convert(char(10),@dt_fim,23)
-- Filtro Usuario Cadastrou Status
and 
(base.id in (select n from @empresas) or not exists (select n from @empresas))
-- Filtro Empresa
and
(us.id=@usuario or @usuario is null)

end