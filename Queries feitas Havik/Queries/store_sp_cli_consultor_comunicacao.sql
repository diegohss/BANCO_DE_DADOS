USE [havik]
GO
/****** Object:  StoredProcedure [dbo].[sp_cli_consultor_comunicacao]    Script Date: 10/04/2011 18:56:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER procedure [dbo].[sp_cli_consultor_comunicacao]
(
@tipo int,
@id_cliente int,
@c_senso int = null,
@c_eloquencia int = null,
@c_objetivo int = null,
@c_energia int = null,
@c_ouvinte int = null,  
@c_mkt int = null,
@c_credibilidade int = null,
@c_estruturado int = null,
@usuario int,
@retorno int output
)
as
begin

if @tipo=1
begin
INSERT INTO bc_cli_consultor_c
           (
			id_cliente
		   ,c_senso
           ,c_eloquencia
           ,c_objetivo
           ,c_energia
           ,c_ouvinte
           ,c_mkt
           ,c_credibilidade
           ,c_estruturado
           ,usuario_alteracao
           ,dt_alteracao
           )
     VALUES
           (
			@id_cliente,
		    @c_senso,
            @c_eloquencia,
            @c_objetivo,
            @c_energia,
            @c_ouvinte, 
            @c_mkt,
            @c_credibilidade,
            @c_estruturado,
            @usuario,
            getdate()            
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
			values (@retorno,'inserção',GETDATE(),@usuario,'bc_cli_consultor_c')		
	   		return(@retorno)			   		
	   	--	return (@erro)
		--	return (@desc_erro)
		end
end

end