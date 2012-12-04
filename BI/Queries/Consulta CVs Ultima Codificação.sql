/* Query Perfil Ideal*/
select cod.area,
	   cod.subdivisao,
	   cod.segmento,
	   -- Todos os casos
	   COUNT(cod.cod_candidato) tipo_1,
	   -- Somente com CV Normal ou Havik
	   sum(case when(
	   (fato.cv>=1 or fato.cv_havik>=1)
		) then 1
		else 0 end) tipo_2,
		-- Somente com Pre-Entrevista
	   sum(case when(
		fato.preentrevista>=1
		) then 1
		else 0 end) tipo_3,
		-- Tendo CV normal ou Havik e a Pre-Entrevista
	   sum(case when(
	   (fato.cv>=1 or fato.cv_havik>=1)
		and fato.preentrevista>=1
		) then 1
		else 0 end) tipo_4,
	   -- Tendo CV Normal ou Havik e o Disc		
	   sum(case when(
	   (fato.cv>=1 or fato.cv_havik>=1)
		and fato.disc>=1
		) then 1
		else 0 end) tipo_5,
		-- Tendo Pre-Entrevista e o Disc
	   sum(case when(
	    fato.disc>=1
		and fato.preentrevista>=1
		) then 1
		else 0 end) tipo_6,
		-- Tendo CV normal ou Havik, Pre-Entrevista
	   sum(case when(
	   (fato.cv>=1 or fato.cv_havik>=1)
		and fato.disc>=1
		and fato.preentrevista>=1
		) then 1
		else 0 end) tipo_7										
	   

from bi_kivah.dbo.dim_candidato base

left join bi_kivah.dbo.dim_codi_candidato_ult cod on
	cod.cod_candidato=base.cod_candidato
	
left join bi_kivah.dbo.fato_rh fato on
	fato.cod_candidato=base.cod_candidato
	
group by cod.area,
	     cod.subdivisao,
	     cod.segmento