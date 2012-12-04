INSERT INTO bi_kivah.dbo.fato_candidato
(
           cod_tempo
           ,cod_candidato
           ,cod_codificacao
           ,cod_cargo
           ,qtd_candidatos
           ,qtd_projetos
           ,qtd_preentrevistas
           ,qtd_entrevistas
           ,qtd_cvs
           ,media_salarial
)
select 
		tempo.cod_tempo,	
		base.id cod_candidato,
		cast(CAST(isnull(lnk.id,0) as varchar(10)) +
		cast(isnull(codi.id_area,0) as varchar(10))+
		cast(isnull(codi.id_subdivisao,0) as varchar(10))+
		cast(isnull(codi.id_segmento,0) as varchar(10)) as int) cod_codificao,	
		profi.id_cargo cod_cargo,
		1 qtd_candidatos,
		isnull(proj.qtd_projetos,0) qtd_projetos,
		isnull(pre.qtd,0) qtd_preentrevistas,
		isnull(ent.qtd,0) qtd_entrevistas,
		isnull(sum(cvs.cv+cvs.cv_havik),0) qtd_cvs,
		isnull(prof.salario,0) media_salarial
		

from havik.dbo.bc_cliente base

left join bi_kivah.dbo.dim_tempo tempo on
	tempo.data=convert(char(10),base.dt_alteracao,23)
	
left join(
select ult.id_cliente,ult.id_area,ult.id_subdivisao,ult.id_segmento
from(
select id_cliente,MAX(id) id
from havik.dbo.bh_cli_codifica
group by id_cliente	)c
left join havik.dbo.bh_cli_codifica ult on
	ult.id=c.id	
)codi on
	codi.id_cliente=base.id

left join havik.dbo.bl_area_subdivisao lnk on
 lnk.id_area=codi.id_area and
 lnk.id_subdivisao=codi.id_subdivisao	
	
-- Tipos Documentos do Candidato
left join
(
select cvs.id_cliente,
	   sum(case 
	   when cvs.idioma=1 or cvs.idioma=2 or cvs.idioma=3 then 1
	   else 0 end) cv,
	   sum(case 
	   when cvs.idioma=4 then 1
	   else 0 end) disc,	   
	   sum(case 
	   when cvs.idioma=5 or cvs.idioma=6 then 1
	   else 0 end) cv_havik,
	   sum(case 
	   when cvs.idioma=7 then 1
	   else 0 end) shortlist, 	   
	   sum(case 
	   when cvs.idioma=11 then 1
	   else 0 end) banca, 	
	   sum(case 
	   when cvs.idioma=12 then 1
	   else 0 end) res, 	
	   sum(case 
	   when cvs.idioma=13 then 1
	   else 0 end) cbi,
	   sum(case 
	   when cvs.idioma=16 then 1
	   else 0 end) game,	 	 
	   sum(case 
	   when cvs.idioma=17 then 1
	   else 0 end) testes	 	 	
from 
(
select id_cliente,idioma,COUNT(id_cliente) qtd
from havik.dbo.bc_cli_base_cvs 
group by id_cliente,idioma
)cvs
group by cvs.id_cliente
)cvs on
	cvs.id_cliente=base.id
	
-- Projetos do Candidato
left join(
select p.id_cliente,COUNT(p.id_projeto) qtd_projetos
from havik.dbo.bh_cli_projeto p
group by p.id_cliente
)proj on
	proj.id_cliente=base.id
	
-- Pré-Entrevista do Candidato

left join(
select r.id_cliente,COUNT(r.id) qtd
from havik.dbo.bc_cli_researcher r
left join havik.dbo.bh_cli_researcher_obs obs on
	obs.id_cliente=r.id_cliente
where obs.id is not null
group by r.id_cliente
)pre on
	pre.id_cliente=base.id
	
-- Entrevista do Candidato
left join(
select c.id_cliente,COUNT(c.id) qtd
from havik.dbo.bc_cli_consultor c
left join havik.dbo.bh_cli_consultor_obs obs on
	obs.id_cliente=c.id_cliente
where obs.id is not null
group by c.id_cliente
)ent on
	ent.id_cliente=base.id
	
-- Salario
left join(
select pro.id_cliente,avg(pro.salario) salario
from havik.dbo.bh_cli_profissional pro
group by pro.id_cliente
)prof on
	prof.id_cliente=base.id
	
--Profissional
left join (
select ult.id_cliente,
	   ult.id_cargo	
from (
SELECT a.id
FROM havik.dbo.bh_cli_profissional a
WHERE a.ID IN
(SELECT TOP 1 b.id FROM havik.dbo.bh_cli_profissional b WHERE b.id_cliente = a.id_cliente ORDER BY b.dt_inicio DESC)
)ult_prof
left join havik.dbo.bh_cli_profissional ult on
	ult.id=ult_prof.id	
)profi on
	profi.id_cliente=base.id
	
group by
		tempo.cod_tempo,	
		base.id,
		cast(CAST(isnull(lnk.id,0) as varchar(10)) +
		cast(isnull(codi.id_area,0) as varchar(10))+
		cast(isnull(codi.id_subdivisao,0) as varchar(10))+
		cast(isnull(codi.id_segmento,0) as varchar(10)) as int),	
		profi.id_cargo,
	    isnull(proj.qtd_projetos,0),
		isnull(pre.qtd,0),
		isnull(ent.qtd,0),
		isnull(prof.salario,0)
		