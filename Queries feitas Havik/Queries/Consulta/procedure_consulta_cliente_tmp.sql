alter procedure sp_teste_busca_cliente
(
@nome varchar(200) = null,
@email varchar(200) = null,
@telefone int = null,
@endereco varchar(400) = null
)
as

begin 

declare @sql varchar(4000)

if @nome<>null
begin
	set @sql=' cli.nome like ''%' + @nome + '%'
end	

if @endereco<>null 
begin
	if @sql=null
	begin
	set @sql= @sql + 'cli.endereco=' + @endereco
	end
	else
	begin
	set @sql= @sql + ' and cli.endereco=' + @endereco
	end
end

declare @x varchar(4000)

set @x='select *

from bc_cliente cli

left join bh_cli_email email on
	email.id_cliente=cli.id

where ';

set @x = @x + @sql;

select @x


end