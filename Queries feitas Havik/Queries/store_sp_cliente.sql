use havik

go

create procedure sp_cliente
(
@tipo int,
@nome varchar(300),
@cpf varchar(11) = null,
@dt_nascimento date = null,
@estado_civil int = null,
@sexo int = null,
@endereco varchar(500) = null,
@numero varchar(20) = null,
@complemento varchar(60) = null,
@cep varchar(8) = null,
@bairro varchar(150) = null,
@cidade varchar(6) = null,
@estado varchar(2) = null,
@pais int = null, 
@usuario int,
@retorno bigint output 
)
as

begin

if @tipo=1
begin

INSERT INTO bc_cliente
(
           nome
           ,cpf
           ,dt_nascimento
           ,id_estado_civil
           ,id_sexo
           ,endereco
           ,numero
           ,complemento
           ,cep
           ,bairro
           ,id_cidade
           ,id_estado
           ,id_pais
           ,dt_alteracao
           ,usuario_alteracao
)
     VALUES
(
	@nome,
	@cpf,
	@dt_nascimento,
	@estado_civil,
	@sexo,
	@endereco,
	@numero,
	@complemento,
	@cep,
	@bairro,
	@cidade,
	@estado,
	@pais,
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
	   		set @retorno=@@identity		
	   	--	set @erro=0
	   	--	set @desc_erro=''
	   		insert into bh_cliente (id_cliente,tp_mudanca,dt_alteracao,usuario_alteracao,tabela_alteracao)
			values (@retorno,'inserção',GETDATE(),@usuario,'bc_cliente')		
	   		return(@retorno)		   		
	   	--	return (@erro)
		--	return (@desc_erro)
		end
end

if @tipo=2
begin

UPDATE bc_cliente
   SET nome = @nome,
       cpf = @cpf,
       dt_nascimento = @dt_nascimento,
       id_estado_civil = @estado_civil,
       id_sexo = @sexo,
       endereco = @endereco,
       numero = @numero,
       complemento = @complemento,
       cep = @cep,
       bairro = @bairro,
       id_cidade = @cidade,
       id_estado = @estado,
       id_pais = @pais,
       usuario_alteracao = @usuario
 WHERE id=@usuario


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
			values (@retorno,'update',GETDATE(),@usuario,'bc_cliente')		
	   		return(@retorno)		   		
	   	--	return (@erro)
		--	return (@desc_erro)
		end
end

end