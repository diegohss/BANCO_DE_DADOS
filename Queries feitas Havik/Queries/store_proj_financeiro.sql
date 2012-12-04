alter procedure sp_proj_financeiro
(
@tipo int,
@id_projeto bigint,
@id_candidato bigint = null,
@email_fatura varchar(200) = null,
@particularidade varchar(500) = null,
@sucesso float = null, 
@retainer float = null,
@parcela_1 float = null, 
@parcela_2 float = null,
@parcela_3 float = null,
@modo_pagamento bigint = null,
@vencimento bigint = null,
@fee float = null,
@imposto bit = null,
@salario_ini float = null,
@salario_fim float = null,
@dt_alteracao datetime,
@usuario int,
@retorno int output
)
as

begin

if @tipo=1
begin

INSERT INTO bc_proj_financeiro
           (
           id_projeto
           ,id_candidato
           ,email_fatura
           ,particularidade
           ,sucesso
           ,retainer
           ,parcela_1
           ,parcela_2
           ,parcela_3
           ,modo_pagamento
           ,vencimento
           ,fee
           ,imposto
           ,salario_ini
           ,salario_fim
           ,dt_alteracao
           ,usuario_alteracao
           )
     VALUES
           (
           @id_projeto,
           @id_candidato,
           @email_fatura,
           @particularidade,
           @sucesso,
           @retainer, 
           @parcela_1,
           @parcela_2,
           @parcela_3,
           @modo_pagamento,
           @vencimento,
           @fee,
           @imposto,
           @salario_ini,
           @salario_fim,
           GETDATE(),
           @usuario
           )
           
if @@error <> 0
		begin
		--	Set @erro=1
		--	Set @desc_erro = 'Ocorreu um erro ao atualizar....bla bla bla'
			set @retorno=0
		--	return (@erro)
		---	return (@desc_erro)
			return(@retorno)
		end
	   	else
	   	begin
	   		set @retorno=@@identity		
	   	--	set @erro=0
	   	--	set @desc_erro=''
	   		insert into bh_projeto (id_projeto,tp_mudanca,dt_alteracao,usuario_alteracao,tabela_alteracao)
			values (@retorno,'inserção',GETDATE(),@usuario,'bc_proj_financeiro')	
			
	   		return(@retorno)	
	   		
	   	--	return (@erro)
		--	return (@desc_erro)
		end

end	

if @tipo=2
begin
UPDATE bc_proj_financeiro

SET	   id_candidato = @id_candidato,
       email_fatura = @email_fatura,
       particularidade = @particularidade,
       sucesso = @sucesso,
       retainer = @retainer,
       parcela_1 = @parcela_1,
       parcela_2 = @parcela_2,
       parcela_3 = @parcela_3,
       modo_pagamento = @modo_pagamento,
       vencimento = @vencimento,
       fee = @fee,
       imposto = @imposto,
       salario_ini = @salario_ini, 
       salario_fim = @salario_fim, 
       dt_alteracao = @dt_alteracao,
       usuario_alteracao = @usuario
       
 WHERE id_projeto=@id_projeto

if @@error <> 0
		begin
		--	Set @erro=1
		--	Set @desc_erro = 'Ocorreu um erro ao atualizar....bla bla bla'
			set @retorno=0
		--	return (@erro)
		---	return (@desc_erro)
			return(@retorno)
		end
	   	else
	   	begin
	   		set @retorno=@@identity		
	   	--	set @erro=0
	   	--	set @desc_erro=''
	   		insert into bh_projeto (id_projeto,tp_mudanca,dt_alteracao,usuario_alteracao,tabela_alteracao)
			values (@retorno,'update',GETDATE(),@usuario,'bc_proj_financeiro')	
			
	   		return(@retorno)	
	   		
	   	--	return (@erro)
		--	return (@desc_erro)
		end

end	
           
end           