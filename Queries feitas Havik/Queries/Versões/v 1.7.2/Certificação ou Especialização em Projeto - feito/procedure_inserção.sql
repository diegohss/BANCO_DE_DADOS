USE [havik]
GO

/****** Object:  StoredProcedure [dbo].[sp_proj_certificacao]    Script Date: 03/27/2012 14:48:45 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[sp_proj_certificacao]
(
@tipo int,
@id_projeto int,
@descricao varchar(40),
@usuario int,
@retorno int output
)
as
begin

if @tipo=1
begin

INSERT INTO bh_proj_certificacao
     (
           id_projeto,
           descricao,
           dt_criacao,
           usuario_criacao,
           exibir
     )
     VALUES
     (
           @id_projeto,
           @descricao,
           getdate(),
           @usuario,
           1
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
			values (@id_projeto,'inserção',GETDATE(),@usuario,'bh_proj_certificacao')		
	   		return(@retorno)			   		
		end
end

end

GO


