create procedure sp_retorno_cliente
(
@id_cliente int
)
as

SELECT 
cli.id,
cli.nome,
cli.cpf,
cli.dt_nascimento,
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
node.qtd_subordinados_diretos

FROM bc_cliente cli

left join bc_cli_hierarquia node on
	node.id_cliente=cli.id
	


