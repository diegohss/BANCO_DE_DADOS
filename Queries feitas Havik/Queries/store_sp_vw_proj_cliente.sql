create procedure sp_vw_proj_cliente
(
@id_cliente int
)
as
SELECT 
	  base.id,
      base.nome,
      base.id_empresa,
      base.segmento,
      base.area,
      base.subdivisao,
      base.cargo,
      base.tipo_produto,
      base.responsavel_captacao,
      base.responsavel_entrega,
      base.colaborador_responsavel,
      base.dt_criacao,
      base.usuario_criacao
  FROM bc_projeto base
	
  inner join bh_cli_projeto proj on
	proj.id_projeto=base.id	  

  left join bh_proj_status stat on
	stat.id_projeto=base.id
	
where proj.id_cliente=@id_cliente
	
order by base.nome