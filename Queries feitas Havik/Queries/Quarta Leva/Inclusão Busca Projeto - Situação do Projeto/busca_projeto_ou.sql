USE [havik]
GO
/****** Object:  StoredProcedure [dbo].[sp_busca_projeto_ou]    Script Date: 02/06/2012 15:42:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER procedure [dbo].[sp_busca_projeto_ou]
(
@id_projeto varchar(20) = null,
@projeto varchar(200) = null,
@escolaridade varchar(4) = null,
@graduacao varchar(200) = null,
@produto varchar(10) = null,
@empresa varchar(200) = null,
@empresa2 varchar(200) = null,
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
@substatus varchar(10) = null,
@substatus2 varchar(10) = null,
@substatus3 varchar(10) = null,
@idioma varchar(4) = null,
@nvl_idioma varchar(4) = null,
@idioma2 varchar(4) = null,
@nvl_idioma2 varchar(4) = null,
@descricao varchar(200) = null,
@descricao2 varchar(200) = null,
@situacao varchar(4) = null,
@usuario int = null
)

as
begin
set @id_projeto=ISNULL(@id_projeto,'')
set @projeto=ISNULL(@projeto,'')
set @escolaridade=ISNULL(@escolaridade,'')
set @graduacao=ISNULL(@graduacao,'')
set @produto=ISNULL(@produto,'')
set @empresa=ISNULL(@empresa,'')
set @empresa2=ISNULL(@empresa2,'')
set @responsavel_entrega=ISNULL(@responsavel_entrega,'')
set @responsavel_captacao=ISNULL(@responsavel_captacao,'')
set @colaborador_responsavel=ISNULL(@colaborador_responsavel,'')
set @modelo_contratacao=ISNULL(@modelo_contratacao,'')
set @sal_ini=ISNULL(@sal_ini,'')
set @sal_fim=ISNULL(@sal_fim,'')
set @contratacao=ISNULL(@contratacao,'')
set @segmento=isnull(@segmento,'')
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
set @idioma=ISNULL(@idioma,'')
set @nvl_idioma=ISNULL(@nvl_idioma,'')
set @idioma2=ISNULL(@idioma2,'')
set @nvl_idioma2=ISNULL(@nvl_idioma2,'')
set @descricao=ISNULL(@descricao,'')
set @descricao2=ISNULL(@descricao2,'')
set @usuario=ISNULL(@usuario,'')
set @situacao=ISNULL(@situacao,'')

declare @sql nvarchar(4000) = null
declare @cond nvarchar(50) = null
declare @ord nvarchar(200) = null
declare @x nvarchar(4000) = null
declare @final nvarchar(4000) = null

set @sql=''
set @cond=''

-- Verificação do Projeto;
if @projeto<>''
begin
	set @sql='proj.nome like ''%' + @projeto + '%'''
	set @cond=' where '
end	

-- Verificação do Código do Projeto (ID);
if @id_projeto<>'' 
begin
	set @cond=' where '
	if @sql=''
	set @sql= @sql + 'proj.id=''' + @id_projeto + ''''
	else
	set @sql= @sql + ' or proj.id=''' + @id_projeto + ''''
end

-- Verificação do Escolaridade;
if @escolaridade<>'' 
begin
	set @cond=' where '
	if @sql=''
	set @sql= @sql + 'req.escolaridade=''' + @escolaridade + ''''
	else
	set @sql= @sql + ' or req.escolaridade=''' + @escolaridade + ''''
end

/*
-- Verificação de Instituição;
if @instituicao<>'' 
begin
	set @cond=' where '
	if @sql=''
	set @sql= @sql + 'ac.instituicao=''' + @instituicao + ''''
	else
	set @sql= @sql + ' or ac.instituicao=''' + @instituicao + ''''
end
*/

-- Verificação de Graduação;
if @graduacao<>'' 
begin
	set @cond=' where '
	if @sql=''
	set @sql= @sql + 'gr.descricao like ''%' + @graduacao + '%'''
	else
	set @sql= @sql + ' or gr.descricao like ''%' + @graduacao + '%'''
