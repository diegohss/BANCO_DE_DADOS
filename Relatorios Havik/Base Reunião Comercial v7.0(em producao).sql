USE [havik]
GO
/****** Object:  StoredProcedure [dbo].[nrel_base_comercial]    Script Date: 10/30/2012 09:32:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--drop procedure nrel_base_comercial
ALTER procedure [dbo].[nrel_base_comercial]
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

select distinct cap.nome_usuario resp_captacao,
	   eq.nome_usuario equipe_entrega,
       ent.nome_usuario resp_entrega,
       col.nome_usuario researcher,
       proj.id_empresa,
       emp.nome cliente,
       proj.tipo_produto,
       prod.descricao produto,
       proj.id,
       proj.nome projeto,
	   CAST(isnull(dsta.descricao,'') + '-' + isnull(dsub.descricao,'') as varchar(100)) ult_status_projeto,
       convert(char(10),proj.dt_ini,23) data_abertura,
       datediff(day,proj.dt_ini,GETDATE()) dias_vaga,
       ofer.salario_mensal salario,
       --Ultima Ação (acao)
       fin.acao,
       --Fee % (fee)
       fin.fee,
       -- Fee reais(lugar valor total) [valor_total] - Valor NET
       case when fin.embutir=1 then
       fin.valor_total
       else
       fin.valor_net end valor_total,
       -- Valor Total Faturado (valor) / Soma Faturas Liquidas
       fin.valor_fatura valor,
       -- Forecast (forecast) Valor_Total - Soma Valor NET
	   case when fin.embutir=1 then
       fin.valor_total-isnull(fin.valor_fatura,0)
       else
       fin.valor_net-isnull(fin.valor_fatura,0)
       end forecast,
       qproj.qtd cdd_alocados,
       short.qtd candidatos_shortlist,
       dtshort.dt_ult_shortlist   
       
       
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
	
-- Candidatos do Projeto com Shortlist enviada
left join(
select base.id_projeto,
       COUNT(distinct base.id_cliente) qtd
from bh_cli_status base
where base.id_status=4 and base.id_substatus=22 and 
base.exibir=1
group by base.id_projeto
)short on
	short.id_projeto=proj.id		
	
-- Data ultima shortlist	
left join(
select base.id_projeto,
      max(base.dt_alteracao) dt_ult_shortlist
from bh_cli_status base
where base.id_status=4 and base.id_substatus=22 and 
base.exibir=1
group by base.id_projeto
)dtshort on
	dtshort.id_projeto=proj.id		
	
-- Quantidade cdds no Projeto
left join(
select p.id_projeto,COUNT(distinct p.id_cliente) qtd

from bh_cli_projeto p	
	
group by p.id_projeto
)qproj on
 qproj.id_projeto=proj.id	
 
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
	   --fee_valor * aliquota_net
	   sum(base.valor_total*imp.aliquota_net) valor_net, 
	   fore.valor_fatura,
	   base.fee,
	   base.valor_total,
	   acao.id id_acao,
	   acao.descricao acao,
	   base.embutir
from (
select b.id_projeto,max(b.id) id
from bh_proj_financeiro b
where b.ativo=1 and b.acao<>5
--where b.faturar=1
group by b.id_projeto
)b

left join bh_proj_financeiro base on
	base.id=b.id
	
left join br_acao acao on
	acao.id=base.acao
	
left join br_impostos imp on
	imp.id=base.id_impostos	
	
left join(
select t.id_projeto,
	   sum(t.valor_fatura) valor_fatura
from bh_proj_financeiro t	 
where t.faturar=1 and t.ativo=1 and t.acao<>5
group by t.id_projeto  
)fore on
	fore.id_projeto=base.id_projeto	
	
	
group by base.id_projeto,fore.valor_fatura,base.fee,base.valor_total,acao.id,acao.descricao,base.embutir
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
	
-- Researcher Projeto
-- Definindo Equipe conforme informado no projeto	
left join bc_usuario col on
	col.id=proj.colaborador_responsavel

left join br_segmento seg on
	seg.id=proj.segmento

where
-- Projetos Abertos
proj.dt_fim is null
and
-- Período
/*convert(char(10),proj.dt_ini,23) between 
convert(char(10),@dt_ini,23) and convert(char(10),@dt_fim,23)
-- Filtro Projeto
and */
(proj.id in (select n from @projetos) or not exists (select n from @projetos))
-- Filtro Empresa
and 
(proj.id_empresa in (select n from @empresas) or not exists (select n from @empresas))
and
-- Filtro Responsavel Captação
(proj.responsavel_captacao=@captacao or @captacao is null)
-- Filtro Responsavel Entrega
and
(proj.responsavel_entrega=@entrega or @entrega is null)


end