USE [havik_teste]
GO
/****** Object:  StoredProcedure [dbo].[sp_cli_altera_status]    Script Date: 02/03/2012 11:51:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_cli_altera_status]
(
@id int,
@exibir int,
@usuario int,
@retorno int output
)
as

declare @id_cliente int

set @id_cliente=(select id_cliente from bh_cli_status where id=@id) 

update bh_cli_status
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
	   		insert into bh_cliente(id_cliente,tp_mudanca,dt_alteracao,usuario_alteracao,tabela_alteracao)
			values (@id_cliente,'alteracao_status',GETDATE(),@usuario,'bh_cli_status')	
	   		return(@retorno)	
		end
