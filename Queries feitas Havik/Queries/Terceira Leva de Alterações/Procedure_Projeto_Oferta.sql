USE [havik]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_proj_oferta]
(
@tipo int,
@id_projeto bigint,
@tp_contrato bigint = null,
@salario_mensal float = null,
@bonus float = null,
@total_cash float = null,
@usuario int,
@retorno int output
)
as

begin

	if @tipo=1
		begin
		INSERT INTO bc_proj_oferta
				   (
					[id_projeto]
				   ,[tp_contrato]
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
	   		set @retorno=1	
	   	--	set @erro=0
	   	--	set @desc_erro=''
	   		insert into bh_projeto (id_projeto,tp_mudanca,dt_alteracao,usuario_alteracao,tabela_alteracao)
			values (@id_projeto,'inserção',GETDATE(),@usuario,'bc_proj_oferta')	
			
	   		return(@retorno)	
	   		
	   	--	return (@erro)
		--	return (@desc_erro)
		end

end	


if @tipo=2
begin

UPDATE bc_proj_oferta
   SET 
       [tp_contrato] = @tp_contrato,
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
	   		set @retorno=1	
	   	--	set @erro=0
	   	--	set @desc_erro=''
	   		insert into bh_projeto (id_projeto,tp_mudanca,dt_alteracao,usuario_alteracao,tabela_alteracao)
			values (@id_projeto,'update',GETDATE(),@usuario,'bc_proj_oferta')	
			
	   		return(@retorno)	
	   		
	   	--	return (@erro)
		--	return (@desc_erro)
		end
end	
end