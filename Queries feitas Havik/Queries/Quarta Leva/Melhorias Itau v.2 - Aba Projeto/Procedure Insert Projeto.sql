USE [havik]
GO
/****** Object:  StoredProcedure [dbo].[sp_projeto]    Script Date: 02/13/2012 17:02:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Diego
-- Create date: 30/08/2011
-- Description:	Fará o Insert na bc_projeto
-- =============================================
ALTER PROCEDURE [dbo].[sp_projeto]
(
@tipo int,
@id_projeto int = null,
@id_empresa int,
@nome varchar(200),
@segmento int = null,
@area int = null,
@subdivisao int = null,
@cargo int = null,
@tipo_produto int,
@responsavel_captacao int = null,
@responsavel_entrega int = null,
@colaborador_responsavel int = null,
@usuario int,
@requisitante int = null,
@rh int = null,
@id_estado varchar(2) = null,
@id_cidade nvarchar(6) = null,
@shortlist_prevista date = null,
@shortlist_entrega date = null,
@busca_inicio date = null,
@shortlist_qtd_cand int = null,
@grau_dificuldade int = null,
@nrovagas varchar(30) = null,
@requisicao varchar(30)=null,
@retorno int output
)
		
AS
begin

	-- SET NOCOUNT ON added to prevent extra result sets from
	SET NOCOUNT ON;
	

	
if @id_projeto<>'' or @id_projeto is not null or @id_projeto=0
	begin
	set @tipo=2
	end
	
	
-- Tipo 1 = Insert ; Tipo 2 = Update	
if @tipo=1
begin

	insert into bc_projeto
	(
	nome,
	id_empresa,
	segmento,
	area,
	subdivisao,
	cargo,
	tipo_produto,
	responsavel_captacao,
	responsavel_entrega,
	colaborador_responsavel,
	dt_criacao,
	usuario_criacao,
	id_requisitante,
	id_rh,
	id_estado,
	id_cidade,
	dt_ini,
	dt_prev_shortlist,
	dt_ent_shortlist,
	dt_ini_busca,
	qtd_cand_shortlist,
	grau_dificuldade,
	cod_do_vagas,
	requisicao_vagas	
	)
	values 
	(
	@nome,
	@id_empresa,
	@segmento,
	@area,
	@subdivisao,
	@cargo,
	@tipo_produto,
	@responsavel_captacao,
	@responsavel_entrega,
	@colaborador_responsavel,
	GETDATE(),
	@usuario,
	@requisitante,
	@rh,
	@id_estado,
	@id_cidade,
	GETDATE(),
	@shortlist_prevista,
	@shortlist_entrega,
	@busca_inicio,
	@shortlist_qtd_cand,
	@grau_dificuldade,
	@nrovagas,
	@requisicao
	)
	
		if @@error <> 0
		begin
			set @retorno=0
			return(@retorno)
		end
	   	else
	   	begin
	   		set @retorno=@@identity		
	   		insert into bh_projeto (id_projeto,tp_mudanca,dt_alteracao,usuario_alteracao,tabela_alteracao)
			values (@retorno,'inserção',GETDATE(),@usuario,'bc_projeto')	
	   		return(@retorno)	
		end

end	

		
if @tipo=2
begin

UPDATE bc_projeto
   SET       
	   nome=@nome,
	   id_empresa=@id_empresa,	
	   segmento=@segmento,
	   area=@area,
	   subdivisao=@subdivisao,
	   cargo=@cargo,
	   tipo_produto=@tipo_produto,	
	   responsavel_captacao=@responsavel_captacao,
       responsavel_entrega=@responsavel_entrega,
       colaborador_responsavel=@colaborador_responsavel,
       id_requisitante=@requisitante,
       id_rh=@rh,
       id_estado=@id_estado,
       id_cidade=@id_cidade,
       dt_prev_shortlist=@shortlist_prevista,
	   dt_ent_shortlist=@shortlist_entrega,
	   dt_ini_busca=@busca_inicio,
	   qtd_cand_shortlist=@shortlist_qtd_cand,
	   grau_dificuldade=@grau_dificuldade,
	   cod_do_vagas=@nrovagas,
	   requisicao_vagas=@requisicao
            
 WHERE id=@id_projeto
 
 		if @@error <> 0
		begin
			set @retorno=0
			return(@retorno)
		end
	   	else
	   	begin
	   		set @retorno=@id_projeto
	   		insert into bh_projeto (id_projeto,tp_mudanca,dt_alteracao,usuario_alteracao,tabela_alteracao)
			values (@id_projeto,'update',GETDATE(),@usuario,'bc_projeto')	
	   		return(@retorno)	
		end

end	


end

	
				


