create procedure sp_cli_profissional
(
@tipo int,
@id_cliente int,
@id_empresa int,
@dt_inicio datetime,
@dt_saida datetime,
@id_segmento int,
@id_area int,
@id_subdivisao int,
@id_cargo int,
@salario float,
@bonus float,
@realizacoes varchar(4000),
@usuario int,
@retorno int output
)


as

begin

if @tipo=1
begin

INSERT INTO bh_cli_profissional
(           
           id_cliente,
           id_empresa,
           dt_inicio,
           dt_saida,
           id_segmento,
           id_area,
           id_subdivisao,
           id_cargo,
           salario,
           bonus,
           realizacoes,
           dt_alteracao,
           usuario_alteracao
)
           
VALUES
(
           @id_cliente,
           @id_empresa,
           @dt_inicio,
           @dt_saida,
           @id_segmento,
           @id_area,
           @id_subdivisao,
           @id_cargo,
           @salario,
           @bonus,
           @realizacoes,
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

if @tipo=2
begin

UPDATE bh_cli_profissional
   SET id_empresa = @id_empresa,
       dt_inicio = @dt_inicio,
       dt_saida = @dt_saida,
       id_segmento = @id_segmento,
       id_area = @id_area,
       id_subdivisao = @id_subdivisao,
       id_cargo = @id_cargo,
       salario = @salario,
       bonus = @bonus,
       realizacoes = @realizacoes,
       dt_alteracao = getdate(),
       usuario_alteracao = @usuario
       
 WHERE id_cliente = @id_cliente

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
			values (@retorno,'update',GETDATE(),@usuario,'bh_cli_profissional')		
	   		return(@retorno)			   		
	   	--	return (@erro)
		--	return (@desc_erro)
		end
end

end