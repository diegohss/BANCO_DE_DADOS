USE [havik]
GO
/****** Object:  StoredProcedure [dbo].[sp_vw_cli_prof_filial]    Script Date: 02/28/2012 17:29:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER procedure [dbo].[sp_vw_cli_prof_filial]
(
@id_empresa int
)
as

select fil.id,fil.id_empresa,fil.nome,cid.MUNNOME cidade,fil.telefone,fil.codigo

from bc_empresa_filial fil

left join br_cidades cid on
	cid.MUNCOD=fil.cidade

where fil.id_empresa=@id_empresa	  
	  