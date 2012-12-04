/* 
Procedure para alimentar as informações da Dimensão Candidato
*/
INSERT INTO bi_kivah.dbo.dim_candidato
(
           cod_candidato
           ,nome_candidato
           ,cidade
           ,estado
           ,idade
           ,ult_empresa
           ,ult_salario
           ,ult_cargo
           ,ult_area
           ,ult_subdivisao
           ,ult_segmento
)
select base.id cod_candidato,
	   base.nome nome_candidato,
	   cid.MUNNOME cidade,
	   uf.UFNOME estado,
	   bi_kivah.dbo.calculaidade(base.dt_nascimento) idade,
	   isnull(prof.empresa,prof.empresa_antiga) empresa,
	   prof.salario,
	   prof.cargo,
	   codi.area,
	   codi.subdivisao,
	   codi.segmento

from havik.dbo.bc_cliente base

left join havik.dbo.br_cidades cid on
	cid.MUNCOD=base.id_cidade

left join havik.dbo.br_estados uf on
	uf.UFCOD=base.id_estado
	
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
	   ult.bonus
from (
SELECT a.id
FROM havik.dbo.bh_cli_profissional a
WHERE a.ID IN
(SELECT TOP 1 b.id FROM havik.dbo.bh_cli_profissional b WHERE b.id_cliente = a.id_cliente ORDER BY b.dt_inicio DESC)
)ult_prof
left join havik.dbo.bh_cli_profissional ult on
	ult.id=ult_prof.id	
left join havik.dbo.br_cargo cargo on
	cargo.id=ult.id_cargo	
left join havik.dbo.bc_empresa_filial fil on
	fil.id=ult.id_filial		
left join havik.dbo.bc_empresa_unq emp on
	emp.id=ult.id_empresa	
)prof on
	prof.id_cliente=base.id
	
-- Codificação
left join(
select cod.id_cliente,
	   cod.id_area,
	   area.descricao area,
	   cod.id_subdivisao,
	   sub.descricao subdivisao,
	   cod.id_segmento,
	   seg.descricao segmento

from (select ult.id_cliente,max(ult.id) id
from havik.dbo.bh_cli_codifica ult
where ult.exibir=1 
group by ult.id_cliente)ult_cod

left join havik.dbo.bh_cli_codifica cod on
	cod.id=ult_cod.id	
left join havik.dbo.br_area area on
	area.id=cod.id_area	
left join havik.dbo.br_subdivisao sub on
	sub.id=cod.id_subdivisao	
left join havik.dbo.br_segmento seg on
	seg.id=cod.id_segmento	
)codi on
	codi.id_cliente=base.id	
left join bi_kivah.dbo.dim_candidato rep on
	rep.cod_candidato=base.id
	
where rep.cod_candidato is null		