use havik
go

create procedure sp_proj_mapeamento
(
@tipo int,
@id_projeto bigint,
@mapeamento bigint,
@exibir int,
@usuario int,
@retorno int output
)

as
-- Tipo 1 = Inserir
-- Tipo 2 = Deletar
begin
if @tipo=1
begin
INSERT INTO bh_proj_mapeamento
           (
           id_projeto
           ,id_mapeamento
           ,exibir
           ,usuario_alteracao
           ,dt_alteracao
           ,usuario_criacao
           ,dt_criacao
           )
     VALUES
           (
           @id_projeto,
           @mapeamento,
           @exibir,
           @usuario,
           GETDATE(),
           @usuario,
           GETDATE()
           )
         -- Gravar log  
		if @@error <> 0
		begin
			set @retorno=0
			return(@retorno)
		end
	   	else
	   	begin
	   		set @retorno=1
	   		insert into bh_projeto (id_projeto,tp_mudanca,dt_alteracao,usuario_alteracao,tabela_alteracao)
			values (@id_projeto,'inserção',GETDATE(),@usuario,'bh_proj_mapeamento')				
	   		return(@retorno)		   		
		end           

end

if @tipo=2
begin
		UPDATE bh_proj_mapeamento
		   SET exibir = @exibir,
			   usuario_alteracao = @usuario,
			   dt_alteracao = GETDATE()			  
		 WHERE id_projeto=@id_projeto and id_mapeamento=@mapeamento
		 
         -- Gravar log  
		if @@error <> 0
		begin
			set @retorno=0
			return(@retorno)
		end
	   	else
	   	begin
	   		set @retorno=1
	   		insert into bh_projeto (id_projeto,tp_mudanca,dt_alteracao,usuario_alteracao,tabela_alteracao)
			values (@id_projeto,'update',GETDATE(),@usuario,'bh_proj_mapeamento')				
	   		return(@retorno)		   		
		end           
end

end




