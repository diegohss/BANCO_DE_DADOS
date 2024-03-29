/****** Script for SelectTopNRows command from SSMS  ******/
create procedure sp_vw_cli_idiomas 
(
@id_cliente int
)
as
SELECT base.id,
       base.id_cliente,
       base.id_idioma,
       idi.descricao idioma,
       base.id_nvl_idioma nvl_idioma,
       base.dt_criacao,
       base.usuario_criacao
       
FROM bh_cli_idiomas base

left join br_idiomas idi on
	idi.id=base.id_idioma
	
left join bc_usuario col on
	col.id=base.usuario_criacao
	
where base.id_cliente=@id_cliente;	