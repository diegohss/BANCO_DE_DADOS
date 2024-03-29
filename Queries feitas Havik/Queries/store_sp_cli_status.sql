USE [havik]
GO
/****** Object:  StoredProcedure [dbo].[sp_cli_status]    Script Date: 10/03/2011 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER procedure [dbo].[sp_cli_status]
(
@tipo int,
@id_cliente int,
@id_projeto int = null,
@id_status int,
@id_substatus int,
@dt_agendada datetime = null,
@obs varchar(4000) = null,
@usuario int,
@retorno int output
)
as

begin

if @tipo=1
begin
INSERT INTO bh_cli_status
           (
            id_cliente,
            id_projeto,
            id_status,
            id_substatus,
            obs,   
            dt_agendada,                     
            dt_criacao,
            usuario_criacao
           )
     VALUES
           (
            @id_cliente,
            @id_projeto,
            @id_status,
            @id_substatus,
            @obs,
            @dt_agendada,
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
	   		set @retorno=1
	   	--	set @erro=0
	   	--	set @desc_erro=''
	   		insert into bh_cliente(id_cliente,tp_mudanca,dt_alteracao,usuario_alteracao,tabela_alteracao)
			values (@retorno,'inserção',GETDATE(),@usuario,'bh_cli_status')				
	   		return(@retorno)
	   	--	return (@erro)
		--	return (@desc_erro)
		end

end	
end