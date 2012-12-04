/*
Diego Henrique Souza Silva
Relatório Base Reunião Comercial
filtros por partner/associado/consultor/equipe/empresa/havik		
Total faturado 	abrtas e fechadas	no mês
Total Piperline		
total de vagas em aberto		
09/2012 v1.0
*/
use havik
go
--drop procedure nrel_base_comercial
create procedure nrel_base_comercial
(
@dt_ini as datetime,
@dt_fim as datetime,
@projeto int=null,
@empresa int=null,
@captacao int=null
)
as
begin

select distinct cap.nome_usuario resp_captacao,
	   eq.nome_usuario equipe,
	   seg.descricao segmento,
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
       datediff(day,proj.dt_ini,proj.dt_fim) dias_vaga,
       ofer.salario_mensal salario,
       fin.fee,
       fin.acao,
       fin.valor_total,
       fin.valor,
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
	   sum(case when base.acao in (3,4) then base.valor_total
	   else 
	   (base.valor_total-base.acumulado)
	   end) valor,
	   base.fee,
	   base.valor_total,
	   acao.descricao acao
from (
select b.id_projeto,max(b.id) id
from bh_proj_financeiro b
where b.faturar=1
group by b.id_projeto
)b
left join bh_proj_financeiro base on
	base.id=b.id
	
left join br_acao acao on
	acao.id=base.acao
group by base.id_projeto,base.fee,base.valor_total,acao.descricao
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
-- Período
convert(char(10),proj.dt_ini,23) between 
convert(char(10),@dt_ini,23) and convert(char(10),@dt_fim,23)
-- Filtro Projeto
and 
(proj.id=@projeto or @projeto is null)
-- Filtro Empresa
and 
(proj.id_empresa=@empresa or @empresa is null)
and
-- Filtro Responsavel Captação
(proj.responsavel_captacao=@captacao or @captacao is null)


end