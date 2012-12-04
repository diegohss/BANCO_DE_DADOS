-- Levantamento Cargos
/*
1.)    Estou enviando abaixo, dados para envio de uma proposta de motoristas bilíngues para atender a empresa  (com ou sem carro – Fiat Double) 
 
 
2.)    Necessito de uma pesquisa salarial para os seguintes cargos – para que possamos reavaliar nossos salários (anexo nosso organograma para facilitar )
 
(todos bilíngues) 
Recursos Humanos / Financeiro / Logistica / Operações / Comunicação
Diretor / gerente senior / gerente / supervisor / coordenador / assistente

Favor gerar uma tabela com os seguintes dados:
 
Candidato
Estado
Salario-ultimo)
Que estejam classificados com inglês 1 ou 2
Cargo-ultimo
Segmento/subdivisão/segmento-ultimos


*/
use havik
go

select distinct uf.UFNOME estado,
       base.id id_candidato,
	   base.nome nome_candidato,
	   prof.salario ultimo_salario,
	   prof.cargo ultimo_cargo,
	   codi.area,
	   codi.subdivisao,
	   codi.segmento

from bc_cliente base

left join br_estados uf on
	uf.UFCOD=base.id_estado

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
		
	
where (idi.id_idioma=1 and idi.id_nvl_idioma in (1,2))	