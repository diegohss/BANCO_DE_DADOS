alter procedure sp_busca_cliente_ou
(
@nome varchar(200) = null,
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
@substatus varchar(10) = null,
@substatus2 varchar(10) = null,
@substatus3 varchar(10) = null,
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
@usuario int = null
)

as

begin

set @nome=isnull(@nome,'')
set @email=isnull(@email,'')
set @telefone=ISNULL(@telefone,'')
set @endereco=ISNULL(@endereco,'')
set @cidade=ISNULL(@cidade,'')
set @bairro=ISNULL(@bairro,'')
set @segmento=ISNULL(@segmento,'')
set @segmento2=ISNULL(@segmento2,'')
set @segmento3=ISNULL(@segmento3,'')
set @cargo=ISNULL(@cargo,'')
set @cargo2=ISNULL(@cargo2,'')
set @cargo3=ISNULL(@cargo3,'')
set @area=ISNULL(@area,'')
set @area2=ISNULL(@area2,'')
set @area3=ISNULL(@area3,'')
set @subdivisao=ISNULL(@subdivisao,'')
set @subdivisao2=ISNULL(@subdivisao2,'')
set @subdivisao3=ISNULL(@subdivisao3,'')
set @status=ISNULL(@status,'')
set @status2=ISNULL(@status2,'')
set @status3=ISNULL(@status3,'')
set @substatus=ISNULL(@substatus,'')
set @substatus2=ISNULL(@substatus2,'')
set @substatus3=ISNULL(@substatus3,'')
set @idade=ISNULL(@idade,'')
set @sexo=ISNULL(@sexo,'')
set @escolaridade=ISNULL(@escolaridade,'')
set @graduacao=ISNULL(@graduacao,'')
set @instituicao=ISNULL(@instituicao,'')
set @salario=ISNULL(@salario,'')
set @empresa=ISNULL(@empresa,'')
set @idioma=ISNULL(@idioma,'')
set @nvl_idioma=ISNULL(@nvl_idioma,'')
set @realiza=ISNULL(@realiza,'')
set @realiza2=ISNULL(@realiza2,'')
set @realiza3=ISNULL(@realiza3,'')
set @projeto=ISNULL(@projeto,'')
set @projeto2=ISNULL(@projeto2,'')
set @projeto3=ISNULL(@projeto3,'')


declare @sql nvarchar(4000) = null
declare @cond nvarchar(50) = null
declare @ord nvarchar(200) = null
declare @x nvarchar(4000) = null
declare @final nvarchar(4000) = null
set @sql=''
set @cond=''

-- Verificação do Nome;
if @nome<>''
begin
	set @cond=' where '
	set @sql='cli.nome like ''%' + @nome + '%'''
--set @sql= @sql + '(idi.id_idioma=' + @idioma + ' and idi.id_nvl_idioma=' + @nvl_idioma +')'
	
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

-- Verificação de substatus;
if @status<>'' 
begin
	set @cond=' where '
	if @sql=''
	set @sql= @sql + 'prof.id_substatus in (''' + @substatus + ''',''' + @substatus2 + ''',''' + @substatus3 + ''')'
	else
	set @sql= @sql + ' or prof.id_substatus in (''' + @substatus + ''',''' + @substatus2 + ''',''' + @substatus3 + ''')'
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



set @x='select distinct 
cli.id,
cli.nome,
cli.cpf,
cli.dt_nascimento,
cli.id_estado_civil,
civ.descricao estado_civil,
cli.id_sexo,
sex.descricao sexo,
cli.endereco,
cli.numero,
cli.complemento,
cli.cep,
cli.bairro,
cli.id_cidade,
cid.MUNNOME cidade,
cli.id_estado,
uf.UFNOME estado,
cli.id_pais,
pais.nome pais,
cli.usuario_alteracao

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
	proj.id_cliente=cli.id
left join br_estado_civil civ on
	civ.id=cli.id_estado_civil
left join br_sexo sex on
	sex.id=cli.id_sexo
left join br_cidades cid on
	cid.MUNCOD=cli.id_cidade
left join br_estados uf on
	uf.UFCOD=cli.id_estado
left join br_paises pais on
	pais.id=cli.id_pais';	

set @ord=' order by cli.nome'

set @final = @x + @cond + @sql + @ord

declare @tmptbl table(	
id bigint,
nome varchar(300),
cpf varchar(11),
dt_nascimento date,
id_estado_civil bigint,
estado_civil varchar(100),
id_sexo tinyint,
sexo varchar(100),
endereco varchar(500),
numero varchar(20),
complemento varchar(60),
cep varchar(8),
bairro varchar(150),
id_cidade nvarchar(6),
cidade nvarchar(50),
id_estado nvarchar(2),
estado nvarchar(50),
id_pais smallint,
pais varchar(255),
usuario_alteracao smallint
)	

insert into @tmptbl exec sp_executesql @final

SELECT * FROM @tmptbl

end	
	
	

