USE [havik]
GO
/****** Object:  StoredProcedure [dbo].[sp_relat_prest_contas_2]    Script Date: 03/27/2012 10:29:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER procedure [dbo].[sp_relat_prest_contas_2]
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
@usuario int
)
as

-- Pre = 1 => Possui Pré-Entrevista
-- Pre = 2 => Possui Pré-Entrevista no Período 
-- Pre = 0 => Sem verificar


-- Pre = 1 => Possui Pré-Entrevista
If @pre=1
begin
select 
   
   CASE
   WHEN GROUPING(proj.id) = 1 THEN cast('TOTAL' as varchar(20))
   ELSE cast(proj.id as varchar(20)) END id_projeto_havik,
   CASE
   WHEN GROUPING(proj.nome) = 1 THEN 'TOTAL PROJETOS' 
   ELSE proj.nome END projeto,  
   stat.descricao status,
   sub.descricao substatus,
   mot.descricao motivos,	
   COUNT(distinct base.id) qtd			
	   	
from bc_projeto proj

-- Último Status com base nos Projetos e Empresas Selecionados,
-- Passando pelo filtro de Status e Substatus
inner join (
-- Tabela já com o último status do Projeto, baseado em data, 
select ult.id,
	   ult.id_cliente,
	   ult.id_projeto,
	   ult.id_status,
	   ult.id_substatus,
	   ult.id_motivo,
	   ult.usuario_criacao,
	   ult.dt_alteracao
-- Cria o from com o último status
from (select p1.id_cliente,max(p1.id) id
from(
select *
from bh_cli_status
where id_projeto in 
(select id
from bc_projeto
where (id in (select n from @projetos) or not exists (select n from @projetos)) and
	  (id_empresa in (select n from @empresas) or not exists (select n from @empresas)))
	  and exibir=1)p1
group by p1.id_cliente
)p2
left join bh_cli_status ult on
	ult.id=p2.id
where (ult.id_status in (select n from @status) or not exists (select n from @status)) and 
	  (ult.id_substatus in (select n from @substatus) or not exists(select n from @substatus)) and
	  (ult.usuario_criacao=@colaborador or @colaborador is null)
)base 
on
	base.id_projeto=proj.id 
	
left join br_cli_status stat on
	stat.id=base.id_status

left join br_cli_substatus sub on
	sub.id=base.id_substatus		
	
left join br_cli_motivos mot on
	mot.id=base.id_motivo
	
left join bc_cli_researcher pre on
	pre.id_cliente=base.id_cliente
	
left join bc_proj_site site on
	site.id_projeto=proj.id	
	
where (proj.responsavel_captacao=@captacao or @captacao is null) and (proj.responsavel_entrega=@entrega or @entrega is null)
	  and (proj.colaborador_responsavel=@colab or @colab is null)	
	  and (convert(char(10),base.dt_alteracao,23) between convert(char(10),@dt_ini,23) and convert(char(10),@dt_fim,23))
	  and (pre.id is not null)
			   
GROUP BY GROUPING SETS((proj.id,proj.nome,stat.descricao,sub.descricao,mot.descricao),proj.nome,())
end

-- Pre = 2 => Possui Pré-Entrevista no Período 
if @pre=2
begin
select 

   CASE
   WHEN GROUPING(proj.id) = 1 THEN cast('TOTAL' as varchar(20))
   ELSE cast(proj.id as varchar(20)) END id_projeto_havik,
   CASE
   WHEN GROUPING(proj.nome) = 1 THEN 'TOTAL PROJETOS' 
   ELSE proj.nome END projeto,
   stat.descricao status,
   sub.descricao substatus,
   mot.descricao motivos,	
   COUNT(base.id) qtd			
	   	
from bc_projeto proj

-- Último Status com base nos Projetos e Empresas Selecionados,
-- Passando pelo filtro de Status e Substatus
inner join (
-- Tabela já com o último status do Projeto, baseado em data, 
select ult.id,
	   ult.id_cliente,
	   ult.id_projeto,
	   ult.id_status,
	   ult.id_substatus,
	   ult.id_motivo,
	   ult.usuario_criacao,
	   ult.dt_alteracao
-- Cria o from com o último status
from (select p1.id_cliente,max(p1.id) id
from(
select *
from bh_cli_status
where id_projeto in 
(select id
from bc_projeto
where (id in (select n from @projetos) or not exists (select n from @projetos)) and
	  (id_empresa in (select n from @empresas) or not exists (select n from @empresas)))
	  and exibir=1)p1
group by p1.id_cliente
)p2
left join bh_cli_status ult on
	ult.id=p2.id
where (ult.id_status in (select n from @status) or not exists (select n from @status)) and 
	  (ult.id_substatus in (select n from @substatus) or not exists(select n from @substatus)) and
	  (ult.usuario_criacao=@colaborador or @colaborador is null)
)base 
on
	base.id_projeto=proj.id 
	
left join br_cli_status stat on
	stat.id=base.id_status

left join br_cli_substatus sub on
	sub.id=base.id_substatus		
	
left join br_cli_motivos mot on
	mot.id=base.id_motivo
	
left join bc_cli_researcher pre on
	pre.id_cliente=base.id_cliente and
	(convert(char(10),pre.dt_alteracao,23) between convert(char(10),@dt_ini,23) and convert(char(10),@dt_fim,23))
	
left join bc_proj_site site on
	site.id_projeto=proj.id		
	
where (proj.responsavel_captacao=@captacao or @captacao is null) and (proj.responsavel_entrega=@entrega or @entrega is null)
	  and (proj.colaborador_responsavel=@colab or @colab is null)	
	  and (convert(char(10),base.dt_alteracao,23) between convert(char(10),@dt_ini,23) and convert(char(10),@dt_fim,23))
	  and (pre.id is not null)
			   
GROUP BY GROUPING SETS((proj.id,proj.nome,stat.descricao,sub.descricao,mot.descricao),proj.nome,())
end


-- Pre = 0 => Sem verificar
if @pre=0
begin
select 

   CASE
   WHEN GROUPING(proj.id) = 1 THEN cast('TOTAL' as varchar(20))
   ELSE cast(proj.id as varchar(20)) END id_projeto_havik,
   CASE
   WHEN GROUPING(proj.nome) = 1 THEN 'TOTAL PROJETOS' 
   ELSE proj.nome END projeto,
   stat.descricao status,
   sub.descricao substatus,
   mot.descricao motivos,	
   COUNT(base.id) qtd			
	   	
from bc_projeto proj

-- Último Status com base nos Projetos e Empresas Selecionados,
-- Passando pelo filtro de Status e Substatus
inner join (
-- Tabela já com o último status do Projeto, baseado em data, 
select ult.id,
	   ult.id_cliente,
	   ult.id_projeto,
	   ult.id_status,
	   ult.id_substatus,
	   ult.id_motivo,
	   ult.usuario_criacao,
	   ult.dt_alteracao
-- Cria o from com o último status
from (select p1.id_cliente,max(p1.id) id
from(
select *
from bh_cli_status
where id_projeto in 
(select id
from bc_projeto
where (id in (select n from @projetos) or not exists (select n from @projetos)) and
	  (id_empresa in (select n from @empresas) or not exists (select n from @empresas)))
	  and exibir=1)p1
group by p1.id_cliente
)p2
left join bh_cli_status ult on
	ult.id=p2.id
where (ult.id_status in (select n from @status) or not exists (select n from @status)) and 
	  (ult.id_substatus in (select n from @substatus) or not exists(select n from @substatus)) and
	  (ult.usuario_criacao=@colaborador or @colaborador is null)
)base 
on
	base.id_projeto=proj.id 
	
left join br_cli_status stat on
	stat.id=base.id_status

left join br_cli_substatus sub on
	sub.id=base.id_substatus		
	
left join br_cli_motivos mot on
	mot.id=base.id_motivo
	
left join bc_proj_site site on
	site.id_projeto=proj.id		
	
/*left join bc_cli_researcher pre on
	pre.id_cliente=base.id_cliente and
	(convert(char(10),pre.dt_alteracao,23) between convert(char(10),@dt_ini,23) and convert(char(10),@dt_fim,23))*/
	
where (proj.responsavel_captacao=@captacao or @captacao is null) and (proj.responsavel_entrega=@entrega or @entrega is null)
	  and (proj.colaborador_responsavel=@colab or @colab is null)	
	  and (convert(char(10),base.dt_alteracao,23) between convert(char(10),@dt_ini,23) and convert(char(10),@dt_fim,23))
	  --and (pre.id is not null)
			   
GROUP BY GROUPING SETS((proj.id,proj.nome,stat.descricao,sub.descricao,mot.descricao),proj.nome,())
end

INSERT INTO bh_relatorios
(
modulo,
tipo,
dt_alteracao,
usuario
)
VALUES
(
'relatorios',
@tipo_relat,
GETDATE(),
@usuario
)


