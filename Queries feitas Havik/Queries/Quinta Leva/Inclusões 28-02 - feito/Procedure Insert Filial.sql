USE [havik]
GO
/****** Object:  StoredProcedure [dbo].[sp_emp_filiais]    Script Date: 02/28/2012 15:17:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Diego
-- Create date: 30/08/2011
-- Description:	Fará o Insert na bc_empresa_filial
-- =============================================
ALTER PROCEDURE [dbo].[sp_emp_filiais]
(
@tipo int,
@id_empresa int,
@id_filial int = null,
@nome varchar(100),
@endereco varchar(200) = null,
@numero int = null,
@complemento varchar(60) = null,
@bairro varchar(100) = null,
@cidade int = null,
@estado nvarchar(2) = null,
@pais int = null,
@cep varchar(8) = null,
@site varchar(100) = null,
@cod_pais int = null,
@ddd int = null,
@tipo_tel int = null,
@telefone int = null,
@usuario int,
@retorno int output,
@codigo varchar(10) = null
)
		
AS
begin
	-- SET NOCOUNT ON added to prevent extra result sets from
	SET NOCOUNT ON;

if @id_filial<>'' or @id_filial is not null or @id_filial=0
	begin
	set @tipo=2
	end

-- Tipo 1 = Insert ; Tipo 2 = Update	
if @tipo=1
begin
	insert into bc_empresa_filial
	(
	id_empresa,
    nome,
    endereco,
    numero,
    complemento,
    bairro,
    cidade,
    estado,
    pais,
    cep,
    site,
    cod_pais,
    ddd,
    telefone,
    dt_criacao,
    usuario_criacao,
    codigo
	)
	values 
	(
	@id_empresa,
	@nome,
	@endereco,
	@numero,
	@complemento,
	@bairro,
	@cidade,
	@estado,
	@pais,
	@cep,
	@site,
	@cod_pais,
	@ddd,
	@telefone,
	GETDATE(),
	@usuario,
	@codigo
	)
	
		if @@error <> 0
		begin
			set @retorno=0
			return(@retorno)
		end
	   	else
	   	begin
	   		set @retorno=1		
	   		insert into bh_empresa (id_empresa,tp_mudanca,dt_alteracao,usuario_alteracao,tabela_alteracao)
			values (@id_empresa,'inserção',GETDATE(),@usuario,'bc_empresa_filial')		
	   		return(@retorno)		   		
		end

end
		
if @tipo=2
begin

UPDATE bc_empresa_filial
   SET [nome] = @nome
      ,[endereco] = @endereco
      ,[numero] = @numero
      ,[complemento] = @complemento
      ,[bairro] = @bairro
      ,[cidade] = @cidade
      ,[estado] = @estado
      ,[pais] = @pais
      ,[cep] = @cep
      ,[site] = @site
      ,[cod_pais] = @cod_pais
      ,[ddd] = @ddd
      ,[telefone] = @telefone
      ,[dt_ult_alteracao] = getdate()
      ,[codigo]=@codigo
      
 WHERE id=@id_filial
 
 
		if @@error <> 0
		begin
			set @retorno=0
			return(@retorno)
		end
	   	else
	   	begin
	   		set @retorno=1		
	   		insert into bh_empresa (id_empresa,tp_mudanca,dt_alteracao,usuario_alteracao,tabela_alteracao)
			values (@id_empresa,'update',GETDATE(),@usuario,'bc_empresa_filial')
	   		return(@retorno)		   		
		end

end

end

	
				

