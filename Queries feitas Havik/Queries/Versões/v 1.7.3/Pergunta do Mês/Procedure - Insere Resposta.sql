use havik
go
create procedure sp_cli_pergunta
(
@id_cliente int = null,
@id_pergunta int = null,
@id_resposta int = null,
@usuario int = null,
@retorno int output
)
as

begin



INSERT INTO bh_cli_perguntas_respostas
           (
           [id_pergunta]
           ,[id_resposta]
           ,[id_cliente]
           ,[dt_alteracao]
           ,[usuario_alteracao]
           )
     VALUES
           (
           @id_pergunta,
           @id_resposta,
           @id_cliente,
           getdate(),
           @usuario
           )
	if @@error <> 0
		begin
			set @retorno=0
			return(@retorno)
		end
	   	else
	   	begin
	   		set @retorno=1	
	   		insert into bh_cliente (id_cliente,tp_mudanca,dt_alteracao,usuario_alteracao,tabela_alteracao)
			values (@id_cliente,'inserção',GETDATE(),@usuario,'bh_cli_perguntas_respostas')		
	   		return(@retorno)			   		
		end           
       
           
end           