end

-- Verificação do Produto(Tipo);
if @produto<>'' 
begin
	set @cond=' where '
	if @sql=''
	set @sql= @sql + 'proj.tipo_produto=''' + @produto + ''''
	else
	set @sql= @sql + ' or proj.tipo_produto=''' + @produto + ''''
end

-- Verificação de Empresa;
if @empresa<>'' 
begin
	set @cond=' where '
	if @sql=''
	begin
	set @sql= @sql + 'emp.nome like ''%' + @empresa + '%'''
	end
	else
	begin
	set @sql= @sql + ' or emp.nome like ''%' + @empresa + '%'''
	end
end

-- Verificação de Empresa 2;
if @empresa2<>'' 
begin
	set @cond=' where '
	if @sql=''
	set @sql= @sql + 'emp.nome like ''%' + @empresa2 + '%'''
	else
	set @sql= @sql + ' or emp.nome like ''%' + @empresa2 + '%'''
end


-- Verificação de Responsavel Captação;
if @responsavel_captacao<>'' 
begin
	set @cond=' where '
	if @sql=''
	set @sql= @sql + 'proj.responsavel_captacao=''' + @responsavel_captacao + ''''
	else
	set @sql= @sql + ' or proj.responsavel_captacao=''' + @responsavel_captacao + ''''
end

-- Verificação de Responsavel Entrega;
if @responsavel_entrega<>'' 
begin
	set @cond=' where '
	if @sql=''
	set @sql= @sql + 'proj.responsavel_entrega=''' + @responsavel_entrega + ''''
	else
	set @sql= @sql + ' or proj.responsavel_entrega=''' + @responsavel_entrega + ''''
end

-- Verificação de Colaborador Responsavel;
if @colaborador_responsavel<>'' 
begin
	set @cond=' where '
	if @sql=''
	set @sql= @sql + 'proj.colaborador_responsavel=''' + @colaborador_responsavel + ''''
	else
	set @sql= @sql + ' or proj.colaborador_responsavel=''' + @colaborador_responsavel + ''''
end

-- Verificação de Tipo Contratação;
if @contratacao<>'' 
begin
	set @cond=' where '
	if @sql=''
	set @sql= @sql + 'proj.colaborador_responsavel=''' + @colaborador_responsavel + ''''
	else
	set @sql= @sql + ' or proj.colaborador_responsavel=''' + @colaborador_responsavel + ''''
end

-- Verificação de Salario;
if @sal_ini<>'' and @sal_fim<>'' 
begin
	set @cond=' where '
	if @sql=''
	set @sql= @sql + 'ofer.salario_mensal between''' + @sal_ini + '''' + ' and ''' + @sal_fim + '''' 
	else
	set @sql= @sql + ' or ofer.salario_mensal between''' + @sal_ini + '''' + ' and ''' + @sal_fim + ''''
end

-- Verificação de Salario pt2;
if @sal_ini<>'' and @sal_fim='' 
begin
	set @cond=' where '
	if @sql=''
	set @sql= @sql + 'ofer.salario_mensal>=''' + @sal_ini + ''''
	else
	set @sql= @sql + ' or ofer.salario_mensal>=''' + @sal_ini + ''''
end


-- Verificação de Segmento;
if @segmento<>'' 
begin
	set @cond=' where '
	if @sql=''
	set @sql= @sql + 'proj.segmento in (''' + @segmento + ''',''' + @segmento2 + ''',''' + @segmento3 + ''')'
	else
	set @sql= @sql + ' or proj.segmento in (''' + @segmento + ''',''' + @segmento2 + ''',''' + @segmento3 + ''')'
end

-- Verificação de Cargo;
if @cargo<>'' 
begin
	set @cond=' where '
	if @sql=''
	set @sql= @sql + 'proj.cargo in (''' + @cargo + ''',''' + @cargo2 + ''',''' + @cargo3 + ''')'
	else
	set @sql= @sql + ' or proj.cargo in (''' + @cargo + ''',''' + @cargo2 + ''',''' + @cargo3 + ''')'
end

-- Verificação de Area;
if @area<>'' 
begin
	set @cond=' where '
	if @sql=''
	set @sql= @sql + 'proj.area in (''' + @area + ''',''' + @area2 + ''',''' + @area3 + ''')'
	else
	set @sql= @sql + ' or proj.area in (''' + @area + ''',''' + @area2 + ''',''' + @area3 + ''')'
end

-- Verificação de subdivisao;
if @subdivisao<>'' 
begin
	set @cond=' where '
	if @sql=''
	set @sql= @sql + 'proj.subdivisao in (''' + @subdivisao + ''',''' + @subdivisao2 + ''',''' + @subdivisao3 + ''')'
	else
	set @sql= @sql + ' or proj.subdivisao in (''' + @subdivisao + ''',''' + @subdivisao2 + ''',''' + @subdivisao3 + ''')'
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
	set @sql= @sql + '(idi.idioma=' + @idioma + ' and idi.nvl_idioma=' + @nvl_idioma +')'
	else
	set @sql= @sql + ' or (idi.idioma=' + @idioma + ' and idi.nvl_idioma=' + @nvl_idioma +')'
end

-- Verificação de Idioma;
if @idioma<>'' and @nvl_idioma=''
begin
	set @cond=' where '
	if @sql=''
	set @sql= @sql + 'idi.idioma=' + @idioma 
	else
	set @sql= @sql + ' or idi.idioma=' + @idioma
end

-- Verificação de Idioma 2 e Nivel 2;
if @idioma2<>'' and @nvl_idioma2<>''
begin
	set @cond=' where '
	if @sql=''
	set @sql= @sql + '(idi.idioma=' + @idioma2 + ' and idi.nvl_idioma=' + @nvl_idioma2 +')'
	else
	set @sql= @sql + ' or (idi.idioma=' + @idioma2 + ' and idi.nvl_idioma=' + @nvl_idioma2 +')'
end

-- Verificação de Idioma 2 ;
if @idioma2<>'' and @nvl_idioma2=''
begin
	set @cond=' where '
	if @sql=''
	set @sql= @sql + 'idi.idioma=' + @idioma2
	else
	set @sql= @sql + ' or idi.idioma=' + @idioma2
end

-- Descrição de texto do site
if @descricao<>'' 
begin
	set @cond=' where '
	if @sql=''
	set @sql=@sql + 'site.descricao_completa like ''%' + @descricao + '%'''
	else
	set @sql=@sql + ' or site.descricao_completa like ''%' + @descricao + '%'''
