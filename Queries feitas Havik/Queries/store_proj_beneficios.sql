create procedure sp_proj_beneficios
(
@tipo int,
@id_projeto bigint,
@beneficios int,
@usuario int,
@retorno int output
)
as

begin

if @tipo=1

INSERT INTO [havik].[dbo].[bh_proj_beneficios]
           (
           [id_projeto]
           ,[beneficios]
           ,[dt_criacao]
           ,[usuario_criacao]
           )
     VALUES
           (
           @id_projeto,
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
			values (@retorno,'inser��o',GETDATE(),@usuario,'bh_proj_beneficios')				
	   		return(@retorno)		   		
	   	--	return (@erro)
		--	return (@desc_erro)
		end

end	


