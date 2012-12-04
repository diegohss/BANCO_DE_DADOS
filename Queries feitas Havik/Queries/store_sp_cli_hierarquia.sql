create procedure sp_cli_hierarquia
(
@tipo int,
@id_cliente int,
@reportase int = null,
@reportados int = null,
@qtd_subordinados int = null,
@qtd_subordinados_diretos int = null,
@usuario int,
@retorno int output
)
as

begin

if @tipo=1
begin

INSERT INTO bc_cli_hierarquia
           (
           id_cliente
           ,reportase
           ,reportados
           ,qtd_subordinados
           ,qtd_subordinados_diretos
           ,usuario_alteracao
           ,dt_alteracao
           )
     VALUES
           (
			@id_cliente,
            @reportase,
            @reportados,
            @qtd_subordinados,
            @qtd_subordinados_diretos,
            @usuario,
            GETDATE()
           )
		if @@error <> 0
		begin
		--	Set @erro=1
		--	Set @desc_erro = 'Ocorreu um erro ao atualizar....bla bla bla'
			set @retorno=0
		--	return (@erro)
		---	return (@desc_erro)
			return(@retorno)
		end
	   	else
	   	begin
	   		set @retorno=1	
	   	--	set @erro=0
	   	--	set @desc_erro=''
	   		insert into bh_cliente (id_cliente,tp_mudanca,dt_alteracao,usuario_alteracao,tabela_alteracao)
			values (@retorno,'inserção',GETDATE(),@usuario,'bc_cli_hierarquia')		
	   		return(@retorno)			   		
	   	--	return (@erro)
		--	return (@desc_erro)
		end
end
end

