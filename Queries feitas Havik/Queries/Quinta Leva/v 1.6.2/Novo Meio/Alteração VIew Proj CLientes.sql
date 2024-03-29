USE [havik]
GO
/****** Object:  StoredProcedure [dbo].[sp_vw_cli_proj_cliente]    Script Date: 03/05/2012 16:36:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER procedure [dbo].[sp_vw_cli_proj_cliente]
(
@id_cliente int
)
as
SELECT distinct
	  base.id,
      base.nome projeto,
      base.id_empresa,
      emp.nome empresa,
      indi.nome_usuario indicado_por,
      base.segmento id_segmento,
      seg.descricao segmento,
      base.area id_area,
      area.descricao area,
      base.subdivisao id_subdvisao,
      sub.descricao subdivisao,
      base.cargo id_cargo,
      cargo.descricao cargo,
      base.tipo_produto id_tp_produto,
      prod.descricao tipo_produto,
      base.responsavel_captacao id_responsavel_captacao,
      cap.nome_usuario responsavel_captacao,
      base.responsavel_entrega id_responsavel_entrega,
      ent.nome_usuario responsavel_entrega,
      base.colaborador_responsavel id_colaborador_responsavel,
      col.nome_usuario colaborador_responsavel,
      dt_cadastro=dbo.fn_dateformat(base.dt_criacao,12),
      us.nome_usuario usuario_criacao
  FROM bc_projeto base
	
  inner join bh_cli_projeto proj on
	proj.id_projeto=base.id	  	

  LEFT JOIN bc_empresa_unq emp on
	emp.id=base.id_empresa

  left join bh_proj_status stat on
	stat.id_projeto=base.id

  left join	br_area area on
	area.id=base.id
	
  left join br_subdivisao sub on
	sub.id=base.subdivisao	

  left join br_cargo cargo on
	cargo.id=base.cargo		
	
  left join br_segmento seg on
	seg.id=base.segmento
	
  left join br_tp_produto prod on
	prod.id=base.tipo_produto 	
	
  left join bc_usuario cap on
	cap.id=base.responsavel_captacao	

  left join bc_usuario ent on
	ent.id=base.responsavel_entrega

  left join bc_usuario col on
	col.id=base.colaborador_responsavel
	
  left join	bh_cli_indicado ind on
	ind.id_cliente=@id_cliente and
	ind.id_projeto=base.id
	
  left join bc_usuario indi on
	indi.id=ind.id_indicado

  left join bc_usuario us on
		us.id=base.usuario_criacao
	
where proj.id_cliente=@id_cliente
	
order by dt_cadastro desc,base.nome