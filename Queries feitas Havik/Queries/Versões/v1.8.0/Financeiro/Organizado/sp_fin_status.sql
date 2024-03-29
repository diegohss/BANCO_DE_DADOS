USE [havik]
GO
/****** Object:  StoredProcedure [dbo].[sp_fin_status]    Script Date: 05/30/2012 14:54:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_fin_status]
(
@id_projeto int,
@id_acao int,
@id_status int,
@id_nota int = null,
@usuario int,
@particularidades varchar(4000) = null,
@nota_fiscal varchar(10) = null,
@retorno int output
)
as

if @id_status=6
begin
update bh_proj_financeiro
set faturar=2		
where id=@id_acao 		
end		
if @id_status=5
begin
update bh_proj_financeiro
set ativo=2		
where id=@id_acao 		
end		

		INSERT INTO bh_fin_status
			 (
				   id_projeto
				   ,id_acao
				   ,id_status
				   ,id_nota
				   ,particularidades
				   ,nota_fiscal
				   ,usuario
				   ,dt_alteracao
			 )
			 VALUES
			 (
					@id_projeto,
					@id_acao,
					@id_status,
					@id_nota,
					@particularidades,
					@nota_fiscal,
					@usuario,
					GETDATE()
			)

		if @@error <> 0
		begin
			set @retorno=0
		    return(@retorno)
		end
	   	else
	   	begin
	   		set @retorno=1	
	   		insert into bh_financeiro (id_acao,tp_mudanca,dt_alteracao,usuario_alteracao,tabela_alteracao)
			values (@id_acao,'inserção',GETDATE(),@usuario,'bh_fin_status')
	   		return(@retorno)			   		
		end
			

		
		