end
if @descricao2<>'' 
begin
	set @cond=' where '
	if @sql=''
	set @sql=@sql + 'site.descricao_completa like ''%' + @descricao2 + '%'''
	else
	set @sql=@sql + ' or site.descricao_completa like ''%' + @descricao2 + '%'''
end

-- Situação do Projeto (aberto ou fechado)
if @situacao<>''
begin
	set @cond=' where '
		if @sql=''
		begin
			if @situacao=1
				begin
				set @sql=@sql + 'proj.dt_fim is null'
				end
			if @situacao=2
				begin
				set @sql=@sql + 'proj.dt_fim is not null'
				end	
		end									
		else
		begin
			if @situacao=1
				begin
				set @sql=@sql + ' and proj.dt_fim is null'
				end
			if @situacao=2
				begin
				set @sql=@sql + ' and proj.dt_fim is not null'
				end						
		end
			
end

--,email.*,fone.*,prof.*
set @x='select distinct proj.id id_projeto,
	   proj.nome Projeto,
	   proj.id_empresa,
	   emp.nome Empresa,
	   proj.tipo_produto id_tipo_produto,
	   prod.descricao produto,
	   proj.segmento id_segmento,
	   seg.descricao segmento,
	   proj.area id_area,
	   area.descricao area,
	   proj.subdivisao id_subdivisao,
	   sub.descricao subdivisao,
	   proj.responsavel_entrega id_responsavel_entrega,
	   entrega.nome_usuario responsavel_entrega,
	   proj.cargo id_cargo,
	   cargo.descricao cargo,	   
	   proj.colaborador_responsavel id_colaborador_responsavel,
	   colaborador.nome_usuario colaborador_responsavel,
	   dt_ini=dbo.fn_dateformat(proj.dt_ini,1),
	   dt_fim=dbo.fn_dateformat(proj.dt_fim,1),
	   convert(decimal(10,2),ofer.salario_mensal) salario,
	   sta.descricao ultimo_status,
	   subs.descricao ultimo_substatus,
	   proj.id_rh,
	   rh.nome_usuario Responsavel_Empresa_RH,
	   proj.id_requisitante,
	   requisitante.nome_usuario Responsavel_Empresa_Requisitante

