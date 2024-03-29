USE [havik]
GO
/****** Object:  StoredProcedure [dbo].[sp_cli_altera_codifica] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_cli_altera_codifica]
(
@id int,
@usuario int,
@retorno int output
)
as

declare @id_cliente int

set @id_cliente=(select id_cliente from bh_cli_codifica where id=@id) 

update bh_cli_codifica
set exibir=0
where id=@id

		if @@error <> 0
		begin
			set @retorno=0
			return(@retorno)
		end
	   	else
	   	begin
	   		set @retorno=1	
	   		insert into bh_cliente(id_cliente,tp_mudanca,dt_alteracao,usuario_alteracao,tabela_alteracao)
			values (@id_cliente,'alteracao_status',GETDATE(),@usuario,'bh_cli_codifica')	
	   		return(@retorno)	
		end
