USE [havik_teste]
GO
/****** Object:  StoredProcedure [dbo].[sp_retorno_cliente]    Script Date: 02/15/2012 14:59:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER procedure [dbo].[sp_retorno_cliente]
(
@id_cliente int
)
as

SELECT 
cli.id,
cli.nome,
cli.cpf,
dt_nascimento=dbo.fn_dateformat(cli.dt_nascimento,1),
cli.id_estado_civil,
cli.id_sexo,
cli.endereco,
cli.numero,
cli.complemento,
cli.cep,
cli.bairro,
cli.id_cidade,
cli.id_estado,
cli.id_pais,
cli.dt_alteracao,
cli.usuario_alteracao,
node.reportados,
node.reportase,
node.qtd_subordinados,
node.qtd_subordinados_diretos,
cli.nome_mae,
cli.nome_pai,
cli.rg

FROM bc_cliente cli

left join bc_cli_hierarquia node on
	node.id_cliente=cli.id

left join bc_empresa_unq emp on
	emp.id=cli.empresa_contato
	
where cli.id=@id_cliente	
	


