create procedure sp_busca_empresa_ou
(
@empresa varchar(200) = null,
@contato varchar(200) = null,
@email varchar(200) = null,
@telefone varchar(15) = null,
@endereco varchar(400) = null,
@cidade varchar(6) = null,
@estado varchar(6) = null,
@pais varchar(6) = null,
@funcionarios varchar(10) = null,
@faturamento varchar(10) = null,
@origem varchar(10) = null,
@endereco_filial varchar(400) = null,
@cidade_filial varchar(10) = null,
@filial varchar(200) = null,
@segmento varchar(10) = null,
@segmento2 varchar(10) = null,
@segmento3 varchar(10) = null,
@cargo varchar(10) = null,
@cargo2 varchar(10) = null,
@cargo3 varchar(10) = null,
@area varchar(10) = null,
@area2 varchar(10) = null,
@area3 varchar(10) = null,
@substatus varchar(10) = null,
@substatus2 varchar(10) = null,
@substatus3 varchar(10) = null,
@status varchar(10) = null,
@status2 varchar(10) = null,
@status3 varchar(10) = null,
@idioma varchar(4) = null,
@nvl_idioma varchar(4) = null,
@realiza varchar(200) = null,
@realiza2 varchar(200) = null,
@realiza3 varchar(200) = null,
@projeto varchar(10) = null,
@projeto2 varchar(10) = null,
@projeto3 varchar(10) = null,
@usuario int
)

as
begin

declare @sql varchar(4000) = null
declare @cond varchar(20) = null
declare @ord varchar(200) = null

set @sql=''
set @cond=''

-- Verificação da Empresa;
if @empresa<>''
begin
	set @sql='emp.nome like ''%' + @empresa + '%'''
	set @cond=' where '
end	

-- Verificação de Cidade;
if @cidade<>'' 
begin
	set @cond=' where '
	if @sql=''
	set @sql= @sql + 'emp.cidade=''' + @cidade + ''''
	else
	set @sql= @sql + ' or emp.cidade=''' + @cidade + ''''
end

-- Verificação do Endereço;
if @endereco<>'' 
begin
	set @cond=' where '
	if @sql=''
	set @sql=@sql + 'emp.endereco like ''%' + @endereco + '%'''
	else
	set @sql=@sql + ' or emp.endereco like ''%' + @endereco + '%'''
end

-- Verificação do Contato(Nome);
if @contato<>'' 
begin
	set @cond=' where '
	if @sql=''
	set @sql=@sql + 'contato like ''%' + @contato + '%'''
	else
	set @sql=@sql + ' or contato like ''%' + @contato + '%'''
end

-- Verificação de Estado;
if @estado<>'' 
begin
	set @cond=' where '
	if @sql=''
	set @sql= @sql + 'emp.estado=''' + @estado + ''''
	else
	set @sql= @sql + ' or emp.estado=''' + @estado + ''''
end

-- Verificação de País;
if @pais<>'' 
begin
	set @cond=' where '
	if @sql=''
	set @sql= @sql + 'emp.pais=''' + @pais + ''''
	else
	set @sql= @sql + ' or emp.pais=''' + @pais+ ''''
end

-- Verificação do Telefone;
if @telefone<>'' 
begin
	set @cond=' where '
	if @sql=''
	set @sql= @sql + 'emp.telefone=''' + @telefone + ''''
	else
	set @sql= @sql + ' or emp.telefone=''' + @telefone + ''''
end

-- Verificação de Funcionarios;
if @funcionarios<>'' 
begin
	set @cond=' where '
	if @sql=''
	set @sql= @sql + 'fil.funcionarios=''' + @funcionarios + ''''
	else
	set @sql= @sql + ' or fil.funcionarios=''' + @funcionarios + ''''
end

-- Verificação de Faturamento;
if @faturamento<>'' 
begin
	set @cond=' where '
	if @sql=''
	set @sql= @sql + 'fil.faturamento=''' + @faturamento + ''''
	else
	set @sql= @sql + ' or fil.faturamento=''' + @faturamento + ''''
end


-- Verificação de Origem;
if @origem<>'' 
begin
	set @cond=' where '
	if @sql=''
	set @sql= @sql + 'fil.origem=''' + @origem + ''''
	else
	set @sql= @sql + ' or fil.origem=''' + @origem + ''''
end

-- Verificação de Cidade Filial;
if @cidade_filial<>'' 
begin
	set @cond=' where '
	if @sql=''
	set @sql= @sql + 'fil.cidade=''' + @cidade_filial + ''''
	else
	set @sql= @sql + ' or fil.cidade=''' + @cidade_filial + ''''
end

-- Verificação de Endereço Filial;
if @endereco_filial<>'' 
begin
	set @cond=' where '
	if @sql=''
	set @sql=@sql + 'fil.endereco like ''%' + @endereco_filial + '%'''
	else
	set @sql=@sql + ' or fil.endereco like ''%' + @endereco_filial + '%'''
