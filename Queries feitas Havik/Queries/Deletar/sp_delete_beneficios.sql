create procedure sp_delete_cli_beneficios
(
@id_cliente int,
@id_beneficio int,
@usuario int,
@retorno int output
)
as

delete from bh_cli_beneficios
where id_cliente=@id_cliente and id_beneficios=@id_beneficio

		if @@error <> 0
		begin
			set @retorno=0
			return(@retorno)
		end
	   	else
	   	begin
	   		set @retorno=1
	   		insert into bh_cliente (id_cliente,tp_mudanca,dt_alteracao,usuario_alteracao,tabela_alteracao)
			values (@id_cliente,'deleção',GETDATE(),@usuario,'bh_cli_beneficios')				
	   		return(@retorno)
		end

