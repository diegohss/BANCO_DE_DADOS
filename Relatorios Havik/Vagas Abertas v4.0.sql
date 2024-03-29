USE [havik]
GO
/****** Object:  StoredProcedure [dbo].[nrel_vagas_abertas]    Script Date: 10/05/2012 18:35:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--drop procedure nrel_vagas_abertas
ALTER procedure [dbo].[nrel_vagas_abertas]
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
select distinct 
	   proj.id id_projeto,
	   proj.nome projeto,
	   emp.nome empresa,
	   cap.nome_usuario quem_captou,
	   eq.nome_usuario equipe_entrega,
	   ent.nome_usuario responsavel_entrega,
	   CAST(isnull(dsta.descricao,'') + '-' + isnull(dsub.descricao,'') as varchar(100))	status_acao,
	   ofer.salario_mensal salario,
	   --fin.valor,
	   convert(char(10),proj.dt_criacao,23) dt_inicio,
	   site.publicado
	   
	    

from bc_projeto proj

-- Ultimo Status do Projeto
left join (
select ult.id_projeto,ult.id_status,ult.id_substatus
from(select st.id_projeto,MAX(st.id) id 
from bh_proj_status st
group by st.id_projeto)ult_st
left join bh_proj_status ult on
	ult.id=ult_st.id
)status on
	status.id_projeto=proj.id
	
-- Status e Substatus

left join br_proj_status dsta on
	dsta.id=status.id_status	
left join br_proj_substatus dsub on
	dsub.id=status.id_substatus	
	
-- Ligação na tabela Empresa
left join bc_empresa_unq emp on
	emp.id=proj.id_empresa
	
-- Descrição do Produto	
left join br_tp_produto prod on
	prod.id=proj.tipo_produto
	
-- Informações da aba Oferta
left join(
select base.id_projeto,base.salario_mensal
from bc_proj_oferta base
)ofer on
	ofer.id_projeto=proj.id	
	
-- Financeiro dos Projetos
left join(
select base.id_projeto,
	   sum(case when base.acao in (3,4) then base.valor_total
	   else 
	   (base.valor_total-base.acumulado)
	   end) valor
from bh_proj_financeiro base
where base.faturar=1
group by base.id_projeto
)fin on
	fin.id_projeto=proj.id	
	
-- Responsavel pela captação do Projeto
left join bc_usuario cap on
	cap.id=proj.responsavel_captacao	
	
-- Responsavel pela entrega do Projeto	
left join bc_usuario ent on
	ent.id=proj.responsavel_entrega
	
-- Definindo Equipe conforme informado no projeto	
left join bc_usuario eq on
	eq.id=proj.equipe
	
-- Ver se está no site ou não
left join
(
select ult.id_projeto,
	   case when ult.mostrar_site=1 then
	   'sim'
	   else 'não' end publicado
from(
select s.id_projeto,MAX(id) id
from bh_proj_site s
group by s.id_projeto)t
left join bh_proj_site ult on
	ult.id=t.id
)site on
	proj.id=site.id_projeto	


where 
--  Empresas Normais
(emp.id not in (5,6))
-- 
and (status.id_status<>2 or status.id_status is null)
-- Período
and
convert(char(10),proj.dt_ini,23) between 
convert(char(10),@dt_ini,23) and convert(char(10),@dt_fim,23)
-- Filtro Projeto
and 
(proj.id in (select n from @projetos) or not exists (select n from @projetos))
-- Filtro Usuario
and
(proj.responsavel_captacao=@captacao or @captacao is null)
end