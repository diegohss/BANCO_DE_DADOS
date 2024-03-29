USE [havik]
GO
/****** Object:  StoredProcedure [dbo].[sp_proj_perfil]    Script Date: 12/02/2011 15:19:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_proj_perfil]
(
@tipo int,
@id_projeto bigint,
@perfil int,
@usuario int,
@retorno int output
)
as

begin

if @tipo=1
begin
INSERT INTO [havik].[dbo].[bh_proj_perfil]
           (
           [id_projeto]
           ,[perfil]
           ,[dt_criacao]
           ,[usuario_criacao]
           )
     VALUES
           (
           @id_projeto,
           @perfil,
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
	   		insert into bh_projeto (id_projeto,tp_mudanca,dt_alteracao,usuario_alteracao,tabela_alteracao)
			values (@id_projeto,'inserção',GETDATE(),@usuario,'bh_proj_perfil')				
	   		return(@retorno)		   		
	   	--	return (@erro)
		--	return (@desc_erro)
		end

end	

end
