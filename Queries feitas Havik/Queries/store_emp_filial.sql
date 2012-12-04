USE [havik]
GO
/****** Object:  StoredProcedure [dbo].[sp_emp_filiais]    Script Date: 09/19/2011 19:11:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Diego
-- Create date: 30/08/2011
-- Description:	Fará o Insert na bc_empresa_filial
-- =============================================
create PROCEDURE [dbo].[sp_emp_filiais]
(
@tipo int,
@id_empresa bigint,
@cnpj varchar(14),
@razao_social varchar(100),
@nome varchar(100),
@segmento bigint,
@endereco varchar(200),
@numero smallint,
@complemento varchar(60),
@bairro varchar(100),
@cidade smallint,
@estado nvarchar(2),
@pais char(2),
@offlimits tinyint,
@cep varchar(8),
@site varchar(100),
@cod_pais smallint,
@ddd smallint,
@tipo_tel bigint,
@telefone smallint,
@email varchar(200),
@usuario int
)
		
AS
begin
	-- SET NOCOUNT ON added to prevent extra result sets from
	SET NOCOUNT ON;
	DECLARE @retorno int
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
    email,
    dt_criacao
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
	@email,
	GETDATE()
	)
	
	set @retorno=@@identity		

		if @@error <> 0
		begin
			return(@@error)
		end
	   	else
	   		return(@retorno)	
		end
	
	insert into bh_empresa (id_empresa,tp_mudanca,dt_alteracao,usuario_alteracao,tabela_alteracao)
	values (@id_empresa,'inserção',GETDATE(),@usuario,'bc_empresa_filial')
		
if @tipo=2
begin

UPDATE bc_empresa_filial
   SET [id_empresa]=@id_empresa  
	  ,[nome] = @nome
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
      
 WHERE id_empresa=@id_empresa
 
 
set @retorno=@@identity		

		if @@error <> 0
		begin
			return(@@error)
		end
	   	else
	   		return(@retorno)	
		end
	
	insert into bh_empresa (id_empresa,tp_mudanca,dt_alteracao,usuario_alteracao,tabela_alteracao)
	values (@id_empresa,'update',GETDATE(),@usuario,'bc_empresa_filial')


end

	
				

