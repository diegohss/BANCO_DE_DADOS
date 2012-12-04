create procedure sp_cli_consultor
(
@tipo int,
@id_cliente int,
@a_senso int = null,
@a_saudacao int = null,
@a_impressao int = null,
@a_levantou int = null,
@a_profissionalismo int = null,
@c_senso int = null,
@c_eloquencia int = null,
@c_objetivo int = null,
@c_energia int = null,
@c_ouvinte int = null,  
@c_mkt int = null,
@c_credibilidade int = null,
@c_estruturado int = null,
@p_inteligencia int = null,
@p_maturidade int = null,
@p_visao int = null,
@p_confianca int = null,
@p_honestidade int = null,
@p_punch int = null,
@p_carisma int = null,
@salario float,
@movimento int = null,
@mudanca int = null,
@usuario int,
@retorno int output
)
as
begin

if @tipo=1
begin
INSERT INTO bc_cli_consultor
           (
			id_cliente
		   ,a_senso
           ,a_saudacao
           ,a_impressao
           ,a_levantou
           ,a_profissionalismo
           ,c_senso
           ,c_eloquencia
           ,c_objetivo
           ,c_energia
           ,c_ouvinte
           ,c_mkt
           ,c_credibilidade
           ,c_estruturado
           ,p_inteligencia
           ,p_maturidade
           ,p_visao
           ,p_confianca
           ,p_honestidade
           ,p_punch
           ,p_carisma
           ,salario
           ,movimento
           ,mudanca
           ,usuario_alteracao
           ,dt_alteracao
           )
     VALUES
           (
			@id_cliente,
			@a_senso,
            @a_saudacao,
            @a_impressao,
            @a_levantou,
            @a_profissionalismo,
            @c_senso,
            @c_eloquencia,
            @c_objetivo,
            @c_energia,
            @c_ouvinte, 
            @c_mkt,
            @c_credibilidade,
            @c_estruturado,
            @p_inteligencia,
            @p_maturidade,
            @p_visao,
            @p_confianca,
            @p_honestidade,
            @p_punch,
            @p_carisma,
            @salario,
            @movimento,
            @mudanca,
            @usuario,
            getdate()            
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
	   		set @retorno=1	
	   	--	set @erro=0
	   	--	set @desc_erro=''
	   		insert into bh_cliente (id_cliente,tp_mudanca,dt_alteracao,usuario_alteracao,tabela_alteracao)
			values (@retorno,'inserção',GETDATE(),@usuario,'bc_cli_consultor')		
	   		return(@retorno)			   		
	   	--	return (@erro)
		--	return (@desc_erro)
		end
end

if @tipo=2
begin


UPDATE bc_cli_consultor
   SET a_senso = @a_senso,
       a_saudacao = @a_saudacao,
       a_impressao = @a_impressao,
       a_levantou = @a_levantou,
       a_profissionalismo = @a_profissionalismo,
       c_senso = @c_senso,
       c_eloquencia = @c_eloquencia,
       c_objetivo = @c_objetivo,
       c_energia = @c_energia,
       c_ouvinte = @c_ouvinte,
       c_mkt = @c_mkt,
       c_credibilidade = @c_credibilidade,
       c_estruturado = @c_estruturado,
       p_inteligencia = @p_inteligencia,
       p_maturidade = @p_maturidade,
       p_visao = @p_visao,
       p_confianca = @p_confianca,
       p_honestidade = @p_honestidade,
       p_punch = @p_punch,
       p_carisma = @p_carisma,
       salario = @salario,
       movimento = @movimento,
       mudanca = @mudanca,
       usuario_alteracao = @usuario,
       dt_alteracao =GETDATE()

WHERE id_cliente=@id_cliente

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
	   		set @retorno=1	
	   	--	set @erro=0
	   	--	set @desc_erro=''
	   		insert into bh_cliente (id_cliente,tp_mudanca,dt_alteracao,usuario_alteracao,tabela_alteracao)
			values (@retorno,'update',GETDATE(),@usuario,'bc_cli_consultor')		
	   		return(@retorno)			   		
	   	--	return (@erro)
		--	return (@desc_erro)
		end
end

end