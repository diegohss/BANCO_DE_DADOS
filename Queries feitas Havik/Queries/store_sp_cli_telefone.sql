create procedure sp_cli_telefone
(
@tipo int,
@id_cliente int,
@cod_pais varchar(8) = null,
@ddd int = null,
@telefone varchar(15) = null,
@usuario int,
@retorno int output
)

as

begin

if @tipo=1
begin

INSERT INTO havik.dbo.bh_cli_telefone
           (
           id_cliente,
           cod_pais,
           ddd,
           telefone,
           dt_alteracao,
           usuario_alteracao
           )
     VALUES
           (
           @id_cliente,
           @cod_pais,
           @ddd,
           @telefone,
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
			values (@id_cliente,'inserção',GETDATE(),@usuario,'bh_cli_telefone')	
			
	   		return(@retorno)	
	   		
	   	--	return (@erro)
		--	return (@desc_erro)
		end

end	
end