from bc_projeto proj

left join bc_empresa_unq emp on
	emp.id=proj.id_empresa
	
left join bc_proj_requisitos req on
	req.id_projeto=proj.id

left join br_tp_produto prod on
	prod.id=proj.tipo_produto

left join br_area area on
	area.id=proj.area
	
left join br_cargo cargo on
	cargo.id=proj.cargo
	
left join br_subdivisao sub on
	sub.id=proj.subdivisao
	
left join br_segmento seg on
	seg.id=proj.segmento
	
left join bc_usuario entrega on
	entrega.id=proj.responsavel_entrega
	
left join bc_usuario colaborador on
	colaborador.id=proj.colaborador_responsavel		
	
left join bc_usuario requisitante on
	requisitante.id=proj.id_requisitante
	
left join bc_usuario rh on
	rh.id=proj.id_rh 
	
left join br_proj_status sta on
	sta.id=proj.ultimo_status
	
left join bh_proj_graduacao grad on
	grad.id_projeto=proj.id	

left join br_graduacao gr on
	gr.id=grad.graduacao	 	
	
left join br_proj_substatus subs on
	subs.id=proj.ultimo_substatus
left join bh_proj_status stat on 
	stat.id_projeto=proj.id
left join bh_proj_idiomas idi on
	idi.id_projeto=proj.id
left join bc_proj_oferta ofer on 
	ofer.id_projeto=proj.id ';
		
set @ord=' order by proj.nome'

set @final = @x + @cond + @sql + @ord

INSERT INTO bh_pesquisas
(
consulta,
modulo,
tipo,
dt_alteracao,
usuario
)
VALUES
(
@final,
'projeto',
'e',
GETDATE(),
@usuario
)

declare @tmptbl table(
	id_projeto bigint  NULL,
	Projeto varchar(200)  NULL,
	id_empresa bigint  NULL,
	Empresa varchar(300) NULL,
	id_tipo_produto bigint NULL,
	produto varchar(100) NULL,
	id_segmento bigint NULL,
	segmento varchar(100) NULL,
	id_area bigint NULL,
	area varchar(100) NULL,
	id_subdivisao bigint NULL,
	subdivisao varchar(100) NULL,
	id_responsavel_entrega int NULL,
	responsavel_entrega nvarchar(200) NULL,
	id_cargo bigint NULL,
	cargo varchar(100) NULL,
	id_colaborador_responsavel int NULL,
	colaborador_responsavel nvarchar(200) NULL,
	dt_ini nvarchar(20) NULL,
	dt_fim nvarchar(20) NULL,
	salario decimal(10,2) NULL,
	ultimo_status nvarchar(100) NULL,
	ultimo_substatus nvarchar(100) NULL,
	id_rh bigint NULL,
	Responsavel_Empresa_RH nvarchar(200) NULL,
	id_requisitante bigint NULL,
	Responsavel_Empresa_Requisitante nvarchar(200) NULL
)

insert into @tmptbl exec sp_executesql @final

SELECT * FROM @tmptbl

end