INSERT INTO bi_kivah.dbo.fato_rh
(
           cod_candidato
           ,cv
           ,disc
           ,cv_havik
           ,shortlist
           ,banca
           ,res
           ,cbi
           ,game
           ,testes
           ,profissional
           ,codificacao
           ,superior_inc
           ,superior_comp
           ,pos_graduacao
           ,mba
           ,ingles_basico
           ,ingles_avancado
           ,idioma_basico
           ,idioma_avancado
           ,preentrevista
           ,entrevista
           ,projeto
           ,placement
           ,entrevista_cliente
)
select base.cod_candidato,
	   -- Documentos do candidato
       isnull(sum(cvs.cv),0) cv,
       isnull(sum(cvs.disc),0) disc,
       isnull(sum(cvs.cv_havik),0) cv_havik,
       isnull(sum(cvs.shortlist),0) shortlist,
       isnull(sum(cvs.banca),0) banca,
       isnull(sum(cvs.res),0) res,
       isnull(sum(cvs.cbi),0) cbi,
       isnull(sum(cvs.game),0) game,
       isnull(sum(cvs.testes),0) testes,
       -- profissional do candidato
       isnull(sum(case when prof.qtd>0 then prof.qtd
       else 0 end),0) profissional,
	   -- Codificação do Candidato
	   isnull(sum(case when codi.qtd>0 then codi.qtd
       else 0 end),0) codificacao,		
       
       -- Escolaridade do Candidato
       isnull(sum(case when escola.superior_inc>0 then 1
       else 0 end),0) superior_inc,
	   isnull(sum(case when escola.superior_comp>0 then 1
       else 0 end),0) superior_comp,
	   isnull(sum(case when escola.pos_graduacao>0 then 1
       else 0 end),0) pos_graduacao,
	   isnull(sum(case when escola.mba>0 then 1
       else 0 end),0) mba,            
	   
	   -- Idioma do Candidato
	   isnull(sum(case when idi.ingles_basico>0 then 1
       else 0 end),0) ingles_basico,
	   isnull(sum(case when idi.ingles_avancado>0 then 1
       else 0 end),0) ingles_avancado,
	   isnull(sum(case when idi.idioma_basico>0 then 1
       else 0 end),0) idioma_basico,
	   isnull(sum(case when idi.idioma_avancado>0 then 1
       else 0 end),0) idioma_avancado,                     
       
	   -- Pré-Entrevista do Candidato
	   isnull(sum(case when pre.qtd>0 then pre.qtd
       else 0 end),0) preentrevista,
	   -- Entrevista do Candidato
	   isnull(sum(case when ent.qtd>0 then ent.qtd
       else 0 end),0) entrevista,
       -- projetos do candidato
       isnull(sum(case when proj.qtd_projetos>0 then proj.qtd_projetos
       else 0 end),0) projeto,
       -- placement do candidato
       isnull(sum(case when place.qtd_meses>0 then place.qtd_meses
       else 0 end),0) placement,
       -- entrevista no cliente
       isnull(sum(case when entcli.qtd>0 then 1
       else 0 end),0) entrevista_cliente
       
       
from
(select id cod_candidato
from havik.dbo.bc_cliente
group by id
)base

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
	cvs.id_cliente=base.cod_candidato
	
-- Histórico Profissional do Candidato	
left join(select base.id_cliente,COUNT(base.id_cliente) qtd
from 
(
select p.id_cliente,ISNULL(p.id_empresa,p.empresa_antiga) empresa,
	   p.salario,p.id_cargo,p.dt_inicio,p.dt_saida
from havik.dbo.bh_cli_profissional p
where (p.empresa_antiga is not null or p.id_empresa is not null) and 
(p.dt_inicio is not null and p.dt_inicio<>'1900-01-01 00:00:00.000')
)base
group by base.id_cliente
)prof on
	prof.id_cliente=base.cod_candidato
	
