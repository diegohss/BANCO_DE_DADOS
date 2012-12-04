create procedure sp_busca_projeto_e
(
@projeto varchar(200) = null,
@escolaridade varchar(4) = null,
@graduacao varchar(4) = null,
@produto varchar(10) = null,
@empresa varchar(10) = null,
@empresa2 varchar(10) = null,
@responsavel_entrega varchar(10) = null,
@responsavel_captacao varchar(10) = null,
@colaborador_responsavel varchar(10) = null,
@modelo_contratacao varchar(10) = null,
@sal_ini varchar(15) = null,
@sal_fim varchar(15) = null,
@contratacao varchar(4) = null,
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
@idioma varchar(4) = null,
@nvl_idioma varchar(4) = null,
@idioma2 varchar(4) = null,
@nvl_idioma2 varchar(4) = null,
@descricao varchar(200) = null,
@descricao2 varchar(200) = null,
@usuario int
)

as
begin

declare @sql varchar(4000) = null
declare @cond varchar(20) = null
declare @ord varchar(200) = null

set @sql=''
set @cond=''

-- Verificação do Projeto;
if @projeto<>''
begin
	set @sql='proj.nome like ''%' + @projeto + '%'''
	set @cond=' where '
end	

-- Verificação do Escolaridade;
if @escolaridade<>'' 
begin
	set @cond=' where '
	if @sql=''
	set @sql= @sql + 'req.escolaridade=''' + @escolaridade + ''''
	else
	set @sql= @sql + ' and req.escolaridade=''' + @escolaridade + ''''
end

-- Verificação do Graduação;
if @graduacao<>'' 
begin
	set @cond=' where '
	if @sql=''
	set @sql= @sql + 'grad.graduacao=''' + @graduacao + ''''
	else
	set @sql= @sql + ' and grad.graduacao=''' + @graduacao + ''''
end

-- Verificação do Produto(Tipo);
if @produto<>'' 
begin
	set @cond=' where '
	if @sql=''
	set @sql= @sql + 'proj.tipo_produto=''' + @produto + ''''
	else
	set @sql= @sql + ' and proj.tipo_produto=''' + @produto + ''''
end

-- Verificação de Empresa;
if @empresa<>'' 
begin
	set @cond=' where '
	if @sql=''
	set @sql= @sql + 'proj.id_empresa=''' + @empresa + ''''
	else
	set @sql= @sql + ' and proj.id_empresa=''' + @empresa + ''''
end

-- Verificação de Empresa 2;
if @empresa2<>'' 
begin
	set @cond=' where '
	if @sql=''
	set @sql= @sql + 'proj.id_empresa=''' + @empresa2 + ''''
	else
	set @sql= @sql + ' and proj.id_empresa=''' + @empresa2 + ''''
end


-- Verificação de Responsavel Captação;
if @responsavel_captacao<>'' 
begin
	set @cond=' where '
	if @sql=''
	set @sql= @sql + 'proj.responsavel_captacao=''' + @responsavel_captacao + ''''
	else
	set @sql= @sql + ' and proj.responsavel_captacao=''' + @responsavel_captacao + ''''
end

-- Verificação de Responsavel Entrega;
if @responsavel_entrega<>'' 
begin
	set @cond=' where '
	if @sql=''
	set @sql= @sql + 'proj.responsavel_entrega=''' + @responsavel_entrega + ''''
	else
	set @sql= @sql + ' and proj.responsavel_entrega=''' + @responsavel_entrega + ''''
end

-- Verificação de Colaborador Responsavel;
if @colaborador_responsavel<>'' 
begin
	set @cond=' where '
	if @sql=''
	set @sql= @sql + 'proj.colaborador_responsavel=''' + @colaborador_responsavel + ''''
	else
	set @sql= @sql + ' and proj.colaborador_responsavel=''' + @colaborador_responsavel + ''''
end

-- Verificação de Tipo Contratação;
if @contratacao<>'' 
begin
	set @cond=' where '
	if @sql=''
	set @sql= @sql + 'proj.colaborador_responsavel=''' + @colaborador_responsavel + ''''
	else
	set @sql= @sql + ' and proj.colaborador_responsavel=''' + @colaborador_responsavel + ''''
end

-- Verificação de Salario;
if @sal_ini<>'' and @sal_fim<>'' 
begin
	set @cond=' where '
	if @sql=''
	set @sql= @sql + 'req.salario_mensal between''' + @sal_ini + '''' + ' and ''' + @sal_fim + '''' 
	else
	set @sql= @sql + ' and req.salario_mensal betweem''' + @sal_ini + '''' + ' and ''' + @sal_fim + ''''
end

-- Verificação de Salario pt2;
if @sal_ini<>'' and @sal_fim='' 
begin
	set @cond=' where '
	if @sql=''
	set @sql= @sql + 'req.salario_mensal>=''' + @sal_ini + ''''
	else
	set @sql= @sql + ' and req.salario_mensal>=''' + @sal_ini + ''''
end


-- Verificação de Segmento;
if @segmento<>'' 
begin
	set @cond=' where '
	if @sql=''
	set @sql= @sql + 'proj.segmento in (''' + @segmento + ''',''' + @segmento2 + ''',''' + @segmento3 + ''')'
	else
	set @sql= @sql + ' and proj.segmento in (''' + @segmento + ''',''' + @segmento2 + ''',''' + @segmento3 + ''')'
end

-- Verificação de Cargo;
if @cargo<>'' 
begin
	set @cond=' where '
	if @sql=''
	set @sql= @sql + 'proj.cargo in (''' + @cargo + ''',''' + @cargo2 + ''',''' + @cargo3 + ''')'
	else
	set @sql= @sql + ' and proj.cargo in (''' + @cargo + ''',''' + @cargo2 + ''',''' + @cargo3 + ''')'
end

-- Verificação de Area;
if @area<>'' 
begin
	set @cond=' where '
	if @sql=''
	set @sql= @sql + 'proj.area in (''' + @area + ''',''' + @area2 + ''',''' + @area3 + ''')'
	else
	set @sql= @sql + ' and proj.area in (''' + @area + ''',''' + @area2 + ''',''' + @area3 + ''')'
end

-- Verificação de subdivisao;
if @subdivisao<>'' 
begin
	set @cond=' where '
	if @sql=''
	set @sql= @sql + 'proj.subdivisao in (''' + @subdivisao + ''',''' + @subdivisao2 + ''',''' + @subdivisao3 + ''')'
	else
	set @sql= @sql + ' and proj.subdivisao in (''' + @subdivisao + ''',''' + @subdivisao2 + ''',''' + @subdivisao3 + ''')'
end

-- Verificação de status;
if @status<>'' 
begin
	set @cond=' where '
	if @sql=''
	set @sql= @sql + 'prof.id_status in (''' + @status + ''',''' + @status2 + ''',''' + @status3 + ''')'
	else
	set @sql= @sql + ' and prof.id_status in (''' + @status + ''',''' + @status2 + ''',''' + @status3 + ''')'
end

/*
-- Verificação de Idade;
if @idade<>'' 
begin
	set @cond=' where '
	if @sql=''
	set @sql= @sql + 'DATEDIFF(year,cli.dt_nascimento,getdate())=''' + @idade + ''''
	else
	set @sql= @sql + ' or DATEDIFF(year,cli.dt_nascimento,getdate())==''' + @idade + ''''
end*/


/*
-- Verificação de Instituição;
if @instituicao<>'' 
begin
	set @cond=' where '
	if @sql=''
	set @sql= @sql + 'acad.instituicao=''' + @instituicao + ''''
	else
	set @sql= @sql + ' or acad.instituicao=''' + @instituicao + ''''
end
*/


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
	set @sql= @sql + ' and idi.id_idioma=' + @idioma
end

-- Verificação de Idioma 2 e Nivel 2;
if @idioma2<>'' and @nvl_idioma2<>''
begin
	set @cond=' where '
	if @sql=''
	set @sql= @sql + '(idi.id_idioma=' + @idioma2 + ' and idi.id_nvl_idioma=' + @nvl_idioma2 +')'
	else
	set @sql= @sql + '( or idi.id_idioma=' + @idioma2 + ' and idi.id_nvl_idioma=' + @nvl_idioma2 +')'
end

-- Verificação de Idioma 2 ;
if @idioma2<>'' 
begin
	set @cond=' where '
	if @sql=''
	set @sql= @sql + 'idi.id_idioma=' + @idioma2
	else
	set @sql= @sql + ' and idi.id_idioma=' + @idioma2
end

-- Descrição de texto do site
if @descricao<>'' 
begin
	set @cond=' where '
	if @sql=''
	set @sql=@sql + 'site.descricao_completa like ''%' + @descricao + '%'''
	else
	set @sql=@sql + ' and site.descricao_completa like ''%' + @descricao + '%'''
end
if @descricao2<>'' 
begin
	set @cond=' where '
	if @sql=''
	set @sql=@sql + 'site.descricao_completa like ''%' + @descricao2 + '%'''
	else
	set @sql=@sql + ' and site.descricao_completa like ''%' + @descricao2 + '%'''
end


declare @x varchar(4000)
--,email.*,fone.*,prof.*
set @x='select distinct proj.*
from bc_projeto proj
left join bc_proj_requisitos req on
	req.id_projeto=proj.id
left join bc_proj_financeiro fin on
	fin.id_projeto=proj.id
left join bh_proj_site site on
	site.id_projeto=proj.id
left join bh_proj_graduacao grad on
	grad.id_projeto=proj.id
left join bh_proj_status stat on
	stat.id_projeto=proj.id';	
--where ';
set @ord=' order by proj.nome'
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
'projeto',
'e',
@usuario
)

exec (@x)


end