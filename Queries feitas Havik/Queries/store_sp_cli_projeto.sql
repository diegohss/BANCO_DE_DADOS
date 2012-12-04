create procedure sp_cli_projeto
(
@tipo int,
@id_cliente int,
@id_projeto int,
@usuario int,
@retorno int output
)
as

begin

if @tipo=1
begin
INSERT INTO bh_cli_projeto
           (
            id_cliente
           ,id_projeto
           ,dt_criacao
           ,usuario_criacao
           )
     VALUES
           (
           @id_cliente,
           @id_projeto,
           GETDATE(),
           @usuario
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
	   		insert into bh_cliente(id_cliente,tp_mudanca,dt_alteracao,usuario_alteracao,tabela_alteracao)
			values (@retorno,'inserção',GETDATE(),@usuario,'bh_cli_projeto')				
	   		return(@retorno)
	   	--	return (@erro)
		--	return (@desc_erro)
		end

end	
end


