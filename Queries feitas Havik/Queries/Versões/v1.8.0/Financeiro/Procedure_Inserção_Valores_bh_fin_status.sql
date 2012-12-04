use havik_teste
go
create procedure sp_fin_status
(
@id_projeto int,
@id_acao int,
@id_status int,
@id_nota int,
@usuario int,
@retorno int output
)
as
		INSERT INTO bh_fin_status
			 (
				   id_projeto
				   ,id_acao
				   ,id_status
				   ,id_nota
				   ,usuario
				   ,dt_alteracao
			 )
			 VALUES
			 (
					@id_projeto,
					@id_acao,
					@id_status,
					@id_nota,
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

