USE [havik_teste]
GO
/****** Object:  StoredProcedure [dbo].[sp_busca_cliente_e]    Script Date: 03/22/2012 10:47:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER procedure [dbo].[sp_busca_cliente_e]
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
@idade_ini varchar(4) = null,
@idade_fim varchar(4) = null,
@sexo varchar(2) = null,
@escolaridade varchar(4) = null,
@graduacao varchar(200) = null,
@instituicao varchar(200) = null,
@salario_ini varchar(10) = null,
@salario_fim varchar(10) = null,
@empresa varchar(200) = null,
@idioma varchar(4) = null,
@nvl_idioma varchar(4) = null,
@realiza varchar(200) = null,
@realiza2 varchar(200) = null,
@realiza3 varchar(200) = null,
@projeto varchar(200) = null,
@projeto2 varchar(200) = null,
@projeto3 varchar(200) = null,
@palavra varchar(200) = null,
@palavra2 varchar(200) = null,
@palavra3 varchar(200) = null,
@curso varchar(200) = null,
@curso2 varchar(200) = null,
@curso3 varchar(200) = null,
@id_cliente varchar(10) = null,
@usuario int
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
set @idade_ini=ISNULL(@idade_ini,'')
set @idade_fim=ISNULL(@idade_fim,'')
set @sexo=ISNULL(@sexo,'')
set @escolaridade=ISNULL(@escolaridade,'')
set @graduacao=ISNULL(@graduacao,'')
set @instituicao=ISNULL(@instituicao,'')
set @salario_ini=ISNULL(@salario_ini,'')
set @salario_fim=ISNULL(@salario_fim,'')
set @empresa=ISNULL(@empresa,'')
set @idioma=ISNULL(@idioma,'')
set @nvl_idioma=ISNULL(@nvl_idioma,'')
set @realiza=ISNULL(@realiza,'')
set @realiza2=ISNULL(@realiza2,'')
set @realiza3=ISNULL(@realiza3,'')
set @projeto=ISNULL(@projeto,'')
set @projeto2=ISNULL(@projeto2,'')
set @projeto3=ISNULL(@projeto3,'')
set @palavra=ISNULL(@palavra,'')
set @palavra2=ISNULL(@palavra2,'')
set @palavra3=ISNULL(@palavra3,'')
set @curso=ISNULL(@curso,'')
set @curso2=ISNULL(@curso2,'')
set @curso3=ISNULL(@curso3,'')
set @id_cliente=ISNULL(@id_cliente,'')

declare @sql nvarchar(max) = null
declare @cond nvarchar(600) = null
declare @ord nvarchar(600) = null
declare @x nvarchar(max) = null
declare @final nvarchar(max) = null
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
	set @sql= @sql + ' and email.descricao=''' + @email + ''''
end

-- Verificação da Id do Cliente;
if @id_cliente<>'' 
begin
	set @cond=' where '
	if @sql=''
	set @sql= @sql + 'cli.id=''' + @id_cliente + ''''
	else
	set @sql= @sql + ' and cli.id=''' + @id_cliente + ''''
end

-- Verificação do Telefone;
if @telefone<>'' 
begin
	set @cond=' where '
	if @sql=''
	set @sql= @sql + 'fone.telefone=''' + @telefone + ''''
	else
	set @sql= @sql + ' and fone.telefone=''' + @telefone + ''''
end

-- Verificação do Endereço;
if @endereco<>'' 
begin
	set @cond=' where '
	if @sql=''
	set @sql= @sql + 'cli.endereco=''' + @endereco + ''''
	else
	set @sql= @sql + ' and cli.endereco=''' + @endereco + ''''
end

-- Verificação de Cidade;
if @cidade<>'' 
begin
	set @cond=' where '
	if @sql=''
	set @sql= @sql + 'cli.id_cidade=''' + @cidade + ''''
	else
	set @sql= @sql + ' and cli.id_cidade=''' + @cidade + ''''
end

-- Verificação de Bairro;
if @bairro<>'' 
begin
	set @cond=' where '
	if @sql=''
	set @sql=@sql + 'cli.bairro like ''%' + @bairro + '%'''
	else
	set @sql=@sql + ' and cli.bairro like ''%' + @bairro + '%'''
end

-- Verificação de Segmento;
if @segmento<>'' 
begin
	set @cond=' where '
	if @sql=''
	set @sql= @sql + 'job.id_segmento in (''' + @segmento + ''',''' + @segmento2 + ''',''' + @segmento3 + ''')'
	else
	set @sql= @sql + ' and job.id_segmento in (''' + @segmento + ''',''' + @segmento2 + ''',''' + @segmento3 + ''')'
end

-- Verificação de Cargo;
if @cargo<>'' 
begin
	set @cond=' where '
	if @sql=''
	set @sql= @sql + 'job.id_cargo in (''' + @cargo + ''',''' + @cargo2 + ''',''' + @cargo3 + ''')'
	else
	set @sql= @sql + ' and job.id_cargo in (''' + @cargo + ''',''' + @cargo2 + ''',''' + @cargo3 + ''')'
end

-- Verificação de Area;
if @area<>'' 
begin
	set @cond=' where '
	if @sql=''
	set @sql= @sql + 'job.id_area in (''' + @area + ''',''' + @area2 + ''',''' + @area3 + ''')'
	else
	set @sql= @sql + ' and job.id_area in (''' + @area + ''',''' + @area2 + ''',''' + @area3 + ''')'
end

-- Verificação de subdivisao;
if @subdivisao<>'' 
begin
	set @cond=' where '
	if @sql=''
	set @sql= @sql + 'job.id_subdivisao in (''' + @subdivisao + ''',''' + @subdivisao2 + ''',''' + @subdivisao3 + ''')'
	else
	set @sql= @sql + ' and job.id_subdivisao in (''' + @subdivisao + ''',''' + @subdivisao2 + ''',''' + @subdivisao3 + ''')'
end

-- Verificação de status;
if @status<>'' 
begin
	set @cond=' where '
	if @sql=''
	set @sql= @sql + 'stat.id_status in (''' + @status + ''',''' + @status2 + ''',''' + @status3 + ''')'
	else
	set @sql= @sql + ' and stat.id_status in (''' + @status + ''',''' + @status2 + ''',''' + @status3 + ''')'
end

-- Verificação de substatus;
if @substatus<>'' 
begin
	set @cond=' where '
	if @sql=''
	set @sql= @sql + 'stat.id_substatus in (''' + @substatus + ''',''' + @substatus2 + ''',''' + @substatus3 + ''')'
	else
	set @sql= @sql + ' and stat.id_substatus in (''' + @substatus + ''',''' + @substatus2 + ''',''' + @substatus3 + ''')'
end


-- Verificação de Idade;
if @idade_ini<>'' and @idade_fim<>'' 
begin
	set @cond=' where '
	if @sql=''
	set @sql= @sql + '(DATEDIFF(year,cli.dt_nascimento,getdate()) between''' + @idade_ini + '''' + ' and ''' + @idade_fim + '''' + ' or cli.dt_nascimento is null)'
	else
	set @sql= @sql + ' and (DATEDIFF(year,cli.dt_nascimento,getdate()) between''' + @idade_ini + '''' + ' and ''' + @idade_fim + ''''  + ' or cli.dt_nascimento is null)'
end

-- Verificação de Idade pt2;
if @idade_ini<>'' and @idade_fim='' 
begin
	set @cond=' where '
	if @sql=''
	set @sql= @sql + '(DATEDIFF(year,cli.dt_nascimento,getdate())>=''' + @idade_ini + '''' + ' or cli.dt_nascimento is null)'
	else
	set @sql= @sql + ' and (DATEDIFF(year,cli.dt_nascimento,getdate())>=''' + @idade_ini + '''' + ' or cli.dt_nascimento is null)'
end

-- Verificação de Idade pt3;
if @idade_ini='' and @idade_fim<>'' 
begin
	set @cond=' where '
	if @sql=''
	set @sql= @sql + '(DATEDIFF(year,cli.dt_nascimento,getdate())<=''' + @idade_fim + '''' + ' or cli.dt_nascimento is null)'
	else
	set @sql= @sql + ' and (DATEDIFF(year,cli.dt_nascimento,getdate())<=''' + @idade_fim + '''' + ' or cli.dt_nascimento is null)'
end

/*
-- Verificação de Idade;
if @idade<>'' 
begin
	set @cond=' where '
	if @sql=''
	set @sql= @sql + 'DATEDIFF(year,cli.dt_nascimento,getdate())=''' + @idade + ''''
	else
	set @sql= @sql + ' and DATEDIFF(year,cli.dt_nascimento,getdate())=''' + @idade + ''''
end
*/

