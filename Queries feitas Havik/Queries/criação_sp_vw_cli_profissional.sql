use havik

go

create procedure sp_vw_cli_profissional
(
@id_cliente int
)

as

SELECT base.id,
       base.id_cliente,
       base.id_empresa,
       emp.nome empresa,
       base.dt_inicio,
       base.dt_saida,
       base.id_segmento,
       seg.descricao segmento,
       base.id_area,
       area.descricao area,
       base.id_subdivisao,
       sub.descricao subdivisao,
       base.id_cargo,
       car.descricao cargo,
       base.salario,
       base.bonus,
       base.total_cash,
       base.realizacoes,
       base.dt_alteracao,
       col.nome_usuario
            
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

where base.id_cliente=@id_cliente

order by base.dt_inicio desc     