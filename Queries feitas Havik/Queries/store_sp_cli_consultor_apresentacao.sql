USE [havik]
GO
/****** Object:  StoredProcedure [dbo].[sp_cli_consultor_apresentacao]    Script Date: 10/04/2011 18:57:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER procedure [dbo].[sp_cli_consultor_apresentacao]
(
@tipo int,
@id_cliente int,
@a_senso int = null,
@a_saudacao int = null,
@a_impressao int = null,
@a_levantou int = null,
@a_profissionalismo int = null,
@usuario int,
@retorno int output
)
as
begin

if @tipo=1
begin
INSERT INTO bc_cli_consultor_a
           (
			id_cliente
		   ,a_senso
           ,a_saudacao
           ,a_impressao
           ,a_levantou
           ,a_profissionalismo
           ,usuario_alteracao
           ,dt_alteracao
           )
     VALUES
           (
			@id_cliente,
			@a_senso,
            @a_saudacao,
            @a_impressao,
            @a_levantou,
            @a_profissionalismo,
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
			values (@retorno,'inserção',GETDATE(),@usuario,'bc_cli_consultor_a')		
	   		return(@retorno)			   		
	   	--	return (@erro)
		--	return (@desc_erro)
		end
end

end