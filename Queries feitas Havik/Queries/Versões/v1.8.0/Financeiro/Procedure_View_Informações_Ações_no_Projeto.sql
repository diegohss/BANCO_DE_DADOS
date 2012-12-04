use havik_teste
go
create procedure sp_vw_proj_acoes
(
@id_projeto int = null
)
as

select 
	acao.descricao acao,
	prod.descricao produto,
	emp.nome empresa,
	proj.nome projeto,
	equi.nome_usuario equipe,
	rcap.nome_usuario resp_captacao,
	rent.nome_usuario resp_entrega,	
	anl.nome_usuario colaborador_resp,
	base.fee,
	imp.descricao imposto,
	base.valor_nota,
	base.particularidades,
	base.fee,
	cli.nome candidato,
	base.base_faturamento,
	base.salario_final,
	modo.descricao modo_pagamento,
	base.vencimento data_vencimento,
	base.email_fatura email_contato,
	proj.cod_do_vagas numero_vagas,
	proj.requisicao_vagas,
	base.parcelas qtd_parcelas
	
from bh_proj_financeiro base

left join br_acao acao on
	acao.id=base.acao
	
left join bc_projeto proj on
	proj.id=base.id_projeto	
	
left join br_modo_pagamento modo on
	modo.id=base.id_modo_pagamento	
	
left join br_tp_produto prod on
	prod.id=proj.tipo_produto	
	
left join bh_fin_status fin on
	fin.id_acao=base.id	

left join br_impostos imp on
	imp.id=base.id_impostos
	
left join bc_usuario rent on
	rent.id=proj.responsavel_entrega
	
left join bc_usuario rcap on
	rcap.id=proj.responsavel_captacao
	
left join bc_usuario equi on
	equi.id=proj.equipe
	
left join bc_usuario anl on
	anl.id=proj.colaborador_responsavel	
	
left join bc_empresa_unq emp on
	emp.id=proj.id_empresa
	
left join bc_cliente cli on
	cli.id=base.id_cliente							

where base.id_projeto=@id_projeto
