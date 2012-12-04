use havik_teste
go
create procedure sp_cli_reporta_duplicidade
(
@id_cliente int,
@usuario int,
@verifica int,
@retorno int output
)
as
insert into bh_cli_duplicidade
(
id_cliente,
verificado,
usuario_criacao,
dt_criacao
)
values
(
@id_cliente,
1,
@usuario,
getdate()
)
		if @@error <> 0
		begin
			set @retorno=0
			return(@retorno)
		end
	   	else
	   	begin
	   		set @retorno=1	
	   		insert into bh_cliente (id_cliente,tp_mudanca,dt_alteracao,usuario_alteracao,tabela_alteracao)
			values (@id_cliente,'inserção',GETDATE(),@usuario,'bh_cli_duplicidade')		
	   		return(@retorno)			   		
		end