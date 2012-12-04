create procedure sp_cli_academico
(
@tipo int,
@id_cliente int,
@id_escolaridade int,
@instituicao varchar(400) = null,
@id_graduacao int = null,
@id_ano_formacao int = null,
@usuario int,
@retorno int output
)

as

begin

if @tipo=1

INSERT INTO bh_cli_academico
           (
            id_cliente
           ,id_escolaridade
           ,instituicao
           ,id_graduacao
           ,id_ano_formacao
           ,dt_alteracao
           ,usuario_criacao
           )
     VALUES
     (
           @id_cliente,
           @id_escolaridade,
           @instituicao,
           @id_graduacao,
           @id_ano_formacao,
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
	   		insert into bh_cliente (id_cliente,tp_mudanca,dt_alteracao,usuario_alteracao,tabela_alteracao)
			values (@retorno,'inserção',GETDATE(),@usuario,'bh_cli_profissional')		
	   		return(@retorno)			   		
	   	--	return (@erro)
		--	return (@desc_erro)
		end
end
           


