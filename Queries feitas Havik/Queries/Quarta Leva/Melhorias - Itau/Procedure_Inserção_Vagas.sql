USE [havik_teste]
GO
/****** Object:  StoredProcedure [dbo].[sp_proj_requisitos]    Script Date: 02/10/2012 16:24:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER procedure [dbo].[sp_proj_requisitos]
(
@tipo int,
@id_projeto bigint,
@tp_contrato bigint = null,
@tamanho_equipe int = null,
@experiencia int = null,
@escolaridade bigint = null,
@superior_imediato bigint = null,
@salario_mensal float = null,
@bonus float = null,
@total_cash float = null,
@salario_ini float = null,
@salario_fim float = null,
@usuario int,
@nrovagas varchar(30) = null,
@requisicao varchar(30) = null,
@retorno int output
)
as

begin

declare @teste int

set @teste=0
set @teste=(select COUNT(*) from bc_proj_requisitos where id_projeto=@id_projeto)

if @teste>=1
	begin 
		set @tipo=2
	end	

	if @tipo=1
		begin
		INSERT INTO bc_proj_requisitos
				   (
					[id_projeto]
				   ,[tp_contrato]
				   ,[tamanho_equipe]
				   ,[experiencia]
				   ,[escolaridade]
				   ,[superior_imediato]
				   ,[salario_mensal]
				   ,[bonus]
				   ,[total_cash]
				   ,[dt_criacao]
				   ,[usuario_criacao]
				   ,[salario_ini]
				   ,[salario_fim]
				   ,[cod_do_vagas]
				   ,[requisicao_vagas]
				   )
			 VALUES
			 (
				   @id_projeto,
				   @tp_contrato,
				   @tamanho_equipe,
				   @experiencia,
				   @escolaridade,
				   @superior_imediato,
				   @salario_mensal,
				   @bonus,
				   @total_cash,
				   getdate(),
				   @usuario,
				   @salario_ini,
				   @salario_fim,
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
	   		set @retorno=1	
	   		insert into bh_projeto (id_projeto,tp_mudanca,dt_alteracao,usuario_alteracao,tabela_alteracao)
			values (@id_projeto,'inserção',GETDATE(),@usuario,'bc_proj_requisitos')				
	   		return(@retorno)	
		end

end	


if @tipo=2
begin

UPDATE bc_proj_requisitos
   SET 
       [tp_contrato] = @tp_contrato,
       [tamanho_equipe] = @tamanho_equipe,
       [experiencia] = @experiencia,
       [escolaridade] = @escolaridade,
       [superior_imediato] = @superior_imediato,
       [salario_mensal] = @salario_mensal,
       [bonus] = @bonus,
       [total_cash] = @total_cash,
       [dt_criacao] = getdate(),
       [usuario_criacao] = @usuario,
       [salario_ini] = @salario_ini,
       [salario_fim] = @salario_fim,
	   [cod_do_vagas]=@nrovagas,
	   [requisicao_vagas]=@requisicao 
       
      
 WHERE id_projeto=@id_projeto


		if @@error <> 0
		begin
			set @retorno=0
			return(@retorno)
		end
	   	else
	   	begin
	   		set @retorno=1	
	   		insert into bh_projeto (id_projeto,tp_mudanca,dt_alteracao,usuario_alteracao,tabela_alteracao)
			values (@id_projeto,'update',GETDATE(),@usuario,'bc_proj_requisitos')			
	   		return(@retorno)	
		end
end	
end