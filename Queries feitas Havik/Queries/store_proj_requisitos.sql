create procedure sp_proj_requisitos
(
@tipo int,
@id_projeto bigint,
@tp_contrato bigint = null,
@tamanho_equipe int = null,
@experiencia int = null,
@escolaridade bigint = null,
@superior_imediato bigint = null,
@salario_mensal money = null,
@bonus money = null,
@total_cash money = null,
@dt_criacao datetime = null,
@usuario int,
@retorno int output
)
as

begin

	if @tipo=1
		begin
		INSERT INTO bc_proj_requisitos
				   (
					[id_projeto]
				   ,[tp_contrato]
				   ,[tamanho_equipe]
				   ,[experiencia]
				   ,[escolaridade]
				   ,[superior_imediato]
				   ,[salario_mensal]
				   ,[bonus]
				   ,[total_cash]
				   ,[dt_criacao]
				   ,[usuario_criacao]
				   )
			 VALUES
			 (
				   @id_projeto,
				   @tp_contrato,
				   @tamanho_equipe,
				   @experiencia,
				   @escolaridade,
				   @superior_imediato,
				   @salario_mensal,
				   @bonus,
				   @total_cash,
				   getdate(),
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
	   		insert into bh_projeto (id_projeto,tp_mudanca,dt_alteracao,usuario_alteracao,tabela_alteracao)
			values (@retorno,'inserção',GETDATE(),@usuario,'bc_proj_requisitos')				
	   		return(@retorno)		   		
	   	--	return (@erro)
		--	return (@desc_erro)
		end

end	


if @tipo=2

UPDATE bc_proj_requisitos
   SET 
       [tp_contrato] = @tp_contrato,
       [tamanho_equipe] = @tamanho_equipe,
       [experiencia] = @experiencia,
       [escolaridade] = @escolaridade,
       [superior_imediato] = @superior_imediato,
       [salario_mensal] = @salario_mensal,
       [bonus] = @bonus,
       [total_cash] = @total_cash,
       [dt_criacao] = getdate(),
       [usuario_criacao] = @usuario
      
 WHERE id_projeto=@id_projeto


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
	   		insert into bh_projeto (id_projeto,tp_mudanca,dt_alteracao,usuario_alteracao,tabela_alteracao)
			values (@retorno,'update',GETDATE(),@usuario,'bc_proj_requisitos')				
	   		return(@retorno)	 		
	   	--	return (@erro)
		--	return (@desc_erro)
		end
end	