USE [havik]
GO

/****** Object:  StoredProcedure [dbo].[sp_delete_proj_perfil]    Script Date: 12/02/2011 16:22:19 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[sp_delete_proj_perfil]
(
@id_projeto int,
@id_perfil int,
@usuario int,
@retorno int output
)
as

delete from bh_proj_perfil
where id_projeto=@id_projeto and perfil=@id_perfil

		if @@error <> 0
		begin
			return(@retorno)
		end
	   	else
	   	begin
	   		set @retorno=1
	   		insert into bh_projeto (id_projeto,tp_mudanca,dt_alteracao,usuario_alteracao,tabela_alteracao)
			values (@id_projeto,'deleção',GETDATE(),@usuario,'bh_proj_perfil')				
	   		return(@retorno)		   		
		end
GO


