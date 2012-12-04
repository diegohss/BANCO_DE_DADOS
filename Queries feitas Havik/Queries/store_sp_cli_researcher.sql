create procedure sp_cli_researcher
(
@tipo int,
@id_cliente int,
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
@salario float = null,
@movimento int = null,
@mudanca int = null,
@usuario int,
@retorno int output
)
as

begin

if @tipo=1
begin

INSERT INTO bc_cli_researcher
(
id_cliente,
c_senso,
c_eloquencia,
c_objetivo,
c_energia,
c_ouvinte,
c_mkt,
c_credibilidade,
c_estruturado,
p_inteligencia,
p_maturidade,
p_visao,
p_confianca,
p_honestidade,
p_punch,
p_carisma,
salario,
movimento,
mudanca,
usuario_alteracao,
dt_alteracao
)
VALUES
(
@id_cliente,
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
GETDATE()
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
			values (@retorno,'inserção',GETDATE(),@usuario,'bc_cli_researcher')		
	   		return(@retorno)			   		
	   	--	return (@erro)
		--	return (@desc_erro)
		end
end

end