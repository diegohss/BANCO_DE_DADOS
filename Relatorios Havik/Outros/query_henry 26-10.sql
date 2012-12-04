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
	   prof.empresa,	   
	   uf.UFNOME estado,
	   cid.MUNNOME cidade,
	   prof.salario ultimo_salario,
	   tel.ddd,
	   tel.telefone
       

	   

from bc_cliente base

left join br_estados uf on
	uf.UFCOD=base.id_estado
	
left join br_cidades cid on
	cid.MUNCOD=base.id_cidade
	
left join bh_cli_idiomas idi on
	idi.id_cliente=base.id
	
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
inner join(
select distinct
ult.id_cliente
/*ult.id_area,
area.descricao area,
ult.id_subdivisao,
sub.descricao subdivisao,
ult.id_segmento,
seg.descricao segmento*/
from bh_cli_codifica ult
/*left join br_area area on
	area.id=ult.id_area	
left join br_subdivisao sub on
	sub.id=ult.id_subdivisao	
left join br_segmento seg on
	seg.id=ult.id_segmento	*/
where ult.exibir=1 and ult.id_segmento=1 and
ult.id_area=12
) codi on 
	codi.id_cliente=base.id
		
left join bh_cli_profissional cargo on
	cargo.id_cliente=base.id and
	cargo.id_cargo=34
	
left join 
(
select ult.*
from(select id_cliente,MAX(id) id 
from bh_cli_telefone
where exibir=1
group by id_cliente)t
left join bh_cli_telefone ult on
	ult.id=t.id) tel on
	tel.id_cliente=base.id