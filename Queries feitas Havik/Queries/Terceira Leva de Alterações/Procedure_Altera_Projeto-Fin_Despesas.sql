USE [havik]
GO
/****** Object:  StoredProcedure [dbo].[sp_proj_]    Script Date: 12/19/2011 13:36:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_proj_altera_fin_despesas]
(
@id int,
@exibir int,
@usuario int,
@retorno int output
)
as

declare @id_projeto int

set @id_projeto=(select id_projeto from bh_proj_fin_despesas where id=@id) 

update bh_proj_fin_despesas
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
			values (@id_projeto,'alteracao_fin_despesas',GETDATE(),@usuario,'bh_proj_fin_despesas')	
	   		return(@retorno)	
		end
