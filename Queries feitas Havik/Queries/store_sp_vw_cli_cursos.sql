alter procedure sp_vw_cli_cursos
(
@id_cliente int
)
as

SELECT 
	   base.id,
       base.id_cliente,
       base.curso,
       base.dt_criacao,
       col.nome_usuario
      
FROM bh_cli_cursos base

left join bc_usuario col on
	col.id=base.usuario_criacao
	
where base.id_cliente=@id_cliente	

order by base.curso desc