USE [havik]
GO
/****** Object:  StoredProcedure [dbo].[sp_cli_base_cvs]    Script Date: 02/13/2012 16:07:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_proj_anexos]
(
@tipo int,
@id_projeto int = null,
@nome_arquivo varchar(200) = null,
@tipo_arquivo varchar(200) = null,
@tipo_anexo int = null,
@dados varbinary(max) = null,
@usuario int,
@retorno int output
)
as

begin
/*
if (select COUNT(*) from bh_proj_anexos where id_projeto=@id_projeto and tipo_anexo=@tipo_anexo)>=1
	begin
		set @tipo=2
	end
	else
	begin
		set @tipo=1
	end	
*/
if @tipo=1
begin

insert into bh_proj_anexos
(
id_projeto,
nome_arquivo,
tipo_arquivo,
tipo_anexo,
dados,
dt_criacao,
usuario_criacao
)
values
(
@id_projeto,
@nome_arquivo,
@tipo_arquivo,
@tipo_anexo,
@dados,
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
	   		insert into bh_projeto (id_projeto,tp_mudanca,dt_alteracao,usuario_alteracao,tabela_alteracao)
			values (@id_projeto,'inserção',GETDATE(),@usuario,'bh_proj_anexos')				
	   		return(@retorno)		   		
		end

end
/*
if @tipo=2
begin

UPDATE bh_proj_anexos
   SET 
      nome_arquivo =@nome_arquivo,
      tipo_arquivo =@tipo_arquivo,
      tipo_anexo =@tipo_anexo,
      dados = @dados,
      dt_criacao = GETDATE(),
      usuario_criacao = @usuario
 WHERE id_projeto =@id_projeto and tipo_anexo = @tipo_anexo
 
	  if @@error <> 0
		begin
			set @retorno=0
			return(@retorno)
		end
	   	else
	   	begin
	   		set @retorno=1
	   		insert into bh_projeto (id_projeto,tp_mudanca,dt_alteracao,usuario_alteracao,tabela_alteracao)
			values (@id_projeto,'update',GETDATE(),@usuario,'bh_proj_anexos')				
	   		return(@retorno)		   		
		end
 
end
*/

end