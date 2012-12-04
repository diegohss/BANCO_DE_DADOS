alter procedure sp_cli_cvs
(
@id_cliente int,
@idioma varchar (50) = null,
@caminho varchar(100) = null,
@cv nvarchar(max) = null,
@usuario int,
@retorno int output
)
as

begin

declare @tipo int = null
if exists(select 1 from bc_cli_cvs where id_cliente=@id_cliente and idioma=@idioma)
begin
set @tipo=1
end
else
begin
set @tipo=2
end

if @tipo=1
begin
INSERT INTO bc_cli_cvs
(
            id_cliente
           ,idioma
           ,caminho
           ,cv
           ,dt_alteracao
           ,usuario_criacao
)
     VALUES
           (
           @id_cliente,
           @idioma,
           @caminho,
           @cv,
           GETDATE(),
           @usuario
           )
           
		if @@error <> 0
		begin
			set @retorno=0
			return(@retorno)
		end
	   	else
	   	begin
	   		set @retorno=1
	   		insert into bh_cliente (id_cliente,tp_mudanca,dt_alteracao,usuario_alteracao,tabela_alteracao)
			values (@retorno,'inserção',GETDATE(),@usuario,'bc_cli_cvs')		
	   		return(@retorno)		   		
		end           
           
           
end

if @tipo=2
begin

UPDATE bc_cli_cvs

  SET idioma = @idioma,
      caminho = @caminho,
      cv = @cv,
      dt_alteracao = getdate(),
      usuario_criacao = @usuario
    
WHERE id_cliente=@id_cliente

		if @@error <> 0
		begin
			set @retorno=0
			return(@retorno)
		end
	   	else
	   	begin
	   		set @retorno=1
	   		insert into bh_cliente (id_cliente,tp_mudanca,dt_alteracao,usuario_alteracao,tabela_alteracao)
			values (@retorno,'update',GETDATE(),@usuario,'bc_cli_cvs')		
	   		return(@retorno)		   		
		end           


end

end