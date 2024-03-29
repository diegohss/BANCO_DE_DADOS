USE [havik]
GO
/****** Object:  StoredProcedure [dbo].[sp_cli_base_cvs]    Script Date: 12/13/2011 11:02:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_emp_contrato]
(
@tipo int,
@id_empresa int = null,
@nome_arquivo varchar(200) = null,
@tipo_arquivo varchar(200) = null,
@idioma int = null,
@caminho varchar(200) = null,
@contrato nvarchar(max) = null,
@dados varbinary(max) = null,
@usuario int,
@retorno int output
)
as

begin

if (select COUNT(*) from bc_emp_contrato where id_empresa=@id_empresa and idioma=@idioma)>=1
	begin
		set @tipo=2
	end
	else
	begin
		set @tipo=1
	end	

if @tipo=1
begin

insert into bc_emp_contrato
(
id_empresa,
nome_arquivo,
tipo_arquivo,
idioma,
caminho,
contrato,
dados,
dt_criacao,
usuario_criacao
)
values
(
@id_empresa,
@nome_arquivo,
@tipo_arquivo,
@idioma,
@caminho,
@contrato,
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
	   		insert into bh_empresa(id_empresa,tp_mudanca,dt_alteracao,usuario_alteracao,tabela_alteracao)
			values (@id_empresa,'inserção',GETDATE(),@usuario,'bc_emp_contrato')				
	   		return(@retorno)		   		
		end

end

if @tipo=2
begin

UPDATE bc_emp_contrato
   SET 
      nome_arquivo =@nome_arquivo,
      tipo_arquivo =@tipo_arquivo,
      caminho =@caminho,
      contrato = @contrato,
      dados = @dados,
      dt_criacao = GETDATE(),
      usuario_criacao = @usuario
 WHERE id_empresa =@id_empresa and idioma = @idioma
 
	  if @@error <> 0
		begin
			set @retorno=0
			return(@retorno)
		end
	   	else
	   	begin
	   		set @retorno=1
	   		insert into bh_empresa (id_empresa,tp_mudanca,dt_alteracao,usuario_alteracao,tabela_alteracao)
			values (@id_empresa,'update',GETDATE(),@usuario,'bc_emp_contrato')				
	   		return(@retorno)		   		
		end
 
end


end