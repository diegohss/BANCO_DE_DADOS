use havik_teste
go
create procedure sp_vw_cli_verifica_nome
(
@nome varchar(200),
@retorno int output
)
as
begin
set @retorno = 1
end

set @retorno = 0
if exists	(	select 1 from bc_cliente
				where LTRIM(RTRIM(nome)) = LTRIM(RTRIM(@nome))
			)

return @retorno