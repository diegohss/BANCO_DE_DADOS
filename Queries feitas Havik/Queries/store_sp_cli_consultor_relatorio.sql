USE [havik]
GO
/****** Object:  StoredProcedure [dbo].[sp_cli_consultor_relatorio]    Script Date: 10/04/2011 18:53:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER procedure [dbo].[sp_cli_consultor_relatorio]
(
@tipo int,
@id_cliente int,
@salario float = null,
@movimento int = null,
@mudanca int = null,
@usuario int,
@retorno int output
)
as
begin

if @tipo=1
begin
INSERT INTO bc_cli_consultor_r
           (
			id_cliente
           ,salario
           ,movimento
           ,mudanca
           ,usuario_alteracao
           ,dt_alteracao
           )
     VALUES
           (
			@id_cliente,
            @salario,
            @movimento,
            @mudanca,
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
			values (@retorno,'inserção',GETDATE(),@usuario,'bc_cli_consultor_r')		
	   		return(@retorno)			   		
	   	--	return (@erro)
		--	return (@desc_erro)
		end
end

end