USE [havik]
GO
/****** Object:  StoredProcedure [dbo].[sp_cliente]    Script Date: 02/29/2012 15:21:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER procedure [dbo].[sp_cliente]
(
@tipo int,
@id_cliente int = null,
@nome varchar(300),
@cpf varchar(11) = null,
@dt_nascimento date = null,
@estado_civil int = null,
@sexo int = null,
@endereco varchar(500) = null,
@cep varchar(8) = null,
@bairro varchar(150) = null,
@cidade varchar(6) = null,
@estado varchar(2) = null,
@pais int = null, 
@rg varchar(15) = null,
@pai varchar(150) = null,
@mae varchar(150) = null,
@numero varchar(20) = null,
@complemento varchar(60) = null,
@usuario int,
@retorno bigint output,
@uf_naturalidade varchar(2) = null,
@naturalidade varchar(6) = null
)
as

begin

if @id_cliente<>'' or @id_cliente is not null or @id_cliente=0
	begin
	set @tipo=2
	end
	
if @tipo=1
begin

INSERT INTO bc_cliente
(
           nome
           ,cpf
           ,dt_nascimento
           ,id_estado_civil
           ,id_sexo
           ,endereco
           ,cep
           ,bairro
           ,id_cidade
           ,id_estado
           ,id_pais
           ,dt_alteracao
           ,usuario_alteracao
           ,nome_mae
           ,nome_pai
           ,rg
           ,numero
           ,complemento
           ,id_uf_natural
           ,id_natural
)
     VALUES
(
	@nome,
	@cpf,
	@dt_nascimento,
	@estado_civil,
	@sexo,
	@endereco,
	@cep,
	@bairro,
	@cidade,
	@estado,
	@pais,
	GETDATE(), 
	@usuario,
	@mae,
	@pai,
	@rg,
	@numero,
	@complemento,
	@uf_naturalidade,
	@naturalidade      
)

		if @@error <> 0
		begin
			set @retorno=0
			return(@retorno)
		end
	   	else
	   	begin
	   		set @retorno=@@identity		
	   		insert into bh_cliente (id_cliente,tp_mudanca,dt_alteracao,usuario_alteracao,tabela_alteracao)
			values (@retorno,'inserção',GETDATE(),@usuario,'bc_cliente')		
	   		return(@retorno)		   		
		end
end

if @tipo=2
begin

UPDATE bc_cliente
   SET nome = @nome,
       cpf = @cpf,
       dt_nascimento = @dt_nascimento,
       id_estado_civil = @estado_civil,
       id_sexo = @sexo,
       endereco = @endereco,
       cep = @cep,
       bairro = @bairro,
       id_cidade = @cidade,
       id_estado = @estado,
       id_pais = @pais,
       usuario_alteracao = @usuario,
       nome_mae=@mae,
       nome_pai=@pai,
       rg=@rg,
       numero=@numero,
       complemento=@complemento,
       id_uf_natural=@uf_naturalidade,
       id_natural=@naturalidade
       
 WHERE id=@id_cliente


		if @@error <> 0
		begin
			set @retorno=0
			return(@retorno)
		end
	   	else
	   	begin
	   		set @retorno=@id_cliente
	   		insert into bh_cliente (id_cliente,tp_mudanca,dt_alteracao,usuario_alteracao,tabela_alteracao)
			values (@id_cliente,'update',GETDATE(),@usuario,'bc_cliente')		
	   		return(@retorno)		   		
		end
end

end