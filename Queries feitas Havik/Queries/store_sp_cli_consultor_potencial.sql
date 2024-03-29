USE [havik]
GO
/****** Object:  StoredProcedure [dbo].[sp_cli_consultor_potencial]    Script Date: 10/04/2011 18:54:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER procedure [dbo].[sp_cli_consultor_potencial]
(
@tipo int,
@id_cliente int,
@p_inteligencia int = null,
@p_maturidade int = null,
@p_visao int = null,
@p_confianca int = null,
@p_honestidade int = null,
@p_punch int = null,
@p_carisma int = null,
@usuario int,
@retorno int output
)
as
begin

if @tipo=1
begin
INSERT INTO bc_cli_consultor_p
           (
			id_cliente
           ,p_inteligencia
           ,p_maturidade
           ,p_visao
           ,p_confianca
           ,p_honestidade
           ,p_punch
           ,p_carisma
           ,usuario_alteracao
           ,dt_alteracao
           )
     VALUES
           (
			@id_cliente,
            @p_inteligencia,
            @p_maturidade,
            @p_visao,
            @p_confianca,
            @p_honestidade,
            @p_punch,
            @p_carisma,
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
			values (@retorno,'inserção',GETDATE(),@usuario,'bc_cli_consultor_p')		
	   		return(@retorno)			   		
	   	--	return (@erro)
		--	return (@desc_erro)
		end
end

end