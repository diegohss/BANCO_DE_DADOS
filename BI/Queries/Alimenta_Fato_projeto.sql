INSERT INTO [bi_kivah].[dbo].[fato_projeto]
(
           [cod_tempo]
           ,[cod_projeto]
           ,[cod_codificacao]
           ,[cod_cargo]
           ,[cod_produto]
           ,[qtd_candidatos]
           ,[qtd_projetos]
           ,[qtd_preentrevistas]
           ,[qtd_entrevistas]
           ,[qtd_cvs]
           ,[media_salarial]
           ,[media_prazo_entrega]
           ,[qtd_ativos]
)
select distinct
      tempo.cod_tempo,
	  base.id cod_projeto,
	  cast(CAST(isnull(lnk.id,0) as varchar(10)) +
	  cast(isnull(base.area,0) as varchar(10))+
	  cast(isnull(base.subdivisao,0) as varchar(10))+
	  cast(isnull(base.segmento,0) as varchar(10)) as int) cod_codificao,
	  base.cargo cod_cargo,
	  base.tipo_produto cod_produto,
	  isnull(cand.qtd,0) qtd_candidatos,
	  1 qtd_projetos,
	  isnull(infos.pre_entrevista,0) qtd_preentrevistas,
	  isnull(infos.entrevista,0) qtd_entrevistas,
	  isnull(infos.cvs,0) qtd_cvs,
	  isnull(infos.salario,0) media_salarial,
	  isnull(datediff(day,base.dt_ini,base.dt_ent_shortlist),0) media_prazo_entrega,
	  case when base.dt_fim is null then 0
	  else 1
	  end qtd_ativos
	  

from havik.dbo.bc_projeto base

left join bi_kivah.dbo.dim_tempo tempo on
	tempo.data=convert(char(10),base.dt_criacao,23)

left join havik.dbo.bl_area_subdivisao lnk on
 lnk.id_area=base.area and
 lnk.id_subdivisao=base.subdivisao
 
left join(
select id_projeto,COUNT(distinct id_cliente) qtd
from havik.dbo.bh_cli_projeto
group by id_projeto
)cand on
	cand.id_projeto=base.id
	
left join(
select base.id_projeto,
	  isnull(SUM(pre.qtd),0) pre_entrevista,
	  isnull(SUM(ent.qtd),0) entrevista,
	  isnull(sum(cvs.cv+cvs.cv_havik),0) cvs,
	  isnull(avg(prof.salario),0) salario
	  
from havik.dbo.bh_cli_projeto base
-- Pre-Entrevista
left join(
select r.id_cliente,COUNT(r.id) qtd
from havik.dbo.bc_cli_researcher r
left join havik.dbo.bh_cli_researcher_obs obs on
	obs.id_cliente=r.id_cliente
where obs.id is not null
group by r.id_cliente
)pre on
	pre.id_cliente=base.id_cliente
	
-- Entrevista do Candidato
left join(
select c.id_cliente,COUNT(c.id) qtd
from havik.dbo.bc_cli_consultor c
left join havik.dbo.bh_cli_consultor_obs obs on
	obs.id_cliente=c.id_cliente
where obs.id is not null
group by c.id_cliente
)ent on
	ent.id_cliente=base.id_cliente
	
-- Cvs	
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
	cvs.id_cliente=base.id_cliente
	
left join(
select pro.id_cliente,avg(pro.salario) salario
from havik.dbo.bh_cli_profissional pro
group by pro.id_cliente
)prof on
	prof.id_cliente=base.id_cliente
	
group by base.id_projeto	
)infos on
	infos.id_projeto=base.id