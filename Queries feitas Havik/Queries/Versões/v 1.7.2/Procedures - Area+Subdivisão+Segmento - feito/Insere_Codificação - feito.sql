use havik
go
create procedure sp_cli_codifica
(
@id_cliente int,
@id_area int,
@id_subdivisao int,
@id_segmento int,
@usuario int,
@retorno int output
)

as

insert into bh_cli_codifica
(
id_cliente,
id_area,
id_subdivisao,
id_segmento,
exibir,
usuario_alteracao,
dt_alteracao
)
values
(
@id_cliente,
@id_area,
@id_subdivisao,
@id_segmento,
1,
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
	   		insert into bh_cliente (id_cliente,tp_mudanca,dt_alteracao,usuario_alteracao,tabela_alteracao)
			values (@retorno,'inserção',GETDATE(),@usuario,'bh_cli_codifica')		
	   		return(@retorno)			   		
		end