-- Verificação de sexo;
if @sexo<>'' 
begin
	set @cond=' where '
	if @sql=''
	set @sql= @sql + 'cli.id_sexo=''' + @sexo + ''''
	else
	set @sql= @sql + ' and cli.id_sexo=''' + @sexo + ''''
end

-- Verificação de Escolaridade;
if @escolaridade<>'' 
begin
	set @cond=' where '
	if @sql=''
	set @sql= @sql + 'ac.id_escolaridade=''' + @escolaridade + ''''
	else
	set @sql= @sql + ' and ac.id_escolaridade=''' + @escolaridade + ''''
end

-- Verificação de Graduação;
if @graduacao<>'' 
begin
	set @cond=' where '
	if @sql=''
	set @sql= @sql + 'gr.descricao like ''%' + @graduacao + '%'''
	else
	set @sql= @sql + ' and gr.descricao like ''%' + @graduacao + '%'''
end

-- Verificação de Instituição;
if @instituicao<>'' 
begin
	set @cond=' where '
	if @sql=''
	set @sql= @sql + 'ac.instituicao=''' + @instituicao + ''''
	else
	set @sql= @sql + ' and ac.instituicao=''' + @instituicao + ''''
end

-- Verificação de Salario;
if @salario_ini<>'' and @salario_fim<>'' 
begin
	set @cond=' where '
	if @sql=''
	set @sql= @sql + 'job.salario between''' + @salario_ini + '''' + ' and ''' + @salario_fim + '''' 
	else
	set @sql= @sql + ' and job.salario between''' + @salario_ini + '''' + ' and ''' + @salario_fim + ''''
end

-- Verificação de Salario pt2;
if @salario_ini<>'' and @salario_fim='' 
begin
	set @cond=' where '
	if @sql=''
	set @sql= @sql + 'job.salario>=''' + @salario_ini + ''''
	else
	set @sql= @sql + ' and job.salario>=''' + @salario_ini + ''''
end

-- Verificação de Empresa;
if @empresa<>'' 
begin
	set @cond=' where '
	if @sql=''
	set @sql= @sql + '(empresa.nome like ''%' + @empresa + '%''' + 'or job.empresa_antiga like ''%' + @empresa + '%''' + ')'
	else
	set @sql= @sql + ' and (empresa.nome like ''%' + @empresa + '%''' + 'or job.empresa_antiga like ''%' + @empresa + '%''' + ')'
