/* Query Possivel Perfil */
select base.cod_candidato,base.nome_candidato

from bi_kivah.dbo.dim_candidato base

left join bi_kivah.dbo.dim_codi_candidato cod on
	cod.cod_candidato=base.cod_candidato
	
left join bi_kivah.dbo.fato_rh fato on
	fato.cod_candidato=base.cod_candidato
	
where (cod.area like '%tecnologia%'	or cod.segmento like '%tecnologia%')
and
(fato.cv>=1 and fato.disc=0 and fato.profissional>=1 and 
(fato.preentrevista>=1 or fato.entrevista>=1) and fato.placement=0)

group by base.cod_candidato,base.nome_candidato