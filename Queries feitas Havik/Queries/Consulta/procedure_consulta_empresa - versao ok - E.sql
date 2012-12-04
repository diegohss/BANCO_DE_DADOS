alter procedure sp_busca_empresa_ou
(
@empresa varchar(200) = null,
@email varchar(200) = null,
@telefone varchar(15) = null,
@endereco varchar(400) = null,
@cidade varchar(6) = null,
@bairro varchar(150) = null,
@segmento varchar(10) = null,
@segmento2 varchar(10) = null,
@segmento3 varchar(10) = null,
@cargo varchar(10) = null,
@cargo2 varchar(10) = null,
@cargo3 varchar(10) = null,
@area varchar(10) = null,
@area2 varchar(10) = null,
@area3 varchar(10) = null,
@subdivisao varchar(10) = null,
@subdivisao2 varchar(10) = null,
@subdivisao3 varchar(10) = null,
@status varchar(10) = null,
@status2 varchar(10) = null,
@status3 varchar(10) = null,
@idade varchar(4) = null,
@sexo varchar(2) = null,
@escolaridade varchar(4) = null,
@graduacao varchar(4) = null,
@instituicao varchar(200) = null,
@salario varchar(10) = null,
@empresa varchar(10) = null,
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
--@pchave varchar(200)
--@pchave2 varchar(200)
--@pchave3 varchar(200)
--set @nome='Diego'
--set @endereco='Teste de UPdate'
--set @email='jose@jose.com'
--set @telefone='64182222'
--set @cidade='355030'
--set @bairro='Ergo'
--set @segmento=4
--set @segmento2=''
--set @segmento3=''
--set @cargo=23
--set @cargo2=3
--set @cargo3=''
--set @idade='30'
--set @sexo='1'
--set @idioma=2
--set @nvl_idioma=1
as
begin

declare @sql varchar(4000) = null
declare @cond varchar(20) = null
declare @ord varchar(200) = null

set @sql=''
set @cond=''

-- Verificação do Nome;
if @nome<>''
begin
	set @sql='cli.nome like ''%' + @nome + '%'''
	set @cond=' where '
end	

-- Verificação do E-Mail;
if @email<>'' 
begin
	set @cond=' where '
	if @sql=''
	set @sql= @sql + 'email.descricao=''' + @email + ''''
	else
	set @sql= @sql + ' or email.descricao=''' + @email + ''''
end

-- Verificação do Telefone;
if @telefone<>'' 
begin
	set @cond=' where '
	if @sql=''
	set @sql= @sql + 'fone.telefone=''' + @telefone + ''''
	else
	set @sql= @sql + ' or fone.telefone=''' + @telefone + ''''
end

-- Verificação do Endereço;
if @endereco<>'' 
begin
	set @cond=' where '
	if @sql=''
	set @sql= @sql + 'cli.endereco=''' + @endereco + ''''
	else
	set @sql= @sql + ' or cli.endereco=''' + @endereco + ''''
end

-- Verificação de Cidade;
if @cidade<>'' 
begin
	set @cond=' where '
	if @sql=''
	set @sql= @sql + 'cli.id_cidade=''' + @cidade + ''''
	else
	set @sql= @sql + ' or cli.id_cidade=''' + @cidade + ''''
end

-- Verificação de Bairro;
if @bairro<>'' 
begin
	set @cond=' where '
	if @sql=''
	set @sql=@sql + 'cli.bairro like ''%' + @bairro + '%'''
	else
	set @sql=@sql + ' or cli.bairro like ''%' + @bairro + '%'''
end

-- Verificação de Segmento;
if @segmento<>'' 
begin
	set @cond=' where '
	if @sql=''
	set @sql= @sql + 'prof.id_segmento in (''' + @segmento + ''',''' + @segmento2 + ''',''' + @segmento3 + ''')'
	else
	set @sql= @sql + ' or prof.id_segmento in (''' + @segmento + ''',''' + @segmento2 + ''',''' + @segmento3 + ''')'
end

-- Verificação de Cargo;
if @cargo<>'' 
begin
	set @cond=' where '
	if @sql=''
	set @sql= @sql + 'prof.id_cargo in (''' + @cargo + ''',''' + @cargo2 + ''',''' + @cargo3 + ''')'
	else
	set @sql= @sql + ' or prof.id_cargo in (''' + @cargo + ''',''' + @cargo2 + ''',''' + @cargo3 + ''')'
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

-- Verificação de subdivisao;
if @subdivisao<>'' 
begin
	set @cond=' where '
	if @sql=''
	set @sql= @sql + 'prof.id_subdivisao in (''' + @subdivisao + ''',''' + @subdivisao2 + ''',''' + @subdivisao3 + ''')'
	else
	set @sql= @sql + ' or prof.id_subdivisao in (''' + @subdivisao + ''',''' + @subdivisao2 + ''',''' + @subdivisao3 + ''')'
end

-- Verificação de status;
if @status<>'' 
begin
	set @cond=' where '
	if @sql=''
	set @sql= @sql + 'prof.id_status in (''' + @status + ''',''' + @status2 + ''',''' + @status3 + ''')'
	else
	set @sql= @sql + ' or prof.id_status in (''' + @status + ''',''' + @status2 + ''',''' + @status3 + ''')'
end

-- Verificação de Idade;
if @idade<>'' 
begin
	set @cond=' where '
	if @sql=''
	set @sql= @sql + 'DATEDIFF(year,cli.dt_nascimento,getdate())=''' + @idade + ''''
	else
	set @sql= @sql + ' or DATEDIFF(year,cli.dt_nascimento,getdate())==''' + @idade + ''''
end

-- Verificação de sexo;
if @sexo<>'' 
begin
	set @cond=' where '
	if @sql=''
	set @sql= @sql + 'cli.id_sexo=''' + @sexo + ''''
	else
	set @sql= @sql + ' or cli.id_sexo=''' + @sexo + ''''
end

-- Verificação de Escolaridade;
if @escolaridade<>'' 
begin
	set @cond=' where '
	if @sql=''
	set @sql= @sql + 'acad.id_escolaridade=''' + @escolaridade + ''''
	else
	set @sql= @sql + ' or acad.id_escolaridade=''' + @escolaridade + ''''
end

-- Verificação de Graduação;
if @graduacao<>'' 
begin
	set @cond=' where '
	if @sql=''
	set @sql= @sql + 'acad.id_graduacao=''' + @graduacao + ''''
	else
	set @sql= @sql + ' or acad.id_graduacao=''' + @graduacao + ''''
end

-- Verificação de Instituição;
if @instituicao<>'' 
begin
	set @cond=' where '
	if @sql=''
	set @sql= @sql + 'acad.instituicao=''' + @instituicao + ''''
	else
	set @sql= @sql + ' or acad.instituicao=''' + @instituicao + ''''
end

-- Verificação de Salario;
if @salario<>'' 
begin
	set @cond=' where '
	if @sql=''
	set @sql= @sql + 'prof.salario>=''' + @salario + ''''
	else
	set @sql= @sql + ' or prof.salario>=''' + @salario + ''''
end

-- Verificação de Empresa;
if @empresa<>'' 
begin
	set @cond=' where '
	if @sql=''
	set @sql= @sql + 'prof.id_empresa=''' + @empresa + ''''
	else
	set @sql= @sql + ' or prof.id_empresa=''' + @empresa + ''''
end


-- Verificação de Idioma e Nivel;
if @idioma<>'' and @nvl_idioma<>''
begin
	set @cond=' where '
	if @sql=''
	set @sql= @sql + '(idi.id_idioma=' + @idioma + ' and idi.id_nvl_idioma=' + @nvl_idioma +')'
	else
	set @sql= @sql + '( or idi.id_idioma=' + @idioma + ' and idi.id_nvl_idioma=' + @nvl_idioma +')'
end

-- Verificação de Idioma;
if @idioma<>'' 
begin
	set @cond=' where '
	if @sql=''
	set @sql= @sql + 'idi.id_idioma=' + @idioma 
	else
	set @sql= @sql + ' or idi.id_idioma=' + @idioma
end

-- Verificação de Projeto;
if @projeto<>'' 
begin
	set @cond=' where '
	if @sql=''
	set @sql= @sql + 'proj.id_projeto in (''' + @projeto + ''',''' + @projeto2 + ''',''' + @projeto3 + ''')'
	else
	set @sql= @sql + ' or proj.id_projeto in (''' + @projeto + ''',''' + @projeto2 + ''',''' + @projeto3 + ''')'
end

-- Mini C.V.
if @realiza<>'' 
begin
	set @cond=' where '
	if @sql=''
	set @sql=@sql + 'cli.realiza like ''%' + @realiza + '%'''
	else
	set @sql=@sql + ' or cli.realiza like ''%' + @realiza + '%'''
end
if @realiza2<>'' 
begin
	set @cond=' where '
	if @sql=''
	set @sql=@sql + 'cli.realiza like ''%' + @realiza2 + '%'''
	else
	set @sql=@sql + ' or cli.realiza like ''%' + @realiza2 + '%'''
end
if @realiza3<>'' 
begin
	set @cond=' where '
	if @sql=''
	set @sql=@sql + 'cli.realiza like ''%' + @realiza3 + '%'''
	else
	set @sql=@sql + ' or cli.realiza like ''%' + @realiza3 + '%'''
end

declare @x varchar(4000)
--,email.*,fone.*,prof.*
set @x='select distinct cli.*
from bc_cliente cli
left join bh_cli_email email on
	email.id_cliente=cli.id
left join bh_cli_telefone fone on
	fone.id_cliente=cli.id	
left join bh_cli_profissional prof on
	prof.id_cliente=cli.id	
left join bh_cli_academico acad on
	acad.id_cliente=cli.id	
left join bh_cli_idiomas idi on
	idi.id_cliente=cli.id	
left join bh_cli_projeto proj on
	proj.id_cliente=cli.id';	
--where ';
set @ord=' order by cli.nome'
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
'e',
@usuario
)

exec (@x)


end