end


-- Verificação de Idioma e Nivel;
if @idioma<>'' and @nvl_idioma<>''
begin
	set @cond=' where '
	if @sql=''
	set @sql= @sql + '(idioma.id_idioma=' + @idioma + ' and idioma.id_nvl_idioma=' + @nvl_idioma +')'
	else
	set @sql= @sql + ' and (idioma.id_idioma=' + @idioma + ' and idioma.id_nvl_idioma=' + @nvl_idioma +')'
end

-- Verificação de Idioma;
if @idioma<>'' and @nvl_idioma=''
begin
	set @cond=' where '
	if @sql=''
	set @sql= @sql + 'idioma.id_idioma=' + @idioma 
	else
	set @sql= @sql + ' and idioma.id_idioma=' + @idioma 
end

-- Verificação de Projeto;
if @projeto<>''
begin
	if @projeto='' begin set @projeto='    ' end
	if @projeto2='' begin set @projeto2='    ' end
	if @projeto3='' begin set @projeto3='    ' end
	set @cond=' where '
	if @sql=''
	set @sql= @sql + '(projeto.nome like ''%' + @projeto + '%''' + ' or projeto.nome like ''%' + @projeto2 + '%''' + ' or projeto.nome like ''%' + @projeto3 + '%'')'
	else
	set @sql= @sql + ' and (projeto.nome like ''%' + @projeto + '%''' + ' or projeto.nome like ''%' + @projeto2 + '%''' + ' or projeto.nome like ''%' + @projeto3 + '%'')'
end

-- Cursos
if @curso<>'' 
begin
	set @cond=' where '
	if @sql=''
	set @sql=@sql + 'curso.curso like ''%' + @curso + '%'''
	else
	set @sql=@sql + ' and curso.curso like ''%' + @curso + '%'''
end

-- Cursos 2
if @curso2<>'' 
begin
	set @cond=' where '
	if @sql=''
	set @sql=@sql + 'curso.curso like ''%' + @curso2 + '%'''
	else
	set @sql=@sql + ' and curso.curso like ''%' + @curso2 + '%'''
end

-- Cursos 3
if @curso3<>'' 
begin
	set @cond=' where '
	if @sql=''
	set @sql=@sql + 'curso.curso like ''%' + @curso3 + '%'''
	else
	set @sql=@sql + ' and curso.curso like ''%' + @curso3 + '%'''
end

