USE [havik]
GO
/****** Object:  StoredProcedure [dbo].[sp_cli_base_cvs]    Script Date: 03/23/2012 15:36:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER procedure [dbo].[sp_cli_base_cvs]
(
@tipo int,
@id_cliente int = null,
@nome_arquivo varchar(200) = null,
@tipo_arquivo varchar(200) = null,
@idioma int = null,
@caminho varchar(200) = null,
@cv nvarchar(max) = null,
@dados varbinary(max) = null,
@usuario int,
@tipo_arq varchar(10)=null,
@retorno int output
)
as

begin

if (select COUNT(*) from bc_cli_base_cvs where id_cliente=@id_cliente and idioma=@idioma)>=1
	begin
		set @tipo=2
	end
	else
	begin
		set @tipo=1
	end	

if @tipo=1
begin

insert into bc_cli_base_cvs
(
id_cliente,
nome_arquivo,
tipo_arquivo,
idioma,
caminho,
cv,
dados,
dt_criacao,
usuario_criacao,
tipo
)
values
(
@id_cliente,
@nome_arquivo,
@tipo_arquivo,
@idioma,
@caminho,
@cv,
@dados,
GETDATE(),
@usuario,
@tipo_arq
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
			values (@id_cliente,'inserção',GETDATE(),@usuario,'bc_cli_base_cvs')				
	   		return(@retorno)		   		
		end

end

if @tipo=2
begin

UPDATE bc_cli_base_cvs
   SET 
      nome_arquivo =@nome_arquivo,
      tipo_arquivo =@tipo_arquivo,
      caminho =@caminho,
      cv = @cv,
      dados = @dados,
      dt_criacao = GETDATE(),
      usuario_criacao = @usuario,
      tipo=@tipo_arq
 WHERE id_cliente =@id_cliente and idioma = @idioma
 
	  if @@error <> 0
		begin
			set @retorno=0
			return(@retorno)
		end
	   	else
	   	begin
	   		set @retorno=1
	   		insert into bh_cliente (id_cliente,tp_mudanca,dt_alteracao,usuario_alteracao,tabela_alteracao)
			values (@id_cliente,'update',GETDATE(),@usuario,'bc_cli_base_cvs')				
	   		return(@retorno)		   		
		end
 
end


end