alter procedure sp_proj_fin_despesas 
(
@tipo int,
@id_projeto bigint,
@id_despesa bigint,
@vl_despesa float,
@dt_alteracao datetime,
@usuario int,
@retorno int output
)

as

begin

if @tipo=1
begin

INSERT INTO bh_proj_fin_despesas
           (
			id_projeto
           ,id_despesa
           ,dt_alteracao
           ,usuario_alteracao
           ,vl_despesa 
           )
     VALUES
           (
            @id_projeto,
            @id_despesa,
            GETDATE(),
            @usuario,
            @vl_despesa 
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
			values (@retorno,'inserção',GETDATE(),@usuario,'bh_proj_fin_despesas')	
			
	   		return(@retorno)	
	   		
	   	--	return (@erro)
		--	return (@desc_erro)
		end
end

if @tipo=2
begin
UPDATE bh_proj_fin_despesas
   SET id_despesa = @id_despesa,
       dt_alteracao = @dt_alteracao,
       usuario_alteracao = @usuario,
       vl_despesa=@vl_despesa 
 WHERE id_projeto=@id_projeto

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
			values (@retorno,'update',GETDATE(),@usuario,'bh_proj_fin_despesas')	
			
	   		return(@retorno)	
	   		
	   	--	return (@erro)
		--	return (@desc_erro)
		end


end	

end

