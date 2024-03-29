USE [havik]
GO
/****** Object:  StoredProcedure [dbo].[sp_vw_cli_anexos]    Script Date: 02/03/2012 14:29:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER procedure [dbo].[sp_vw_cli_anexos]
(
@id_cliente int 
)
as
select idi.descricao tipo,
	   us.nome_usuario,
	   data_anexo=dbo.fn_dateformat(cvs.dt_criacao,12),
	   COUNT(cvs.id) qtd

from bc_cli_base_cvs cvs

left join br_cli_cvs_idiomas idi on
	idi.id=cvs.idioma
	
left join bc_usuario us on
	us.id=cvs.usuario_criacao	
	
where cvs.id_cliente=@id_cliente
	
group by idi.descricao,
	   us.nome_usuario,
	   dbo.fn_dateformat(cvs.dt_criacao,12)	