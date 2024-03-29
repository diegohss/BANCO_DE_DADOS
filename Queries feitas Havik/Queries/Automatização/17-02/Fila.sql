USE [havik]
GO
/****** Object:  StoredProcedure [dbo].[sp_extrator_proj_clientes_all]    Script Date: 02/17/2012 14:04:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_extrator_proj_clientes_all_2]

as

begin

declare @id_projeto int = null

declare @tmptbl table(
	id_projeto bigint NULL,
	projeto varchar(200) NULL,
	dt_status nvarchar(20) NULL,
	status varchar(100) NULL,
	substatus varchar(100) NULL,
	motivo varchar(100) NULL,
	usuario_status nvarchar(50) NULL,
	follow nvarchar(50) NULL,
	entrevistador nvarchar(50) NULL,
	dt_agendada datetime NULL,
	hora time(7) NULL,
	id_cliente bigint NOT NULL,
	nome varchar(300) NULL,
	Idade int NULL,
	area varchar(100) NULL,
	subdivisao varchar(100) NULL,
	empresa varchar(100) NULL,
	filial varchar(100) NULL,
	cargo varchar(100) NULL,
	salario decimal(10, 0) NULL,
	bonus money NULL,
	dt_inicio datetime NULL,
	dt_saida datetime NULL,
	idioma varchar(100) NULL,
	ingles bigint NULL,
	escolaridade varchar(100) NULL,
	graduacao varchar(100) NULL,
	instituicao varchar(400) NULL
)


declare projeto cursor for
select id from bc_projeto where dt_fim is null

open projeto

fetch next from projeto into @id_projeto

WHILE @@FETCH_STATUS <> -1
begin
insert into @tmptbl
select distinct 
       proj.id id_projeto,
       proj.nome projeto, 
       dt_status=dbo.fn_dateformat(status.dt_alteracao,1),
       status.status status,
	   status.substatus substatus,
	   status.motivo,
	   status.usuario_status usuario_status,	   
	   status.follow,
	   status.entrevistador,
	   status.dt_agendada,
	   status.hora,
	   base.id_cliente,	
	   cli.nome nome,
	   DATEDIFF(year,cli.dt_nascimento,getdate()) Idade,
	   prof.area area,
	   prof.subdivisao subdivisao,
	   isnull(prof.empresa,prof.empresa_antiga) empresa, 
	   prof.filial,
	   prof.cargo cargo,
	   prof.salario salario,
	   prof.bonus,  
	   prof.dt_inicio,
	   prof.dt_saida,
	   idi.idioma,
	   idi.id_nvl_idioma ingles,
	   acad.escolaridade,
	   acad.graduacao,
	   acad.instituicao
	   --media.media_potencial entrevista,
	   

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
	   fil.nome filial,
	   ult.id_cargo,
	   cargo.descricao cargo,
	   convert(decimal(10),ult.salario) salario,
	   ult.bonus,  
	   ult.id_segmento,
	   seg.descricao segmento,
	   ult.id_area,
	   area.descricao area,
	   ult.id_subdivisao,
	   sub.descricao subdivisao,
	   ult.dt_inicio,
	   ult.dt_saida,
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
	
left join br_area area on
	area.id=ult.id_area	
	
left join br_cargo cargo on
	cargo.id=ult.id_cargo
	
left join br_subdivisao sub on
	sub.id=ult.id_subdivisao
	
left join br_segmento seg on
	seg.id=ult.id_segmento

left join bc_empresa_unq emp on
	emp.id=ult.id_empresa		
	
left join bc_empresa_filial fil on
	fil.id=ult.id_filial		
		
)prof on
	prof.id_cliente=base.id_cliente
	
-- Ultimo Status
left join (
select ult.id,
	   ult.id_projeto,	
	   ult.id_cliente,	
       ult.id_status,
       dsta.descricao status,
       ult.id_substatus,
       dsub.descricao substatus,
       fl.nome_usuario follow,
       ent.nome_usuario entrevistador,
       mot.descricao motivo,
       ult.dt_agendada,
       ult.hora,
       ult.dt_alteracao,
       us.nome_usuario usuario_status       
		
from (select ult.id_cliente,max(ult.id) id
from bh_cli_status ult
where ult.id_projeto=@id_projeto
group by ult.id_cliente)ult_st

left join bh_cli_status ult on
	ult.id=ult_st.id

left join br_cli_status dsta on
	dsta.id=ult.id_status
	
left join br_cli_substatus dsub on
	dsub.id=ult.id_substatus
	
left join bc_usuario us on
	us.id=ult.usuario_criacao	
	
left join br_cli_motivos mot on
	mot.id=ult.id_motivo
	
left join bc_usuario fl on
	fl.id=ult.follow
	
left join bc_usuario ent on
	ent.id=ult.entrevistador
				
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
/*	
--Media Geral
left join(SELECT  pot.id_cliente,
		sum(pot.p_inteligencia + pot.p_maturidade + pot.p_visao + pot.p_confianca +
	    pot.p_honestidade + pot.p_punch + pot.p_carisma)/7 media_potencial

from bc_cli_consultor_p pot
	
group by pot.id_cliente
)media on
	media.id_cliente=base.id_cliente	
*/
-- Ultimo Academico

left join(
select ult.id_cliente,
	   ult.id_escolaridade,
	   esc.descricao escolaridade,
	   ult.id_graduacao,
	   grad.descricao graduacao,
	   ult.instituicao   

from (select acad.id_cliente,max(acad.id) id
	  from bh_cli_academico acad
	  where acad.exibir=1
	  group by acad.id_cliente)ult_st
	
left join bh_cli_academico ult on 	
	ult.id=ult_st.id
	
left join br_graduacao grad on
	grad.id=ult.id_graduacao	
	
left join br_escolaridade esc on
	esc.id=ult.id_escolaridade	
)acad on
	acad.id_cliente=base.id_cliente

-- Outros Joins

left join bc_cliente cli on
	cli.id=base.id_cliente 
	
where base.id_projeto=@id_projeto and status.status is not null

order by dt_status desc	

FETCH NEXT FROM projeto INTO @id_projeto

END

CLOSE projeto
DEALLOCATE projeto

select * from @tmptbl

end
	
/*
	
		
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
*/