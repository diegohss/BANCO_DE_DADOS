USE [havik]
GO
/****** Object:  StoredProcedure [dbo].[sp_cli_profissional]    Script Date: 03/20/2012 10:42:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER procedure [dbo].[sp_cli_profissional]
(
@tipo int,
@id_cliente int,
@id_empresa int,
@id_linha int = null,
@dt_inicio datetime = null,
@dt_saida datetime = null,
@id_cargo int = null,
@salario float = null,
@bonus float = null,
@realizacoes varchar(4000) = null,
@tp_contato int = null,
@filial int = null,
@usuario int,
@retorno int output,
@tp_contrato int = null
)

as

begin

set @id_linha=isnull(@id_linha,'')
if @id_linha<>'' 
begin
set @tipo=2
end
else
begin
set @tipo=1
end

if @tipo=1
begin

INSERT INTO bh_cli_profissional
(           
           id_cliente,
           id_empresa,
           dt_inicio,
           dt_saida,
           id_cargo,
           salario,
           bonus,
           realizacoes,
           dt_alteracao,
           usuario_alteracao,
           tipo_contato,
           total_cash,
           id_filial,
           id_tp_contrato
)
           
VALUES
(
           @id_cliente,
           @id_empresa,
           @dt_inicio,
           @dt_saida,
           @id_cargo,
           @salario,
           @bonus,
           @realizacoes,
           GETDATE(),
           @usuario,
           @tp_contato,
           ((@bonus * @salario) + (@salario * 12)),
           @filial,
           @tp_contrato
)           
	UPDATE bc_cliente
	SET 
       tipo_contato=@tp_contato
       
	WHERE id=@id_cliente           


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
       id_cargo = @id_cargo,
       salario = @salario,
       bonus = @bonus,
       realizacoes = @realizacoes,
       dt_alteracao = getdate(),
       usuario_alteracao = @usuario,
       tipo_contato=@tp_contato,
       total_cash=((@bonus * @salario) + (@salario * 12)),
       id_filial=@filial,
       id_tp_contrato=@tp_contrato
       
 WHERE id=@id_linha
 
 	UPDATE bc_cliente
	SET 
       tipo_contato=@tp_contato,
       empresa_contato=@id_empresa       
	WHERE id=@id_cliente         

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