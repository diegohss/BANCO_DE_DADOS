/*
miriamsantosbelem: pra vc ir se divertindo ate lá.vc consegue gerar uma listagem de candidatos cadastrados como bancos
miriamsantosbelem: 
bancos comercial,alta renda ou varejo.com as colunas id nome ,cargo e salario(ultimos),cidade
*/

use havik
go

select distinct 
	   base.id id_candidato,
       base.nome nome_candidato,
       
       proj.id_projeto,
       proj.projeto ultimo_projeto,
       
       status.status ultimo_status,
       status.substatus ultimo_substatus,
       
       isnull(prof.empresa,prof.empresa_antiga) ultima_empresa,       
	   prof.cargo ultimo_cargo,
	   prof.salario ultimo_salario,
	   
	   codi.area ultima_area,
	   codi.subdivisao ultima_subdivisao,
	   codi.segmento ultimo_segmento
       

	   

from bc_cliente base


--  Verificação participação de projetos no Itau
inner join
(
select distinct base.id_cliente
from bh_cli_projeto base
	left join bc_projeto pro on
		pro.id=base.id_projeto
where pro.id_empresa in (3194)		
)hproj on
	hproj.id_cliente=base.id
	  
--3194 - Itau
-- 1310 - BBA
-- 3516 - Itau Seguros	

-- Profissional
left join(
select ult.id,
	   ult.id_cliente,
	   ult.id_empresa,
	   emp.nome empresa,
	   ult.empresa_antiga,
	   fil.nome filial,
	   ult.id_cargo,
	   cargo.descricao cargo,
	   convert(decimal(10),ult.salario) salario,
	   ult.bonus,  
	   ult.dt_inicio,
	   ult.dt_saida,
	   ult.usuario_alteracao,
	   ult.tipo_contato

from (
SELECT a.id
FROM bh_cli_profissional a
WHERE a.ID IN
(SELECT TOP 1 b.id FROM bh_cli_profissional b WHERE b.id_cliente = a.id_cliente ORDER BY b.dt_inicio DESC)
)ult_prof

left join bh_cli_profissional ult on
	ult.id=ult_prof.id
	
left join br_cargo cargo on
	cargo.id=ult.id_cargo
	
left join bc_empresa_unq emp on
	emp.id=ult.id_empresa		
	
left join bc_empresa_filial fil on
	fil.id=ult.id_filial		
		
)prof on
	prof.id_cliente=base.id
	
-- Ultima Codificação
left join(
select
ult.id_cliente,
ult.id_area,
area.descricao area,
ult.id_subdivisao,
sub.descricao subdivisao,
ult.id_segmento,
seg.descricao segmento
from(
select ult_c.id_cliente,MAX(ult_c.id) id
from bh_cli_codifica ult_c
where ult_c.exibir=1
group by ult_c.id_cliente
)ult_c
left join bh_cli_codifica ult on
	ult.id=ult_c.id
left join br_area area on
	area.id=ult.id_area	
left join br_subdivisao sub on
	sub.id=ult.id_subdivisao	
left join br_segmento seg on
	seg.id=ult.id_segmento
) codi on 
	codi.id_cliente=base.id
	
-- Ultimo Projeto
left join(
select ult.id_cliente,
       ult.id_projeto,
       pr.nome projeto
from(select id_cliente,MAX(id) id
from bh_cli_projeto
group by id_cliente)t
left join bh_cli_projeto ult on
	ult.id=t.id
left join bc_projeto pr on
	pr.id=ult.id_projeto	
)proj on
	proj.id_cliente=base.id	
	

-- Ultimo Status
left join (
select ult.id,
	   ult.id_projeto,	
	   ult.id_cliente,	
       ult.id_status,
       dsta.descricao status,
       ult.id_substatus,
       dsub.descricao substatus,
       ult.dt_alteracao
		
from (select id_cliente,max(id) id
from bh_cli_status 
where exibir=1 and id_cliente in
(
select prt.id_cliente
from(select id_cliente,MAX(id) id
from bh_cli_projeto
group by id_cliente)tt
left join bh_cli_projeto prt on
	prt.id=tt.id
)
group by id_cliente)ult_st

left join bh_cli_status ult on
	ult.id=ult_st.id

left join br_cli_status dsta on
	dsta.id=ult.id_status
	
left join br_cli_substatus dsub on
	dsub.id=ult.id_substatus
	
)status on
	status.id_cliente=base.id 	
	
	
		