end

-- Verificação de Nome Filial;
if @filial<>'' 
begin
	set @cond=' where '
	if @sql=''
	set @sql=@sql + 'fil.nome like ''%' + @filial + '%'''
	else
	set @sql=@sql + ' or fil.nome like ''%' + @filial + '%'''
end

-- Verificação de Segmento;
if @segmento<>'' 
begin
	set @cond=' where '
	if @sql=''
	set @sql= @sql + 'proj.id_segmento in (''' + @segmento + ''',''' + @segmento2 + ''',''' + @segmento3 + ''')'
	else
	set @sql= @sql + ' or prof.id_segmento in (''' + @segmento + ''',''' + @segmento2 + ''',''' + @segmento3 + ''')'
end

-- Verificação de Area;
if @area<>'' 
begin
	set @cond=' where '
	if @sql=''
	set @sql= @sql + 'prof.id_area in (''' + @area + ''',''' + @area2 + ''',''' + @area3 + ''')'
	else
	set @sql= @sql + ' or prof.id_area in (''' + @area + ''',''' + @area2 + ''',''' + @area3 + ''')'
end


-- Verificação de status;
if @status<>'' 
begin
	set @cond=' where '
	if @sql=''
	set @sql= @sql + 'stat.id_status in (''' + @status + ''',''' + @status2 + ''',''' + @status3 + ''')'
	else
	set @sql= @sql + ' or stat.id_status in (''' + @status + ''',''' + @status2 + ''',''' + @status3 + ''')'
end


-- Verificação de substatus;
if @substatus<>'' 
begin
	set @cond=' where '
	if @sql=''
	set @sql= @sql + 'stat.id_substatus in (''' + @substatus + ''',''' + @substatus2 + ''',''' + @substatus3 + ''')'
	else
	set @sql= @sql + ' or stat.id_substatus in (''' + @substatus + ''',''' + @substatus2 + ''',''' + @substatus3 + ''')'
end

-- Verificação de Nome Cliente da Filial (Contato);
if @contato<>'' 
begin
	set @cond=' where '
	if @sql=''
	set @sql=@sql + 'cont.nome like ''%' + @contato + '%'''
	else
	set @sql=@sql + ' or cont.nome like ''%' + @contato + '%'''
end

-- Verificação de Cargo;
if @cargo<>'' 
begin
	set @cond=' where '
	if @sql=''
	set @sql= @sql + 'cont.cargo in (''' + @cargo + ''',''' + @cargo2 + ''',''' + @cargo3 + ''')'
	else
	set @sql= @sql + ' or cont.cargo in (''' + @cargo + ''',''' + @cargo2 + ''',''' + @cargo3 + ''')'
end


declare @x varchar(4000)
--,email.*,fone.*,prof.*
set @x='select distinct emp.*
from bc_empresa_unq emp
left join bc_emp_financeiro fin on
	fin.id_empresa=emp.id
left join bc_empresa_filial fil on
	fil.id_empresa=emp.id
left join bh_emp_status stat on
	stat.id_empresa=emp.id
left join bh_emp_mercado mer on
	mer.id_empresa=emp.id
left join bh_emp_contato cont on
	cont.id_empresa=proj.id';	
--where ';
set @ord=' order by emp.nome'
--select @x x
--select @sql sql
set @x = @x + @cond + @sql + @ord

--select @x

INSERT INTO bh_pesquisas
(
consulta,
modulo,
tipo,
usuario
)
VALUES
(
@x,
'empresa',
'ou',
@usuario
)

exec (@x)


end