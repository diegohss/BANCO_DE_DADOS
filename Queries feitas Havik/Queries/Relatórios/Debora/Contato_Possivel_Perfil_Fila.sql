select distinct 
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
	   prof.area area,
	   prof.subdivisao subdivisao,
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
	   ult.id_segmento,
	   seg.descricao segmento,
	   ult.id_area,
	   area.descricao area,
	   ult.id_subdivisao,
	   sub.descricao subdivisao,
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
       ult.dt_alteracao,
       us.nome_usuario usuario_status    
		
from bh_cli_status ult

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
	cli.id=base.id_cliente
	
where base.id_projeto in (1370,1371,1372,1373,1374,1375,1376,1377,1378,1379,1380,1381,1382,1383)	
and
status.id_status=2
and
status.id_substatus=46