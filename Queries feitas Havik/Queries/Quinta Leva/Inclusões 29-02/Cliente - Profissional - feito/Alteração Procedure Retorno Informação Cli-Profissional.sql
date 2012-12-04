USE [havik]
GO
/****** Object:  StoredProcedure [dbo].[sp_vw_cli_profissional]    Script Date: 02/29/2012 15:47:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER procedure [dbo].[sp_vw_cli_profissional]
(
@id_cliente int
)

as

SELECT base.id,
       base.id_cliente,
       base.id_empresa,
       isnull(emp.nome,base.empresa_antiga) empresa,
       dt_inicio=dbo.fn_dateformat(base.dt_inicio,1),
       dt_saida=dbo.fn_dateformat(base.dt_saida,1),
       base.id_segmento,
       seg.descricao segmento,
       base.id_area,
       area.descricao area,
       base.id_subdivisao,
       sub.descricao subdivisao,
       base.id_cargo,
       car.descricao cargo,
       convert(decimal(10),base.salario) salario,
       convert(decimal(10,2),base.bonus) bonus,
       convert(decimal(10),base.total_cash) total_cash,
       contato.id id_contato,
       contato.descricao tipo_contato,
       fil.id id_filial, 
       fil.nome filial,
       --base.realizacoes,
       dt_cadastro=dbo.fn_dateformat(base.dt_alteracao,12),
       col.nome_usuario,
       contrato.id id_tipo_contrato,
       contrato.descricao tipo_contrato
            
FROM bh_cli_profissional base

left join bc_empresa_unq emp on
	emp.id=base.id_empresa 
	
left join br_area area on
	area.id=base.id_area

left join br_cargo car on
	car.id=base.id_cargo

left join br_segmento seg on
	seg.id=base.id_segmento	
	
left join br_subdivisao sub on
	sub.id=base.id_subdivisao

left join bc_usuario col on
	col.id=base.usuario_alteracao
	
left join br_tp_contato contato on
	contato.id=base.tipo_contato	

left join bc_empresa_filial fil on
	fil.id=base.id_filial	
	
left join br_tp_contratacao contrato on
	contrato.id=base.id_tp_contrato	

where base.id_cliente=@id_cliente

order by base.dt_inicio desc     