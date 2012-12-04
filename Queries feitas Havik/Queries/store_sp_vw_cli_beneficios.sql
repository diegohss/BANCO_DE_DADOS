create procedure sp_vw_cli_beneficios
(
@id_cliente int
)
as
SELECT base.id,
       base.id_cliente,
       base.id_beneficios,
       ben.descricao beneficios,
       base.dt_alteracao,
       col.nome_usuario
      
FROM bh_cli_beneficios base

left join bc_usuario col on
	col.id=base.usuario_alteracao
	
left join br_cli_beneficios ben on
	ben.id=base.id_beneficios	
	
where base.id_cliente=@id_cliente	
	