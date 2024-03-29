USE [havik_teste]
GO
/****** Object:  StoredProcedure [dbo].[sp_vw_fin_inicio]    Script Date: 04/27/2012 16:57:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER procedure [dbo].[sp_vw_fin_inicio]
(
@acao varchar(10) = null,
@st_financeiro varchar(10) = null,
@resp_entrega varchar(10) = null,
@produto varchar(10) = null,
@periodo varchar(10) = null,
@resp_captacao varchar(10) = null,
@empresa varchar(10) = null
)
as

if @acao='0' set @acao=null
if @st_financeiro='0' set @st_financeiro=null
if @resp_entrega='0' set @resp_entrega=null
if @produto='0' set @produto=null
if @periodo='0' set @periodo=null
if @resp_captacao='0' set @resp_captacao=null
if @empresa='0' set @empresa=null

select
	base.id,
	acao.id,
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
	cli.id id_candidato,
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
	
left join br_fin_periodo per on
	per.id=@periodo	

where 
(base.acao=@acao or @acao is null) /*and (fin.id_status=@st_financeiro or @st_financeiro is null) and
(proj.responsavel_entrega=@resp_entrega or @resp_entrega is null) and
(proj.responsavel_captacao=@resp_captacao or @resp_captacao is null) and
(proj.tipo_produto=@produto or @produto is null) and
(proj.id_empresa=@empresa or @empresa is null) 
and (convert(char(10),base.dt_alteracao,23)>=(convert(char(10),dateadd(day,per.valor,GETDATE()),23)) or @periodo is null)
*/