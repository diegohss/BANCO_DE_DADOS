USE [havik]
GO

/****** Object:  StoredProcedure [dbo].[sp_cli_idiomas]    Script Date: 09/27/2011 14:01:57 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[sp_cli_idiomas]
(
@tipo int,
@id_cliente bigint,
@idioma bigint,
@nvl_idioma int,
@usuario int,
@retorno int output
)

as

begin

if @tipo=1

INSERT INTO bh_cli_idiomas
           (
           id_cliente
           ,id_idioma
           ,id_nvl_idioma
           ,dt_criacao
           ,usuario_criacao
           )
     VALUES
           (
           @id_cliente,
           @idioma,
           @nvl_idioma,
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
			values (@retorno,'inserção',GETDATE(),@usuario,'bh_cli_idiomas')				
	   		return(@retorno)		   		
	   	--	return (@erro)
		--	return (@desc_erro)
		end

end	



GO


