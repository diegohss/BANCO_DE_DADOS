USE [havik_teste]
GO
/****** Object:  StoredProcedure [dbo].[sp_proj_financeiro_atual]    Script Date: 05/03/2012 14:15:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER procedure [dbo].[sp_proj_financeiro_atual]
(
@id_linha int = null,
@id_projeto int,
@id_cliente int=null,
@acao int,
@faturar int=null,
@email_fatura varchar(150) = null,
@particularidade varchar(4000) = null,
@base_fat float = null,
@sal_final float = null,
@vencimento datetime = null,
@fee float = null,
@parcelas int = null,
@imposto int = null,
@modo_pag int = null,
@valor_total float = null,
@valor_fatura float = null,
@valor_fat_imposto float = null,
@percentual int = null,
@usuario int = null,
@usuario_alt int = null,
@retorno int output
)
as

declare @tipo int

set @id_linha=isnull(@id_linha,'')
if @id_linha<>'' 
begin
set @tipo=2
end
else
begin
set @tipo=1
end

if @tipo=1
begin

INSERT INTO bh_proj_financeiro
           (
           id_projeto
           ,id_cliente
           ,acao
           ,faturar
           ,email_fatura
           ,particularidades
           ,base_faturamento
           ,salario_final
           ,vencimento
           ,fee
           ,id_impostos
           ,id_modo_pagamento
           ,valor_total
           ,valor_fatura
           ,valor_fat_imposto
           ,percentual
           ,parcelas
           ,usuario_criacao
           ,dt_criacao
           ,usuario_alteracao
           ,dt_alteracao
           )
     VALUES
           (
            @id_projeto,
			@id_cliente,
			@acao,
			@faturar,
			@email_fatura,
			@particularidade,
			@base_fat,
			@sal_final,
			@vencimento,
			@fee,
			@imposto,
			@modo_pag,
			@valor_total,
			@valor_fatura,
			@valor_fat_imposto,			
			@percentual,
			@parcelas,
			@usuario,
			GETDATE(),
			@usuario_alt,
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
	   		insert into bh_projeto (id_projeto,tp_mudanca,dt_alteracao,usuario_alteracao,tabela_alteracao)
			values (@id_projeto,'inserção',GETDATE(),@usuario,'bh_proj_financeiro')		
	   		return(@retorno)			   		
		end
         
end

if @tipo=2
begin
		UPDATE bh_proj_financeiro
	   SET id_projeto = @id_projeto
		  ,id_cliente = @id_cliente
		  ,acao = @acao
		  ,faturar = @faturar
		  ,email_fatura = @email_fatura
		  ,particularidades = @particularidade
		  ,base_faturamento = @base_fat
		  ,salario_final = @sal_final
		  ,vencimento = @vencimento
		  ,fee = @fee
		  ,id_impostos = @imposto
		  ,id_modo_pagamento = @modo_pag
		  ,usuario_alteracao = @usuario
		  ,dt_alteracao = GETDATE()
		  ,parcelas = @parcelas
		  ,valor_total = @valor_total
		  ,percentual = @percentual
		  ,valor_fatura = @valor_fatura
		  ,valor_fat_imposto=@valor_fat_imposto
		 WHERE id=@id_linha
		 
		if @@error <> 0
		begin
			set @retorno=0
		    return(@retorno)
		end
	   	else
	   	begin
	   		set @retorno=1	
	   		insert into bh_projeto (id_projeto,tp_mudanca,dt_alteracao,usuario_alteracao,tabela_alteracao)
			values (@id_projeto,'update',GETDATE(),@usuario,'bh_proj_financeiro')		
	   		return(@retorno)			   		
		end


end