-- Mini C.V. (realizações)
if @realiza<>'' 
begin
	set @cond=' where '
	if @sql=''
	set @sql=@sql + 'job.realizacoes like ''%' + @realiza + '%'''
	else
	set @sql=@sql + ' and job.realizacoes like ''%' + @realiza + '%'''
end
if @realiza2<>'' 
begin
	set @cond=' where '
	if @sql=''
	set @sql=@sql + 'job.realizacoes ''%' + @realiza2 + '%'''
	else
	set @sql=@sql + ' and job.realizacoes like ''%' + @realiza2 + '%'''
end
if @realiza3<>'' 
begin
	set @cond=' where '
	if @sql=''
	set @sql=@sql + 'job.realizacoes like ''%' + @realiza3 + '%'''
	else
	set @sql=@sql + ' and job.realizacoes like ''%' + @realiza3 + '%'''
end

-- C.V. (Palavra-chave)
if @palavra<>'' 
begin
	set @cond=' where '
	if @sql=''
	set @sql=@sql + 'cvs.cv like ''%' + @palavra + '%'''
	else
	set @sql=@sql + ' and cvs.cv like ''%' + @palavra + '%'''
end
if @palavra2<>'' 
begin
	set @cond=' where '
	if @sql=''
	set @sql=@sql + 'cvs.cv ''%' + @palavra2 + '%'''
	else
	set @sql=@sql + ' and cvs.cv like ''%' + @palavra2 + '%'''
end
if @palavra3<>'' 
begin
	set @cond=' where '
	if @sql=''
	set @sql=@sql + 'cvs.cv like ''%' + @palavra3 + '%'''
	else
	set @sql=@sql + ' and cvs.cv like ''%' + @palavra3 + '%'''
end


set @x='select distinct cli.nome Nome,
	   DATEDIFF(year,cli.dt_nascimento,getdate()) Idade,
	   prof.id_empresa,
	   isnull(prof.empresa,prof.empresa_antiga) Ultima_Empresa,
	   proj.qtd_projetos Qtd_Projetos_Participou,
	   codi.id_area,
	   codi.area Ultima_Area,
	   codi.id_subdivisao,
	   codi.subdivisao Ultima_Subdivisao,
	   codi.id_segmento,
	   codi.segmento Ultimo_Segmento,
	   prof.id_cargo,
	   prof.cargo Ultimo_Cargo,
	   round(prof.salario,2) salario,	   
	   cli.id_cidade,
	   cid.MUNNOME Cidade,		   	   	   
	   acad.id_graduacao,
	   acad.graduacao Ultima_Graduacao,
	   idi.id_idioma,
	   idi.idioma Ultimo_Idioma,
	   idi.id_nvl_idioma Nivel_Idioma,	   
	   med.media_potencial Media_Potencial,
	   cic.descricao cicatriz,
	   cic.hexa hexa,
	   cli.id id_cliente	        
from bc_cliente cli
--Profissional
left join (
select ult.id_cliente,
	   ult.id_empresa,
	   emp.nome empresa,
	   ult.empresa_antiga,
	   ult.id_cargo,
	   cargo.descricao cargo,
	   ult.salario
from (
SELECT a.id
FROM bh_cli_profissional a
WHERE a.ID IN
(SELECT TOP 1 b.id FROM bh_cli_profissional b WHERE b.id_cliente = a.id_cliente ORDER BY b.dt_inicio DESC)
)ult_prof
left join bh_cli_profissional ult on
	ult.id=ult_prof.id	
left join br_cargo cargo on
	cargo.id=ult.id_cargo	
left join bc_empresa_unq emp on
	emp.id=ult.id_empresa	
)prof on
	prof.id_cliente=cli.id		
