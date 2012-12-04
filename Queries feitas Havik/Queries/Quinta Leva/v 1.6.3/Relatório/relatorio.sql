-- Procedure que será usada como para o relatório base para os filtros 
-- 
use havik_teste

go

create procedure sp_relat_prest_contas_2
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
@usuario int
)
as
select isnull(proj.id,0) id_projeto_havik,
	   isnull(proj.nome,'TOTAL') projeto,
	   proj.
	   COUNT(distinct base.id_cliente) qtd_clientes
	   	
from bc_projeto proj

-- Último Status com base nos Projetos e Empresas Selecionados,
-- Passando pelo filtro de Status e Substatus
inner join (
select *
from (
select *
from bh_cli_status
where id_projeto in 
(
select id
from bc_projeto
where (id_empresa in (select n from @empresas)) and
(id in (select n from @projetos))))t
--where t.id_status in (select n from @status) and t.id_substatus in (select n from @substatus) 
)base on
	base.id_projeto=proj.id 


--where proj.id in (1480,1510)

group by rollup(proj.id,proj.nome)