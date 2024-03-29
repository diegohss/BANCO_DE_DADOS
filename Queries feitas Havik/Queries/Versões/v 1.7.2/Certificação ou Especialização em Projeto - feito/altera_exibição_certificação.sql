USE [havik]
GO
/****** Object:  StoredProcedure [dbo].[sp_proj_altera_graduacao]    Script Date: 03/27/2012 15:09:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_proj_altera_certificacao]
(
@id int,
@exibir int,
@usuario int,
@retorno int output
)
as

declare @id_projeto int

set @id_projeto=(select id_projeto from bh_proj_certificacao where id=@id) 

update bh_proj_certificacao
set exibir=@exibir
where id=@id

		if @@error <> 0
		begin
			set @retorno=0
			return(@retorno)
		end
	   	else
	   	begin
	   		set @retorno=1	
	   		insert into bh_projeto(id_projeto,tp_mudanca,dt_alteracao,usuario_alteracao,tabela_alteracao)
			values (@id_projeto,'alteracao_certificacao',GETDATE(),@usuario,'bh_proj_certificacao')	
	   		return(@retorno)	
		end
