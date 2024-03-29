alter procedure sp_retorno_projeto
(
@id_projeto int
)
as
SELECT 
proj.id,
proj.nome,
proj.id_empresa,
proj.segmento,
proj.area,
proj.subdivisao,
proj.cargo,
proj.tipo_produto,
proj.responsavel_captacao,
proj.responsavel_entrega,
proj.colaborador_responsavel,
proj.dt_criacao,
proj.usuario_criacao,
cli.nome,
fin.email_fatura,
fin.particularidade,
fin.keyaccount,
fin.sucesso,
fin.retainer,
fin.parcela_1,
fin.parcela_2,
fin.parcela_3,
fin.modo_pagamento,
fin.vencimento,
fin.fee,
fin.imposto,
fin.salario_ini,
fin.salario_fim,
req.tp_contrato,
req.tamanho_equipe,
req.experiencia,
req.escolaridade,
req.superior_imediato,
req.salario_mensal,
req.bonus,
req.total_cash,
site.descricao_completa,
site.resumo_descricao,
site.mostrar_site

FROM bc_projeto proj

left join bc_proj_financeiro fin on
	fin.id_projeto=proj.id
left join bc_proj_requisitos req on
	req.id_projeto=proj.id
left join bc_proj_site site on
	site.id_projeto=proj.id
left join bc_cliente cli on
	cli.id=fin.id_candidato	
	
	
where proj.id=@id_projeto		