-- Academico	
left join (
select ult.id_cliente,
	   ult.id_graduacao,
	   grad.descricao graduacao
from (
select ult_acad.id_cliente,max(ult_acad.id) id
from bh_cli_academico ult_acad
group by ult_acad.id_cliente
)ult_acad
left join bh_cli_academico ult on	
	ult.id=ult_acad.id and
	ult.id_cliente=ult_acad.id_cliente	
left join br_graduacao grad on
	grad.id=ult.id_graduacao		
)acad on acad.id_cliente=cli.id
-- Codificação
left join(
select
ult.id_cliente,
ult.id_area,
area.descricao area,
ult.id_subdivisao,
sub.descricao subdivisao,
ult.id_segmento,
seg.descricao segmento
from(
select ult_c.id_cliente,MAX(ult_c.id) id
from bh_cli_codifica ult_c
where ult_c.exibir=1
group by ult_c.id_cliente
)ult_c
left join bh_cli_codifica ult on
	ult.id=ult_c.id
left join br_area area on
	area.id=ult.id_area	
left join br_subdivisao sub on
	sub.id=ult.id_subdivisao	
left join br_segmento seg on
	seg.id=ult.id_segmento
)codi on codi.id_cliente=cli.id
-- Idioma
left join(
select ult.id_cliente,
	   ult.id_idioma,
	   idioma.descricao idioma,
	   ult.id_nvl_idioma
from (
select ult_idi.id_cliente,MAX(ult_idi.id) id
from bh_cli_idiomas ult_idi
where ult_idi.id_idioma=1
group by ult_idi.id_cliente
)ult_idi
left join bh_cli_idiomas ult on
		ult.id=ult_idi.id and
		ult.id_cliente=ult_idi.id_cliente		
left join br_idiomas idioma on
		idioma.id=ult.id_idioma		
)idi on	idi.id_cliente=cli.id
-- Quantidade Projetos	
left join (
	select projeto.id_cliente,COUNT(distinct projeto.id) qtd_projetos
	from bh_cli_projeto projeto		
	group by projeto.id_cliente
	)proj on
		proj.id_cliente=cli.id
-- Média Avaliação
left join(
select  distinct pot.id_cliente,
		sum(pot.p_inteligencia + pot.p_maturidade + pot.p_visao + pot.p_confianca +
		 pot.p_honestidade + pot.p_punch + pot.p_carisma)/(7 * COUNT(pot.id_cliente))  media_potencial		 
from bc_cli_consultor_p pot		 
group by pot.id_cliente
)med on	med.id_cliente=cli.id	
left join br_cidades cid on
	cid.MUNCOD=cli.id_cidade	
left join bh_cli_profissional job on
	job.id_cliente=cli.id	
left join bc_empresa_unq empresa on
	empresa.id=job.id_empresa	
left join bh_cli_academico ac on
	ac.id_cliente=cli.id	
left join br_graduacao gr on
	gr.id=ac.id_graduacao	 		 
left join bc_cli_cvs cvs on
	cvs.id_cliente=cli.id
left join (select c.id_cliente,
	   cc.descricao,
	   cc.hexa
from bh_cli_cicatriz c
left join br_cli_tp_cicatriz cc on
	cc.id=c.id_cicatriz)cic on
	cic.id_cliente=cli.id 
left join bh_cli_status stat on
	stat.id_cliente=cli.id
left join bh_cli_idiomas idioma on
    idioma.id_cliente=cli.id
left join bh_cli_projeto hist_proj on
	 hist_proj.id_cliente=cli.id	
left join bc_projeto projeto on
	 projeto.id=hist_proj.id_projeto
left join bh_cli_cursos curso on
	curso.id_cliente=cli.id
left join bh_cli_email email on
	email.id_cliente=cli.id
left join bh_cli_telefone fone on
	fone.id_cliente=cli.id ';	

set @ord=' order by cli.nome '

if @idade_ini<>'' or @idade_fim<>'' 
begin
set @ord=' order by idade desc,cli.nome '
end

set @final = cast(cast(@x as nvarchar(max)) + cast(@cond as nvarchar(max)) + cast(@sql as nvarchar(max)) + cast(@ord as nvarchar(max)) as nvarchar(max))


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
'cliente',
'e',
GETDATE(),
@usuario
)

declare @tmptbl table(	
	Nome varchar(300)  NULL,
	Idade int NULL,
	id_empresa bigint NULL,
	Ultima_Empresa varchar(300) NULL,
	Qtd_Projetos_Participou int NULL,	
	id_area bigint NULL,
	Ultima_Area varchar(100) NULL,
	id_subdivisao bigint NULL,
	Ultima_Subdivisao varchar(100) NULL,
	id_segmento bigint NULL,
	Ultimo_Segmento varchar(100) NULL,	
	id_cargo bigint NULL,
	Ultimo_Cargo varchar(300) NULL,
	salario decimal(10,2) NULL,	
	id_cidade nvarchar(6) NULL,
	Cidade nvarchar(200) NULL,	
	id_graduacao bigint NULL,
	Ultima_Graduacao varchar(300) NULL,
	id_idioma bigint NULL,
	Ultimo_Idioma varchar(100) NULL,
	Nivel_Idioma bigint NULL,
	Media_Potencial int NULL,
	Cicatriz varchar(30) null,
	Hexa varchar(10) null,
	id_cliente bigint  NULL	
)	

insert into @tmptbl exec sp_executesql @final

SELECT * FROM @tmptbl

end	
	
	

