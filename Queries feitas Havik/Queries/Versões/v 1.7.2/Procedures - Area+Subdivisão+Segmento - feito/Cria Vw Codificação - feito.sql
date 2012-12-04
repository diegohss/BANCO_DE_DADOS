use havik

go

create procedure sp_vw_cli_codifica
(
@id_cliente int=null
)
as

select cod.id,
	   cod.id_area,
	   ar.descricao area,
	   cod.id_subdivisao,
	   sub.descricao subdivisao,
	   cod.id_segmento,
	   seg.descricao segmento,
	   us.nome_usuario usuario,
	   dt_criacao=dbo.fn_dateformat(cod.dt_alteracao,12) 


from bh_cli_codifica cod

left join bc_usuario us on
	us.id=cod.usuario_alteracao
	
left join br_area ar on
	ar.id=cod.id_area

left join br_subdivisao sub	on
	sub.id=cod.id_subdivisao

left join br_segmento seg on
	seg.id=cod.id_segmento
	
where cod.id_cliente=@id_cliente and cod.exibir=1	