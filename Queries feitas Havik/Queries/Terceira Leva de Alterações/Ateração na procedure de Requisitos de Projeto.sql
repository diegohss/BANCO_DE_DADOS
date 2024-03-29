USE [havik]
GO
/****** Object:  StoredProcedure [dbo].[sp_proj_requisitos]    Script Date: 12/02/2011 16:26:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER procedure [dbo].[sp_proj_requisitos]
(
@tipo int,
@id_projeto bigint,
@tp_contrato bigint = null,
@tamanho_equipe int = null,
@experiencia int = null,
@escolaridade bigint = null,
@superior_imediato bigint = null,
@salario_mensal float = null,
@bonus float = null,
@total_cash float = null,
@salario_ini float = null,
@salario_fim float = null,
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
				   ,[salario_ini]
				   ,[salario_fim]
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
				   @usuario,
				   @salario_ini,
				   @salario_fim
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
	   		insert into bh_projeto (id_projeto,tp_mudanca,dt_alteracao,usuario_alteracao,tabela_alteracao)
			values (@id_projeto,'inserção',GETDATE(),@usuario,'bc_proj_requisitos')	
			
	   		return(@retorno)	
	   		
	   	--	return (@erro)
		--	return (@desc_erro)
		end

end	


if @tipo=2
begin

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
       [usuario_criacao] = @usuario,
       [salario_ini] = @salario_ini,
       [salario_fim] = @salario_fim
      
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
	   		set @retorno=1	
	   	--	set @erro=0
	   	--	set @desc_erro=''
	   		insert into bh_projeto (id_projeto,tp_mudanca,dt_alteracao,usuario_alteracao,tabela_alteracao)
			values (@id_projeto,'update',GETDATE(),@usuario,'bc_proj_requisitos')	
			
	   		return(@retorno)	
	   		
	   	--	return (@erro)
		--	return (@desc_erro)
		end
end	
end