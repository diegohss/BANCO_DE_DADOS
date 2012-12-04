create procedure sp_cli_verifica_cv
(
@id_cliente int,
@idioma int,
@retorno int output 
)
as

begin

set @retorno=0

if (select COUNT(*) from bc_cli_base_cvs where id_cliente=@id_cliente and idioma=@idioma)>=1
	begin
		set @retorno=(select id from bc_cli_base_cvs where id_cliente=@id_cliente and idioma=@idioma)
	end
	else
	begin
		set @retorno=0
	end	
return @retorno
end