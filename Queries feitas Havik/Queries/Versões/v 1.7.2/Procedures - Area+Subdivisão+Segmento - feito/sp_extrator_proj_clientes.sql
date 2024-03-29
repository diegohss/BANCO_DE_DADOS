USE [havik]
GO
/****** Object:  StoredProcedure [dbo].[sp_extrator_proj_clientes]    Script Date: 03/22/2012 11:48:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER procedure [dbo].[sp_extrator_proj_clientes]
(
@id_projeto varchar(10),
@id_status varchar(5) = null,
@id_substatus varchar(5) = null
)

as

begin

set @id_status=ISNULL(@id_status,'')
set @id_substatus=ISNULL(@id_substatus,'')
set @id_projeto=isnull(@id_projeto,'')

declare @sql nvarchar(4000) = null
declare @cond nvarchar(100) = null
declare @ord nvarchar(200) = null
declare @x nvarchar(4000) = null
declare @final nvarchar(4000) = null

if @id_status='0'
begin
set @id_status=''
end

if @id_substatus='0'
begin
set @id_substatus=''
end

set @ord=''
set @sql=''
set @cond=''
set @cond=' where base.id_projeto=''' + @id_projeto + '''' + ' and status.status is not null'
set @ord=' order by dt_status desc'

if @id_status<>'' 
begin
	set @cond=' where base.id_projeto=''' + @id_projeto + ''''
	if @sql=''
	set @sql= @sql + ' and status.id_status=''' + @id_status + ''''
	else
	set @sql= @sql + ' and status.id_status=''' + @id_status + ''''
end

if @id_substatus<>'' 
begin
	set @cond=' where base.id_projeto=''' + @id_projeto + ''''
	if @sql=''
	set @sql= @sql + ' and status.id_substatus=''' + @id_substatus + ''''
	else
	set @sql= @sql + ' and status.id_substatus=''' + @id_substatus + ''''
end



set @x='select distinct 
       proj.id id_projeto,
       proj.nome projeto, 
       status.status status,
	   status.substatus substatus,
	   dt_status=dbo.fn_dateformat(status.dt_alteracao,1),
	   cli.nome nome,
	   DATEDIFF(year,cli.dt_nascimento,getdate()) Idade,
	   isnull(prof.empresa,prof.empresa_antiga) empresa, 
	   prof.salario salario,
	   prof.cargo cargo,
	   codi.area area,
	   codi.subdivisao subdivisao,
	   media.media_potencial entrevista,
	   idi.id_nvl_idioma ingles,
	   status.usuario_status usuario_status,
	   base.id_cliente	
	   
FROM bh_cli_projeto base

left join bc_projeto proj on
	proj.id=base.id_projeto

-- Profissional
left join(
select ult.id,
	   ult.id_cliente,
	   ult.id_empresa,
	   emp.nome empresa,
	   ult.empresa_antiga,
	   ult.id_cargo,
	   cargo.descricao cargo,
	   convert(decimal(10),ult.salario) salario,
	   ult.usuario_alteracao,
	   ult.tipo_contato

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
	prof.id_cliente=base.id_cliente
	
-- Ultima Codificação

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
) codi on 
	codi.id_cliente=base.id_cliente	
	
-- Ultimo Status
left join (
select ult.id,
	   ult.id_projeto,	
	   ult.id_cliente,	
       ult.id_status,
       dsta.descricao status,
       ult.id_substatus,
       dsub.descricao substatus,
       ult.dt_alteracao,
       us.nome_usuario usuario_status    
		
from (select ult.id_cliente,max(ult.id) id
from bh_cli_status ult
where ult.id_projeto=' + @id_projeto + ' group by ult.id_cliente)ult_st

left join bh_cli_status ult on
	ult.id=ult_st.id

left join br_cli_status dsta on
	dsta.id=ult.id_status
	
left join br_cli_substatus dsub on
	dsub.id=ult.id_substatus
	
left join bc_usuario us on
	us.id=ult.usuario_criacao	
)status on
	status.id_cliente=base.id_cliente and
	status.id_projeto=base.id_projeto

-- Ultima Avaliação Idioma (Inglês)
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
		ult.id=ult_idi.id 
		
	left join br_idiomas idioma on
		idioma.id=ult.id_idioma		
)idi on
	idi.id_cliente=base.id_cliente
	
--Media Geral
left join(SELECT  pot.id_cliente,
		sum(pot.p_inteligencia + pot.p_maturidade + pot.p_visao + pot.p_confianca +
	    pot.p_honestidade + pot.p_punch + pot.p_carisma)/7 media_potencial

from bc_cli_consultor_p pot
	
group by pot.id_cliente
)media on
	media.id_cliente=base.id_cliente	

-- Outros Joins

left join bc_cliente cli on
	cli.id=base.id_cliente '
	
		
set @final = @x + @cond + @sql + @ord
--select @final
declare @tmptbl table(
	id_projeto bigint NULL,
	projeto varchar(200) NULL,
	status varchar(100) NULL,
	substatus varchar(100) NULL,
	dt_status nvarchar(20) NULL,
	nome varchar(300) NULL,
	Idade int NULL,
	empresa varchar(100) NULL,
	salario decimal(10, 0) NULL,
	cargo varchar(100) NULL,
	area varchar(100) NULL,
	subdivisao varchar(100) NULL,
	entrevista int NULL,
	ingles bigint NULL,
	usuario_status nvarchar(50) NULL,
	id_cliente bigint NULL
)

insert into @tmptbl exec sp_executesql @final

SELECT * FROM @tmptbl

end