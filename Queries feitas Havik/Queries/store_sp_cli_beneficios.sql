USE [havik]
GO
/****** Object:  StoredProcedure [dbo].[sp_cli_beneficios]    Script Date: 09/26/2011 18:25:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure sp_cli_beneficios
(
@tipo int,
@id_cliente bigint,
@beneficios int,
@usuario int,
@retorno int output
)
as

begin

if @tipo=1
begin
INSERT INTO bh_cli_beneficios
           (
            id_cliente
           ,id_beneficios
           ,dt_alteracao
           ,usuario_alteracao
           )
     VALUES
           (
           @id_cliente,
           @beneficios,
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
	   		insert into bh_projeto (id_projeto,tp_mudanca,dt_alteracao,usuario_alteracao,tabela_alteracao)
			values (@retorno,'inserção',GETDATE(),@usuario,'bh_cli_beneficios')				
	   		return(@retorno)
	   	--	return (@erro)
		--	return (@desc_erro)
		end

end	

end
