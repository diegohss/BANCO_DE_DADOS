
begin

declare @nome varchar(200)
declare @email varchar(200)
declare @telefone varchar(15)
declare @endereco varchar(400)
declare @sql varchar(4000)
declare @cidade varchar(6)
declare @bairro varchar(150)
declare @segmento varchar(10)
declare @segmento2 varchar(10)
declare @segmento3 varchar(10)
declare @cargo varchar(10)
declare @cargo2 varchar(10)
declare @cargo3 varchar(10)
declare @area varchar(10)
declare @area2 varchar(10)
declare @area3 varchar(10)
declare @subdivisao varchar(10)
declare @subdivisao2 varchar(10)
declare @subdivisao3 varchar(10)
declare @status varchar(10)
declare @status2 varchar(10)
declare @status3 varchar(10)
declare @idade varchar(4)
declare @sexo varchar(2)
declare @escolaridade varchar(4)
declare @graduacao varchar(4)
declare @instituicao varchar(200)
declare @salario varchar(10)
declare @empresa varchar(10)
declare @idioma varchar(4)
declare @nvl_idioma varchar(4)
declare @realiza varchar(200)
declare @realiza2 varchar(200)
declare @realiza3 varchar(200)
declare @pchave varchar(200)
declare @pchave2 varchar(200)
declare @pchave3 varchar(200)
declare @projeto varchar(10)
declare @projeto2 varchar(10)
declare @projeto3 varchar(10)
declare @cond varchar(20);

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

set @x='select cli.*,email.*,fone.*,prof.*
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

--select @x x
--select @sql sql
set @x = @x + @cond + @sql

--select @x

exec (@x)


end