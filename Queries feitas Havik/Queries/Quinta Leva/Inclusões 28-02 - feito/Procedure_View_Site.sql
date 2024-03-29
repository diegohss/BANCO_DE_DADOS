USE [havik]
GO
/****** Object:  StoredProcedure [dbo].[sp_retorno_projeto]    Script Date: 02/28/2012 16:14:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER procedure [dbo].[sp_retorno_projeto]
(
@id_projeto int
)
as
SELECT 
proj.id,
proj.nome,
emp.nome empresa,
proj.segmento,
proj.area,
proj.subdivisao,
proj.cargo,
proj.tipo_produto,
proj.responsavel_captacao,
proj.responsavel_entrega,
proj.colaborador_responsavel,
proj.dt_criacao dt_cadastro,
proj.usuario_criacao,
cli.nome nome_cliente,
fin.email_fatura,
fin.particularidade,
fin.keyaccount,
CONVERT(decimal(10),(fin.sucesso)) sucesso,
CONVERT(decimal(10),(fin.retainer)) retainer,
CONVERT(decimal(3),(fin.parcela_1 * 100)) parcela_1,
CONVERT(decimal(3),(fin.parcela_2 * 100)) parcela_2,
CONVERT(decimal(3),(fin.parcela_3 * 100)) parcela_3,
fin.modo_pagamento,
fin.vencimento,
fin.fee,
fin.imposto,
fin.salario_ini,
fin.salario_fim,
--Oferta
ofer.tp_contrato,
--Requisitos
req.tamanho_equipe,
req.experiencia,
req.escolaridade,
req.superior_imediato,
--Oferta
CONVERT(decimal(10),(ofer.salario_mensal)) salario_mensal,
ofer.bonus,
CONVERT(decimal(10),(ofer.total_cash)) total_cash,
-- Fim Oferta
site.descricao_completa,
site.resumo_descricao,
site.mostrar_site,
proj.id_empresa,
proj.id_requisitante,
proj.id_rh,
proj.id_estado,
proj.id_cidade,
proj_inicio=dbo.fn_dateformat(proj.dt_ini,1),
proj_fim=dbo.fn_dateformat(proj.dt_fim,1),
--Oferta com Range Salarial
req.salario_ini salario_1,
req.salario_fim salario_2,
dt_prev_shortlist=dbo.fn_dateformat(proj.dt_prev_shortlist,1),
dt_ent_shortlist=dbo.fn_dateformat(proj.dt_ent_shortlist,1),
dt_ini_busca=dbo.fn_dateformat(proj.dt_ini_busca,1),
proj.qtd_cand_shortlist,
proj.grau_dificuldade,
proj.cod_do_vagas,
proj.requisicao_vagas,
site.titulo

FROM bc_projeto proj

left join bc_proj_financeiro fin on
	fin.id_projeto=proj.id
left join bc_proj_requisitos req on
	req.id_projeto=proj.id
left join bc_proj_site site on
	site.id_projeto=proj.id
left join bc_cliente cli on
	cli.id=fin.id_candidato	
left join bc_empresa_unq emp on
	emp.id=proj.id_empresa
left join bc_proj_oferta ofer on
	ofer.id_projeto=proj.id	
	
where proj.id=@id_projeto		