-- Codificação do Candidato
left join(
select cod.id_cliente,COUNT(cod.id) qtd
from havik.dbo.bh_cli_codifica cod
where cod.exibir=1
group by cod.id_cliente
)codi on
	codi.id_cliente=base.cod_candidato	
	
-- Escolaridade do Candidato
left join(
select base.id_cliente,
	   sum(case 
	   when base.id_escolaridade=3 then 1
	   else 0
	   end) superior_inc,
	   sum(case 
	   when base.id_escolaridade=4 then 1
	   else 0
	   end) superior_comp,	   
	   sum(case 
	   when base.id_escolaridade=6 then 1
	   else 0
	   end) pos_graduacao,
	   sum(case 
	   when base.id_escolaridade=5 then 1
	   else 0
	   end) mba	   	   
from
(
SELECT form.id_cliente,form.id_escolaridade
  FROM havik.dbo.bh_cli_academico form
where form.exibir=1
group by form.id_cliente,form.id_escolaridade
 )base
group by base.id_cliente
)escola on
	escola.id_cliente=base.cod_candidato

-- Idioma do Candidato
left join(
select base.id_cliente,
	   sum(case 
	   when base.id_idioma=1 and base.id_nvl_idioma<3 then 1
	   else 0
	   end) ingles_basico,
	   sum(case 
	   when base.id_idioma=1 and base.id_nvl_idioma>2 then 1
	   else 0
	   end) ingles_avancado,	   
	   sum(case 
	   when base.id_idioma<>1 and base.id_nvl_idioma<3 then 1
	   else 0
	   end) idioma_basico,
	   sum(case 
	   when base.id_idioma<>1 and base.id_nvl_idioma>2 then 1
	   else 0
	   end) idioma_avancado	   	   
from
(
SELECT lin.id_cliente,lin.id_idioma,lin.id_nvl_idioma
  FROM havik.dbo.bh_cli_idiomas lin
where lin.exibir=1
group by lin.id_cliente,lin.id_idioma,lin.id_nvl_idioma 
 )base
group by base.id_cliente
)idi on
	idi.id_cliente=base.cod_candidato
-- Pré-Entrevista do Candidato

left join(
select r.id_cliente,COUNT(r.id) qtd
from havik.dbo.bc_cli_researcher r
left join havik.dbo.bh_cli_researcher_obs obs on
	obs.id_cliente=r.id_cliente
where obs.id is not null
group by r.id_cliente
)pre on
	pre.id_cliente=base.cod_candidato
	
-- Entrevista do Candidato
left join(
select c.id_cliente,COUNT(c.id) qtd
from havik.dbo.bc_cli_consultor c
left join havik.dbo.bh_cli_consultor_obs obs on
	obs.id_cliente=c.id_cliente
where obs.id is not null
group by c.id_cliente
)ent on
	ent.id_cliente=base.cod_candidato
	
-- Projetos do Candidato
left join(
select p.id_cliente,COUNT(p.id_projeto) qtd_projetos
from havik.dbo.bh_cli_projeto p
group by p.id_cliente
)proj on
	proj.id_cliente=base.cod_candidato
-- Placement do Candidato
left join(
select pl.id_cliente,AVG(pl.qtd_meses) qtd_meses
from (select clis.id_cliente,datediff(month,clis.dt_alteracao,GETDATE()) qtd_meses
from havik.dbo.bh_cli_status clis
where ((clis.id_status=7 and clis.id_substatus=32 and clis.exibir=1) or
	  (clis.id_status=8 and clis.id_substatus=32 and clis.exibir=1) or
	  (clis.id_status=7 and clis.id_substatus is null and clis.exibir=1))
)pl
group by pl.id_cliente
)place on
	place.id_cliente=base.cod_candidato

-- Entrevista do Candidato no Cliente
left join(
select clis.id_cliente,COUNT(clis.id) qtd
from havik.dbo.bh_cli_status clis
where ((clis.id_status=5 and clis.id_substatus=29 and clis.exibir=1))
group by clis.id_cliente
)entcli on
	entcli.id_cliente=base.cod_candidato

group by base.cod_candidato
order by 1	
	